; ISR_example.asm: a) Increments/decrements a BCD variable every half second using
; an ISR for timer 2; b) Generates a 2kHz square wave at pin P3.7 using
; an ISR for timer 0; and c) in the 'main' loop it displays the variable
; incremented/decremented using the ISR for timer 0 on the LCD.  Also resets it to 
; zero if the 'BOOT' pushbutton connected to P4.5 is pressed.
$NOLIST
$MODLP52
$LIST

CLK           EQU 22118400 ; Microcontroller system crystal frequency in Hz
TIMER0_RATE   EQU 4096     ; 2048Hz squarewave (peak amplitude of CEM-1203 speaker)
TIMER0_RELOAD EQU ((65536-(CLK/TIMER0_RATE)))
TIMER2_RATE   EQU 1000     ; 1000Hz, for a timer tick of 1ms
TIMER2_RELOAD EQU ((65536-(CLK/TIMER2_RATE)))

BOOT_BUTTON   equ P4.5
SOUND_OUT     equ P3.7
UPDOWN        equ P0.0

; Reset vector
org 0000H
    ljmp main

; External interrupt 0 vector (not used in this code)
org 0003H
	reti

; Timer/Counter 0 overflow interrupt vector
org 000BH
	ljmp Timer0_ISR

; External interrupt 1 vector (not used in this code)
org 0013H
	reti

; Timer/Counter 1 overflow interrupt vector (not used in this code)
org 001BH
	reti

; Serial port receive/transmit interrupt vector (not used in this code)
org 0023H 
	reti
	
; Timer/Counter 2 overflow interrupt vector
org 002BH
	ljmp Timer2_ISR

dseg at 30h
Count1ms:     ds 2 ; Used to determine when half second has passed
BCD_counter:  ds 1 ; The BCD counter incrememted in the ISR and displayed in the main loop

bseg
half_seconds_flag: dbit 1 ; Set to one in the ISR every time 500 ms had passed

cseg
; These 'equ' must match the wiring between the microcontroller and the LCD!
LCD_RS equ P1.4
LCD_RW equ P1.5
LCD_E  equ P1.6
LCD_D4 equ P3.2
LCD_D5 equ P3.3
LCD_D6 equ P3.4
LCD_D7 equ P3.5
$NOLIST
$include(LCD_4bit.inc) ; A library of LCD related functions and utility macros
$LIST

;                     1234567890123456    <- This helps determine the position of the counter
Initial_Message:  db 'BCD_counter: xx', 0

;---------------------------------;
; Routine to initialize the ISR   ;
; for timer 0                     ;
;---------------------------------;
Timer0_Init:
	mov a, TMOD
	anl a, #0xf0 ; Clear the bits for timer 0
	orl a, #0x01 ; Configure timer 0 as 16-timer
	mov TMOD, a
	mov TH0, #high(TIMER0_RELOAD)
	mov TL0, #low(TIMER0_RELOAD)
	; Enable the timer and interrupts
    setb ET0  ; Enable timer 0 interrupt
    setb TR0  ; Start timer 0
    setb EA   ; Enable Global interrupts
	ret

;---------------------------------;
; ISR for timer 0.  Set to execute;
; every 1/4096Hz to generate a    ;
; 2048 Hz square wave at pin P3.7 ;
;---------------------------------;
Timer0_ISR:
	; Define a latency correction for the timer reload
	CORRECTION EQU (4+4+2+2+4+4) ; lcall+ljmp+clr+mov+mov+setb
	; In mode 1 we need to reload the timer.
	clr TR0
	mov TH0, #high(TIMER0_RELOAD+CORRECTION)
	mov TL0, #low(TIMER0_RELOAD+CORRECTION)
	setb TR0
	cpl SOUND_OUT ; Connect speaker to P3.7!
	reti

