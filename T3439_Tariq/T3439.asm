
_interrupt1:
	PUSH	DSWPAG
	PUSH	50
	PUSH	RCOUNT
	PUSH	W0
	MOV	#2, W0
	REPEAT	#12
	PUSH	[W0++]

;T3439.c,21 :: 		void interrupt1() iv 0x000003C ics ICS_AUTO {
;T3439.c,23 :: 		IFS1.INT1IF = 0;
	BCLR.B	IFS1, #4
;T3439.c,24 :: 		_flag_1 = 1;
	MOV	#1, W0
	MOV	W0, __flag_1
;T3439.c,28 :: 		IEC1.INT1IE = 0; // Disable interrupt nul bit
	BCLR.B	IEC1, #4
;T3439.c,29 :: 		IEC1.INT2IE = 1; // Enable interrupt saftey 2
	BSET	IEC1, #13
;T3439.c,31 :: 		}
L_end_interrupt1:
	MOV	#26, W0
	REPEAT	#12
	POP	[W0--]
	POP	W0
	POP	RCOUNT
	POP	50
	POP	DSWPAG
	RETFIE
; end of _interrupt1

_interrupt2:
	PUSH	DSWPAG
	PUSH	50
	PUSH	RCOUNT
	PUSH	W0
	MOV	#2, W0
	REPEAT	#12
	PUSH	[W0++]

;T3439.c,35 :: 		void interrupt2() iv 0x000004E ics ICS_AUTO {
;T3439.c,37 :: 		IFS1.INT2IF = 0;
	PUSH	W10
	PUSH	W11
	BCLR	IFS1, #13
;T3439.c,38 :: 		_flag_2 = 1;
	MOV	#1, W0
	MOV	W0, __flag_2
;T3439.c,39 :: 		MOTOR_COMMAND(RORAT5, sizeof(RORAT5));
	MOV	#9, W11
	MOV	#lo_addr(T3439_RORAT5), W10
	CALL	_MOTOR_COMMAND
;T3439.c,41 :: 		IEC1.INT1IE = 1;
	BSET.B	IEC1, #4
;T3439.c,42 :: 		IEC1.INT2IE = 0;
	BCLR	IEC1, #13
;T3439.c,43 :: 		IEC3.INT3IE = 1;
	BSET.B	IEC3, #5
;T3439.c,45 :: 		}
L_end_interrupt2:
	POP	W11
	POP	W10
	MOV	#26, W0
	REPEAT	#12
	POP	[W0--]
	POP	W0
	POP	RCOUNT
	POP	50
	POP	DSWPAG
	RETFIE
; end of _interrupt2

_interrupt3:
	PUSH	DSWPAG
	PUSH	50
	PUSH	RCOUNT
	PUSH	W0
	MOV	#2, W0
	REPEAT	#12
	PUSH	[W0++]

;T3439.c,48 :: 		void interrupt3() iv 0x000007E ics ICS_AUTO {
;T3439.c,50 :: 		IFS1.INT3IF = 0; // Clear interrupt saftey 2 bit
	BCLR.B	IFS1, #5
;T3439.c,51 :: 		_flag_3 = 1;
	MOV	#1, W0
	MOV	W0, __flag_3
;T3439.c,53 :: 		IEC1.INT1IE = 0;
	BCLR.B	IEC1, #4
;T3439.c,54 :: 		IEC1.INT2IE = 0;
	BCLR	IEC1, #13
;T3439.c,55 :: 		IEC3.INT3IE = 0; // Disable interrupt saftey 2
	BCLR.B	IEC3, #5
;T3439.c,56 :: 		}
L_end_interrupt3:
	MOV	#26, W0
	REPEAT	#12
	POP	[W0--]
	POP	W0
	POP	RCOUNT
	POP	50
	POP	DSWPAG
	RETFIE
; end of _interrupt3

_main:
	MOV	#2048, W15
	MOV	#6142, W0
	MOV	WREG, 32
	MOV	#1, W0
	MOV	WREG, 50
	MOV	#4, W0
	IOR	68

