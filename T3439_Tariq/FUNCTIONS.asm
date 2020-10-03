
_GET_COMMANDS:

;FUNCTIONS.c,9 :: 		void GET_COMMANDS() {
;FUNCTIONS.c,11 :: 		if (uart1_Data_Ready()) {
	PUSH	W10
	PUSH	W11
	PUSH	W12
	CALL	_UART1_Data_Ready
	CP0	W0
	BRA NZ	L__GET_COMMANDS50
	GOTO	L_GET_COMMANDS0
L__GET_COMMANDS50:
;FUNCTIONS.c,12 :: 		uart1_read_text(input, "\r\n", sizeof(input)); // Read String data up to 10th charachter if \r if found stop looking and put data in input.
	MOV.B	#16, W12
	MOV	#lo_addr(?lstr1_FUNCTIONS), W11
	MOV	#lo_addr(_input), W10
	CALL	_UART1_Read_Text
;FUNCTIONS.c,14 :: 		if (strcmp(input, COMMAND_GET_POS) == 0) {
	MOV	#lo_addr(FUNCTIONS_COMMAND_GET_POS), W11
	MOV	#lo_addr(_input), W10
	CALL	_strcmp
	CP	W0, #0
	BRA Z	L__GET_COMMANDS51
	GOTO	L_GET_COMMANDS1
L__GET_COMMANDS51:
;FUNCTIONS.c,15 :: 		MOTOR_COMMAND(GET_POS, sizeof(GET_POS));
	MOV	#9, W11
	MOV	#lo_addr(FUNCTIONS_GET_POS), W10
	CALL	_MOTOR_COMMAND
;FUNCTIONS.c,16 :: 		} else if (strcmp(input, COMMMAND_SET_0_POS) == 0) {
	GOTO	L_GET_COMMANDS2
L_GET_COMMANDS1:
	MOV	#lo_addr(FUNCTIONS_COMMMAND_SET_0_POS), W11
	MOV	#lo_addr(_input), W10
	CALL	_strcmp
	CP	W0, #0
	BRA Z	L__GET_COMMANDS52
	GOTO	L_GET_COMMANDS3
L__GET_COMMANDS52:
;FUNCTIONS.c,17 :: 		MOTOR_COMMAND(SET_0_POS, sizeof(SET_0_POS));
	MOV	#9, W11
	MOV	#lo_addr(FUNCTIONS_SET_0_POS), W10
	CALL	_MOTOR_COMMAND
;FUNCTIONS.c,18 :: 		} else if (strcmp(input, COMMMAND_MV_ABS_0) == 0) {
	GOTO	L_GET_COMMANDS4
L_GET_COMMANDS3:
	MOV	#lo_addr(FUNCTIONS_COMMMAND_MV_ABS_0), W11
	MOV	#lo_addr(_input), W10
	CALL	_strcmp
	CP	W0, #0
	BRA Z	L__GET_COMMANDS53
	GOTO	L_GET_COMMANDS5
L__GET_COMMANDS53:
;FUNCTIONS.c,19 :: 		MOTOR_COMMAND(MV_ABS_0, sizeof(MV_ABS_0));
	MOV	#9, W11
	MOV	#lo_addr(FUNCTIONS_MV_ABS_0), W10
	CALL	_MOTOR_COMMAND
;FUNCTIONS.c,20 :: 		} else if (strcmp(input, COMMMAND_RORAT5) == 0) {
	GOTO	L_GET_COMMANDS6
L_GET_COMMANDS5:
	MOV	#lo_addr(FUNCTIONS_COMMMAND_RORAT5), W11
	MOV	#lo_addr(_input), W10
	CALL	_strcmp
	CP	W0, #0
	BRA Z	L__GET_COMMANDS54
	GOTO	L_GET_COMMANDS7
L__GET_COMMANDS54:
;FUNCTIONS.c,21 :: 		MOTOR_COMMAND(RORAT5, sizeof(RORAT5));
	MOV	#9, W11
	MOV	#lo_addr(FUNCTIONS_RORAT5), W10
	CALL	_MOTOR_COMMAND
;FUNCTIONS.c,22 :: 		} else if (strcmp(input, COMMMAND_ROLAT5) == 0) {
	GOTO	L_GET_COMMANDS8
L_GET_COMMANDS7:
	MOV	#lo_addr(FUNCTIONS_COMMMAND_ROLAT5), W11
	MOV	#lo_addr(_input), W10
	CALL	_strcmp
	CP	W0, #0
	BRA Z	L__GET_COMMANDS55
	GOTO	L_GET_COMMANDS9
L__GET_COMMANDS55:
;FUNCTIONS.c,23 :: 		MOTOR_COMMAND(ROLAT5, sizeof(ROLAT5));
	MOV	#9, W11
	MOV	#lo_addr(FUNCTIONS_ROLAT5), W10
	CALL	_MOTOR_COMMAND
;FUNCTIONS.c,24 :: 		} else if (strcmp(input, COMMAND_START) == 0) {
	GOTO	L_GET_COMMANDS10
L_GET_COMMANDS9:
	MOV	#lo_addr(FUNCTIONS_COMMAND_START), W11
	MOV	#lo_addr(_input), W10
	CALL	_strcmp
	CP	W0, #0
	BRA Z	L__GET_COMMANDS56
	GOTO	L_GET_COMMANDS11
L__GET_COMMANDS56:
;FUNCTIONS.c,27 :: 		MOTOR_COMMAND(ROLAT5, sizeof(ROLAT5));
	MOV	#9, W11
	MOV	#lo_addr(FUNCTIONS_ROLAT5), W10
	CALL	_MOTOR_COMMAND
;FUNCTIONS.c,29 :: 		} else if (strcmp(input, COMMMAND_STOP) == 0) {
	GOTO	L_GET_COMMANDS12
L_GET_COMMANDS11:
	MOV	#lo_addr(FUNCTIONS_COMMMAND_STOP), W11
	MOV	#lo_addr(_input), W10
	CALL	_strcmp
	CP	W0, #0
	BRA Z	L__GET_COMMANDS57
	GOTO	L_GET_COMMANDS13
L__GET_COMMANDS57:
;FUNCTIONS.c,30 :: 		uart1_write_text("Stopped!");
	MOV	#lo_addr(?lstr2_FUNCTIONS), W10
	CALL	_UART1_Write_Text
;FUNCTIONS.c,31 :: 		MOTOR_COMMAND(STOP, sizeof(STOP));
	MOV	#9, W11
	MOV	#lo_addr(FUNCTIONS_STOP), W10
	CALL	_MOTOR_COMMAND
;FUNCTIONS.c,32 :: 		} else if (strcmp(input, COMMAND_RESET) == 0) {
	GOTO	L_GET_COMMANDS14
L_GET_COMMANDS13:
	MOV	#lo_addr(FUNCTIONS_COMMAND_RESET), W11
	MOV	#lo_addr(_input), W10
	CALL	_strcmp
	CP	W0, #0
	BRA Z	L__GET_COMMANDS58
	GOTO	L_GET_COMMANDS15
L__GET_COMMANDS58:
;FUNCTIONS.c,34 :: 		reset
	RESET
;FUNCTIONS.c,36 :: 		} else {}
	GOTO	L_GET_COMMANDS16
L_GET_COMMANDS15:
L_GET_COMMANDS16:
L_GET_COMMANDS14:
L_GET_COMMANDS12:
L_GET_COMMANDS10:
L_GET_COMMANDS8:
L_GET_COMMANDS6:
L_GET_COMMANDS4:
L_GET_COMMANDS2:
;FUNCTIONS.c,37 :: 		}
L_GET_COMMANDS0:
;FUNCTIONS.c,38 :: 		}
L_end_GET_COMMANDS:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _GET_COMMANDS

