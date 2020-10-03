
_main:
	MOV	#2048, W15
	MOV	#6142, W0
	MOV	WREG, 32
	MOV	#1, W0
	MOV	WREG, 50
	MOV	#4, W0
	IOR	68

;T3439.c,13 :: 		void main() {
;T3439.c,16 :: 		TRISB = 0x7EEF;
	PUSH	W10
	PUSH	W11
	PUSH	W12
	MOV	#32495, W0
	MOV	WREG, TRISB
;T3439.c,17 :: 		TRISC = 0xFFFF;
	MOV	#65535, W0
	MOV	WREG, TRISC
;T3439.c,18 :: 		TRISD = 0xFFFF;
	MOV	#65535, W0
	MOV	WREG, TRISD
;T3439.c,19 :: 		TRISE = 0xFFFF;
	MOV	#65535, W0
	MOV	WREG, TRISE
;T3439.c,20 :: 		TRISF = 0x0000;
	CLR	TRISF
;T3439.c,21 :: 		TRISG = 0xFFF3;
	MOV	#65523, W0
	MOV	WREG, TRISG
;T3439.c,22 :: 		ANSD = 0x0000;
	CLR	ANSD
;T3439.c,23 :: 		ANSB = 0x0000;
	CLR	ANSB
;T3439.c,26 :: 		UART1_Init(9600);
	MOV	#9600, W10
	MOV	#0, W11
	CALL	_UART1_Init
;T3439.c,27 :: 		UART3_Init(9600);
	MOV	#9600, W10
	MOV	#0, W11
	CALL	_UART3_Init
;T3439.c,29 :: 		Delay_ms(1500);
	MOV	#62, W8
	MOV	#2323, W7
L_main0:
	DEC	W7
	BRA NZ	L_main0
	DEC	W8
	BRA NZ	L_main0
	NOP
;T3439.c,30 :: 		LATB.F8 = 1;
	BSET	LATB, #8
;T3439.c,32 :: 		Unlock_IOLOCK();
	CALL	_Unlock_IOLOCK
;T3439.c,34 :: 		PPS_Mapping_NoLock(28, _INPUT, _U1RX); // Sets pin 15 to be Input, and maps RX3/DT3 Input to it
	MOV.B	#28, W12
	MOV.B	#1, W11
	MOV.B	#28, W10
	CALL	_PPS_Mapping_NoLock
;T3439.c,35 :: 		PPS_Mapping_NoLock(18, _OUTPUT, _U1TX); // Sets pin 5 to be Output
	MOV.B	#3, W12
	CLR	W11
	MOV.B	#18, W10
	CALL	_PPS_Mapping_NoLock
;T3439.c,38 :: 		PPS_Mapping_NoLock(14, _INPUT, _U3RX); // Sets pin 15 to be Input, and maps RX3/DT3 Input to it
	MOV.B	#32, W12
	MOV.B	#1, W11
	MOV.B	#14, W10
	CALL	_PPS_Mapping_NoLock
;T3439.c,39 :: 		PPS_Mapping_NoLock(29, _OUTPUT, _U3TX); // Sets pin 5 to be Output
	MOV.B	#28, W12
	CLR	W11
	MOV.B	#29, W10
	CALL	_PPS_Mapping_NoLock
;T3439.c,42 :: 		PPS_Mapping_NoLock(22, _INPUT, _INT1); // Sets pin 22 to be Input, and maps interrupt
	MOV.B	#3, W12
	MOV.B	#1, W11
	MOV.B	#22, W10
	CALL	_PPS_Mapping_NoLock
;T3439.c,43 :: 		PPS_Mapping_NoLock(25, _INPUT, _INT2); // Sets pin 25 to be Input, and maps interrupt
	MOV.B	#4, W12
	MOV.B	#1, W11
	MOV.B	#25, W10
	CALL	_PPS_Mapping_NoLock
;T3439.c,44 :: 		PPS_Mapping_NoLock(20, _INPUT, _INT3); // Sets pin 20 to be Input, and maps interrupt
	MOV.B	#5, W12
	MOV.B	#1, W11
	MOV.B	#20, W10
	CALL	_PPS_Mapping_NoLock
;T3439.c,46 :: 		Lock_IOLOCK();
	CALL	_Lock_IOLOCK
;T3439.c,49 :: 		INTCON1.NSTDIS = 0;
	BCLR	INTCON1, #15
;T3439.c,50 :: 		INTCON1.INT1EP = 0;
	BCLR.B	INTCON1, #1
;T3439.c,52 :: 		IEC3.INT3IE = 0; // Disable interrupt saftey 2
	BCLR.B	IEC3, #5
;T3439.c,53 :: 		IEC1.INT2IE = 0; // Disable interrupt saftey 1
	BCLR	IEC1, #13
;T3439.c,58 :: 		while (1) {
L_main2:
;T3439.c,60 :: 		GET_COMMANDS();
	CALL	_GET_COMMANDS
;T3439.c,62 :: 		if(PORTD.F4 == 0 && PORTD.F5 == 0){
	BTSC	PORTD, #4
	GOTO	L__main9
	BTSC	PORTD, #5
	GOTO	L__main8
L__main7:
;T3439.c,63 :: 		IEC1.INT1IE = 1; //Nul ENABLE TO START TEST
	BSET.B	IEC1, #4
;T3439.c,62 :: 		if(PORTD.F4 == 0 && PORTD.F5 == 0){
L__main9:
L__main8:
;T3439.c,66 :: 		}
	GOTO	L_main2
;T3439.c,67 :: 		}
L_end_main:
	POP	W12
	POP	W11
	POP	W10
L__main_end_loop:
	BRA	L__main_end_loop
; end of _main
