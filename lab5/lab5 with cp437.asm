;--------------------------------------------------------
; File Created by C51
; Version 1.0.0 #1069 (Apr 23 2015) (MSVC)
; This file was generated Sun Mar 06 17:12:07 2016
;--------------------------------------------------------
$name lab5_with_cp437
$optc51 --model-small
$printf_float
	R_DSEG    segment data
	R_CSEG    segment code
	R_BSEG    segment bit
	R_XSEG    segment xdata
	R_PSEG    segment xdata
	R_ISEG    segment idata
	R_OSEG    segment data overlay
	BIT_BANK  segment data overlay
	R_HOME    segment code
	R_GSINIT  segment code
	R_IXSEG   segment xdata
	R_CONST   segment code
	R_XINIT   segment code
	R_DINIT   segment code

;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	public _main
	public _UART0_Init
	public _TIMER0_Init
	public _waitms
	public _Timer3us
	public _PORT_Init
	public _SYSCLK_Init
	public __c51_external_startup
;--------------------------------------------------------
; Special Function Registers
;--------------------------------------------------------
_P0             DATA 0x80
_SP             DATA 0x81
_DPL            DATA 0x82
_DPH            DATA 0x83
_EMI0TC         DATA 0x84
_EMI0CF         DATA 0x85
_OSCLCN         DATA 0x86
_PCON           DATA 0x87
_TCON           DATA 0x88
_TMOD           DATA 0x89
_TL0            DATA 0x8a
_TL1            DATA 0x8b
_TH0            DATA 0x8c
_TH1            DATA 0x8d
_CKCON          DATA 0x8e
_PSCTL          DATA 0x8f
_P1             DATA 0x90
_TMR3CN         DATA 0x91
_TMR4CN         DATA 0x91
_TMR3RLL        DATA 0x92
_TMR4RLL        DATA 0x92
_TMR3RLH        DATA 0x93
_TMR4RLH        DATA 0x93
_TMR3L          DATA 0x94
_TMR4L          DATA 0x94
_TMR3H          DATA 0x95
_TMR4H          DATA 0x95
_USB0ADR        DATA 0x96
_USB0DAT        DATA 0x97
_SCON           DATA 0x98
_SCON0          DATA 0x98
_SBUF           DATA 0x99
_SBUF0          DATA 0x99
_CPT1CN         DATA 0x9a
_CPT0CN         DATA 0x9b
_CPT1MD         DATA 0x9c
_CPT0MD         DATA 0x9d
_CPT1MX         DATA 0x9e
_CPT0MX         DATA 0x9f
_P2             DATA 0xa0
_SPI0CFG        DATA 0xa1
_SPI0CKR        DATA 0xa2
_SPI0DAT        DATA 0xa3
_P0MDOUT        DATA 0xa4
_P1MDOUT        DATA 0xa5
_P2MDOUT        DATA 0xa6
_P3MDOUT        DATA 0xa7
_IE             DATA 0xa8
_CLKSEL         DATA 0xa9
_EMI0CN         DATA 0xaa
__XPAGE         DATA 0xaa
_SBCON1         DATA 0xac
_P4MDOUT        DATA 0xae
_PFE0CN         DATA 0xaf
_P3             DATA 0xb0
_OSCXCN         DATA 0xb1
_OSCICN         DATA 0xb2
_OSCICL         DATA 0xb3
_SBRLL1         DATA 0xb4
_SBRLH1         DATA 0xb5
_FLSCL          DATA 0xb6
_FLKEY          DATA 0xb7
_IP             DATA 0xb8
_CLKMUL         DATA 0xb9
_SMBTC          DATA 0xb9
_AMX0N          DATA 0xba
_AMX0P          DATA 0xbb
_ADC0CF         DATA 0xbc
_ADC0L          DATA 0xbd
_ADC0H          DATA 0xbe
_SFRPAGE        DATA 0xbf
_SMB0CN         DATA 0xc0
_SMB1CN         DATA 0xc0
_SMB0CF         DATA 0xc1
_SMB1CF         DATA 0xc1
_SMB0DAT        DATA 0xc2
_SMB1DAT        DATA 0xc2
_ADC0GTL        DATA 0xc3
_ADC0GTH        DATA 0xc4
_ADC0LTL        DATA 0xc5
_ADC0LTH        DATA 0xc6
_P4             DATA 0xc7
_TMR2CN         DATA 0xc8
_TMR5CN         DATA 0xc8
_REG01CN        DATA 0xc9
_TMR2RLL        DATA 0xca
_TMR5RLL        DATA 0xca
_TMR2RLH        DATA 0xcb
_TMR5RLH        DATA 0xcb
_TMR2L          DATA 0xcc
_TMR5L          DATA 0xcc
_TMR2H          DATA 0xcd
_TMR5H          DATA 0xcd
_SMB0ADM        DATA 0xce
_SMB1ADM        DATA 0xce
_SMB0ADR        DATA 0xcf
_SMB1ADR        DATA 0xcf
_PSW            DATA 0xd0
_REF0CN         DATA 0xd1
_SCON1          DATA 0xd2
_SBUF1          DATA 0xd3
_P0SKIP         DATA 0xd4
_P1SKIP         DATA 0xd5
_P2SKIP         DATA 0xd6
_USB0XCN        DATA 0xd7
_PCA0CN         DATA 0xd8
_PCA0MD         DATA 0xd9
_PCA0CPM0       DATA 0xda
_PCA0CPM1       DATA 0xdb
_PCA0CPM2       DATA 0xdc
_PCA0CPM3       DATA 0xdd
_PCA0CPM4       DATA 0xde
_P3SKIP         DATA 0xdf
_ACC            DATA 0xe0
_XBR0           DATA 0xe1
_XBR1           DATA 0xe2
_XBR2           DATA 0xe3
_IT01CF         DATA 0xe4
_CKCON1         DATA 0xe4
_SMOD1          DATA 0xe5
_EIE1           DATA 0xe6
_EIE2           DATA 0xe7
_ADC0CN         DATA 0xe8
_PCA0CPL1       DATA 0xe9
_PCA0CPH1       DATA 0xea
_PCA0CPL2       DATA 0xeb
_PCA0CPH2       DATA 0xec
_PCA0CPL3       DATA 0xed
_PCA0CPH3       DATA 0xee
_RSTSRC         DATA 0xef
_B              DATA 0xf0
_P0MDIN         DATA 0xf1
_P1MDIN         DATA 0xf2
_P2MDIN         DATA 0xf3
_P3MDIN         DATA 0xf4
_P4MDIN         DATA 0xf5
_EIP1           DATA 0xf6
_EIP2           DATA 0xf7
_SPI0CN         DATA 0xf8
_PCA0L          DATA 0xf9
_PCA0H          DATA 0xfa
_PCA0CPL0       DATA 0xfb
_PCA0CPH0       DATA 0xfc
_PCA0CPL4       DATA 0xfd
_PCA0CPH4       DATA 0xfe
_VDM0CN         DATA 0xff
_DPTR           DATA 0x8382
_TMR2RL         DATA 0xcbca
_TMR3RL         DATA 0x9392
_TMR4RL         DATA 0x9392
_TMR5RL         DATA 0xcbca
_TMR2           DATA 0xcdcc
_TMR3           DATA 0x9594
_TMR4           DATA 0x9594
_TMR5           DATA 0xcdcc
_SBRL1          DATA 0xb5b4
_ADC0           DATA 0xbebd
_ADC0GT         DATA 0xc4c3
_ADC0LT         DATA 0xc6c5
_PCA0           DATA 0xfaf9
_PCA0CP1        DATA 0xeae9
_PCA0CP2        DATA 0xeceb
_PCA0CP3        DATA 0xeeed
_PCA0CP0        DATA 0xfcfb
_PCA0CP4        DATA 0xfefd
;--------------------------------------------------------
; special function bits
;--------------------------------------------------------
_P0_0           BIT 0x80
_P0_1           BIT 0x81
_P0_2           BIT 0x82
_P0_3           BIT 0x83
_P0_4           BIT 0x84
_P0_5           BIT 0x85
_P0_6           BIT 0x86
_P0_7           BIT 0x87
_TF1            BIT 0x8f
_TR1            BIT 0x8e
_TF0            BIT 0x8d
_TR0            BIT 0x8c
_IE1            BIT 0x8b
_IT1            BIT 0x8a
_IE0            BIT 0x89
_IT0            BIT 0x88
_P1_0           BIT 0x90
_P1_1           BIT 0x91
_P1_2           BIT 0x92
_P1_3           BIT 0x93
_P1_4           BIT 0x94
_P1_5           BIT 0x95
_P1_6           BIT 0x96
_P1_7           BIT 0x97
_S0MODE         BIT 0x9f
_SCON0_6        BIT 0x9e
_MCE0           BIT 0x9d
_REN0           BIT 0x9c
_TB80           BIT 0x9b
_RB80           BIT 0x9a
_TI0            BIT 0x99
_RI0            BIT 0x98
_SCON_6         BIT 0x9e
_MCE            BIT 0x9d
_REN            BIT 0x9c
_TB8            BIT 0x9b
_RB8            BIT 0x9a
_TI             BIT 0x99
_RI             BIT 0x98
_P2_0           BIT 0xa0
_P2_1           BIT 0xa1
_P2_2           BIT 0xa2
_P2_3           BIT 0xa3
_P2_4           BIT 0xa4
_P2_5           BIT 0xa5
_P2_6           BIT 0xa6
_P2_7           BIT 0xa7
_EA             BIT 0xaf
_ESPI0          BIT 0xae
_ET2            BIT 0xad
_ES0            BIT 0xac
_ET1            BIT 0xab
_EX1            BIT 0xaa
_ET0            BIT 0xa9
_EX0            BIT 0xa8
_P3_0           BIT 0xb0
_P3_1           BIT 0xb1
_P3_2           BIT 0xb2
_P3_3           BIT 0xb3
_P3_4           BIT 0xb4
_P3_5           BIT 0xb5
_P3_6           BIT 0xb6
_P3_7           BIT 0xb7
_IP_7           BIT 0xbf
_PSPI0          BIT 0xbe
_PT2            BIT 0xbd
_PS0            BIT 0xbc
_PT1            BIT 0xbb
_PX1            BIT 0xba
_PT0            BIT 0xb9
_PX0            BIT 0xb8
_MASTER0        BIT 0xc7
_TXMODE0        BIT 0xc6
_STA0           BIT 0xc5
_STO0           BIT 0xc4
_ACKRQ0         BIT 0xc3
_ARBLOST0       BIT 0xc2
_ACK0           BIT 0xc1
_SI0            BIT 0xc0
_MASTER1        BIT 0xc7
_TXMODE1        BIT 0xc6
_STA1           BIT 0xc5
_STO1           BIT 0xc4
_ACKRQ1         BIT 0xc3
_ARBLOST1       BIT 0xc2
_ACK1           BIT 0xc1
_SI1            BIT 0xc0
_TF2            BIT 0xcf
_TF2H           BIT 0xcf
_TF2L           BIT 0xce
_TF2LEN         BIT 0xcd
_TF2CEN         BIT 0xcc
_T2SPLIT        BIT 0xcb
_TR2            BIT 0xca
_T2CSS          BIT 0xc9
_T2XCLK         BIT 0xc8
_TF5H           BIT 0xcf
_TF5L           BIT 0xce
_TF5LEN         BIT 0xcd
_TMR5CN_4       BIT 0xcc
_T5SPLIT        BIT 0xcb
_TR5            BIT 0xca
_TMR5CN_1       BIT 0xc9
_T5XCLK         BIT 0xc8
_CY             BIT 0xd7
_AC             BIT 0xd6
_F0             BIT 0xd5
_RS1            BIT 0xd4
_RS0            BIT 0xd3
_OV             BIT 0xd2
_F1             BIT 0xd1
_PARITY         BIT 0xd0
_CF             BIT 0xdf
_CR             BIT 0xde
_PCA0CN_5       BIT 0xde
_CCF4           BIT 0xdc
_CCF3           BIT 0xdb
_CCF2           BIT 0xda
_CCF1           BIT 0xd9
_CCF0           BIT 0xd8
_ACC_7          BIT 0xe7
_ACC_6          BIT 0xe6
_ACC_5          BIT 0xe5
_ACC_4          BIT 0xe4
_ACC_3          BIT 0xe3
_ACC_2          BIT 0xe2
_ACC_1          BIT 0xe1
_ACC_0          BIT 0xe0
_AD0EN          BIT 0xef
_AD0TM          BIT 0xee
_AD0INT         BIT 0xed
_AD0BUSY        BIT 0xec
_AD0WINT        BIT 0xeb
_AD0CM2         BIT 0xea
_AD0CM1         BIT 0xe9
_AD0CM0         BIT 0xe8
_B_7            BIT 0xf7
_B_6            BIT 0xf6
_B_5            BIT 0xf5
_B_4            BIT 0xf4
_B_3            BIT 0xf3
_B_2            BIT 0xf2
_B_1            BIT 0xf1
_B_0            BIT 0xf0
_SPIF           BIT 0xff
_WCOL           BIT 0xfe
_MODF           BIT 0xfd
_RXOVRN         BIT 0xfc
_NSSMD1         BIT 0xfb
_NSSMD0         BIT 0xfa
_TXBMT          BIT 0xf9
_SPIEN          BIT 0xf8
;--------------------------------------------------------
; overlayable register banks
;--------------------------------------------------------
	rbank0 segment data overlay