_MOTOR_COMMAND:

;FUNCTIONS.c,45 :: 		void MOTOR_COMMAND(unsigned char * data_get, int data_len) {
;FUNCTIONS.c,46 :: 		for (i = 0; i < data_len; i++) {
	PUSH	W12
	PUSH	W13
	CLR	W0
	MOV	W0, _i
L_MOTOR_COMMAND17:
	MOV	#lo_addr(_i), W0
	CP	W11, [W0]
	BRA GT	L__MOTOR_COMMAND60
	GOTO	L_MOTOR_COMMAND18
L__MOTOR_COMMAND60:
;FUNCTIONS.c,48 :: 		UART_Set_Active( & UART3_Read, & UART3_Write, & UART3_Data_Ready, & UART3_Tx_Idle);
	PUSH.D	W10
	MOV	#lo_addr(_UART3_Tx_Idle), W13
	MOV	#lo_addr(_UART3_Data_Ready), W12
	MOV	#lo_addr(_UART3_Write), W11
	MOV	#lo_addr(_UART3_Read), W10
	CALL	_UART_Set_Active
	POP.D	W10
;FUNCTIONS.c,49 :: 		UART3_Write(data_get[i]);
	MOV	#lo_addr(_i), W0
	ADD	W10, [W0], W0
	PUSH	W10
	ZE	[W0], W10
	CALL	_UART3_Write
	POP	W10
;FUNCTIONS.c,52 :: 		UART_Set_Active( & UART1_Read, & UART1_Write, & UART1_Data_Ready, & UART1_Tx_Idle);
	PUSH.D	W10
	MOV	#lo_addr(_UART1_Tx_Idle), W13
	MOV	#lo_addr(_UART1_Data_Ready), W12
	MOV	#lo_addr(_UART1_Write), W11
	MOV	#lo_addr(_UART1_Read), W10
	CALL	_UART_Set_Active
	POP.D	W10
;FUNCTIONS.c,46 :: 		for (i = 0; i < data_len; i++) {
	MOV	#1, W1
	MOV	#lo_addr(_i), W0
	ADD	W1, [W0], [W0]
;FUNCTIONS.c,53 :: 		}
	GOTO	L_MOTOR_COMMAND17
L_MOTOR_COMMAND18:
;FUNCTIONS.c,54 :: 		}
L_end_MOTOR_COMMAND:
	POP	W13
	POP	W12
	RETURN
; end of _MOTOR_COMMAND

_GET_CURRENT_POS:
	LNK	#2

;FUNCTIONS.c,60 :: 		void GET_CURRENT_POS() {
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
L_GET_CURRENT_POS20:
	DEC	W7
	BRA NZ	L_GET_CURRENT_POS20
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
	CALL	_MOTOR_COMMAND
;FUNCTIONS.c,84 :: 		while (x <= 9) {
L_GET_CURRENT_POS22:
	MOV	_x, W0
	CP	W0, #9
	BRA LE	L__GET_CURRENT_POS62
	GOTO	L_GET_CURRENT_POS23
L__GET_CURRENT_POS62:
;FUNCTIONS.c,85 :: 		for (i = 0; i < uart3_data_ready(); i++) {
	CLR	W0
	MOV	W0, _i
L_GET_CURRENT_POS24:
	CALL	_UART3_Data_Ready
	MOV	#lo_addr(_i), W1
	CP	W0, [W1]
	BRA GTU	L__GET_CURRENT_POS63
	GOTO	L_GET_CURRENT_POS25
L__GET_CURRENT_POS63:
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
	GOTO	L_GET_CURRENT_POS24
L_GET_CURRENT_POS25:
;FUNCTIONS.c,90 :: 		}
	GOTO	L_GET_CURRENT_POS22
L_GET_CURRENT_POS23:
;FUNCTIONS.c,91 :: 		}
L_end_GET_CURRENT_POS:
	POP	W11
	POP	W10
	ULNK
	RETURN
; end of _GET_CURRENT_POS

_HEX2COMP:

;FUNCTIONS.c,93 :: 		int HEX2COMP(char * hex) {
;FUNCTIONS.c,94 :: 		int value = 0, counter = 1;
; value start address is: 8 (W4)
	CLR	W4
;FUNCTIONS.c,95 :: 		for (counter = 1; counter < 18; counter++) {
; counter start address is: 6 (W3)
	MOV	#1, W3
; value end address is: 8 (W4)
; counter end address is: 6 (W3)
L_HEX2COMP27:
; counter start address is: 6 (W3)
; value start address is: 8 (W4)
	CP	W3, #18
	BRA LT	L__HEX2COMP65
	GOTO	L_HEX2COMP28
L__HEX2COMP65:
;FUNCTIONS.c,96 :: 		switch (hex[counter]) {
	ADD	W10, W3, W2
	GOTO	L_HEX2COMP30
;FUNCTIONS.c,97 :: 		case '0':
L_HEX2COMP32:
;FUNCTIONS.c,98 :: 		value = value << 4;
	SL	W4, #4, W0
; value end address is: 8 (W4)
; value start address is: 0 (W0)
;FUNCTIONS.c,99 :: 		break;
	MOV	W0, W4
; value end address is: 0 (W0)
	GOTO	L_HEX2COMP31
;FUNCTIONS.c,100 :: 		case '1':
L_HEX2COMP33:
;FUNCTIONS.c,101 :: 		value = (value << 4) + 1;
; value start address is: 8 (W4)
	SL	W4, #4, W0
; value end address is: 8 (W4)
; value start address is: 0 (W0)
	INC	W0
;FUNCTIONS.c,102 :: 		break;
	MOV	W0, W4
; value end address is: 0 (W0)
	GOTO	L_HEX2COMP31
;FUNCTIONS.c,103 :: 		case '2':
L_HEX2COMP34:
;FUNCTIONS.c,104 :: 		value = (value << 4) + 2;
; value start address is: 8 (W4)
	SL	W4, #4, W0
; value end address is: 8 (W4)
; value start address is: 0 (W0)
	INC2	W0
;FUNCTIONS.c,105 :: 		break;
	MOV	W0, W4
; value end address is: 0 (W0)
	GOTO	L_HEX2COMP31
;FUNCTIONS.c,106 :: 		case '3':
L_HEX2COMP35:
;FUNCTIONS.c,107 :: 		value = (value << 4) + 3;
; value start address is: 8 (W4)
	SL	W4, #4, W0
; value end address is: 8 (W4)
; value start address is: 0 (W0)
	ADD	W0, #3, W0
;FUNCTIONS.c,108 :: 		break;
	MOV	W0, W4
; value end address is: 0 (W0)
	GOTO	L_HEX2COMP31
;FUNCTIONS.c,109 :: 		case '4':
L_HEX2COMP36:
;FUNCTIONS.c,110 :: 		value = (value << 4) + 4;
; value start address is: 8 (W4)
	SL	W4, #4, W0
; value end address is: 8 (W4)
; value start address is: 0 (W0)
	ADD	W0, #4, W0
;FUNCTIONS.c,111 :: 		break;
	MOV	W0, W4
; value end address is: 0 (W0)
	GOTO	L_HEX2COMP31
;FUNCTIONS.c,112 :: 		case '5':
L_HEX2COMP37:
;FUNCTIONS.c,113 :: 		value = (value << 4) + 5;
; value start address is: 8 (W4)
	SL	W4, #4, W0
; value end address is: 8 (W4)
; value start address is: 0 (W0)
	ADD	W0, #5, W0
;FUNCTIONS.c,114 :: 		break;
	MOV	W0, W4
; value end address is: 0 (W0)
	GOTO	L_HEX2COMP31
;FUNCTIONS.c,115 :: 		case '6':
L_HEX2COMP38:
;FUNCTIONS.c,116 :: 		value = (value << 4) + 6;
; value start address is: 8 (W4)
	SL	W4, #4, W0
; value end address is: 8 (W4)
; value start address is: 0 (W0)
	ADD	W0, #6, W0
;FUNCTIONS.c,117 :: 		break;
	MOV	W0, W4
; value end address is: 0 (W0)
	GOTO	L_HEX2COMP31
;FUNCTIONS.c,118 :: 		case '7':
L_HEX2COMP39:
;FUNCTIONS.c,119 :: 		value = (value << 4) + 7;
; value start address is: 8 (W4)
	SL	W4, #4, W0
; value end address is: 8 (W4)
; value start address is: 0 (W0)
	ADD	W0, #7, W0
;FUNCTIONS.c,120 :: 		break;
	MOV	W0, W4
; value end address is: 0 (W0)
	GOTO	L_HEX2COMP31
;FUNCTIONS.c,121 :: 		case '8':
L_HEX2COMP40:
;FUNCTIONS.c,122 :: 		value = (value << 4) + 8;
; value start address is: 8 (W4)
	SL	W4, #4, W0
; value end address is: 8 (W4)
; value start address is: 0 (W0)
	ADD	W0, #8, W0
;FUNCTIONS.c,123 :: 		break;
	MOV	W0, W4
; value end address is: 0 (W0)
	GOTO	L_HEX2COMP31
;FUNCTIONS.c,124 :: 		case '9':
L_HEX2COMP41:
;FUNCTIONS.c,125 :: 		value = (value << 4) + 9;
; value start address is: 8 (W4)
	SL	W4, #4, W0
; value end address is: 8 (W4)
; value start address is: 0 (W0)
	ADD	W0, #9, W0
;FUNCTIONS.c,126 :: 		break;
	MOV	W0, W4
; value end address is: 0 (W0)
	GOTO	L_HEX2COMP31
;FUNCTIONS.c,127 :: 		case 'A':
L_HEX2COMP42:
;FUNCTIONS.c,128 :: 		value = (value << 4) + 10;
; value start address is: 8 (W4)
	SL	W4, #4, W0
; value end address is: 8 (W4)
; value start address is: 0 (W0)
	ADD	W0, #10, W0
;FUNCTIONS.c,129 :: 		break;
	MOV	W0, W4
; value end address is: 0 (W0)
	GOTO	L_HEX2COMP31
;FUNCTIONS.c,130 :: 		case 'B':
L_HEX2COMP43:
;FUNCTIONS.c,131 :: 		value = (value << 4) + 11;
; value start address is: 8 (W4)
	SL	W4, #4, W0
; value end address is: 8 (W4)
; value start address is: 0 (W0)
	ADD	W0, #11, W0
;FUNCTIONS.c,132 :: 		break;
	MOV	W0, W4
; value end address is: 0 (W0)
	GOTO	L_HEX2COMP31
;FUNCTIONS.c,133 :: 		case 'C':
L_HEX2COMP44:
;FUNCTIONS.c,134 :: 		value = (value << 4) + 12;
; value start address is: 8 (W4)
	SL	W4, #4, W0
; value end address is: 8 (W4)
; value start address is: 0 (W0)
	ADD	W0, #12, W0
;FUNCTIONS.c,135 :: 		break;
	MOV	W0, W4
; value end address is: 0 (W0)
	GOTO	L_HEX2COMP31
;FUNCTIONS.c,136 :: 		case 'D':
L_HEX2COMP45:
;FUNCTIONS.c,137 :: 		value = (value << 4) + 13;
; value start address is: 8 (W4)
	SL	W4, #4, W0
; value end address is: 8 (W4)
; value start address is: 0 (W0)
	ADD	W0, #13, W0
;FUNCTIONS.c,138 :: 		break;
	MOV	W0, W4
; value end address is: 0 (W0)
	GOTO	L_HEX2COMP31
;FUNCTIONS.c,139 :: 		case 'E':
L_HEX2COMP46:
;FUNCTIONS.c,140 :: 		value = (value << 4) + 14;
; value start address is: 8 (W4)
	SL	W4, #4, W0
; value end address is: 8 (W4)
; value start address is: 0 (W0)
	ADD	W0, #14, W0
;FUNCTIONS.c,141 :: 		break;
	MOV	W0, W4
; value end address is: 0 (W0)
	GOTO	L_HEX2COMP31
;FUNCTIONS.c,142 :: 		case 'F':
L_HEX2COMP47:
;FUNCTIONS.c,143 :: 		value = (value << 4) + 15;
; value start address is: 8 (W4)
	SL	W4, #4, W0
; value end address is: 8 (W4)
; value start address is: 0 (W0)
	ADD	W0, #15, W0
;FUNCTIONS.c,144 :: 		break;
	MOV	W0, W4
; value end address is: 0 (W0)
	GOTO	L_HEX2COMP31
;FUNCTIONS.c,145 :: 		default:
L_HEX2COMP48:
;FUNCTIONS.c,146 :: 		break;
; value start address is: 8 (W4)
	GOTO	L_HEX2COMP31
;FUNCTIONS.c,147 :: 		}
L_HEX2COMP30:
	MOV.B	[W2], W1
	MOV.B	#48, W0
	CP.B	W1, W0
	BRA NZ	L__HEX2COMP66
	GOTO	L_HEX2COMP32
L__HEX2COMP66:
	MOV.B	[W2], W1
	MOV.B	#49, W0
	CP.B	W1, W0
	BRA NZ	L__HEX2COMP67
	GOTO	L_HEX2COMP33
L__HEX2COMP67:
	MOV.B	[W2], W1
	MOV.B	#50, W0
	CP.B	W1, W0
	BRA NZ	L__HEX2COMP68
	GOTO	L_HEX2COMP34
L__HEX2COMP68:
	MOV.B	[W2], W1
	MOV.B	#51, W0
	CP.B	W1, W0
	BRA NZ	L__HEX2COMP69
	GOTO	L_HEX2COMP35
L__HEX2COMP69:
	MOV.B	[W2], W1
	MOV.B	#52, W0
	CP.B	W1, W0
	BRA NZ	L__HEX2COMP70
	GOTO	L_HEX2COMP36
L__HEX2COMP70:
	MOV.B	[W2], W1
	MOV.B	#53, W0
	CP.B	W1, W0
	BRA NZ	L__HEX2COMP71
	GOTO	L_HEX2COMP37
L__HEX2COMP71:
	MOV.B	[W2], W1
	MOV.B	#54, W0
	CP.B	W1, W0
	BRA NZ	L__HEX2COMP72
	GOTO	L_HEX2COMP38
L__HEX2COMP72:
	MOV.B	[W2], W1
	MOV.B	#55, W0
	CP.B	W1, W0
	BRA NZ	L__HEX2COMP73
	GOTO	L_HEX2COMP39
L__HEX2COMP73:
	MOV.B	[W2], W1
	MOV.B	#56, W0
	CP.B	W1, W0
	BRA NZ	L__HEX2COMP74
	GOTO	L_HEX2COMP40
L__HEX2COMP74:
	MOV.B	[W2], W1
	MOV.B	#57, W0
	CP.B	W1, W0
	BRA NZ	L__HEX2COMP75
	GOTO	L_HEX2COMP41
L__HEX2COMP75:
	MOV.B	[W2], W1
	MOV.B	#65, W0
	CP.B	W1, W0
	BRA NZ	L__HEX2COMP76
	GOTO	L_HEX2COMP42
L__HEX2COMP76:
	MOV.B	[W2], W1
	MOV.B	#66, W0
	CP.B	W1, W0
	BRA NZ	L__HEX2COMP77
	GOTO	L_HEX2COMP43
L__HEX2COMP77:
	MOV.B	[W2], W1
	MOV.B	#67, W0
	CP.B	W1, W0
	BRA NZ	L__HEX2COMP78
	GOTO	L_HEX2COMP44
L__HEX2COMP78:
	MOV.B	[W2], W1
	MOV.B	#68, W0
	CP.B	W1, W0
	BRA NZ	L__HEX2COMP79
	GOTO	L_HEX2COMP45
L__HEX2COMP79:
	MOV.B	[W2], W1
	MOV.B	#69, W0
	CP.B	W1, W0
	BRA NZ	L__HEX2COMP80
	GOTO	L_HEX2COMP46
L__HEX2COMP80:
	MOV.B	[W2], W1
	MOV.B	#70, W0
	CP.B	W1, W0
	BRA NZ	L__HEX2COMP81
	GOTO	L_HEX2COMP47
L__HEX2COMP81:
	GOTO	L_HEX2COMP48
; value end address is: 8 (W4)
L_HEX2COMP31:
;FUNCTIONS.c,95 :: 		for (counter = 1; counter < 18; counter++) {
; value start address is: 8 (W4)
	INC	W3
;FUNCTIONS.c,148 :: 		}
; counter end address is: 6 (W3)
	GOTO	L_HEX2COMP27
L_HEX2COMP28:
;FUNCTIONS.c,149 :: 		return value;
	MOV	W4, W0
; value end address is: 8 (W4)
;FUNCTIONS.c,150 :: 		}
L_end_HEX2COMP:
	RETURN
; end of _HEX2COMP
