;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.4.0 #8981 (Jul  5 2014) (Linux)
; This file was generated Sun Sep 10 20:11:45 2017
;--------------------------------------------------------
	.module ldr
	.optsdcc -mstm8
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _InitializeUART
	.globl _print_UCHAR_hex
	.globl _UARTPrintF
	.globl _delay
	.globl _InitializeSystemClock
	.globl _delayTenMicro
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area DATA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area INITIALIZED
;--------------------------------------------------------
; Stack segment in internal ram 
;--------------------------------------------------------
	.area	SSEG
__start__stack:
	.ds	1

;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area DABS (ABS)
;--------------------------------------------------------
; interrupt vector 
;--------------------------------------------------------
	.area HOME
__interrupt_vect:
	int s_GSINIT ;reset
	int 0x0000 ;trap
	int 0x0000 ;int0
	int 0x0000 ;int1
	int 0x0000 ;int2
	int 0x0000 ;int3
	int 0x0000 ;int4
	int 0x0000 ;int5
	int 0x0000 ;int6
	int 0x0000 ;int7
	int 0x0000 ;int8
	int 0x0000 ;int9
	int 0x0000 ;int10
	int 0x0000 ;int11
	int 0x0000 ;int12
	int 0x0000 ;int13
	int 0x0000 ;int14
	int 0x0000 ;int15
	int 0x0000 ;int16
	int 0x0000 ;int17
	int 0x0000 ;int18
	int 0x0000 ;int19
	int 0x0000 ;int20
	int 0x0000 ;int21
	int 0x0000 ;int22
	int 0x0000 ;int23
	int 0x0000 ;int24
	int 0x0000 ;int25
	int 0x0000 ;int26
	int 0x0000 ;int27
	int 0x0000 ;int28
	int 0x0000 ;int29
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area HOME
	.area GSINIT
	.area GSFINAL
	.area GSINIT
__sdcc_gs_init_startup:
__sdcc_init_data:
; stm8_genXINIT() start
	ldw x, #l_DATA
	jreq	00002$
00001$:
	clr (s_DATA - 1, x)
	decw x
	jrne	00001$
00002$:
	ldw	x, #l_INITIALIZER
	jreq	00004$
00003$:
	ld	a, (s_INITIALIZER - 1, x)
	ld	(s_INITIALIZED - 1, x), a
	decw	x
	jrne	00003$
00004$:
; stm8_genXINIT() end
	.area GSFINAL
	jp	__sdcc_program_startup
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME
	.area HOME
__sdcc_program_startup:
	jp	_main