;---------------------------------;
; Routine to initialize the ISR   ;
; for timer 2                     ;
;---------------------------------;
Timer2_Init:
	mov T2CON, #0 ; Stop timer.  Autoreload mode.
	; One millisecond interrupt
	mov RCAP2H, #high(TIMER2_RELOAD)
	mov RCAP2L, #low(TIMER2_RELOAD)
	; Set the 16-bit variable Count1ms to zero
	clr a
	mov Count1ms+0, a
	mov Count1ms+1, a
	; Enable the timer and interrupts
    setb ET2  ; Enable timer 2 interrupt
    setb TR2  ; Enable timer 2
    setb EA   ; Enable Global interrupts
	ret

;---------------------------------;
; ISR for timer 2                 ;
;---------------------------------;
Timer2_ISR:
	clr TF2  ; Timer 2 doesn't clear TF2 automatically in ISR
	cpl P3.6 ; To check the interrupt rate with oscilloscope. It must be a 1 ms pulse.
	
	; The two registers used in the ISR must be saved in the stack
	push acc
	push psw
	
	; Increment the 16-bit counter
	inc Count1ms+0    ; Increment the low 8-bits first
	mov a, Count1ms+0 ; If the low 8-bits overflow, then increment high 8-bits
	jnz Inc_Done
	inc Count1ms+1

Inc_Done:
	; Check if half second has passed
	mov a, Count1ms+0
	cjne a, #low(1000), Timer2_ISR_done
	mov a, Count1ms+1
	cjne a, #high(1000), Timer2_ISR_done
	
	; 500 milliseconds have passed.  Set a flag so the main program knows
	setb half_seconds_flag ; Let the main program know half second had passed
	cpl TR1 ; This line makes a beep-silence-beep-silence sound
	; Reset the milli-seconds counter, it is a 16-bit variable
	clr a
	mov Count1ms+0, a
	mov Count1ms+1, a
	; Increment the BCD counter
	mov a, BCD_counter
	jnb UPDOWN, Timer2_ISR_decrement
	add a, #0x01
	sjmp Timer2_ISR_da
Timer2_ISR_decrement:
	add a, #0x99
Timer2_ISR_da:
	da a
	mov BCD_counter, a
	
Timer2_ISR_done:
	pop psw
	pop acc
	reti

;---------------------------------;
; Main program. Includes hardware ;
; initialization and 'forever'    ;
; loop.                           ;
;---------------------------------;
main:
	; Initialization
    mov SP, #7FH
    mov PMOD, #0 ; Configure all ports in bidirectional mode
    lcall Timer0_Init
    lcall Timer2_Init
    lcall LCD_4BIT
    ; For convenience a few handy macros are included in 'LCD_4bit.inc':
	Set_Cursor(1, 1)
    Send_Constant_String(#Initial_Message)
    setb half_seconds_flag
	mov BCD_counter, #0x00
	
	; After initialization the program stays in this 'forever' loop
loop:
	jb BOOT_BUTTON, loop_a  ; if the 'BOOT' button is not pressed skip
	Wait_Milli_Seconds(#50)	; Debounce delay.  This macro is also in 'LCD_4bit.inc'
	jb BOOT_BUTTON, loop_a  ; if the 'BOOT' button is not pressed skip
	jnb BOOT_BUTTON, $		; wait for button release
	; A clean press of the 'BOOT' button has been detected, reset the BCD counter.
	; But first stop the timer and reset the milli-seconds counter, to resync everything.
	clr TR0
	clr a
	mov Count1ms+0, a
	mov Count1ms+1, a
	; Now clear the BCD counter
	mov BCD_counter, #0x00
	setb TR0                ; Re-enable the timer
	sjmp loop_b             ; Display the new value
loop_a:
	jnb half_seconds_flag, loop
loop_b:
    clr half_seconds_flag ; We clear this flag in the main loop, but it is set in the ISR for timer 0
	Set_Cursor(1, 14)     ; the place in the LCD where we want the BCD counter value
	Display_BCD(BCD_counter) ; This macro is also in 'LCD_4bit.inc'
    ljmp loop
END