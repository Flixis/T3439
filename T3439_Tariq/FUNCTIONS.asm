
_MOTOR_COMMAND:

;FUNCTIONS.C,8 :: 		void MOTOR_COMMAND(unsigned char * data_get, int data_len) {
;FUNCTIONS.C,9 :: 		for (i = 0; i < data_len; i++) {
	PUSH	W12
	PUSH	W13
	CLR	W0
	MOV	W0, _i
L_MOTOR_COMMAND0:
	MOV	#lo_addr(_i), W0
	CP	W11, [W0]
	BRA GT	L__MOTOR_COMMAND11
	GOTO	L_MOTOR_COMMAND1
L__MOTOR_COMMAND11:
;FUNCTIONS.C,11 :: 		UART_Set_Active( & UART3_Read, & UART3_Write, & UART3_Data_Ready, & UART3_Tx_Idle);
	PUSH.D	W10
	MOV	#lo_addr(_UART3_Tx_Idle), W13
	MOV	#lo_addr(_UART3_Data_Ready), W12
	MOV	#lo_addr(_UART3_Write), W11
	MOV	#lo_addr(_UART3_Read), W10
	CALL	_UART_Set_Active
	POP.D	W10
;FUNCTIONS.C,12 :: 		UART3_Write(data_get[i]);
	MOV	#lo_addr(_i), W0
	ADD	W10, [W0], W0
	PUSH	W10
	ZE	[W0], W10
	CALL	_UART3_Write
	POP	W10
;FUNCTIONS.C,13 :: 		destroy = UART3_read();
	CALL	_UART3_Read
	MOV	#lo_addr(_destroy), W1
	MOV.B	W0, [W1]
;FUNCTIONS.C,16 :: 		UART_Set_Active( & UART1_Read, & UART1_Write, & UART1_Data_Ready, & UART1_Tx_Idle);
	PUSH.D	W10
	MOV	#lo_addr(_UART1_Tx_Idle), W13
	MOV	#lo_addr(_UART1_Data_Ready), W12
	MOV	#lo_addr(_UART1_Write), W11
	MOV	#lo_addr(_UART1_Read), W10
	CALL	_UART_Set_Active
	POP.D	W10
;FUNCTIONS.C,9 :: 		for (i = 0; i < data_len; i++) {
	MOV	#1, W1
	MOV	#lo_addr(_i), W0
	ADD	W1, [W0], [W0]
;FUNCTIONS.C,17 :: 		}
	GOTO	L_MOTOR_COMMAND0
L_MOTOR_COMMAND1:
;FUNCTIONS.C,18 :: 		}
L_end_MOTOR_COMMAND:
	POP	W13
	POP	W12
	RETURN
; end of _MOTOR_COMMAND

_GET_CURRENT_POS:
	LNK	#2

;FUNCTIONS.C,23 :: 		void GET_CURRENT_POS(char* Hexoutput){
;FUNCTIONS.C,35 :: 		U1STA.UTXEN = 0;
	PUSH	W11
	BCLR	U1STA, #10
;FUNCTIONS.C,36 :: 		U1STA.OERR = 1;
	BSET.B	U1STA, #1
;FUNCTIONS.C,37 :: 		U3STA.OERR = 1;
	BSET.B	U3STA, #1
;FUNCTIONS.C,38 :: 		Delay_ms(5);
	MOV	#13333, W7
L_GET_CURRENT_POS3:
	DEC	W7
	BRA NZ	L_GET_CURRENT_POS3
	NOP
;FUNCTIONS.C,39 :: 		U1STA.UTXEN = 1;
	BSET	U1STA, #10
;FUNCTIONS.C,40 :: 		U1STA.OERR = 0;
	BCLR.B	U1STA, #1
;FUNCTIONS.C,41 :: 		U3STA.OERR = 0;
	BCLR.B	U3STA, #1
;FUNCTIONS.C,42 :: 		Motor_Command(GET_POS, sizeof(GET_POS));
	PUSH	W10
	MOV	#9, W11
	MOV	#lo_addr(FUNCTIONS_GET_POS), W10
	CALL	_MOTOR_COMMAND
	POP	W10
;FUNCTIONS.C,44 :: 		x=1;
	MOV	#1, W0
	MOV	W0, _x
;FUNCTIONS.C,45 :: 		while (x <= 9) {
L_GET_CURRENT_POS5:
	MOV	_x, W0
	CP	W0, #9
	BRA LE	L__GET_CURRENT_POS13
	GOTO	L_GET_CURRENT_POS6
L__GET_CURRENT_POS13:
;FUNCTIONS.C,46 :: 		for (i = 0; i < uart3_Data_ready(); i++) {
	CLR	W0
	MOV	W0, _i
L_GET_CURRENT_POS7:
	CALL	_UART3_Data_Ready
	MOV	#lo_addr(_i), W1
	CP	W0, [W1]
	BRA GTU	L__GET_CURRENT_POS14
	GOTO	L_GET_CURRENT_POS8
L__GET_CURRENT_POS14:
;FUNCTIONS.C,47 :: 		Hexoutput[i] = uart3_read();
	MOV	#lo_addr(_i), W0
	ADD	W10, [W0], W0
	MOV	W0, [W14+0]
	CALL	_UART3_Read
	MOV	[W14+0], W1
	MOV.B	W0, [W1]
;FUNCTIONS.C,48 :: 		uart1_write(Hexoutput[i]);
	MOV	#lo_addr(_i), W0
	ADD	W10, [W0], W0
	PUSH	W10
	ZE	[W0], W10
	CALL	_UART1_Write
	POP	W10
;FUNCTIONS.C,49 :: 		x++;
	MOV	#1, W1
	MOV	#lo_addr(_x), W0
	ADD	W1, [W0], [W0]
;FUNCTIONS.C,46 :: 		for (i = 0; i < uart3_Data_ready(); i++) {
	MOV	#1, W1
	MOV	#lo_addr(_i), W0
	ADD	W1, [W0], [W0]
;FUNCTIONS.C,50 :: 		}
	GOTO	L_GET_CURRENT_POS7
L_GET_CURRENT_POS8:
;FUNCTIONS.C,51 :: 		}
	GOTO	L_GET_CURRENT_POS5
L_GET_CURRENT_POS6:
;FUNCTIONS.C,55 :: 		}
L_end_GET_CURRENT_POS:
	POP	W11
	ULNK
	RETURN
; end of _GET_CURRENT_POS
