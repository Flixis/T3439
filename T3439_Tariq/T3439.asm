
_interrupt1:
	PUSH	DSWPAG
	PUSH	50
	PUSH	RCOUNT
	PUSH	W0
	MOV	#2, W0
	REPEAT	#12
	PUSH	[W0++]

;T3439.c,34 :: 		void interrupt1() iv 0x000003C ics ICS_AUTO {
;T3439.c,36 :: 		if (_flag_1 == 1) {
	PUSH	W10
	MOV	__flag_1, W0
	CP	W0, #1
	BRA Z	L__interrupt148
	GOTO	L_interrupt10
L__interrupt148:
;T3439.c,37 :: 		GET_CURRENT_POS(Pos1data);
	MOV	#lo_addr(_Pos1data), W10
	CALL	_GET_CURRENT_POS
;T3439.c,38 :: 		delay_ms(500);
	MOV	#21, W8
	MOV	#22619, W7
L_interrupt11:
	DEC	W7
	BRA NZ	L_interrupt11
	DEC	W8
	BRA NZ	L_interrupt11
;T3439.c,39 :: 		_flag_1 = 0;
	CLR	W0
	MOV	W0, __flag_1
;T3439.c,40 :: 		_flag_2 = 1;
	MOV	#1, W0
	MOV	W0, __flag_2
;T3439.c,44 :: 		IFS1.INT1IF = 0; // Clear interrupt nul bit
	BCLR.B	IFS1, #4
;T3439.c,45 :: 		IEC1.INT1IE = 0; // Disable interrupt nul bit
	BCLR.B	IEC1, #4
;T3439.c,46 :: 		IEC1.INT2IE = 1; // Enable interrupt saftey 2
	BSET	IEC1, #13
;T3439.c,47 :: 		}
L_interrupt10:
;T3439.c,48 :: 		if (_flag_4 == 1) {
	MOV	__flag_4, W0
	CP	W0, #1
	BRA Z	L__interrupt149
	GOTO	L_interrupt13
L__interrupt149:
;T3439.c,49 :: 		GET_CURRENT_POS(Pos4data);
	MOV	#lo_addr(_Pos4data), W10
	CALL	_GET_CURRENT_POS
;T3439.c,50 :: 		_flag_4 = 0;
	CLR	W0
	MOV	W0, __flag_4
;T3439.c,51 :: 		_flag_5 = 1;
	MOV	#1, W0
	MOV	W0, __flag_5
;T3439.c,54 :: 		IFS1.INT1IF = 0; // Clear interrupt nul bit
	BCLR.B	IFS1, #4
;T3439.c,55 :: 		IEC1.INT1IE = 0; // Disable interrupt nul bit
	BCLR.B	IEC1, #4
;T3439.c,56 :: 		IEC3.INT3IE = 1; // Enable interrupt saftey 2
	BSET.B	IEC3, #5
;T3439.c,57 :: 		}
L_interrupt13:
;T3439.c,58 :: 		}
L_end_interrupt1:
	POP	W10
	MOV	#26, W0
	REPEAT	#12
	POP	[W0--]
	POP	W0
	POP	RCOUNT
	POP	50
	POP	DSWPAG
	RETFIE
; end of _interrupt1

_interrupt2_low:
	PUSH	DSWPAG
	PUSH	50
	PUSH	RCOUNT
	PUSH	W0
	MOV	#2, W0
	REPEAT	#12
	PUSH	[W0++]