;--------------------------------------------------------
; internal ram data
;--------------------------------------------------------
	rseg R_DSEG
_main_v0_1_58:
	ds 4
_main_frequency_1_1_58:
	ds 4
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
	rseg	R_OSEG
;--------------------------------------------------------
; indirectly addressable internal ram data
;--------------------------------------------------------
	rseg R_ISEG
;--------------------------------------------------------
; absolute internal ram data
;--------------------------------------------------------
	DSEG
;--------------------------------------------------------
; bit data
;--------------------------------------------------------
	rseg R_BSEG
;--------------------------------------------------------
; paged external ram data
;--------------------------------------------------------
	rseg R_PSEG
;--------------------------------------------------------
; external ram data
;--------------------------------------------------------
	rseg R_XSEG
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	XSEG
;--------------------------------------------------------
; external initialized ram data
;--------------------------------------------------------
	rseg R_IXSEG
	rseg R_HOME
	rseg R_GSINIT
	rseg R_CSEG
;--------------------------------------------------------
; Reset entry point and interrupt vectors
;--------------------------------------------------------
	CSEG at 0x0000
	ljmp	_crt0
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	rseg R_HOME
	rseg R_GSINIT
	rseg R_GSINIT
;--------------------------------------------------------
; data variables initialization
;--------------------------------------------------------
	rseg R_DINIT
	; The linker places a 'ret' at the end of segment R_DINIT.