;T3439.c,60 :: 		void main() {
;T3439.c,63 :: 		TRISB = 0x7EEF;
	PUSH	W10
	PUSH	W11
	PUSH	W12
	MOV	#32495, W0
	MOV	WREG, TRISB
;T3439.c,64 :: 		TRISC = 0xFFFF;
	MOV	#65535, W0
	MOV	WREG, TRISC
;T3439.c,65 :: 		TRISD = 0xFFFF;
	MOV	#65535, W0
	MOV	WREG, TRISD
;T3439.c,66 :: 		TRISE = 0xFFFF;
	MOV	#65535, W0
	MOV	WREG, TRISE
;T3439.c,67 :: 		TRISF = 0x0000;
	CLR	TRISF
;T3439.c,68 :: 		TRISG = 0xFFF3;
	MOV	#65523, W0
	MOV	WREG, TRISG
;T3439.c,69 :: 		ANSD = 0x0000;
	CLR	ANSD
;T3439.c,70 :: 		ANSB = 0x0000;
	CLR	ANSB
;T3439.c,73 :: 		UART1_Init(9600);
	MOV	#9600, W10
	MOV	#0, W11
	CALL	_UART1_Init
;T3439.c,74 :: 		UART3_Init(9600);
	MOV	#9600, W10
	MOV	#0, W11
	CALL	_UART3_Init
;T3439.c,76 :: 		Delay_ms(1500);
	MOV	#62, W8
	MOV	#2323, W7
L_main0:
	DEC	W7
	BRA NZ	L_main0
	DEC	W8
	BRA NZ	L_main0
	NOP
;T3439.c,77 :: 		LATB.F8 = 1;
	BSET	LATB, #8
;T3439.c,79 :: 		Unlock_IOLOCK();
	CALL	_Unlock_IOLOCK
;T3439.c,81 :: 		PPS_Mapping_NoLock(28, _INPUT, _U1RX); // Sets pin 15 to be Input, and maps RX3/DT3 Input to it
	MOV.B	#28, W12
	MOV.B	#1, W11
	MOV.B	#28, W10
	CALL	_PPS_Mapping_NoLock
;T3439.c,82 :: 		PPS_Mapping_NoLock(18, _OUTPUT, _U1TX); // Sets pin 5 to be Output
	MOV.B	#3, W12
	CLR	W11
	MOV.B	#18, W10
	CALL	_PPS_Mapping_NoLock
;T3439.c,85 :: 		PPS_Mapping_NoLock(14, _INPUT, _U3RX); // Sets pin 15 to be Input, and maps RX3/DT3 Input to it
	MOV.B	#32, W12
	MOV.B	#1, W11
	MOV.B	#14, W10
	CALL	_PPS_Mapping_NoLock
;T3439.c,86 :: 		PPS_Mapping_NoLock(29, _OUTPUT, _U3TX); // Sets pin 5 to be Output
	MOV.B	#28, W12
	CLR	W11
	MOV.B	#29, W10
	CALL	_PPS_Mapping_NoLock
;T3439.c,89 :: 		PPS_Mapping_NoLock(22, _INPUT, _INT1); // Sets pin 22 to be Input, and maps interrupt
	MOV.B	#3, W12
	MOV.B	#1, W11
	MOV.B	#22, W10
	CALL	_PPS_Mapping_NoLock
;T3439.c,90 :: 		PPS_Mapping_NoLock(25, _INPUT, _INT2); // Sets pin 25 to be Input, and maps interrupt
	MOV.B	#4, W12
	MOV.B	#1, W11
	MOV.B	#25, W10
	CALL	_PPS_Mapping_NoLock
;T3439.c,91 :: 		PPS_Mapping_NoLock(20, _INPUT, _INT3); // Sets pin 20 to be Input, and maps interrupt
	MOV.B	#5, W12
	MOV.B	#1, W11
	MOV.B	#20, W10
	CALL	_PPS_Mapping_NoLock
;T3439.c,93 :: 		Lock_IOLOCK();
	CALL	_Lock_IOLOCK
;T3439.c,96 :: 		INTCON1.NSTDIS = 0;
	BCLR	INTCON1, #15
;T3439.c,102 :: 		while (1) {
L_main2:
;T3439.c,104 :: 		GET_COMMANDS();
	CALL	_GET_COMMANDS
;T3439.c,106 :: 		if (PORTD.F4 == 0 && PORTD.F5 == 0) {
	BTSC	PORTD, #4
	GOTO	L__main28
	BTSC	PORTD, #5
	GOTO	L__main27
L__main26:
;T3439.c,107 :: 		IEC1.INT1IE = 1; //Nul ENABLE TO START TEST
	BSET.B	IEC1, #4
;T3439.c,106 :: 		if (PORTD.F4 == 0 && PORTD.F5 == 0) {
L__main28:
L__main27:
;T3439.c,110 :: 		if (_flag_1 == 1) {
	MOV	__flag_1, W0
	CP	W0, #1
	BRA Z	L__main37
	GOTO	L_main7
L__main37:
;T3439.c,111 :: 		GET_CURRENT_POS();
	CALL	_GET_CURRENT_POS
;T3439.c,112 :: 		_flag_1 = 0;
	CLR	W0
	MOV	W0, __flag_1
;T3439.c,114 :: 		}
L_main7:
;T3439.c,116 :: 		if (_flag_2 == 1 && PORTD.F4 == 1) {
	MOV	__flag_2, W0
	CP	W0, #1
	BRA Z	L__main38
	GOTO	L__main30
L__main38:
	BTSS	PORTD, #4
	GOTO	L__main29
L__main25:
;T3439.c,117 :: 		GET_CURRENT_POS();
	CALL	_GET_CURRENT_POS
;T3439.c,118 :: 		_flag_2 = 0;
	CLR	W0
	MOV	W0, __flag_2
;T3439.c,119 :: 		delay_ms(150);
	MOV	#7, W8
	MOV	#6785, W7
L_main11:
	DEC	W7
	BRA NZ	L_main11
	DEC	W8
	BRA NZ	L_main11
;T3439.c,120 :: 		MOTOR_COMMAND(RORAT5, sizeof(RORAT5));
	MOV	#9, W11
	MOV	#lo_addr(T3439_RORAT5), W10
	CALL	_MOTOR_COMMAND
;T3439.c,121 :: 		while (xx) {
L_main13:
	MOV	#lo_addr(_xx), W0
	CP0	[W0]
	BRA NZ	L__main39
	GOTO	L_main14
L__main39:
;T3439.c,122 :: 		if (PORTD.F4 == 0) {
	BTSC	PORTD, #4
	GOTO	L_main15
;T3439.c,123 :: 		GET_CURRENT_POS();
	CALL	_GET_CURRENT_POS
;T3439.c,124 :: 		xx = 0;
	CLR	W0
	MOV	W0, _xx
;T3439.c,128 :: 		}
L_main15:
;T3439.c,129 :: 		}
	GOTO	L_main13
L_main14:
;T3439.c,116 :: 		if (_flag_2 == 1 && PORTD.F4 == 1) {
L__main30:
L__main29:
;T3439.c,132 :: 		if (_flag_3 == 1&& PORTD.F5 == 1) {
	MOV	__flag_3, W0
	CP	W0, #1
	BRA Z	L__main40
	GOTO	L__main32
L__main40:
	BTSS	PORTD, #5
	GOTO	L__main31
L__main24:
;T3439.c,133 :: 		GET_CURRENT_POS();
	CALL	_GET_CURRENT_POS
;T3439.c,134 :: 		_flag_3 = 0;
	CLR	W0
	MOV	W0, __flag_3
;T3439.c,135 :: 		delay_ms(150);
	MOV	#7, W8
	MOV	#6785, W7
L_main19:
	DEC	W7
	BRA NZ	L_main19
	DEC	W8
	BRA NZ	L_main19
;T3439.c,136 :: 		MOTOR_COMMAND(RORAT5, sizeof(RORAT5));
	MOV	#9, W11
	MOV	#lo_addr(T3439_RORAT5), W10
	CALL	_MOTOR_COMMAND
;T3439.c,137 :: 		while (yy) {
L_main21:
	MOV	#lo_addr(_yy), W0
	CP0	[W0]
	BRA NZ	L__main41
	GOTO	L_main22
L__main41:
;T3439.c,138 :: 		if (PORTD.F5 == 0) {
	BTSC	PORTD, #5
	GOTO	L_main23
;T3439.c,139 :: 		GET_CURRENT_POS();
	CALL	_GET_CURRENT_POS
;T3439.c,140 :: 		yy = 0;
	CLR	W0
	MOV	W0, _yy
;T3439.c,143 :: 		}
L_main23:
;T3439.c,144 :: 		}
	GOTO	L_main21
L_main22:
;T3439.c,132 :: 		if (_flag_3 == 1&& PORTD.F5 == 1) {
L__main32:
L__main31:
;T3439.c,147 :: 		}
	GOTO	L_main2
;T3439.c,148 :: 		}
L_end_main:
	POP	W12
	POP	W11
	POP	W10
L__main_end_loop:
	BRA	L__main_end_loop
; end of _main