;T3439.c,61 :: 		void interrupt2_low() iv 0x000004E ics ICS_AUTO {
;T3439.c,63 :: 		if (PORTD.F4 == 1 && _flag_2 == 1) {
	PUSH	W10
	PUSH	W11
	BTSS	PORTD, #4
	GOTO	L__interrupt2_low38
	MOV	__flag_2, W0
	CP	W0, #1
	BRA Z	L__interrupt2_low51
	GOTO	L__interrupt2_low37
L__interrupt2_low51:
L__interrupt2_low36:
;T3439.c,64 :: 		GET_CURRENT_POS(Pos2data);
	MOV	#lo_addr(_Pos2data), W10
	CALL	_GET_CURRENT_POS
;T3439.c,65 :: 		_flag_2 = 0;
	CLR	W0
	MOV	W0, __flag_2
;T3439.c,66 :: 		_flag_3 = 1;
	MOV	#1, W0
	MOV	W0, __flag_3
;T3439.c,67 :: 		delay_ms(300);
	MOV	#13, W8
	MOV	#13571, W7
L_interrupt2_low7:
	DEC	W7
	BRA NZ	L_interrupt2_low7
	DEC	W8
	BRA NZ	L_interrupt2_low7
;T3439.c,68 :: 		Motor_Command(RORAT5, sizeof(RORAT5));
	MOV	#9, W11
	MOV	#lo_addr(T3439_RORAT5), W10
	CALL	_MOTOR_COMMAND
;T3439.c,70 :: 		IFS1.INT2IF = 0; // Clear Safety flag bit
	BCLR	IFS1, #13
;T3439.c,71 :: 		INTCON2.INT2EP = 1; //Set Safety bit to negative edge detect.
	BSET.B	INTCON2, #2
;T3439.c,63 :: 		if (PORTD.F4 == 1 && _flag_2 == 1) {
L__interrupt2_low38:
L__interrupt2_low37:
;T3439.c,73 :: 		if (PORTD.F4 == 0 && _flag_3 == 1) {
	BTSC	PORTD, #4
	GOTO	L__interrupt2_low40
	MOV	__flag_3, W0
	CP	W0, #1
	BRA Z	L__interrupt2_low52
	GOTO	L__interrupt2_low39
L__interrupt2_low52:
L__interrupt2_low35:
;T3439.c,74 :: 		GET_CURRENT_POS(Pos3data);
	MOV	#lo_addr(_Pos3data), W10
	CALL	_GET_CURRENT_POS
;T3439.c,75 :: 		_flag_3 = 0;
	CLR	W0
	MOV	W0, __flag_3
;T3439.c,76 :: 		_flag_4 = 1;
	MOV	#1, W0
	MOV	W0, __flag_4
;T3439.c,78 :: 		IEC1.INT2IE = 0; // Disable interrupt saftey 2
	BCLR	IEC1, #13
;T3439.c,79 :: 		IEC1.INT1IE = 1; // Enable interrupt nul bit
	BSET.B	IEC1, #4
;T3439.c,73 :: 		if (PORTD.F4 == 0 && _flag_3 == 1) {
L__interrupt2_low40:
L__interrupt2_low39:
;T3439.c,83 :: 		}
L_end_interrupt2_low:
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
; end of _interrupt2_low

_interrupt3:
	PUSH	DSWPAG
	PUSH	50
	PUSH	RCOUNT
	PUSH	W0
	MOV	#2, W0
	REPEAT	#12
	PUSH	[W0++]

;T3439.c,85 :: 		void interrupt3() iv 0x000007E ics ICS_AUTO {
;T3439.c,87 :: 		if (PORTD.F5 == 1 && _flag_5 == 1) {
	PUSH	W10
	PUSH	W11
	BTSS	PORTD, #5
	GOTO	L__interrupt344
	MOV	__flag_5, W0
	CP	W0, #1
	BRA Z	L__interrupt354
	GOTO	L__interrupt343
L__interrupt354:
L__interrupt342:
;T3439.c,88 :: 		GET_CURRENT_POS(Pos5data);
	MOV	#lo_addr(_Pos5data), W10
	CALL	_GET_CURRENT_POS
;T3439.c,89 :: 		_flag_5 = 0;
	CLR	W0
	MOV	W0, __flag_5
;T3439.c,90 :: 		_flag_6 = 1;
	MOV	#1, W0
	MOV	W0, __flag_6
;T3439.c,91 :: 		delay_ms(300);
	MOV	#13, W8
	MOV	#13571, W7
L_interrupt315:
	DEC	W7
	BRA NZ	L_interrupt315
	DEC	W8
	BRA NZ	L_interrupt315
;T3439.c,92 :: 		Motor_Command(ROLAT5, sizeof(ROLAT5));
	MOV	#9, W11
	MOV	#lo_addr(T3439_ROLAT5), W10
	CALL	_MOTOR_COMMAND
;T3439.c,94 :: 		IFS1.INT3IF = 0; // Clear interrupt saftey 2 bit
	BCLR.B	IFS1, #5
;T3439.c,95 :: 		INTCON2.INT3EP = 1; //Set Safety2 bit to negative edge detect
	BSET.B	INTCON2, #3
;T3439.c,87 :: 		if (PORTD.F5 == 1 && _flag_5 == 1) {
L__interrupt344:
L__interrupt343:
;T3439.c,97 :: 		if (PORTD.F5 == 0 && _flag_6 == 1) {
	BTSC	PORTD, #5
	GOTO	L__interrupt346
	MOV	__flag_6, W0
	CP	W0, #1
	BRA Z	L__interrupt355
	GOTO	L__interrupt345
L__interrupt355:
L__interrupt341:
;T3439.c,98 :: 		GET_CURRENT_POS(Pos6data);
	MOV	#lo_addr(_Pos6data), W10
	CALL	_GET_CURRENT_POS
;T3439.c,99 :: 		_flag_6 = 0;
	CLR	W0
	MOV	W0, __flag_6
;T3439.c,100 :: 		delay_ms(50);
	MOV	#3, W8
	MOV	#2261, W7
L_interrupt320:
	DEC	W7
	BRA NZ	L_interrupt320
	DEC	W8
	BRA NZ	L_interrupt320
;T3439.c,101 :: 		Motor_Command(STOP, sizeof(STOP));
	MOV	#9, W11
	MOV	#lo_addr(T3439_STOP), W10
	CALL	_MOTOR_COMMAND
;T3439.c,103 :: 		IEC3.INT3IE = 0; // Enable interrupt saftey 2
	BCLR.B	IEC3, #5
;T3439.c,104 :: 		IEC1.INT1IE = 1; // Disable interrupt nul bit
	BSET.B	IEC1, #4
;T3439.c,105 :: 		delay_ms(500);
	MOV	#21, W8
	MOV	#22619, W7
L_interrupt322:
	DEC	W7
	BRA NZ	L_interrupt322
	DEC	W8
	BRA NZ	L_interrupt322
;T3439.c,107 :: 		reset
	RESET
;T3439.c,97 :: 		if (PORTD.F5 == 0 && _flag_6 == 1) {
L__interrupt346:
L__interrupt345:
;T3439.c,111 :: 		}
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

;T3439.c,114 :: 		void main() {
;T3439.c,117 :: 		TRISB = 0x7EEF;
	PUSH	W10
	PUSH	W11
	PUSH	W12
	MOV	#32495, W0
	MOV	WREG, TRISB
;T3439.c,118 :: 		TRISC = 0xFFFF;
	MOV	#65535, W0
	MOV	WREG, TRISC
;T3439.c,119 :: 		TRISD = 0xFFFF;
	MOV	#65535, W0
	MOV	WREG, TRISD
;T3439.c,120 :: 		TRISE = 0xFFFF;
	MOV	#65535, W0
	MOV	WREG, TRISE
;T3439.c,121 :: 		TRISF = 0x0000;
	CLR	TRISF
;T3439.c,122 :: 		TRISG = 0xFFF3;
	MOV	#65523, W0
	MOV	WREG, TRISG
;T3439.c,123 :: 		ANSD = 0x0000;
	CLR	ANSD
;T3439.c,124 :: 		ANSB = 0x0000;
	CLR	ANSB
;T3439.c,127 :: 		UART1_Init(9600);
	MOV	#9600, W10
	MOV	#0, W11
	CALL	_UART1_Init
;T3439.c,128 :: 		UART3_Init(9600);
	MOV	#9600, W10
	MOV	#0, W11
	CALL	_UART3_Init
;T3439.c,130 :: 		Delay_ms(3000);
	MOV	#123, W8
	MOV	#4647, W7
L_main24:
	DEC	W7
	BRA NZ	L_main24
	DEC	W8
	BRA NZ	L_main24
	NOP
	NOP
;T3439.c,131 :: 		LATB.F8 = 1;
	BSET	LATB, #8
;T3439.c,133 :: 		Unlock_IOLOCK();
	CALL	_Unlock_IOLOCK
;T3439.c,135 :: 		PPS_Mapping_NoLock(28, _INPUT, _U1RX); // Sets pin 15 to be Input, and maps RX3/DT3 Input to it
	MOV.B	#28, W12
	MOV.B	#1, W11
	MOV.B	#28, W10
	CALL	_PPS_Mapping_NoLock
;T3439.c,136 :: 		PPS_Mapping_NoLock(18, _OUTPUT, _U1TX); // Sets pin 5 to be Output
	MOV.B	#3, W12
	CLR	W11
	MOV.B	#18, W10
	CALL	_PPS_Mapping_NoLock
;T3439.c,139 :: 		PPS_Mapping_NoLock(14, _INPUT, _U3RX); // Sets pin 15 to be Input, and maps RX3/DT3 Input to it
	MOV.B	#32, W12
	MOV.B	#1, W11
	MOV.B	#14, W10
	CALL	_PPS_Mapping_NoLock
;T3439.c,140 :: 		PPS_Mapping_NoLock(29, _OUTPUT, _U3TX); // Sets pin 5 to be Output
	MOV.B	#28, W12
	CLR	W11
	MOV.B	#29, W10
	CALL	_PPS_Mapping_NoLock
;T3439.c,143 :: 		PPS_Mapping_NoLock(22, _INPUT, _INT1); // Sets pin 22 to be Input, and maps interrupt
	MOV.B	#3, W12
	MOV.B	#1, W11
	MOV.B	#22, W10
	CALL	_PPS_Mapping_NoLock
;T3439.c,144 :: 		PPS_Mapping_NoLock(25, _INPUT, _INT2); // Sets pin 25 to be Input, and maps interrupt
	MOV.B	#4, W12
	MOV.B	#1, W11
	MOV.B	#25, W10
	CALL	_PPS_Mapping_NoLock
;T3439.c,145 :: 		PPS_Mapping_NoLock(20, _INPUT, _INT3); // Sets pin 20 to be Input, and maps interrupt
	MOV.B	#5, W12
	MOV.B	#1, W11
	MOV.B	#20, W10
	CALL	_PPS_Mapping_NoLock
;T3439.c,147 :: 		Lock_IOLOCK();
	CALL	_Lock_IOLOCK
;T3439.c,150 :: 		INTCON1.NSTDIS = 0;
	BCLR	INTCON1, #15
;T3439.c,152 :: 		IEC3.INT3IE = 0; // Disable interrupt saftey 2
	BCLR.B	IEC3, #5
;T3439.c,153 :: 		IEC1.INT2IE = 0; // Disable interrupt saftey 1
	BCLR	IEC1, #13
;T3439.c,154 :: 		IEC1.INT1IE = 1; //Nul ENABLE TO START TEST
	BSET.B	IEC1, #4
;T3439.c,156 :: 		while (1) {
L_main26:
;T3439.c,158 :: 		if (UART1_Data_Ready() > 0) {
	CALL	_UART1_Data_Ready
	CP	W0, #0
	BRA GTU	L__main57
	GOTO	L_main28
L__main57:
;T3439.c,159 :: 		uart1_read_text(input, "\r\n", 16); // Read String data up to 10th charachter if \r if found stop looking and put data in input.
	MOV.B	#16, W12
	MOV	#lo_addr(?lstr1_T3439), W11
	MOV	#lo_addr(_input), W10
	CALL	_UART1_Read_Text
;T3439.c,162 :: 		if (strcmp(input, COMMAND_START) == 0) {
	MOV	#lo_addr(T3439_COMMAND_START), W11
	MOV	#lo_addr(_input), W10
	CALL	_strcmp
	CP	W0, #0
	BRA Z	L__main58
	GOTO	L_main29
L__main58:
;T3439.c,163 :: 		Motor_Command(ROLAT5, sizeof(ROLAT5));
	MOV	#9, W11
	MOV	#lo_addr(T3439_ROLAT5), W10
	CALL	_MOTOR_COMMAND
;T3439.c,164 :: 		} else if (strcmp(input, COMMMAND_STOP) == 0) {
	GOTO	L_main30
L_main29:
	MOV	#lo_addr(T3439_COMMMAND_STOP), W11
	MOV	#lo_addr(_input), W10
	CALL	_strcmp
	CP	W0, #0
	BRA Z	L__main59
	GOTO	L_main31
L__main59:
;T3439.c,165 :: 		uart1_write_text("Stopped!");
	MOV	#lo_addr(?lstr2_T3439), W10
	CALL	_UART1_Write_Text
;T3439.c,166 :: 		Motor_Command(STOP, sizeof(STOP));
	MOV	#9, W11
	MOV	#lo_addr(T3439_STOP), W10
	CALL	_MOTOR_COMMAND
;T3439.c,167 :: 		} else if (strcmp(input, COMMAND_RESET) == 0) {
	GOTO	L_main32
L_main31:
	MOV	#lo_addr(T3439_COMMAND_RESET), W11
	MOV	#lo_addr(_input), W10
	CALL	_strcmp
	CP	W0, #0
	BRA Z	L__main60
	GOTO	L_main33
L__main60:
;T3439.c,169 :: 		reset
	RESET
;T3439.c,171 :: 		} else {
	GOTO	L_main34
L_main33:
;T3439.c,174 :: 		}
L_main34:
L_main32:
L_main30:
;T3439.c,175 :: 		}
L_main28:
;T3439.c,176 :: 		}
	GOTO	L_main26
;T3439.c,178 :: 		}
L_end_main:
	POP	W12
	POP	W11
	POP	W10
L__main_end_loop:
	BRA	L__main_end_loop
; end of _main