;--------------------------------------------------------
; code
;--------------------------------------------------------
	rseg R_CSEG
;------------------------------------------------------------
;Allocation info for local variables in function '_c51_external_startup'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\lab5 with cp437.c:38: char _c51_external_startup (void)
;	-----------------------------------------
;	 function _c51_external_startup
;	-----------------------------------------
__c51_external_startup:
	using	0
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\lab5 with cp437.c:40: PCA0MD&=(~0x40) ;    // DISABLE WDT: clear Watchdog Enable bit
	anl	_PCA0MD,#0xBF
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\lab5 with cp437.c:45: CLKSEL|=0b_0000_0010; // SYSCLK derived from the Internal High-Frequency Oscillator / 2.
	orl	_CLKSEL,#0x02
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\lab5 with cp437.c:51: OSCICN |= 0x03; // Configure internal oscillator for its maximum frequency
	orl	_OSCICN,#0x03
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\lab5 with cp437.c:54: P2MDIN &= 0b_1111_0000; // P2.0 to P2.3
	anl	_P2MDIN,#0xF0
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\lab5 with cp437.c:55: P2SKIP |= 0b_0000_1111; // Skip Crossbar decoding for these pins
	orl	_P2SKIP,#0x0F
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\lab5 with cp437.c:63: AMX0P = LQFP32_MUX_P2_0; // Select positive input from P2.0
	mov	_AMX0P,#0x08
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\lab5 with cp437.c:64: AMX0N = LQFP32_MUX_GND;  // GND is negative input (Single-ended Mode)
	mov	_AMX0N,#0x1F
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\lab5 with cp437.c:67: ADC0CF = 0xF8; // SAR clock = 31, Right-justified result
	mov	_ADC0CF,#0xF8
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\lab5 with cp437.c:68: ADC0CN = 0b_1000_0000; // AD0EN=1, AD0TM=0
	mov	_ADC0CN,#0x80
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\lab5 with cp437.c:69: REF0CN=0b_0000_1000; //Select VDD as the voltage reference for the converter
	mov	_REF0CN,#0x08
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\lab5 with cp437.c:71: VDM0CN=0x80;       // enable VDD monitor
	mov	_VDM0CN,#0x80
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\lab5 with cp437.c:72: RSTSRC=0x02|0x04;  // Enable reset on missing clock detector and VDD
	mov	_RSTSRC,#0x06
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\lab5 with cp437.c:73: P0MDOUT|=0x10;     // Enable Uart TX as push-pull output
	orl	_P0MDOUT,#0x10
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\lab5 with cp437.c:74: XBR0=0x01;         // Enable UART on P0.4(TX) and P0.5(RX)
	mov	_XBR0,#0x01
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\lab5 with cp437.c:75: XBR1=0x40;         // Enable crossbar and weak pull-ups
	mov	_XBR1,#0x40
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\lab5 with cp437.c:78: TH1 = 0x10000-((SYSCLK/BAUDRATE)/2L);
	mov	_TH1,#0x98
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\lab5 with cp437.c:79: CKCON &= ~0x0B;                  // T1M = 1; SCA1:0 = xx
	anl	_CKCON,#0xF4
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\lab5 with cp437.c:80: CKCON |=  0x08;
	orl	_CKCON,#0x08
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\lab5 with cp437.c:94: TL1 = TH1;     // Init timer 1
	mov	_TL1,_TH1
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\lab5 with cp437.c:95: TMOD &= 0x0f;  // TMOD: timer 1 in 8-bit autoreload
	anl	_TMOD,#0x0F
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\lab5 with cp437.c:96: TMOD |= 0x20;                       
	orl	_TMOD,#0x20
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\lab5 with cp437.c:97: TR1 = 1;       // Start timer1
	setb	_TR1
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\lab5 with cp437.c:98: SCON = 0x52;
	mov	_SCON,#0x52
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\lab5 with cp437.c:100: return 0;
	mov	dpl,#0x00
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'SYSCLK_Init'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\lab5 with cp437.c:103: void SYSCLK_Init (void)
;	-----------------------------------------
;	 function SYSCLK_Init
;	-----------------------------------------
_SYSCLK_Init:
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\lab5 with cp437.c:109: CLKSEL|=0b_0000_0010; // SYSCLK derived from the Internal High-Frequency Oscillator / 2.
	orl	_CLKSEL,#0x02
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\lab5 with cp437.c:115: OSCICN |= 0x03;   // Configure internal oscillator for its maximum frequency
	orl	_OSCICN,#0x03
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\lab5 with cp437.c:116: RSTSRC  = 0x04;   // Enable missing clock detector
	mov	_RSTSRC,#0x04
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'PORT_Init'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\lab5 with cp437.c:119: void PORT_Init (void)
;	-----------------------------------------
;	 function PORT_Init
;	-----------------------------------------
_PORT_Init:
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\lab5 with cp437.c:121: P0MDOUT |= 0x10; // Enable UTX as push-pull output
	orl	_P0MDOUT,#0x10
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\lab5 with cp437.c:122: XBR0     = 0x01; // Enable UART on P0.4(TX) and P0.5(RX)                     
	mov	_XBR0,#0x01
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\lab5 with cp437.c:123: XBR1     = 0x40; // Enable crossbar and weak pull-ups
	mov	_XBR1,#0x40
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Timer3us'
;------------------------------------------------------------
;us                        Allocated to registers r2 
;i                         Allocated to registers r3 
;------------------------------------------------------------
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\lab5 with cp437.c:127: void Timer3us(unsigned char us)
;	-----------------------------------------
;	 function Timer3us
;	-----------------------------------------
_Timer3us:
	mov	r2,dpl
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\lab5 with cp437.c:132: CKCON|=0b_0100_0000;
	orl	_CKCON,#0x40
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\lab5 with cp437.c:134: TMR3RL = (-(SYSCLK)/1000000L); // Set Timer3 to overflow in 1us.
	mov	_TMR3RL,#0xE8
	mov	(_TMR3RL >> 8),#0xFF
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\lab5 with cp437.c:135: TMR3 = TMR3RL;                 // Initialize Timer3 for first overflow
	mov	_TMR3,_TMR3RL
	mov	(_TMR3 >> 8),(_TMR3RL >> 8)
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\lab5 with cp437.c:137: TMR3CN = 0x04;                 // Sart Timer3 and clear overflow flag
	mov	_TMR3CN,#0x04
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\lab5 with cp437.c:138: for (i = 0; i < us; i++)       // Count <us> overflows
	mov	r3,#0x00
