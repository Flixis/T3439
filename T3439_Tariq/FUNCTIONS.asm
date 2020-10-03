
_GET_COMMANDS:

;FUNCTIONS.c,8 :: 		void GET_COMMANDS() {
;FUNCTIONS.c,10 :: 		if (uart1_Data_Ready()) {
	PUSH	W10
	PUSH	W11
	PUSH	W12
	CALL	_UART1_Data_Ready
	CP0	W0
	BRA NZ	L__GET_COMMANDS30
	GOTO	L_GET_COMMANDS0
L__GET_COMMANDS30:
;FUNCTIONS.c,11 :: 		uart1_read_text(input, "\r\n", sizeof(input)); // Read String data up to 10th charachter if \r if found stop looking and put data in input.
	MOV.B	#16, W12
	MOV	#lo_addr(?lstr1_FUNCTIONS), W11
	MOV	#lo_addr(_input), W10
	CALL	_UART1_Read_Text
;FUNCTIONS.c,13 :: 		if (strcmp(input, COMMAND_GET_POS) == 0) {
	MOV	#lo_addr(FUNCTIONS_COMMAND_GET_POS), W11
	MOV	#lo_addr(_input), W10
	CALL	_strcmp
	CP	W0, #0
	BRA Z	L__GET_COMMANDS31
	GOTO	L_GET_COMMANDS1
L__GET_COMMANDS31:
;FUNCTIONS.c,14 :: 		Motor_Command(GET_POS, sizeof(GET_POS));
	MOV	#9, W11
	MOV	#lo_addr(FUNCTIONS_GET_POS), W10
	CALL	_Motor_Command
;FUNCTIONS.c,15 :: 		} else if (strcmp(input, COMMMAND_SET_0_POS) == 0) {
	GOTO	L_GET_COMMANDS2
L_GET_COMMANDS1:
	MOV	#lo_addr(FUNCTIONS_COMMMAND_SET_0_POS), W11
	MOV	#lo_addr(_input), W10
	CALL	_strcmp
	CP	W0, #0
	BRA Z	L__GET_COMMANDS32
	GOTO	L_GET_COMMANDS3
L__GET_COMMANDS32:
;FUNCTIONS.c,16 :: 		Motor_Command(SET_0_POS, sizeof(SET_0_POS));
	MOV	#9, W11
	MOV	#lo_addr(FUNCTIONS_SET_0_POS), W10
	CALL	_Motor_Command
;FUNCTIONS.c,17 :: 		} else if (strcmp(input, COMMMAND_MV_ABS_0) == 0) {
	GOTO	L_GET_COMMANDS4
L_GET_COMMANDS3:
	MOV	#lo_addr(FUNCTIONS_COMMMAND_MV_ABS_0), W11
	MOV	#lo_addr(_input), W10
	CALL	_strcmp
	CP	W0, #0
	BRA Z	L__GET_COMMANDS33
	GOTO	L_GET_COMMANDS5
L__GET_COMMANDS33:
;FUNCTIONS.c,18 :: 		Motor_Command(MV_ABS_0, sizeof(MV_ABS_0));
	MOV	#9, W11
	MOV	#lo_addr(FUNCTIONS_MV_ABS_0), W10
	CALL	_Motor_Command
;FUNCTIONS.c,19 :: 		} else if (strcmp(input, COMMMAND_RORAT5) == 0) {
	GOTO	L_GET_COMMANDS6
L_GET_COMMANDS5:
	MOV	#lo_addr(FUNCTIONS_COMMMAND_RORAT5), W11
	MOV	#lo_addr(_input), W10
	CALL	_strcmp
	CP	W0, #0
	BRA Z	L__GET_COMMANDS34
	GOTO	L_GET_COMMANDS7
L__GET_COMMANDS34:
;FUNCTIONS.c,20 :: 		Motor_Command(RORAT5, sizeof(RORAT5));
	MOV	#9, W11
	MOV	#lo_addr(FUNCTIONS_RORAT5), W10
	CALL	_Motor_Command
;FUNCTIONS.c,21 :: 		} else if (strcmp(input, COMMMAND_ROLAT5) == 0) {
	GOTO	L_GET_COMMANDS8
L_GET_COMMANDS7:
	MOV	#lo_addr(FUNCTIONS_COMMMAND_ROLAT5), W11
	MOV	#lo_addr(_input), W10
	CALL	_strcmp
	CP	W0, #0
	BRA Z	L__GET_COMMANDS35
	GOTO	L_GET_COMMANDS9
L__GET_COMMANDS35:
;FUNCTIONS.c,22 :: 		Motor_Command(ROLAT5, sizeof(ROLAT5));
	MOV	#9, W11
	MOV	#lo_addr(FUNCTIONS_ROLAT5), W10
	CALL	_Motor_Command
;FUNCTIONS.c,23 :: 		} else if (strcmp(input, COMMAND_START) == 0) {
	GOTO	L_GET_COMMANDS10
L_GET_COMMANDS9:
	MOV	#lo_addr(FUNCTIONS_COMMAND_START), W11
	MOV	#lo_addr(_input), W10
	CALL	_strcmp
	CP	W0, #0
	BRA Z	L__GET_COMMANDS36
	GOTO	L_GET_COMMANDS11
L__GET_COMMANDS36:
;FUNCTIONS.c,27 :: 		Motor_Command(ROLAT5, sizeof(ROLAT5));
	MOV	#9, W11
	MOV	#lo_addr(FUNCTIONS_ROLAT5), W10
	CALL	_Motor_Command
;FUNCTIONS.c,28 :: 		delay_ms(1000);
	MOV	#41, W8
	MOV	#45239, W7
L_GET_COMMANDS12:
	DEC	W7
	BRA NZ	L_GET_COMMANDS12
	DEC	W8
	BRA NZ	L_GET_COMMANDS12
;FUNCTIONS.c,30 :: 		} else if (strcmp(input, COMMMAND_STOP) == 0) {
	GOTO	L_GET_COMMANDS14
L_GET_COMMANDS11:
	MOV	#lo_addr(FUNCTIONS_COMMMAND_STOP), W11
	MOV	#lo_addr(_input), W10
	CALL	_strcmp
	CP	W0, #0
	BRA Z	L__GET_COMMANDS37
	GOTO	L_GET_COMMANDS15
L__GET_COMMANDS37:
;FUNCTIONS.c,31 :: 		uart1_write_text("Stopped!");
	MOV	#lo_addr(?lstr2_FUNCTIONS), W10
	CALL	_UART1_Write_Text
;FUNCTIONS.c,32 :: 		Motor_Command(STOP, sizeof(STOP));
	MOV	#9, W11
	MOV	#lo_addr(FUNCTIONS_STOP), W10
	CALL	_Motor_Command
;FUNCTIONS.c,33 :: 		} else if (strcmp(input, COMMAND_RESET) == 0) {
	GOTO	L_GET_COMMANDS16
L_GET_COMMANDS15:
	MOV	#lo_addr(FUNCTIONS_COMMAND_RESET), W11
	MOV	#lo_addr(_input), W10
	CALL	_strcmp
	CP	W0, #0
	BRA Z	L__GET_COMMANDS38
	GOTO	L_GET_COMMANDS17
L__GET_COMMANDS38:
;FUNCTIONS.c,35 :: 		reset
	RESET
;FUNCTIONS.c,37 :: 		} else {}
	GOTO	L_GET_COMMANDS18
L_GET_COMMANDS17:
L_GET_COMMANDS18:
L_GET_COMMANDS16:
L_GET_COMMANDS14:
L_GET_COMMANDS10:
L_GET_COMMANDS8:
L_GET_COMMANDS6:
L_GET_COMMANDS4:
L_GET_COMMANDS2:
;FUNCTIONS.c,38 :: 		}
L_GET_COMMANDS0:
;FUNCTIONS.c,39 :: 		}
L_end_GET_COMMANDS:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _GET_COMMANDS

