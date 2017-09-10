                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.4.0 #8981 (Jul  5 2014) (Linux)
                                      4 ; This file was generated Sun Sep 10 20:11:45 2017
                                      5 ;--------------------------------------------------------
                                      6 	.module ldr
                                      7 	.optsdcc -mstm8
                                      8 	
                                      9 ;--------------------------------------------------------
                                     10 ; Public variables in this module
                                     11 ;--------------------------------------------------------
                                     12 	.globl _main
                                     13 	.globl _InitializeUART
                                     14 	.globl _print_UCHAR_hex
                                     15 	.globl _UARTPrintF
                                     16 	.globl _delay
                                     17 	.globl _InitializeSystemClock
                                     18 	.globl _delayTenMicro
                                     19 ;--------------------------------------------------------
                                     20 ; ram data
                                     21 ;--------------------------------------------------------
                                     22 	.area DATA
                                     23 ;--------------------------------------------------------
                                     24 ; ram data
                                     25 ;--------------------------------------------------------
                                     26 	.area INITIALIZED
                                     27 ;--------------------------------------------------------
                                     28 ; Stack segment in internal ram 
                                     29 ;--------------------------------------------------------
                                     30 	.area	SSEG
      000000                         31 __start__stack:
      000000                         32 	.ds	1
                                     33 
                                     34 ;--------------------------------------------------------
                                     35 ; absolute external ram data
                                     36 ;--------------------------------------------------------
                                     37 	.area DABS (ABS)
                                     38 ;--------------------------------------------------------
                                     39 ; interrupt vector 
                                     40 ;--------------------------------------------------------
                                     41 	.area HOME
      008000                         42 __interrupt_vect:
      008000 82 00 80 83             43 	int s_GSINIT ;reset
      008004 82 00 00 00             44 	int 0x0000 ;trap
      008008 82 00 00 00             45 	int 0x0000 ;int0
      00800C 82 00 00 00             46 	int 0x0000 ;int1
      008010 82 00 00 00             47 	int 0x0000 ;int2
      008014 82 00 00 00             48 	int 0x0000 ;int3
      008018 82 00 00 00             49 	int 0x0000 ;int4
      00801C 82 00 00 00             50 	int 0x0000 ;int5
      008020 82 00 00 00             51 	int 0x0000 ;int6
      008024 82 00 00 00             52 	int 0x0000 ;int7
      008028 82 00 00 00             53 	int 0x0000 ;int8
      00802C 82 00 00 00             54 	int 0x0000 ;int9
      008030 82 00 00 00             55 	int 0x0000 ;int10
      008034 82 00 00 00             56 	int 0x0000 ;int11
      008038 82 00 00 00             57 	int 0x0000 ;int12
      00803C 82 00 00 00             58 	int 0x0000 ;int13
      008040 82 00 00 00             59 	int 0x0000 ;int14
      008044 82 00 00 00             60 	int 0x0000 ;int15
      008048 82 00 00 00             61 	int 0x0000 ;int16
      00804C 82 00 00 00             62 	int 0x0000 ;int17
      008050 82 00 00 00             63 	int 0x0000 ;int18
      008054 82 00 00 00             64 	int 0x0000 ;int19
      008058 82 00 00 00             65 	int 0x0000 ;int20
      00805C 82 00 00 00             66 	int 0x0000 ;int21
      008060 82 00 00 00             67 	int 0x0000 ;int22
      008064 82 00 00 00             68 	int 0x0000 ;int23
      008068 82 00 00 00             69 	int 0x0000 ;int24
      00806C 82 00 00 00             70 	int 0x0000 ;int25
      008070 82 00 00 00             71 	int 0x0000 ;int26
      008074 82 00 00 00             72 	int 0x0000 ;int27
      008078 82 00 00 00             73 	int 0x0000 ;int28
      00807C 82 00 00 00             74 	int 0x0000 ;int29
                                     75 ;--------------------------------------------------------
                                     76 ; global & static initialisations
                                     77 ;--------------------------------------------------------
                                     78 	.area HOME
                                     79 	.area GSINIT
                                     80 	.area GSFINAL
                                     81 	.area GSINIT
      008083                         82 __sdcc_gs_init_startup:
      008083                         83 __sdcc_init_data:
                                     84 ; stm8_genXINIT() start
      008083 AE 00 00         [ 2]   85 	ldw x, #l_DATA
      008086 27 07            [ 1]   86 	jreq	00002$
      008088                         87 00001$:
      008088 72 4F 00 00      [ 1]   88 	clr (s_DATA - 1, x)
      00808C 5A               [ 2]   89 	decw x
      00808D 26 F9            [ 1]   90 	jrne	00001$
      00808F                         91 00002$:
      00808F AE 00 00         [ 2]   92 	ldw	x, #l_INITIALIZER
      008092 27 09            [ 1]   93 	jreq	00004$
      008094                         94 00003$:
      008094 D6 83 0F         [ 1]   95 	ld	a, (s_INITIALIZER - 1, x)
      008097 D7 00 00         [ 1]   96 	ld	(s_INITIALIZED - 1, x), a
      00809A 5A               [ 2]   97 	decw	x
      00809B 26 F7            [ 1]   98 	jrne	00003$
      00809D                         99 00004$:
                                    100 ; stm8_genXINIT() end
                                    101 	.area GSFINAL
      00809D CC 80 80         [ 2]  102 	jp	__sdcc_program_startup
                                    103 ;--------------------------------------------------------
                                    104 ; Home
                                    105 ;--------------------------------------------------------
                                    106 	.area HOME
                                    107 	.area HOME
      008080                        108 __sdcc_program_startup:
      008080 CC 82 1B         [ 2]  109 	jp	_main
                                    110 ;	return from main will return to caller
                                    111 ;--------------------------------------------------------
                                    112 ; code
                                    113 ;--------------------------------------------------------
                                    114 	.area CODE
                                    115 ;	ldr.c: 27: void delayTenMicro (void) {
                                    116 ;	-----------------------------------------
                                    117 ;	 function delayTenMicro
                                    118 ;	-----------------------------------------
      0080A0                        119 _delayTenMicro:
                                    120 ;	ldr.c: 29: for (a = 0; a < 50; ++a)
      0080A0 A6 32            [ 1]  121 	ld	a, #0x32
      0080A2                        122 00104$:
                                    123 ;	ldr.c: 30: __asm__("nop");
      0080A2 9D               [ 1]  124 	nop
      0080A3 4A               [ 1]  125 	dec	a
                                    126 ;	ldr.c: 29: for (a = 0; a < 50; ++a)
      0080A4 4D               [ 1]  127 	tnz	a
      0080A5 26 FB            [ 1]  128 	jrne	00104$
      0080A7 81               [ 4]  129 	ret
                                    130 ;	ldr.c: 32: void InitializeSystemClock() {
                                    131 ;	-----------------------------------------
                                    132 ;	 function InitializeSystemClock
                                    133 ;	-----------------------------------------
      0080A8                        134 _InitializeSystemClock:
                                    135 ;	ldr.c: 33: CLK_ICKR = 0;                       //  Reset the Internal Clock Register.
      0080A8 AE 50 C0         [ 2]  136 	ldw	x, #0x50c0
      0080AB 7F               [ 1]  137 	clr	(x)
                                    138 ;	ldr.c: 34: CLK_ICKR = CLK_HSIEN;               //  Enable the HSI.
      0080AC AE 50 C0         [ 2]  139 	ldw	x, #0x50c0
      0080AF A6 01            [ 1]  140 	ld	a, #0x01
      0080B1 F7               [ 1]  141 	ld	(x), a
                                    142 ;	ldr.c: 35: CLK_ECKR = 0;                       //  Disable the external clock.
      0080B2 AE 50 C1         [ 2]  143 	ldw	x, #0x50c1
      0080B5 7F               [ 1]  144 	clr	(x)
                                    145 ;	ldr.c: 36: while ((CLK_ICKR & CLK_HSIRDY) == 0);       //  Wait for the HSI to be ready for use.
      0080B6                        146 00101$:
      0080B6 AE 50 C0         [ 2]  147 	ldw	x, #0x50c0
      0080B9 F6               [ 1]  148 	ld	a, (x)
      0080BA A5 02            [ 1]  149 	bcp	a, #0x02
      0080BC 27 F8            [ 1]  150 	jreq	00101$
                                    151 ;	ldr.c: 37: CLK_CKDIVR = 0;                     //  Ensure the clocks are running at full speed.
      0080BE AE 50 C6         [ 2]  152 	ldw	x, #0x50c6
      0080C1 7F               [ 1]  153 	clr	(x)
                                    154 ;	ldr.c: 38: CLK_PCKENR1 = 0xff;                 //  Enable all peripheral clocks.
      0080C2 AE 50 C7         [ 2]  155 	ldw	x, #0x50c7
      0080C5 A6 FF            [ 1]  156 	ld	a, #0xff
      0080C7 F7               [ 1]  157 	ld	(x), a
                                    158 ;	ldr.c: 39: CLK_PCKENR2 = 0xff;                 //  Ditto.
      0080C8 AE 50 CA         [ 2]  159 	ldw	x, #0x50ca
      0080CB A6 FF            [ 1]  160 	ld	a, #0xff
      0080CD F7               [ 1]  161 	ld	(x), a
                                    162 ;	ldr.c: 40: CLK_CCOR = 0;                       //  Turn off CCO.
      0080CE AE 50 C9         [ 2]  163 	ldw	x, #0x50c9
      0080D1 7F               [ 1]  164 	clr	(x)
                                    165 ;	ldr.c: 41: CLK_HSITRIMR = 0;                   //  Turn off any HSIU trimming.
      0080D2 AE 50 CC         [ 2]  166 	ldw	x, #0x50cc
      0080D5 7F               [ 1]  167 	clr	(x)
                                    168 ;	ldr.c: 42: CLK_SWIMCCR = 0;                    //  Set SWIM to run at clock / 2.
      0080D6 AE 50 CD         [ 2]  169 	ldw	x, #0x50cd
      0080D9 7F               [ 1]  170 	clr	(x)
                                    171 ;	ldr.c: 43: CLK_SWR = 0xe1;                     //  Use HSI as the clock source.
      0080DA AE 50 C4         [ 2]  172 	ldw	x, #0x50c4
      0080DD A6 E1            [ 1]  173 	ld	a, #0xe1
      0080DF F7               [ 1]  174 	ld	(x), a
                                    175 ;	ldr.c: 44: CLK_SWCR = 0;                       //  Reset the clock switch control register.
      0080E0 AE 50 C5         [ 2]  176 	ldw	x, #0x50c5
      0080E3 7F               [ 1]  177 	clr	(x)
                                    178 ;	ldr.c: 45: CLK_SWCR = CLK_SWEN;                //  Enable switching.
      0080E4 AE 50 C5         [ 2]  179 	ldw	x, #0x50c5
      0080E7 A6 02            [ 1]  180 	ld	a, #0x02
      0080E9 F7               [ 1]  181 	ld	(x), a
                                    182 ;	ldr.c: 46: while ((CLK_SWCR & CLK_SWBSY) != 0);        //  Pause while the clock switch is busy.
      0080EA                        183 00104$:
      0080EA AE 50 C5         [ 2]  184 	ldw	x, #0x50c5
      0080ED F6               [ 1]  185 	ld	a, (x)
      0080EE 44               [ 1]  186 	srl	a
      0080EF 25 F9            [ 1]  187 	jrc	00104$
      0080F1 81               [ 4]  188 	ret
                                    189 ;	ldr.c: 48: void delay (int time_ms) {
                                    190 ;	-----------------------------------------
                                    191 ;	 function delay
                                    192 ;	-----------------------------------------
      0080F2                        193 _delay:
      0080F2 52 0A            [ 2]  194 	sub	sp, #10
                                    195 ;	ldr.c: 50: for (x = 0; x < 1036*time_ms; ++x)
      0080F4 5F               [ 1]  196 	clrw	x
      0080F5 1F 03            [ 2]  197 	ldw	(0x03, sp), x
      0080F7 1F 01            [ 2]  198 	ldw	(0x01, sp), x
      0080F9 1E 0D            [ 2]  199 	ldw	x, (0x0d, sp)
      0080FB 89               [ 2]  200 	pushw	x
      0080FC 4B 0C            [ 1]  201 	push	#0x0c
      0080FE 4B 04            [ 1]  202 	push	#0x04
      008100 CD 82 BA         [ 4]  203 	call	__mulint
      008103 5B 04            [ 2]  204 	addw	sp, #4
      008105 1F 09            [ 2]  205 	ldw	(0x09, sp), x
      008107                        206 00103$:
      008107 16 09            [ 2]  207 	ldw	y, (0x09, sp)
      008109 17 07            [ 2]  208 	ldw	(0x07, sp), y
      00810B 7B 07            [ 1]  209 	ld	a, (0x07, sp)
      00810D 49               [ 1]  210 	rlc	a
      00810E 4F               [ 1]  211 	clr	a
      00810F A2 00            [ 1]  212 	sbc	a, #0x00
      008111 6B 06            [ 1]  213 	ld	(0x06, sp), a
      008113 6B 05            [ 1]  214 	ld	(0x05, sp), a
      008115 1E 03            [ 2]  215 	ldw	x, (0x03, sp)
      008117 13 07            [ 2]  216 	cpw	x, (0x07, sp)
      008119 7B 02            [ 1]  217 	ld	a, (0x02, sp)
      00811B 12 06            [ 1]  218 	sbc	a, (0x06, sp)
      00811D 7B 01            [ 1]  219 	ld	a, (0x01, sp)
      00811F 12 05            [ 1]  220 	sbc	a, (0x05, sp)
      008121 2E 17            [ 1]  221 	jrsge	00105$
                                    222 ;	ldr.c: 51: __asm__("nop");
      008123 9D               [ 1]  223 	nop
                                    224 ;	ldr.c: 50: for (x = 0; x < 1036*time_ms; ++x)
      008124 16 03            [ 2]  225 	ldw	y, (0x03, sp)
      008126 72 A9 00 01      [ 2]  226 	addw	y, #0x0001
      00812A 7B 02            [ 1]  227 	ld	a, (0x02, sp)
      00812C A9 00            [ 1]  228 	adc	a, #0x00
      00812E 97               [ 1]  229 	ld	xl, a
      00812F 7B 01            [ 1]  230 	ld	a, (0x01, sp)
      008131 A9 00            [ 1]  231 	adc	a, #0x00
      008133 95               [ 1]  232 	ld	xh, a
      008134 17 03            [ 2]  233 	ldw	(0x03, sp), y
      008136 1F 01            [ 2]  234 	ldw	(0x01, sp), x
      008138 20 CD            [ 2]  235 	jra	00103$
      00813A                        236 00105$:
      00813A 5B 0A            [ 2]  237 	addw	sp, #10
      00813C 81               [ 4]  238 	ret
                                    239 ;	ldr.c: 56: void UARTPrintF (char *message) {
                                    240 ;	-----------------------------------------
                                    241 ;	 function UARTPrintF
                                    242 ;	-----------------------------------------
      00813D                        243 _UARTPrintF:
                                    244 ;	ldr.c: 57: char *ch = message;
      00813D 16 03            [ 2]  245 	ldw	y, (0x03, sp)
                                    246 ;	ldr.c: 58: while (*ch) {
      00813F                        247 00104$:
      00813F 90 F6            [ 1]  248 	ld	a, (y)
      008141 4D               [ 1]  249 	tnz	a
      008142 27 0F            [ 1]  250 	jreq	00107$
                                    251 ;	ldr.c: 59: UART1_DR = (unsigned char) *ch;     //  Put the next character into the data transmission register.
      008144 AE 52 31         [ 2]  252 	ldw	x, #0x5231
      008147 F7               [ 1]  253 	ld	(x), a
                                    254 ;	ldr.c: 60: while ((UART1_SR & SR_TXE) == 0);   //  Wait for transmission to complete.
      008148                        255 00101$:
      008148 AE 52 30         [ 2]  256 	ldw	x, #0x5230
      00814B F6               [ 1]  257 	ld	a, (x)
      00814C 48               [ 1]  258 	sll	a
      00814D 24 F9            [ 1]  259 	jrnc	00101$
                                    260 ;	ldr.c: 61: ch++;                               //  Grab the next character.
      00814F 90 5C            [ 2]  261 	incw	y
      008151 20 EC            [ 2]  262 	jra	00104$
      008153                        263 00107$:
      008153 81               [ 4]  264 	ret
                                    265 ;	ldr.c: 64: void print_UCHAR_hex (unsigned char buffer) {
                                    266 ;	-----------------------------------------
                                    267 ;	 function print_UCHAR_hex
                                    268 ;	-----------------------------------------
      008154                        269 _print_UCHAR_hex:
      008154 52 0C            [ 2]  270 	sub	sp, #12
                                    271 ;	ldr.c: 67: a = (buffer >> 4);
      008156 7B 0F            [ 1]  272 	ld	a, (0x0f, sp)
      008158 4E               [ 1]  273 	swap	a
      008159 A4 0F            [ 1]  274 	and	a, #0x0f
      00815B 5F               [ 1]  275 	clrw	x
      00815C 97               [ 1]  276 	ld	xl, a
                                    277 ;	ldr.c: 68: if (a > 9)
      00815D A3 00 09         [ 2]  278 	cpw	x, #0x0009
      008160 2D 07            [ 1]  279 	jrsle	00102$
                                    280 ;	ldr.c: 69: a = a + 'a' - 10;
      008162 1C 00 57         [ 2]  281 	addw	x, #0x0057
      008165 1F 01            [ 2]  282 	ldw	(0x01, sp), x
      008167 20 05            [ 2]  283 	jra	00103$
      008169                        284 00102$:
                                    285 ;	ldr.c: 71: a += '0'; 
      008169 1C 00 30         [ 2]  286 	addw	x, #0x0030
      00816C 1F 01            [ 2]  287 	ldw	(0x01, sp), x
      00816E                        288 00103$:
                                    289 ;	ldr.c: 72: b = buffer & 0x0f;
      00816E 7B 0F            [ 1]  290 	ld	a, (0x0f, sp)
      008170 A4 0F            [ 1]  291 	and	a, #0x0f
      008172 5F               [ 1]  292 	clrw	x
      008173 97               [ 1]  293 	ld	xl, a
                                    294 ;	ldr.c: 73: if (b > 9)
      008174 A3 00 09         [ 2]  295 	cpw	x, #0x0009
      008177 2D 07            [ 1]  296 	jrsle	00105$
                                    297 ;	ldr.c: 74: b = b + 'a' - 10;
      008179 1C 00 57         [ 2]  298 	addw	x, #0x0057
      00817C 1F 0B            [ 2]  299 	ldw	(0x0b, sp), x
      00817E 20 05            [ 2]  300 	jra	00106$
      008180                        301 00105$:
                                    302 ;	ldr.c: 76: b += '0'; 
      008180 1C 00 30         [ 2]  303 	addw	x, #0x0030
      008183 1F 0B            [ 2]  304 	ldw	(0x0b, sp), x
      008185                        305 00106$:
                                    306 ;	ldr.c: 77: message[0] = a;
      008185 90 96            [ 1]  307 	ldw	y, sp
      008187 72 A9 00 03      [ 2]  308 	addw	y, #3
      00818B 7B 02            [ 1]  309 	ld	a, (0x02, sp)
      00818D 90 F7            [ 1]  310 	ld	(y), a
                                    311 ;	ldr.c: 78: message[1] = b;
      00818F 93               [ 1]  312 	ldw	x, y
      008190 5C               [ 2]  313 	incw	x
      008191 7B 0C            [ 1]  314 	ld	a, (0x0c, sp)
      008193 F7               [ 1]  315 	ld	(x), a
                                    316 ;	ldr.c: 79: message[2] = 0;
      008194 93               [ 1]  317 	ldw	x, y
      008195 5C               [ 2]  318 	incw	x
      008196 5C               [ 2]  319 	incw	x
      008197 7F               [ 1]  320 	clr	(x)
                                    321 ;	ldr.c: 80: UARTPrintF (message);
      008198 90 89            [ 2]  322 	pushw	y
      00819A CD 81 3D         [ 4]  323 	call	_UARTPrintF
      00819D 5B 02            [ 2]  324 	addw	sp, #2
      00819F 5B 0C            [ 2]  325 	addw	sp, #12
      0081A1 81               [ 4]  326 	ret
                                    327 ;	ldr.c: 83: void InitializeUART() {
                                    328 ;	-----------------------------------------
                                    329 ;	 function InitializeUART
                                    330 ;	-----------------------------------------
      0081A2                        331 _InitializeUART:
                                    332 ;	ldr.c: 93: UART1_CR1 = 0;
      0081A2 AE 52 34         [ 2]  333 	ldw	x, #0x5234
      0081A5 7F               [ 1]  334 	clr	(x)
                                    335 ;	ldr.c: 94: UART1_CR2 = 0;
      0081A6 AE 52 35         [ 2]  336 	ldw	x, #0x5235
      0081A9 7F               [ 1]  337 	clr	(x)
                                    338 ;	ldr.c: 95: UART1_CR4 = 0;
      0081AA AE 52 37         [ 2]  339 	ldw	x, #0x5237
      0081AD 7F               [ 1]  340 	clr	(x)
                                    341 ;	ldr.c: 96: UART1_CR3 = 0;
      0081AE AE 52 36         [ 2]  342 	ldw	x, #0x5236
      0081B1 7F               [ 1]  343 	clr	(x)
                                    344 ;	ldr.c: 97: UART1_CR5 = 0;
      0081B2 AE 52 38         [ 2]  345 	ldw	x, #0x5238
      0081B5 7F               [ 1]  346 	clr	(x)
                                    347 ;	ldr.c: 98: UART1_GTR = 0;
      0081B6 AE 52 39         [ 2]  348 	ldw	x, #0x5239
      0081B9 7F               [ 1]  349 	clr	(x)
                                    350 ;	ldr.c: 99: UART1_PSCR = 0;
      0081BA AE 52 3A         [ 2]  351 	ldw	x, #0x523a
      0081BD 7F               [ 1]  352 	clr	(x)
                                    353 ;	ldr.c: 103: UNSET (UART1_CR1, CR1_M);        //  8 Data bits.
      0081BE AE 52 34         [ 2]  354 	ldw	x, #0x5234
      0081C1 F6               [ 1]  355 	ld	a, (x)
      0081C2 A4 EF            [ 1]  356 	and	a, #0xef
      0081C4 F7               [ 1]  357 	ld	(x), a
                                    358 ;	ldr.c: 104: UNSET (UART1_CR1, CR1_PCEN);     //  Disable parity.
      0081C5 AE 52 34         [ 2]  359 	ldw	x, #0x5234
      0081C8 F6               [ 1]  360 	ld	a, (x)
      0081C9 A4 FB            [ 1]  361 	and	a, #0xfb
      0081CB F7               [ 1]  362 	ld	(x), a
                                    363 ;	ldr.c: 105: UNSET (UART1_CR3, CR3_STOPH);    //  1 stop bit.
      0081CC AE 52 36         [ 2]  364 	ldw	x, #0x5236
      0081CF F6               [ 1]  365 	ld	a, (x)
      0081D0 A4 DF            [ 1]  366 	and	a, #0xdf
      0081D2 F7               [ 1]  367 	ld	(x), a
                                    368 ;	ldr.c: 106: UNSET (UART1_CR3, CR3_STOPL);    //  1 stop bit.
      0081D3 AE 52 36         [ 2]  369 	ldw	x, #0x5236
      0081D6 F6               [ 1]  370 	ld	a, (x)
      0081D7 A4 EF            [ 1]  371 	and	a, #0xef
      0081D9 F7               [ 1]  372 	ld	(x), a
                                    373 ;	ldr.c: 107: UART1_BRR2 = 0x0a;      //  Set the baud rate registers to 115200 baud
      0081DA AE 52 33         [ 2]  374 	ldw	x, #0x5233
      0081DD A6 0A            [ 1]  375 	ld	a, #0x0a
      0081DF F7               [ 1]  376 	ld	(x), a
                                    377 ;	ldr.c: 108: UART1_BRR1 = 0x08;      //  based upon a 16 MHz system clock.
      0081E0 AE 52 32         [ 2]  378 	ldw	x, #0x5232
      0081E3 A6 08            [ 1]  379 	ld	a, #0x08
      0081E5 F7               [ 1]  380 	ld	(x), a
                                    381 ;	ldr.c: 112: UNSET (UART1_CR2, CR2_TEN);      //  Disable transmit.
      0081E6 AE 52 35         [ 2]  382 	ldw	x, #0x5235
      0081E9 F6               [ 1]  383 	ld	a, (x)
      0081EA A4 F7            [ 1]  384 	and	a, #0xf7
      0081EC F7               [ 1]  385 	ld	(x), a
                                    386 ;	ldr.c: 113: UNSET (UART1_CR2, CR2_REN);      //  Disable receive.
      0081ED AE 52 35         [ 2]  387 	ldw	x, #0x5235
      0081F0 F6               [ 1]  388 	ld	a, (x)
      0081F1 A4 FB            [ 1]  389 	and	a, #0xfb
      0081F3 F7               [ 1]  390 	ld	(x), a
                                    391 ;	ldr.c: 117: SET (UART1_CR3, CR3_CPOL);
      0081F4 AE 52 36         [ 2]  392 	ldw	x, #0x5236
      0081F7 F6               [ 1]  393 	ld	a, (x)
      0081F8 AA 04            [ 1]  394 	or	a, #0x04
      0081FA F7               [ 1]  395 	ld	(x), a
                                    396 ;	ldr.c: 118: SET (UART1_CR3, CR3_CPHA);
      0081FB AE 52 36         [ 2]  397 	ldw	x, #0x5236
      0081FE F6               [ 1]  398 	ld	a, (x)
      0081FF AA 02            [ 1]  399 	or	a, #0x02
      008201 F7               [ 1]  400 	ld	(x), a
                                    401 ;	ldr.c: 119: SET (UART1_CR3, CR3_LBCL);
      008202 72 10 52 36      [ 1]  402 	bset	0x5236, #0
                                    403 ;	ldr.c: 123: SET (UART1_CR2, CR2_TEN);
      008206 AE 52 35         [ 2]  404 	ldw	x, #0x5235
      008209 F6               [ 1]  405 	ld	a, (x)
      00820A AA 08            [ 1]  406 	or	a, #0x08
      00820C F7               [ 1]  407 	ld	(x), a
                                    408 ;	ldr.c: 124: SET (UART1_CR2, CR2_REN);
      00820D AE 52 35         [ 2]  409 	ldw	x, #0x5235
      008210 F6               [ 1]  410 	ld	a, (x)
      008211 AA 04            [ 1]  411 	or	a, #0x04
      008213 F7               [ 1]  412 	ld	(x), a
                                    413 ;	ldr.c: 125: UART1_CR3 = CR3_CLKEN;
      008214 AE 52 36         [ 2]  414 	ldw	x, #0x5236
      008217 A6 08            [ 1]  415 	ld	a, #0x08
      008219 F7               [ 1]  416 	ld	(x), a
      00821A 81               [ 4]  417 	ret
                                    418 ;	ldr.c: 130: int main () {
                                    419 ;	-----------------------------------------
                                    420 ;	 function main
                                    421 ;	-----------------------------------------
      00821B                        422 _main:
      00821B 52 06            [ 2]  423 	sub	sp, #6
                                    424 ;	ldr.c: 136: InitializeSystemClock();
      00821D CD 80 A8         [ 4]  425 	call	_InitializeSystemClock
                                    426 ;	ldr.c: 137: InitializeUART();
      008220 CD 81 A2         [ 4]  427 	call	_InitializeUART
                                    428 ;	ldr.c: 141: PD_DDR |= (1<<2);
      008223 AE 50 11         [ 2]  429 	ldw	x, #0x5011
      008226 F6               [ 1]  430 	ld	a, (x)
      008227 AA 04            [ 1]  431 	or	a, #0x04
      008229 F7               [ 1]  432 	ld	(x), a
                                    433 ;	ldr.c: 142: PD_CR1 |= (1<<2);
      00822A AE 50 12         [ 2]  434 	ldw	x, #0x5012
      00822D F6               [ 1]  435 	ld	a, (x)
      00822E AA 04            [ 1]  436 	or	a, #0x04
      008230 F7               [ 1]  437 	ld	(x), a
                                    438 ;	ldr.c: 143: PD_CR2 |= (1<<2);
      008231 AE 50 13         [ 2]  439 	ldw	x, #0x5013
      008234 F6               [ 1]  440 	ld	a, (x)
      008235 AA 04            [ 1]  441 	or	a, #0x04
      008237 F7               [ 1]  442 	ld	(x), a
                                    443 ;	ldr.c: 145: while (1) {
      008238                        444 00108$:
                                    445 ;	ldr.c: 148: ampere=0;
      008238 5F               [ 1]  446 	clrw	x
      008239 1F 03            [ 2]  447 	ldw	(0x03, sp), x
                                    448 ;	ldr.c: 150: ADC_CSR |= ((0x0F)&4); // select channel = 4 = PD3
      00823B AE 54 00         [ 2]  449 	ldw	x, #0x5400
      00823E F6               [ 1]  450 	ld	a, (x)
      00823F AA 04            [ 1]  451 	or	a, #0x04
      008241 F7               [ 1]  452 	ld	(x), a
                                    453 ;	ldr.c: 151: ADC_CR2 |= ADC_ALIGN; // Right Aligned Data
      008242 AE 54 02         [ 2]  454 	ldw	x, #0x5402
      008245 F6               [ 1]  455 	ld	a, (x)
      008246 AA 08            [ 1]  456 	or	a, #0x08
      008248 F7               [ 1]  457 	ld	(x), a
                                    458 ;	ldr.c: 152: ADC_CR1 |= ADC_ADON; // ADC ON
      008249 72 10 54 01      [ 1]  459 	bset	0x5401, #0
                                    460 ;	ldr.c: 153: ADC_CR1 |= ADC_ADON; // start conversion 
      00824D 72 10 54 01      [ 1]  461 	bset	0x5401, #0
                                    462 ;	ldr.c: 154: while(((ADC_CSR)&(1<<7))== 0); // Wait till EOC
      008251                        463 00101$:
      008251 AE 54 00         [ 2]  464 	ldw	x, #0x5400
      008254 F6               [ 1]  465 	ld	a, (x)
      008255 48               [ 1]  466 	sll	a
      008256 24 F9            [ 1]  467 	jrnc	00101$
                                    468 ;	ldr.c: 156: ampere |= (unsigned int)ADC_DRL;
      008258 AE 54 05         [ 2]  469 	ldw	x, #0x5405
      00825B F6               [ 1]  470 	ld	a, (x)
      00825C 02               [ 1]  471 	rlwa	x
      00825D 4F               [ 1]  472 	clr	a
      00825E 01               [ 1]  473 	rrwa	x
      00825F 16 03            [ 2]  474 	ldw	y, (0x03, sp)
      008261 17 01            [ 2]  475 	ldw	(0x01, sp), y
      008263 1A 02            [ 1]  476 	or	a, (0x02, sp)
      008265 90 97            [ 1]  477 	ld	yl, a
      008267 9E               [ 1]  478 	ld	a, xh
      008268 1A 01            [ 1]  479 	or	a, (0x01, sp)
      00826A 90 95            [ 1]  480 	ld	yh, a
                                    481 ;	ldr.c: 157: ampere |= (unsigned int)ADC_DRH<<8;
      00826C AE 54 04         [ 2]  482 	ldw	x, #0x5404
      00826F F6               [ 1]  483 	ld	a, (x)
      008270 5F               [ 1]  484 	clrw	x
      008271 97               [ 1]  485 	ld	xl, a
      008272 58               [ 2]  486 	sllw	x
      008273 58               [ 2]  487 	sllw	x
      008274 58               [ 2]  488 	sllw	x
      008275 58               [ 2]  489 	sllw	x
      008276 58               [ 2]  490 	sllw	x
      008277 58               [ 2]  491 	sllw	x
      008278 58               [ 2]  492 	sllw	x
      008279 58               [ 2]  493 	sllw	x
      00827A 17 05            [ 2]  494 	ldw	(0x05, sp), y
      00827C 9F               [ 1]  495 	ld	a, xl
      00827D 1A 06            [ 1]  496 	or	a, (0x06, sp)
      00827F 90 97            [ 1]  497 	ld	yl, a
      008281 9E               [ 1]  498 	ld	a, xh
      008282 1A 05            [ 1]  499 	or	a, (0x05, sp)
      008284 90 95            [ 1]  500 	ld	yh, a
                                    501 ;	ldr.c: 159: ADC_CR1 &= ~(1<<0); // ADC Stop Conversion
      008286 AE 54 01         [ 2]  502 	ldw	x, #0x5401
      008289 F6               [ 1]  503 	ld	a, (x)
      00828A A4 FE            [ 1]  504 	and	a, #0xfe
      00828C F7               [ 1]  505 	ld	(x), a
                                    506 ;	ldr.c: 160: ampere &= 0x03ff; // 0 bits resolution so above 0x0400 is nothing
      00828D 90 9E            [ 1]  507 	ld	a, yh
      00828F A4 03            [ 1]  508 	and	a, #0x03
      008291 90 95            [ 1]  509 	ld	yh, a
                                    510 ;	ldr.c: 163: PD_ODR |= (1<<2);
      008293 AE 50 0F         [ 2]  511 	ldw	x, #0x500f
      008296 F6               [ 1]  512 	ld	a, (x)
                                    513 ;	ldr.c: 161: if (ampere > 0x2ff) //lights are on
      008297 90 A3 02 FF      [ 2]  514 	cpw	y, #0x02ff
      00829B 2D 08            [ 1]  515 	jrsle	00105$
                                    516 ;	ldr.c: 163: PD_ODR |= (1<<2);
      00829D AA 04            [ 1]  517 	or	a, #0x04
      00829F AE 50 0F         [ 2]  518 	ldw	x, #0x500f
      0082A2 F7               [ 1]  519 	ld	(x), a
      0082A3 20 06            [ 2]  520 	jra	00106$
      0082A5                        521 00105$:
                                    522 ;	ldr.c: 166: PD_ODR &= ~(1<<2);
      0082A5 A4 FB            [ 1]  523 	and	a, #0xfb
      0082A7 AE 50 0F         [ 2]  524 	ldw	x, #0x500f
      0082AA F7               [ 1]  525 	ld	(x), a
      0082AB                        526 00106$:
                                    527 ;	ldr.c: 168: delay(4000);
      0082AB 4B A0            [ 1]  528 	push	#0xa0
      0082AD 4B 0F            [ 1]  529 	push	#0x0f
      0082AF CD 80 F2         [ 4]  530 	call	_delay
      0082B2 5B 02            [ 2]  531 	addw	sp, #2
      0082B4 CC 82 38         [ 2]  532 	jp	00108$
      0082B7 5B 06            [ 2]  533 	addw	sp, #6
      0082B9 81               [ 4]  534 	ret
                                    535 	.area CODE
                                    536 	.area INITIALIZER
                                    537 	.area CABS (ABS)
