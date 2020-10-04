
_interrupt1:
	PUSH	DSWPAG
	PUSH	50
	PUSH	RCOUNT
	PUSH	W0
	MOV	#2, W0
	REPEAT	#12
	PUSH	[W0++]

;T3439.c,21 :: 		void interrupt1() iv 0x000003C ics ICS_AUTO {
;T3439.c,23 :: 		IEC1.INT1IE = 0; // Disable interrupt nul bit
	BCLR.B	IEC1, #4
;T3439.c,24 :: 		IEC1.INT2IE = 1; // Enable interrupt saftey 2
	BSET	IEC1, #13
;T3439.c,26 :: 		IFS1.INT1IF = 0;
	BCLR.B	IFS1, #4
;T3439.c,27 :: 		GET_CURRENT_POS();
	CALL	_GET_CURRENT_POS
;T3439.c,28 :: 		_flag_1 = 1;
	MOV	#1, W0
	MOV	W0, __flag_1
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
;T3439.c,38 :: 		_flag_2 = 1;
	PUSH	W10
	PUSH	W11
	MOV	#1, W0
	MOV	W0, __flag_2
;T3439.c,40 :: 		uart1_write_text("interrupt2");
	MOV	#lo_addr(?lstr1_T3439), W10
	CALL	_UART1_Write_Text
;T3439.c,42 :: 		if (_flag_2 == 1 && PORTD.F4 == 1) {
	MOV	__flag_2, W0
	CP	W0, #1
	BRA Z	L__interrupt241
	GOTO	L__interrupt232
L__interrupt241:
	BTSS	PORTD, #4
	GOTO	L__interrupt231
L__interrupt230:
;T3439.c,43 :: 		uart1_write_text("flag2");
	MOV	#lo_addr(?lstr2_T3439), W10
	CALL	_UART1_Write_Text
;T3439.c,44 :: 		GET_CURRENT_POS();
	CALL	_GET_CURRENT_POS
;T3439.c,45 :: 		_flag_2 = 0;
	CLR	W0
	MOV	W0, __flag_2
;T3439.c,46 :: 		delay_ms(150);
	MOV	#7, W8
	MOV	#6785, W7
L_interrupt23:
	DEC	W7
	BRA NZ	L_interrupt23
	DEC	W8
	BRA NZ	L_interrupt23
;T3439.c,47 :: 		MOTOR_COMMAND(RORAT5, sizeof(RORAT5));
	MOV	#9, W11
	MOV	#lo_addr(T3439_RORAT5), W10
	CALL	_MOTOR_COMMAND
;T3439.c,48 :: 		while (xx) {
L_interrupt25:
	MOV	#lo_addr(_xx), W0
	CP0	[W0]
	BRA NZ	L__interrupt242
	GOTO	L_interrupt26
L__interrupt242:
;T3439.c,49 :: 		if (PORTD.F4 == 0) {
	BTSC	PORTD, #4
	GOTO	L_interrupt27
;T3439.c,50 :: 		GET_CURRENT_POS();
	CALL	_GET_CURRENT_POS
;T3439.c,51 :: 		xx = 0;
	CLR	W0
	MOV	W0, _xx
;T3439.c,53 :: 		IEC1.INT1IE = 1;
	BSET.B	IEC1, #4
;T3439.c,54 :: 		IEC1.INT2IE = 0;
	BCLR	IEC1, #13
;T3439.c,55 :: 		IEC3.INT3IE = 1;
	BSET.B	IEC3, #5
;T3439.c,56 :: 		}
L_interrupt27:
;T3439.c,57 :: 		}
	GOTO	L_interrupt25
L_interrupt26:
;T3439.c,42 :: 		if (_flag_2 == 1 && PORTD.F4 == 1) {
L__interrupt232:
L__interrupt231:
;T3439.c,60 :: 		}
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

;T3439.c,63 :: 		void interrupt3() iv 0x000007E ics ICS_AUTO {
;T3439.c,65 :: 		IFS1.INT3IF = 0; // Clear interrupt saftey 2 bit
	PUSH	W10
	PUSH	W11
	BCLR.B	IFS1, #5
;T3439.c,66 :: 		_flag_3 = 1;
	MOV	#1, W0
	MOV	W0, __flag_3
;T3439.c,68 :: 		if (_flag_3 && PORTD.F5 == 1) {
	BTSS	PORTD, #5
	GOTO	L__interrupt334
L__interrupt333:
;T3439.c,69 :: 		GET_CURRENT_POS();
	CALL	_GET_CURRENT_POS
;T3439.c,70 :: 		_flag_3 = 0;
	CLR	W0
	MOV	W0, __flag_3
;T3439.c,71 :: 		delay_ms(150);
	MOV	#7, W8
	MOV	#6785, W7
L_interrupt311:
	DEC	W7
	BRA NZ	L_interrupt311
	DEC	W8
	BRA NZ	L_interrupt311
;T3439.c,72 :: 		MOTOR_COMMAND(RORAT5, sizeof(RORAT5));
	MOV	#9, W11
	MOV	#lo_addr(T3439_RORAT5), W10
	CALL	_MOTOR_COMMAND
;T3439.c,73 :: 		while (yy) {
L_interrupt313:
	MOV	#lo_addr(_yy), W0
	CP0	[W0]
	BRA NZ	L__interrupt344
	GOTO	L_interrupt314
L__interrupt344:
;T3439.c,74 :: 		if (PORTD.F5 == 0) {
	BTSC	PORTD, #5
	GOTO	L_interrupt315
;T3439.c,75 :: 		GET_CURRENT_POS();
	CALL	_GET_CURRENT_POS
;T3439.c,76 :: 		yy = 0;
	CLR	W0
	MOV	W0, _yy
;T3439.c,78 :: 		IEC1.INT1IE = 0;
	BCLR.B	IEC1, #4
;T3439.c,79 :: 		IEC1.INT2IE = 0;
	BCLR	IEC1, #13
;T3439.c,80 :: 		IEC3.INT3IE = 0; // Disable interrupt saftey 2
	BCLR.B	IEC3, #5
;T3439.c,81 :: 		}
L_interrupt315:
;T3439.c,82 :: 		}
	GOTO	L_interrupt313
L_interrupt314:
;T3439.c,68 :: 		if (_flag_3 && PORTD.F5 == 1) {
L__interrupt334:
;T3439.c,85 :: 		}
L_end_interrupt3:
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
; end of _interrupt3

_main:
	MOV	#2048, W15
	MOV	#6142, W0
	MOV	WREG, 32
	MOV	#1, W0
	MOV	WREG, 50
	MOV	#4, W0
	IOR	68

;T3439.c,88 :: 		void main() {
;T3439.c,91 :: 		TRISB = 0x7EEF;
	PUSH	W10
	PUSH	W11
	PUSH	W12
	MOV	#32495, W0
	MOV	WREG, TRISB
;T3439.c,92 :: 		TRISC = 0xFFFF;
	MOV	#65535, W0
	MOV	WREG, TRISC
;T3439.c,93 :: 		TRISD = 0xFFFF;
	MOV	#65535, W0
	MOV	WREG, TRISD
;T3439.c,94 :: 		TRISE = 0xFFFF;
	MOV	#65535, W0
	MOV	WREG, TRISE
;T3439.c,95 :: 		TRISF = 0x0000;
	CLR	TRISF
;T3439.c,96 :: 		TRISG = 0xFFF3;
	MOV	#65523, W0
	MOV	WREG, TRISG
;T3439.c,97 :: 		ANSD = 0x0000;
	CLR	ANSD
;T3439.c,98 :: 		ANSB = 0x0000;
	CLR	ANSB
;T3439.c,101 :: 		UART1_Init(9600);
	MOV	#9600, W10
	MOV	#0, W11
	CALL	_UART1_Init
;T3439.c,102 :: 		UART3_Init(9600);
	MOV	#9600, W10
	MOV	#0, W11
	CALL	_UART3_Init
;T3439.c,104 :: 		Delay_ms(1500);
	MOV	#62, W8
	MOV	#2323, W7
L_main16:
	DEC	W7
	BRA NZ	L_main16
	DEC	W8
	BRA NZ	L_main16
	NOP
;T3439.c,105 :: 		LATB.F8 = 1;
	BSET	LATB, #8
;T3439.c,107 :: 		Unlock_IOLOCK();
	CALL	_Unlock_IOLOCK
;T3439.c,109 :: 		PPS_Mapping_NoLock(28, _INPUT, _U1RX); // Sets pin 15 to be Input, and maps RX3/DT3 Input to it
	MOV.B	#28, W12
	MOV.B	#1, W11
	MOV.B	#28, W10
	CALL	_PPS_Mapping_NoLock
;T3439.c,110 :: 		PPS_Mapping_NoLock(18, _OUTPUT, _U1TX); // Sets pin 5 to be Output
	MOV.B	#3, W12
	CLR	W11
	MOV.B	#18, W10
	CALL	_PPS_Mapping_NoLock
;T3439.c,113 :: 		PPS_Mapping_NoLock(14, _INPUT, _U3RX); // Sets pin 15 to be Input, and maps RX3/DT3 Input to it
	MOV.B	#32, W12
	MOV.B	#1, W11
	MOV.B	#14, W10
	CALL	_PPS_Mapping_NoLock
;T3439.c,114 :: 		PPS_Mapping_NoLock(29, _OUTPUT, _U3TX); // Sets pin 5 to be Output
	MOV.B	#28, W12
	CLR	W11
	MOV.B	#29, W10
	CALL	_PPS_Mapping_NoLock
;T3439.c,117 :: 		PPS_Mapping_NoLock(22, _INPUT, _INT1); // Sets pin 22 to be Input, and maps interrupt
	MOV.B	#3, W12
	MOV.B	#1, W11
	MOV.B	#22, W10
	CALL	_PPS_Mapping_NoLock
;T3439.c,118 :: 		PPS_Mapping_NoLock(25, _INPUT, _INT2); // Sets pin 25 to be Input, and maps interrupt
	MOV.B	#4, W12
	MOV.B	#1, W11
	MOV.B	#25, W10
	CALL	_PPS_Mapping_NoLock
;T3439.c,119 :: 		PPS_Mapping_NoLock(20, _INPUT, _INT3); // Sets pin 20 to be Input, and maps interrupt
	MOV.B	#5, W12
	MOV.B	#1, W11
	MOV.B	#20, W10
	CALL	_PPS_Mapping_NoLock
;T3439.c,121 :: 		Lock_IOLOCK();
	CALL	_Lock_IOLOCK
;T3439.c,124 :: 		INTCON1.NSTDIS = 0;
	BCLR	INTCON1, #15
;T3439.c,126 :: 		IEC3.INT3IE = 0; // Disable interrupt saftey 2
	BCLR.B	IEC3, #5
;T3439.c,127 :: 		IEC1.INT2IE = 0; // Disable interrupt saftey 1
	BCLR	IEC1, #13
;T3439.c,129 :: 		while (1) {
L_main18:
;T3439.c,132 :: 		if (uart1_Data_Ready()) {
	CALL	_UART1_Data_Ready
	CP0	W0
	BRA NZ	L__main46
	GOTO	L_main20
L__main46:
;T3439.c,133 :: 		uart1_read_text(input, "\r\n", sizeof(input)); // Read String data up to 10th charachter if \r if found stop looking and put data in input.
	MOV.B	#16, W12
	MOV	#lo_addr(?lstr3_T3439), W11
	MOV	#lo_addr(_input), W10
	CALL	_UART1_Read_Text
;T3439.c,135 :: 		if (strcmp(input, COMMAND_START) == 0) {
	MOV	#lo_addr(T3439_COMMAND_START), W11
	MOV	#lo_addr(_input), W10
	CALL	_strcmp
	CP	W0, #0
	BRA Z	L__main47
	GOTO	L_main21
L__main47:
;T3439.c,138 :: 		MOTOR_COMMAND(ROLAT5, sizeof(ROLAT5));
	MOV	#9, W11
	MOV	#lo_addr(T3439_ROLAT5), W10
	CALL	_MOTOR_COMMAND
;T3439.c,140 :: 		} else if (strcmp(input, COMMMAND_STOP) == 0) {
	GOTO	L_main22
L_main21:
	MOV	#lo_addr(T3439_COMMMAND_STOP), W11
	MOV	#lo_addr(_input), W10
	CALL	_strcmp
	CP	W0, #0
	BRA Z	L__main48
	GOTO	L_main23
L__main48:
;T3439.c,141 :: 		uart1_write_text("Stopped!");
	MOV	#lo_addr(?lstr4_T3439), W10
	CALL	_UART1_Write_Text
;T3439.c,142 :: 		MOTOR_COMMAND(STOP, sizeof(STOP));
	MOV	#9, W11
	MOV	#lo_addr(T3439_STOP), W10
	CALL	_MOTOR_COMMAND
;T3439.c,143 :: 		} else if (strcmp(input, COMMAND_RESET) == 0) {
	GOTO	L_main24
L_main23:
	MOV	#lo_addr(T3439_COMMAND_RESET), W11
	MOV	#lo_addr(_input), W10
	CALL	_strcmp
	CP	W0, #0
	BRA Z	L__main49
	GOTO	L_main25
L__main49:
;T3439.c,145 :: 		reset
	RESET
;T3439.c,147 :: 		} else {}
	GOTO	L_main26
L_main25:
L_main26:
L_main24:
L_main22:
;T3439.c,148 :: 		}
L_main20:
;T3439.c,150 :: 		if (PORTD.F4 == 0 && PORTD.F5 == 0) {
	BTSC	PORTD, #4
	GOTO	L__main38
	BTSC	PORTD, #5
	GOTO	L__main37
L__main36:
;T3439.c,151 :: 		IEC1.INT1IE = 1; //Nul ENABLE TO START TEST
	BSET.B	IEC1, #4
;T3439.c,150 :: 		if (PORTD.F4 == 0 && PORTD.F5 == 0) {
L__main38:
L__main37:
;T3439.c,154 :: 		}
	GOTO	L_main18
;T3439.c,155 :: 		}
L_end_main:
	POP	W12
	POP	W11
	POP	W10
L__main_end_loop:
	BRA	L__main_end_loop
; end of _main
