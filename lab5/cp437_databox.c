#include <C8051f38x.h>
#include <stdio.h>

#define SYSCLK      48000000L  // SYSCLK frequency in Hz
#define BAUDRATE      115200L  // Baud rate of UART in bps

// ANSI colors
#define	COLOR_BLACK		0
#define	COLOR_RED		1
#define	COLOR_GREEN		2
#define	COLOR_YELLOW		3
#define	COLOR_BLUE		4
#define	COLOR_MAGENTA		5
#define	COLOR_CYAN		6
#define	COLOR_WHITE		7

// Some ANSI escape sequences
#define CURSOR_ON "\x1b[?25h"
#define CURSOR_OFF "\x1b[?25l"
#define CLEAR_SCREEN "\x1b[2J"
#define GOTO_YX "\x1B[%d;%dH"
#define CLR_TO_END_LINE "\x1B[K"

/* Black foreground, white background */
#define BKF_WTB "\x1B[0;30;47m"
#define FORE_BACK "\x1B[0;3%d;4%dm"
#define FONT_SELECT "\x1B[%dm"

void PORT_Init (void)
{
	P0MDOUT |= 0x10; // Enable UTX as push-pull output
	XBR0     = 0x01; // Enable UART on P0.4(TX) and P0.5(RX)                     
	XBR1     = 0x40; // Enable crossbar and weak pull-ups
}

void SYSCLK_Init (void)
{
	CLKSEL|=0b_0000_0011; // SYSCLK derived from Internal HF Osc / 1.
	OSCICN |= 0x03;   // Configure internal oscillator for its maximum 
	RSTSRC  = 0x04;   // Enable missing clock detector
}
 
void UART0_Init (void)
{
	SCON0 = 0x10;
	TH1 = 0x10000-((SYSCLK/BAUDRATE)/2L);
	CKCON &= ~0x0B; // T1M = 1; SCA1:0 = xx
	CKCON |=  0x08;
	TL1 = TH1;      // Init Timer1
	TMOD &= ~0xf0;  // TMOD: timer 1 in 8-bit auto-reload
	TMOD |=  0x20;                       
	TR1 = 1; // START Timer1
	TI = 1;  // Indicate TX0 ready
}
 
void main (void)
{
    PCA0MD &= ~0x40; // WDTE = 0 (clear watchdog timer enable)
    PORT_Init();     // Initialize Port I/O
    SYSCLK_Init ();  // Initialize Oscillator
    UART0_Init();    // Initialize UART0
    printf( CLEAR_SCREEN );
    printf( FORE_BACK , COLOR_BLACK, COLOR_WHITE );

    printf( "浜様様様様様曜様様様様様様�\n" );
    printf( "� Vrms Ref   �            �\n" );
    printf( "麺様様様様様洋様様様様様様�\n" );
    printf( "� Vrms Test  �            �\n" );
    printf( "麺様様様様様洋様様様様様様�\n" );
    printf( "� Phase      �            �\n" );
    printf( "麺様様様様様洋様様様様様様�\n" );
    printf( "� Frequency  �            �\n" );
    printf( "藩様様様様様擁様様様様様様�\n" );
    
    printf( GOTO_YX , 2, 18);
    printf( FORE_BACK , COLOR_RED, COLOR_WHITE );
    printf("%6.3f", 2.543);
    printf( GOTO_YX , 4, 18);
    printf( FORE_BACK , COLOR_GREEN, COLOR_WHITE );
    printf("%6.3f", 1.191);
    printf( GOTO_YX , 6, 18);
    printf( FORE_BACK , COLOR_BLUE, COLOR_WHITE );
    printf("%7.3f", -47.39);
    printf( GOTO_YX , 8, 18);
    printf( FORE_BACK , COLOR_MAGENTA, COLOR_WHITE );
    printf("%7.3f", 59.44);
	
}