;	return from main will return to caller
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CODE
;	ldr.c: 27: void delayTenMicro (void) {
;	-----------------------------------------
;	 function delayTenMicro
;	-----------------------------------------
_delayTenMicro:
;	ldr.c: 29: for (a = 0; a < 50; ++a)
	ld	a, #0x32
00104$:
;	ldr.c: 30: __asm__("nop");
	nop
	dec	a
;	ldr.c: 29: for (a = 0; a < 50; ++a)
	tnz	a
	jrne	00104$
	ret
;	ldr.c: 32: void InitializeSystemClock() {
;	-----------------------------------------
;	 function InitializeSystemClock
;	-----------------------------------------
_InitializeSystemClock:
;	ldr.c: 33: CLK_ICKR = 0;                       //  Reset the Internal Clock Register.
	ldw	x, #0x50c0
	clr	(x)
;	ldr.c: 34: CLK_ICKR = CLK_HSIEN;               //  Enable the HSI.
	ldw	x, #0x50c0
	ld	a, #0x01
	ld	(x), a
;	ldr.c: 35: CLK_ECKR = 0;                       //  Disable the external clock.
	ldw	x, #0x50c1
	clr	(x)
;	ldr.c: 36: while ((CLK_ICKR & CLK_HSIRDY) == 0);       //  Wait for the HSI to be ready for use.
00101$:
	ldw	x, #0x50c0
	ld	a, (x)
	bcp	a, #0x02
	jreq	00101$
;	ldr.c: 37: CLK_CKDIVR = 0;                     //  Ensure the clocks are running at full speed.
	ldw	x, #0x50c6
	clr	(x)
;	ldr.c: 38: CLK_PCKENR1 = 0xff;                 //  Enable all peripheral clocks.
	ldw	x, #0x50c7
	ld	a, #0xff
	ld	(x), a
;	ldr.c: 39: CLK_PCKENR2 = 0xff;                 //  Ditto.
	ldw	x, #0x50ca
	ld	a, #0xff
	ld	(x), a
;	ldr.c: 40: CLK_CCOR = 0;                       //  Turn off CCO.
	ldw	x, #0x50c9
	clr	(x)
;	ldr.c: 41: CLK_HSITRIMR = 0;                   //  Turn off any HSIU trimming.
	ldw	x, #0x50cc
	clr	(x)
;	ldr.c: 42: CLK_SWIMCCR = 0;                    //  Set SWIM to run at clock / 2.
	ldw	x, #0x50cd
	clr	(x)
;	ldr.c: 43: CLK_SWR = 0xe1;                     //  Use HSI as the clock source.
	ldw	x, #0x50c4
	ld	a, #0xe1
	ld	(x), a
;	ldr.c: 44: CLK_SWCR = 0;                       //  Reset the clock switch control register.
	ldw	x, #0x50c5
	clr	(x)
;	ldr.c: 45: CLK_SWCR = CLK_SWEN;                //  Enable switching.
	ldw	x, #0x50c5
	ld	a, #0x02
	ld	(x), a
;	ldr.c: 46: while ((CLK_SWCR & CLK_SWBSY) != 0);        //  Pause while the clock switch is busy.
00104$:
	ldw	x, #0x50c5
	ld	a, (x)
	srl	a
	jrc	00104$
	ret
;	ldr.c: 48: void delay (int time_ms) {
;	-----------------------------------------
;	 function delay
;	-----------------------------------------
_delay:
	sub	sp, #10
;	ldr.c: 50: for (x = 0; x < 1036*time_ms; ++x)
	clrw	x
	ldw	(0x03, sp), x
	ldw	(0x01, sp), x
	ldw	x, (0x0d, sp)
	pushw	x
	push	#0x0c
	push	#0x04
	call	__mulint
	addw	sp, #4
	ldw	(0x09, sp), x
00103$:
	ldw	y, (0x09, sp)
	ldw	(0x07, sp), y
	ld	a, (0x07, sp)
	rlc	a
	clr	a
	sbc	a, #0x00
	ld	(0x06, sp), a
	ld	(0x05, sp), a
	ldw	x, (0x03, sp)
	cpw	x, (0x07, sp)
	ld	a, (0x02, sp)
	sbc	a, (0x06, sp)
	ld	a, (0x01, sp)
	sbc	a, (0x05, sp)
	jrsge	00105$
;	ldr.c: 51: __asm__("nop");
	nop
;	ldr.c: 50: for (x = 0; x < 1036*time_ms; ++x)
	ldw	y, (0x03, sp)
	addw	y, #0x0001
	ld	a, (0x02, sp)
	adc	a, #0x00
	ld	xl, a
	ld	a, (0x01, sp)
	adc	a, #0x00
	ld	xh, a
	ldw	(0x03, sp), y
	ldw	(0x01, sp), x
	jra	00103$
00105$:
	addw	sp, #10
	ret
;	ldr.c: 56: void UARTPrintF (char *message) {
;	-----------------------------------------
;	 function UARTPrintF
;	-----------------------------------------
_UARTPrintF:
;	ldr.c: 57: char *ch = message;
	ldw	y, (0x03, sp)
;	ldr.c: 58: while (*ch) {
00104$:
	ld	a, (y)
	tnz	a
	jreq	00107$
;	ldr.c: 59: UART1_DR = (unsigned char) *ch;     //  Put the next character into the data transmission register.
	ldw	x, #0x5231
	ld	(x), a
;	ldr.c: 60: while ((UART1_SR & SR_TXE) == 0);   //  Wait for transmission to complete.
00101$:
	ldw	x, #0x5230
	ld	a, (x)
	sll	a
	jrnc	00101$
;	ldr.c: 61: ch++;                               //  Grab the next character.
	incw	y
	jra	00104$
00107$:
	ret
;	ldr.c: 64: void print_UCHAR_hex (unsigned char buffer) {
;	-----------------------------------------
;	 function print_UCHAR_hex
;	-----------------------------------------
_print_UCHAR_hex:
	sub	sp, #12
;	ldr.c: 67: a = (buffer >> 4);
	ld	a, (0x0f, sp)
	swap	a
	and	a, #0x0f
	clrw	x
	ld	xl, a
;	ldr.c: 68: if (a > 9)
	cpw	x, #0x0009
	jrsle	00102$
;	ldr.c: 69: a = a + 'a' - 10;
	addw	x, #0x0057
	ldw	(0x01, sp), x
	jra	00103$
00102$:
;	ldr.c: 71: a += '0'; 
	addw	x, #0x0030
	ldw	(0x01, sp), x
00103$:
;	ldr.c: 72: b = buffer & 0x0f;
	ld	a, (0x0f, sp)
	and	a, #0x0f
	clrw	x
	ld	xl, a
;	ldr.c: 73: if (b > 9)
	cpw	x, #0x0009
	jrsle	00105$
;	ldr.c: 74: b = b + 'a' - 10;
	addw	x, #0x0057
	ldw	(0x0b, sp), x
	jra	00106$
00105$:
;	ldr.c: 76: b += '0'; 
	addw	x, #0x0030
	ldw	(0x0b, sp), x
00106$:
;	ldr.c: 77: message[0] = a;
	ldw	y, sp
	addw	y, #3
	ld	a, (0x02, sp)
	ld	(y), a
;	ldr.c: 78: message[1] = b;
	ldw	x, y
	incw	x
	ld	a, (0x0c, sp)
	ld	(x), a
;	ldr.c: 79: message[2] = 0;
	ldw	x, y
	incw	x
	incw	x
	clr	(x)
;	ldr.c: 80: UARTPrintF (message);
	pushw	y
	call	_UARTPrintF
	addw	sp, #2
	addw	sp, #12
	ret
;	ldr.c: 83: void InitializeUART() {
;	-----------------------------------------
;	 function InitializeUART
;	-----------------------------------------
_InitializeUART:
;	ldr.c: 93: UART1_CR1 = 0;
	ldw	x, #0x5234
	clr	(x)
;	ldr.c: 94: UART1_CR2 = 0;
	ldw	x, #0x5235
	clr	(x)
;	ldr.c: 95: UART1_CR4 = 0;
	ldw	x, #0x5237
	clr	(x)
;	ldr.c: 96: UART1_CR3 = 0;
	ldw	x, #0x5236
	clr	(x)
;	ldr.c: 97: UART1_CR5 = 0;
	ldw	x, #0x5238
	clr	(x)
;	ldr.c: 98: UART1_GTR = 0;
	ldw	x, #0x5239
	clr	(x)
;	ldr.c: 99: UART1_PSCR = 0;
	ldw	x, #0x523a
	clr	(x)
;	ldr.c: 103: UNSET (UART1_CR1, CR1_M);        //  8 Data bits.
	ldw	x, #0x5234
	ld	a, (x)
	and	a, #0xef
	ld	(x), a
;	ldr.c: 104: UNSET (UART1_CR1, CR1_PCEN);     //  Disable parity.
	ldw	x, #0x5234
	ld	a, (x)
	and	a, #0xfb
	ld	(x), a
;	ldr.c: 105: UNSET (UART1_CR3, CR3_STOPH);    //  1 stop bit.
	ldw	x, #0x5236
	ld	a, (x)
	and	a, #0xdf
	ld	(x), a
;	ldr.c: 106: UNSET (UART1_CR3, CR3_STOPL);    //  1 stop bit.
	ldw	x, #0x5236
	ld	a, (x)
	and	a, #0xef
	ld	(x), a
;	ldr.c: 107: UART1_BRR2 = 0x0a;      //  Set the baud rate registers to 115200 baud
	ldw	x, #0x5233
	ld	a, #0x0a
	ld	(x), a
;	ldr.c: 108: UART1_BRR1 = 0x08;      //  based upon a 16 MHz system clock.
	ldw	x, #0x5232
	ld	a, #0x08
	ld	(x), a
;	ldr.c: 112: UNSET (UART1_CR2, CR2_TEN);      //  Disable transmit.
	ldw	x, #0x5235
	ld	a, (x)
	and	a, #0xf7
	ld	(x), a
;	ldr.c: 113: UNSET (UART1_CR2, CR2_REN);      //  Disable receive.
	ldw	x, #0x5235
	ld	a, (x)
	and	a, #0xfb
	ld	(x), a
;	ldr.c: 117: SET (UART1_CR3, CR3_CPOL);
	ldw	x, #0x5236
	ld	a, (x)
	or	a, #0x04
	ld	(x), a
;	ldr.c: 118: SET (UART1_CR3, CR3_CPHA);
	ldw	x, #0x5236
	ld	a, (x)
	or	a, #0x02
	ld	(x), a
;	ldr.c: 119: SET (UART1_CR3, CR3_LBCL);
	bset	0x5236, #0
;	ldr.c: 123: SET (UART1_CR2, CR2_TEN);
	ldw	x, #0x5235
	ld	a, (x)
	or	a, #0x08
	ld	(x), a
;	ldr.c: 124: SET (UART1_CR2, CR2_REN);
	ldw	x, #0x5235
	ld	a, (x)
	or	a, #0x04
	ld	(x), a
;	ldr.c: 125: UART1_CR3 = CR3_CLKEN;
	ldw	x, #0x5236
	ld	a, #0x08
	ld	(x), a
	ret
;	ldr.c: 130: int main () {
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
	sub	sp, #6
;	ldr.c: 136: InitializeSystemClock();
	call	_InitializeSystemClock
;	ldr.c: 137: InitializeUART();
	call	_InitializeUART
;	ldr.c: 141: PD_DDR |= (1<<2);
	ldw	x, #0x5011
	ld	a, (x)
	or	a, #0x04
	ld	(x), a
;	ldr.c: 142: PD_CR1 |= (1<<2);
	ldw	x, #0x5012
	ld	a, (x)
	or	a, #0x04
	ld	(x), a
;	ldr.c: 143: PD_CR2 |= (1<<2);
	ldw	x, #0x5013
	ld	a, (x)
	or	a, #0x04
	ld	(x), a
;	ldr.c: 145: while (1) {
00108$:
;	ldr.c: 148: ampere=0;
	clrw	x
	ldw	(0x03, sp), x
;	ldr.c: 150: ADC_CSR |= ((0x0F)&4); // select channel = 4 = PD3
	ldw	x, #0x5400
	ld	a, (x)
	or	a, #0x04
	ld	(x), a
;	ldr.c: 151: ADC_CR2 |= ADC_ALIGN; // Right Aligned Data
	ldw	x, #0x5402
	ld	a, (x)
	or	a, #0x08
	ld	(x), a
;	ldr.c: 152: ADC_CR1 |= ADC_ADON; // ADC ON
	bset	0x5401, #0
;	ldr.c: 153: ADC_CR1 |= ADC_ADON; // start conversion 
	bset	0x5401, #0
;	ldr.c: 154: while(((ADC_CSR)&(1<<7))== 0); // Wait till EOC
00101$:
	ldw	x, #0x5400
	ld	a, (x)
	sll	a
	jrnc	00101$
;	ldr.c: 156: ampere |= (unsigned int)ADC_DRL;
	ldw	x, #0x5405
	ld	a, (x)
	rlwa	x
	clr	a
	rrwa	x
	ldw	y, (0x03, sp)
	ldw	(0x01, sp), y
	or	a, (0x02, sp)
	ld	yl, a
	ld	a, xh
	or	a, (0x01, sp)
	ld	yh, a
;	ldr.c: 157: ampere |= (unsigned int)ADC_DRH<<8;
	ldw	x, #0x5404
	ld	a, (x)
	clrw	x
	ld	xl, a
	sllw	x
	sllw	x
	sllw	x
	sllw	x
	sllw	x
	sllw	x
	sllw	x
	sllw	x
	ldw	(0x05, sp), y
	ld	a, xl
	or	a, (0x06, sp)
	ld	yl, a
	ld	a, xh
	or	a, (0x05, sp)
	ld	yh, a
;	ldr.c: 159: ADC_CR1 &= ~(1<<0); // ADC Stop Conversion
	ldw	x, #0x5401
	ld	a, (x)
	and	a, #0xfe
	ld	(x), a
;	ldr.c: 160: ampere &= 0x03ff; // 0 bits resolution so above 0x0400 is nothing
	ld	a, yh
	and	a, #0x03
	ld	yh, a
;	ldr.c: 163: PD_ODR |= (1<<2);
	ldw	x, #0x500f
	ld	a, (x)
;	ldr.c: 161: if (ampere > 0x2ff) //lights are on
	cpw	y, #0x02ff
	jrsle	00105$
;	ldr.c: 163: PD_ODR |= (1<<2);
	or	a, #0x04
	ldw	x, #0x500f
	ld	(x), a
	jra	00106$
00105$:
;	ldr.c: 166: PD_ODR &= ~(1<<2);
	and	a, #0xfb
	ldw	x, #0x500f
	ld	(x), a
00106$:
;	ldr.c: 168: delay(4000);
	push	#0xa0
	push	#0x0f
	call	_delay
	addw	sp, #2
	jp	00108$
	addw	sp, #6
	ret
	.area CODE
	.area INITIALIZER
	.area CABS (ABS)