L005004?:
	clr	c
	mov	a,r3
	subb	a,r2
	jnc	L005007?
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\lab5 with cp437.c:140: while (!(TMR3CN & 0x80));  // Wait for overflow
L005001?:
	mov	a,_TMR3CN
	jnb	acc.7,L005001?
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\lab5 with cp437.c:141: TMR3CN &= ~(0x80);         // Clear overflow indicator
	anl	_TMR3CN,#0x7F
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\lab5 with cp437.c:138: for (i = 0; i < us; i++)       // Count <us> overflows
	inc	r3
	sjmp	L005004?
L005007?:
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\lab5 with cp437.c:143: TMR3CN = 0 ;                   // Stop Timer3 and clear overflow flag
	mov	_TMR3CN,#0x00
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'waitms'
;------------------------------------------------------------
;ms                        Allocated to registers r2 r3 
;j                         Allocated to registers r4 r5 
;k                         Allocated to registers r6 
;------------------------------------------------------------
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\lab5 with cp437.c:146: void waitms (unsigned int ms)
;	-----------------------------------------
;	 function waitms
;	-----------------------------------------
_waitms:
	mov	r2,dpl
	mov	r3,dph
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\lab5 with cp437.c:150: for(j=0; j<ms; j++)
	mov	r4,#0x00
	mov	r5,#0x00