_Motor_Command:

;FUNCTIONS.c,46 :: 		void Motor_Command(unsigned char * data_get, int data_len) {
;FUNCTIONS.c,47 :: 		for (i = 0; i < data_len; i++) {
	PUSH	W12
	PUSH	W13
	CLR	W0
	MOV	W0, _i
L_Motor_Command19:
	MOV	#lo_addr(_i), W0
	CP	W11, [W0]
	BRA GT	L__Motor_Command40
	GOTO	L_Motor_Command20
L__Motor_Command40:
;FUNCTIONS.c,49 :: 		UART_Set_Active( & UART3_Read, & UART3_Write, & UART3_Data_Ready, & UART3_Tx_Idle);
	PUSH.D	W10
	MOV	#lo_addr(_UART3_Tx_Idle), W13
	MOV	#lo_addr(_UART3_Data_Ready), W12
	MOV	#lo_addr(_UART3_Write), W11
	MOV	#lo_addr(_UART3_Read), W10
	CALL	_UART_Set_Active
	POP.D	W10
;FUNCTIONS.c,50 :: 		UART3_Write(data_get[i]);
	MOV	#lo_addr(_i), W0
	ADD	W10, [W0], W0
	PUSH	W10
	ZE	[W0], W10
	CALL	_UART3_Write
	POP	W10
;FUNCTIONS.c,53 :: 		UART_Set_Active( & UART1_Read, & UART1_Write, & UART1_Data_Ready, & UART1_Tx_Idle);
	PUSH.D	W10
	MOV	#lo_addr(_UART1_Tx_Idle), W13
	MOV	#lo_addr(_UART1_Data_Ready), W12
	MOV	#lo_addr(_UART1_Write), W11
	MOV	#lo_addr(_UART1_Read), W10
	CALL	_UART_Set_Active
	POP.D	W10
;FUNCTIONS.c,47 :: 		for (i = 0; i < data_len; i++) {
	MOV	#1, W1
	MOV	#lo_addr(_i), W0
	ADD	W1, [W0], [W0]
;FUNCTIONS.c,54 :: 		}
	GOTO	L_Motor_Command19
L_Motor_Command20:
;FUNCTIONS.c,55 :: 		}
L_end_Motor_Command:
	POP	W13
	POP	W12
	RETURN
; end of _Motor_Command

_GET_CURRENT_POS:
	LNK	#2

;FUNCTIONS.c,59 :: 		void GET_CURRENT_POS() {
;FUNCTIONS.c,71 :: 		U1STA.UTXEN = 0;
	PUSH	W10
	PUSH	W11
	BCLR	U1STA, #10
;FUNCTIONS.c,72 :: 		U1STA.OERR = 1;
	BSET.B	U1STA, #1
;FUNCTIONS.c,73 :: 		U3STA.OERR = 1;
	BSET.B	U3STA, #1
;FUNCTIONS.c,74 :: 		Delay_ms(5);
	MOV	#13333, W7
L_GET_CURRENT_POS22:
	DEC	W7
	BRA NZ	L_GET_CURRENT_POS22
	NOP
;FUNCTIONS.c,75 :: 		U1STA.UTXEN = 1;
	BSET	U1STA, #10
;FUNCTIONS.c,76 :: 		U1STA.OERR = 0;
	BCLR.B	U1STA, #1
;FUNCTIONS.c,77 :: 		U3STA.OERR = 0;
	BCLR.B	U3STA, #1
;FUNCTIONS.c,78 :: 		Motor_Command(GET_POS, sizeof(GET_POS));
	MOV	#9, W11
	MOV	#lo_addr(FUNCTIONS_GET_POS), W10
	CALL	_Motor_Command
;FUNCTIONS.c,84 :: 		while (x <= 9) {
L_GET_CURRENT_POS24:
	MOV	_x, W0
	CP	W0, #9
	BRA LE	L__GET_CURRENT_POS42
	GOTO	L_GET_CURRENT_POS25
L__GET_CURRENT_POS42:
;FUNCTIONS.c,85 :: 		for (i = 0; i < uart3_data_ready(); i++) {
	CLR	W0
	MOV	W0, _i
L_GET_CURRENT_POS26:
	CALL	_UART3_Data_Ready
	MOV	#lo_addr(_i), W1
	CP	W0, [W1]
	BRA GTU	L__GET_CURRENT_POS43
	GOTO	L_GET_CURRENT_POS27
L__GET_CURRENT_POS43:
;FUNCTIONS.c,86 :: 		hex[i] = uart3_read();
	MOV	#lo_addr(_hex), W1
	MOV	#lo_addr(_i), W0
	ADD	W1, [W0], W0
	MOV	W0, [W14+0]
	CALL	_UART3_Read
	MOV	[W14+0], W1
	MOV.B	W0, [W1]
;FUNCTIONS.c,87 :: 		uart1_write(hex[i]);
	MOV	#lo_addr(_hex), W1
	MOV	#lo_addr(_i), W0
	ADD	W1, [W0], W0
	ZE	[W0], W10
	CALL	_UART1_Write
;FUNCTIONS.c,88 :: 		x++;
	MOV	#1, W1
	MOV	#lo_addr(_x), W0
	ADD	W1, [W0], [W0]
;FUNCTIONS.c,85 :: 		for (i = 0; i < uart3_data_ready(); i++) {
	MOV	#1, W1
	MOV	#lo_addr(_i), W0
	ADD	W1, [W0], [W0]
;FUNCTIONS.c,89 :: 		}
	GOTO	L_GET_CURRENT_POS26
L_GET_CURRENT_POS27:
;FUNCTIONS.c,90 :: 		}
	GOTO	L_GET_CURRENT_POS24
L_GET_CURRENT_POS25:
;FUNCTIONS.c,92 :: 		}
L_end_GET_CURRENT_POS:
	POP	W11
	POP	W10
	ULNK
	RETURN
; end of _GET_CURRENT_POS