L006005?:
	clr	c
	mov	a,r4
	subb	a,r2
	mov	a,r5
	subb	a,r3
	jnc	L006009?
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\lab5 with cp437.c:151: for (k=0; k<4; k++) Timer3us(250);
	mov	r6,#0x00
L006001?:
	cjne	r6,#0x04,L006018?
L006018?:
	jnc	L006007?
	mov	dpl,#0xFA
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	push	ar6
	lcall	_Timer3us
	pop	ar6
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
	inc	r6
	sjmp	L006001?
L006007?:
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\lab5 with cp437.c:150: for(j=0; j<ms; j++)
	inc	r4
	cjne	r4,#0x00,L006005?
	inc	r5
	sjmp	L006005?
L006009?:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'TIMER0_Init'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\lab5 with cp437.c:154: void TIMER0_Init(void)
;	-----------------------------------------
;	 function TIMER0_Init
;	-----------------------------------------
_TIMER0_Init:
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\lab5 with cp437.c:156: TMOD&=0b_1111_0000; // Set the bits of Timer/Counter 0 to zero
	anl	_TMOD,#0xF0
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\lab5 with cp437.c:157: TMOD|=0b_0000_0101; // Timer/Counter 0 used as a 16-bit counter
	orl	_TMOD,#0x05
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\lab5 with cp437.c:158: TR0=0; // Stop Timer/Counter 0
	clr	_TR0
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'UART0_Init'
;------------------------------------------------------------
;------------------------------------------------------------
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\lab5 with cp437.c:164: void UART0_Init (void)
;	-----------------------------------------
;	 function UART0_Init
;	-----------------------------------------
_UART0_Init:
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\lab5 with cp437.c:166: SCON0 = 0x10;
	mov	_SCON0,#0x10
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\lab5 with cp437.c:169: TH1 = 0x10000-((SYSCLK/BAUDRATE)/2L);
	mov	_TH1,#0x98
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\lab5 with cp437.c:170: CKCON &= ~0x0B;                  // T1M = 1; SCA1:0 = xx
	anl	_CKCON,#0xF4
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\lab5 with cp437.c:171: CKCON |=  0x08;
	orl	_CKCON,#0x08
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\lab5 with cp437.c:184: TL1 = TH1;      // Init Timer1
	mov	_TL1,_TH1
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\lab5 with cp437.c:185: TMOD &= ~0xf0;  // TMOD: timer 1 in 8-bit autoreload
	anl	_TMOD,#0x0F
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\lab5 with cp437.c:186: TMOD |=  0x20;                       
	orl	_TMOD,#0x20
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\lab5 with cp437.c:187: TR1 = 1; // START Timer1
	setb	_TR1
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\lab5 with cp437.c:188: TI = 1;  // Indicate TX0 ready
	setb	_TI
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'main'
;------------------------------------------------------------
;v0                        Allocated with name '_main_v0_1_58'
;v1                        Allocated to registers r6 r7 r0 r1 
;Period_1                  Allocated to registers 
;frequency_1               Allocated with name '_main_frequency_1_1_58'
;Pulse_2                   Allocated to registers 
;phase_difference          Allocated to registers r2 r3 r4 r5 
;------------------------------------------------------------
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\lab5 with cp437.c:191: void main (void)
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\lab5 with cp437.c:201: PORT_Init();     // Initialize Port I/O
	lcall	_PORT_Init
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\lab5 with cp437.c:202: SYSCLK_Init ();  // Initialize Oscillator
	lcall	_SYSCLK_Init
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\lab5 with cp437.c:203: UART0_Init();    // Initialize UART0
	lcall	_UART0_Init
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\lab5 with cp437.c:204: TIMER0_Init();
	lcall	_TIMER0_Init
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\lab5 with cp437.c:207: printf("\x1b[2J"); // Clear screen using ANSI escape sequence.
	mov	a,#__str_0
	push	acc
	mov	a,#(__str_0 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	dec	sp
	dec	sp
	dec	sp
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\lab5 with cp437.c:218: AD0BUSY=1;
	setb	_AD0BUSY
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\lab5 with cp437.c:219: while (AD0BUSY); // Wait for conversion to complete
L009001?:
	jb	_AD0BUSY,L009001?
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\lab5 with cp437.c:221: while(1)
L009029?:
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\lab5 with cp437.c:223: printf("\x1B[6;1H"); // ANSI escape sequence: move to row 6, column 1
	mov	a,#__str_1
	push	acc
	mov	a,#(__str_1 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	dec	sp
	dec	sp
	dec	sp
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\lab5 with cp437.c:226: TR0=0; // Stop timer 0
	clr	_TR0
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\lab5 with cp437.c:227: TMOD=0B_0000_0001; // Set timer 0 as 16- // Set timer 0 as 16-bit timer bit timer
	mov	_TMOD,#0x01
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\lab5 with cp437.c:228: TH0=0; TL0=0; // Reset the timer
	mov	_TH0,#0x00
	mov	_TL0,#0x00
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\lab5 with cp437.c:229: while (P2_5==1); // Wait for the signal to be zero
L009004?:
	jb	_P2_5,L009004?
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\lab5 with cp437.c:230: while (P2_5==0); // Wait for the signal to be one
L009007?:
	jnb	_P2_5,L009007?
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\lab5 with cp437.c:231: TR0=1; // Start timing
	setb	_TR0
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\lab5 with cp437.c:232: while (P2_5==1); // Wait for the signal to be zero
L009010?:
	jb	_P2_5,L009010?
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\lab5 with cp437.c:233: TR0=0; // Stop timer 0
	clr	_TR0
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\lab5 with cp437.c:235: Period_1=(TH0*0x100+TL0)*2; // Assume Period is unsigned int 
	mov	r3,_TH0
	mov	r2,#0x00
	mov	r4,_TL0
	mov	r5,#0x00
	mov	a,r4
	add	a,r2
	mov	r2,a
	mov	a,r5
	addc	a,r3
	mov	dpl,r2
	xch	a,dpl
	add	a,acc
	xch	a,dpl
	rlc	a
	mov	dph,a
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\lab5 with cp437.c:236: frequency_1=1/((float)Period_1);
	lcall	___uint2fs
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	dptr,#0x0000
	mov	b,#0x80
	mov	a,#0x3F
	lcall	___fsdiv
	mov	_main_frequency_1_1_58,dpl
	mov	(_main_frequency_1_1_58 + 1),dph
	mov	(_main_frequency_1_1_58 + 2),b
	mov	(_main_frequency_1_1_58 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\lab5 with cp437.c:238: TR0=0; // Stop timer 0
	clr	_TR0
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\lab5 with cp437.c:239: TMOD=0B_0000_0001; // Set timer 0 as 16- // Set timer 0 as 16-bit timer bit timer
	mov	_TMOD,#0x01
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\lab5 with cp437.c:240: TH0=0; TL0=0; // Reset the timer
	mov	_TH0,#0x00
	mov	_TL0,#0x00
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\lab5 with cp437.c:241: while (P1_4==1); // Wait for the signal to be zero
L009013?:
	jb	_P1_4,L009013?
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\lab5 with cp437.c:242: while (P1_4==0); // Wait for the signal to be one
L009016?:
	jnb	_P1_4,L009016?
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\lab5 with cp437.c:243: TR0=1; // Start timing
	setb	_TR0
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\lab5 with cp437.c:244: while (P1_4==1); // Wait for the signal to be zero
L009019?:
	jb	_P1_4,L009019?
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\lab5 with cp437.c:245: TR0=0; // Stop timer 0
	clr	_TR0
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\lab5 with cp437.c:247: Pulse_2=(TH0*0x100+TL0); // Assume Period is unsigned int 
	mov	r7,_TH0
	mov	r6,#0x00
	mov	r0,_TL0
	mov	r1,#0x00
	mov	a,r0
	add	a,r6
	mov	dpl,a
	mov	a,r1
	addc	a,r7
	mov	dph,a
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\lab5 with cp437.c:249: phase_difference=((float)Pulse_2)*(360/((float)Period_1));
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	lcall	___uint2fs
	mov	r6,dpl
	mov	r7,dph
	mov	r0,b
	mov	r1,a
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
	push	ar6
	push	ar7
	push	ar0
	push	ar1
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	dptr,#0x0000
	mov	b,#0xB4
	mov	a,#0x43
	lcall	___fsdiv
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar1
	pop	ar0
	pop	ar7
	pop	ar6
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	mov	dpl,r6
	mov	dph,r7
	mov	b,r0
	mov	a,r1
	lcall	___fsmul
	mov	r2,dpl
	mov	r3,dph
	mov	r4,b
	mov	r5,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\lab5 with cp437.c:251: AD0BUSY = 1;
	setb	_AD0BUSY
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\lab5 with cp437.c:252: AMX0P=LQFP32_MUX_P2_6;
	mov	_AMX0P,#0x0E
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\lab5 with cp437.c:253: while (AD0BUSY); // Wait for conversion to complete
L009022?:
	jb	_AD0BUSY,L009022?
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\lab5 with cp437.c:254: v0 = ((ADC0L+(ADC0H*0x100))*VDD)/1023.0; // Read 0-1023 value in ADC0 and convert to volts
	mov	r6,_ADC0L
	mov	r7,#0x00
	mov	r1,_ADC0H
	clr	a
	add	a,r6
	mov	dpl,a
	mov	a,r1
	addc	a,r7
	mov	dph,a
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	lcall	___sint2fs
	mov	r6,dpl
	mov	r7,dph
	mov	r0,b
	mov	r1,a
	push	ar6
	push	ar7
	push	ar0
	push	ar1
	mov	dptr,#0xCCCD
	mov	b,#0x54
	mov	a,#0x40
	lcall	___fsmul
	mov	r6,dpl
	mov	r7,dph
	mov	r0,b
	mov	r1,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	clr	a
	push	acc
	mov	a,#0xC0
	push	acc
	mov	a,#0x7F
	push	acc
	mov	a,#0x44
	push	acc
	mov	dpl,r6
	mov	dph,r7
	mov	b,r0
	mov	a,r1
	lcall	___fsdiv
	mov	_main_v0_1_58,dpl
	mov	(_main_v0_1_58 + 1),dph
	mov	(_main_v0_1_58 + 2),b
	mov	(_main_v0_1_58 + 3),a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	pop	ar5
	pop	ar4
	pop	ar3
	pop	ar2
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\lab5 with cp437.c:256: AD0BUSY = 1;
	setb	_AD0BUSY
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\lab5 with cp437.c:257: AMX0P=LQFP32_MUX_P1_5;
	mov	_AMX0P,#0x05
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\lab5 with cp437.c:258: while (AD0BUSY); // Wait for conversion to complete
L009025?:
	jb	_AD0BUSY,L009025?
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\lab5 with cp437.c:259: v1 = ((ADC0L+(ADC0H*0x100))*VDD)/1023.0; // Read 0-1023 value in ADC0 and convert to volts
	mov	r6,_ADC0L
	mov	r7,#0x00
	mov	r1,_ADC0H
	clr	a
	add	a,r6
	mov	dpl,a
	mov	a,r1
	addc	a,r7
	mov	dph,a
	push	ar2
	push	ar3
	push	ar4
	push	ar5
	lcall	___sint2fs
	mov	r6,dpl
	mov	r7,dph
	mov	r0,b
	mov	r1,a
	push	ar6
	push	ar7
	push	ar0
	push	ar1
	mov	dptr,#0xCCCD
	mov	b,#0x54
	mov	a,#0x40
	lcall	___fsmul
	mov	r6,dpl
	mov	r7,dph
	mov	r0,b
	mov	r1,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
	clr	a
	push	acc
	mov	a,#0xC0
	push	acc
	mov	a,#0x7F
	push	acc
	mov	a,#0x44
	push	acc
	mov	dpl,r6
	mov	dph,r7
	mov	b,r0
	mov	a,r1
	lcall	___fsdiv
	mov	r6,dpl
	mov	r7,dph
	mov	r0,b
	mov	r1,a
	mov	a,sp
	add	a,#0xfc
	mov	sp,a
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\lab5 with cp437.c:261: PCA0MD &= ~0x40; // WDTE = 0 (clear watchdog timer enable)
	anl	_PCA0MD,#0xBF
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\lab5 with cp437.c:263: printf( CLEAR_SCREEN );
	push	ar6
	push	ar7
	push	ar0
	push	ar1
	mov	a,#__str_0
	push	acc
	mov	a,#(__str_0 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	dec	sp
	dec	sp
	dec	sp
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\lab5 with cp437.c:264: printf( FORE_BACK , COLOR_BLACK, COLOR_WHITE );
	mov	a,#0x07
	push	acc
	clr	a
	push	acc
	clr	a
	push	acc
	push	acc
	mov	a,#__str_2
	push	acc
	mov	a,#(__str_2 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xf9
	mov	sp,a
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\lab5 with cp437.c:266: printf( "浜様様様様様曜様様様様様様�\n" );
	mov	a,#__str_3
	push	acc
	mov	a,#(__str_3 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	dec	sp
	dec	sp
	dec	sp
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\lab5 with cp437.c:267: printf( "� Vrms Ref   �            �\n" );
	mov	a,#__str_4
	push	acc
	mov	a,#(__str_4 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	dec	sp
	dec	sp
	dec	sp
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\lab5 with cp437.c:268: printf( "麺様様様様様洋様様様様様様�\n" );
	mov	a,#__str_5
	push	acc
	mov	a,#(__str_5 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	dec	sp
	dec	sp
	dec	sp
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\lab5 with cp437.c:269: printf( "� Vrms Test  �            �\n" );
	mov	a,#__str_6
	push	acc
	mov	a,#(__str_6 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	dec	sp
	dec	sp
	dec	sp
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\lab5 with cp437.c:270: printf( "麺様様様様様洋様様様様様様�\n" );
	mov	a,#__str_5
	push	acc
	mov	a,#(__str_5 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	dec	sp
	dec	sp
	dec	sp
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\lab5 with cp437.c:271: printf( "� Phase      �            �\n" );
	mov	a,#__str_7
	push	acc
	mov	a,#(__str_7 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	dec	sp
	dec	sp
	dec	sp
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\lab5 with cp437.c:272: printf( "麺様様様様様洋様様様様様様�\n" );
	mov	a,#__str_5
	push	acc
	mov	a,#(__str_5 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	dec	sp
	dec	sp
	dec	sp
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\lab5 with cp437.c:273: printf( "� Frequency  �            �\n" );
	mov	a,#__str_8
	push	acc
	mov	a,#(__str_8 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	dec	sp
	dec	sp
	dec	sp
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\lab5 with cp437.c:274: printf( "藩様様様様様擁様様様様様様�\n" );
	mov	a,#__str_9
	push	acc
	mov	a,#(__str_9 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	dec	sp
	dec	sp
	dec	sp
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\lab5 with cp437.c:276: printf( GOTO_YX , 2, 18);
	mov	a,#0x12
	push	acc
	clr	a
	push	acc
	mov	a,#0x02
	push	acc
	clr	a
	push	acc
	mov	a,#__str_10
	push	acc
	mov	a,#(__str_10 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xf9
	mov	sp,a
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\lab5 with cp437.c:277: printf( FORE_BACK , COLOR_RED, COLOR_WHITE );
	mov	a,#0x07
	push	acc
	clr	a
	push	acc
	mov	a,#0x01
	push	acc
	clr	a
	push	acc
	mov	a,#__str_2
	push	acc
	mov	a,#(__str_2 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xf9
	mov	sp,a
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\lab5 with cp437.c:278: printf("%.3f", v0);
	push	_main_v0_1_58
	push	(_main_v0_1_58 + 1)
	push	(_main_v0_1_58 + 2)
	push	(_main_v0_1_58 + 3)
	mov	a,#__str_11
	push	acc
	mov	a,#(__str_11 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xf9
	mov	sp,a
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\lab5 with cp437.c:279: printf( GOTO_YX , 4, 18);
	mov	a,#0x12
	push	acc
	clr	a
	push	acc
	mov	a,#0x04
	push	acc
	clr	a
	push	acc
	mov	a,#__str_10
	push	acc
	mov	a,#(__str_10 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xf9
	mov	sp,a
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\lab5 with cp437.c:280: printf( FORE_BACK , COLOR_GREEN, COLOR_WHITE );
	mov	a,#0x07
	push	acc
	clr	a
	push	acc
	mov	a,#0x02
	push	acc
	clr	a
	push	acc
	mov	a,#__str_2
	push	acc
	mov	a,#(__str_2 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xf9
	mov	sp,a
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\lab5 with cp437.c:281: printf("%.3f", v1);
	mov	a,#__str_11
	push	acc
	mov	a,#(__str_11 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xf9
	mov	sp,a
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\lab5 with cp437.c:282: printf( GOTO_YX , 6, 18);
	mov	a,#0x12
	push	acc
	clr	a
	push	acc
	mov	a,#0x06
	push	acc
	clr	a
	push	acc
	mov	a,#__str_10
	push	acc
	mov	a,#(__str_10 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xf9
	mov	sp,a
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\lab5 with cp437.c:283: printf( FORE_BACK , COLOR_BLUE, COLOR_WHITE );
	mov	a,#0x07
	push	acc
	clr	a
	push	acc
	mov	a,#0x04
	push	acc
	clr	a
	push	acc
	mov	a,#__str_2
	push	acc
	mov	a,#(__str_2 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xf9
	mov	sp,a
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\lab5 with cp437.c:284: printf("%.3f", phase_difference);
	mov	a,#__str_11
	push	acc
	mov	a,#(__str_11 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xf9
	mov	sp,a
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\lab5 with cp437.c:285: printf( GOTO_YX , 8, 18);
	mov	a,#0x12
	push	acc
	clr	a
	push	acc
	mov	a,#0x08
	push	acc
	clr	a
	push	acc
	mov	a,#__str_10
	push	acc
	mov	a,#(__str_10 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xf9
	mov	sp,a
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\lab5 with cp437.c:286: printf( FORE_BACK , COLOR_MAGENTA, COLOR_WHITE );
	mov	a,#0x07
	push	acc
	clr	a
	push	acc
	mov	a,#0x05
	push	acc
	clr	a
	push	acc
	mov	a,#__str_2
	push	acc
	mov	a,#(__str_2 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xf9
	mov	sp,a
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\lab5 with cp437.c:287: printf("%.3f", frequency_1);
	push	_main_frequency_1_1_58
	push	(_main_frequency_1_1_58 + 1)
	push	(_main_frequency_1_1_58 + 2)
	push	(_main_frequency_1_1_58 + 3)
	mov	a,#__str_11
	push	acc
	mov	a,#(__str_11 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	mov	a,sp
	add	a,#0xf9
	mov	sp,a
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\lab5 with cp437.c:289: printf("\x1B[K"); // ANSI escape sequence: Clear to end of line
	mov	a,#__str_12
	push	acc
	mov	a,#(__str_12 >> 8)
	push	acc
	mov	a,#0x80
	push	acc
	lcall	_printf
	dec	sp
	dec	sp
	dec	sp
;	C:\Users\jeffreyliou\Desktop\elec291\lab5\lab5 with cp437.c:290: waitms(100);  // Wait 100ms before next round of measurements.
	mov	dptr,#0x0064
	lcall	_waitms
	ljmp	L009029?
	rseg R_CSEG

	rseg R_XINIT

	rseg R_CONST
__str_0:
	db 0x1B
	db '[2J'
	db 0x00
__str_1:
	db 0x1B
	db '[6;1H'
	db 0x00
__str_2:
	db 0x1B
	db '[0;3%d;4%dm'
	db 0x00
__str_3:
	db 0xC9
	db 0xCD
	db 0xCD
	db 0xCD
	db 0xCD
	db 0xCD
	db 0xCD
	db 0xCD
	db 0xCD
	db 0xCD
	db 0xCD
	db 0xCD
	db 0xCD
	db 0xCB
	db 0xCD
	db 0xCD
	db 0xCD
	db 0xCD
	db 0xCD
	db 0xCD
	db 0xCD
	db 0xCD
	db 0xCD
	db 0xCD
	db 0xCD
	db 0xCD
	db 0xBB
	db 0x0A
	db 0x00
__str_4:
	db 0xBA
	db ' Vrms Ref   '
	db 0xBA
	db '            '
	db 0xBA
	db 0x0A
	db 0x00
__str_5:
	db 0xCC
	db 0xCD
	db 0xCD
	db 0xCD
	db 0xCD
	db 0xCD
	db 0xCD
	db 0xCD
	db 0xCD
	db 0xCD
	db 0xCD
	db 0xCD
	db 0xCD
	db 0xCE
	db 0xCD
	db 0xCD
	db 0xCD
	db 0xCD
	db 0xCD
	db 0xCD
	db 0xCD
	db 0xCD
	db 0xCD
	db 0xCD
	db 0xCD
	db 0xCD
	db 0xB9
	db 0x0A
	db 0x00
__str_6:
	db 0xBA
	db ' Vrms Test  '
	db 0xBA
	db '            '
	db 0xBA
	db 0x0A
	db 0x00
__str_7:
	db 0xBA
	db ' Phase      '
	db 0xBA
	db '            '
	db 0xBA
	db 0x0A
	db 0x00
__str_8:
	db 0xBA
	db ' Frequency  '
	db 0xBA
	db '            '
	db 0xBA
	db 0x0A
	db 0x00
__str_9:
	db 0xC8
	db 0xCD
	db 0xCD
	db 0xCD
	db 0xCD
	db 0xCD
	db 0xCD
	db 0xCD
	db 0xCD
	db 0xCD
	db 0xCD
	db 0xCD
	db 0xCD
	db 0xCA
	db 0xCD
	db 0xCD
	db 0xCD
	db 0xCD
	db 0xCD
	db 0xCD
	db 0xCD
	db 0xCD
	db 0xCD
	db 0xCD
	db 0xCD
	db 0xCD
	db 0xBC
	db 0x0A
	db 0x00
__str_10:
	db 0x1B
	db '[%d;%dH'
	db 0x00
__str_11:
	db '%.3f'
	db 0x00
__str_12:
	db 0x1B
	db '[K'
	db 0x00

	CSEG

end
