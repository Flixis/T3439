
_MOTOR_COMMAND:

;FUNCTIONS.c,13 :: 		void MOTOR_COMMAND(unsigned char * data_get, int data_len) {
;FUNCTIONS.c,14 :: 		for (i = 0; i < data_len; i++) {
	PUSH	W12
	PUSH	W13
	CLR	W0
	MOV	W0, _i
L_MOTOR_COMMAND0:
	MOV	#lo_addr(_i), W0
	CP	W11, [W0]
	BRA GT	L__MOTOR_COMMAND33
	GOTO	L_MOTOR_COMMAND1
L__MOTOR_COMMAND33:
;FUNCTIONS.c,16 :: 		UART_Set_Active( & UART3_Read, & UART3_Write, & UART3_Data_Ready, & UART3_Tx_Idle);
	PUSH.D	W10
	MOV	#lo_addr(_UART3_Tx_Idle), W13
	MOV	#lo_addr(_UART3_Data_Ready), W12
	MOV	#lo_addr(_UART3_Write), W11
	MOV	#lo_addr(_UART3_Read), W10
	CALL	_UART_Set_Active
	POP.D	W10
;FUNCTIONS.c,17 :: 		UART3_Write(data_get[i]);
	MOV	#lo_addr(_i), W0
	ADD	W10, [W0], W0
	PUSH	W10
	ZE	[W0], W10
	CALL	_UART3_Write
	POP	W10
;FUNCTIONS.c,20 :: 		UART_Set_Active( & UART1_Read, & UART1_Write, & UART1_Data_Ready, & UART1_Tx_Idle);
	PUSH.D	W10
	MOV	#lo_addr(_UART1_Tx_Idle), W13
	MOV	#lo_addr(_UART1_Data_Ready), W12
	MOV	#lo_addr(_UART1_Write), W11
	MOV	#lo_addr(_UART1_Read), W10
	CALL	_UART_Set_Active
	POP.D	W10
;FUNCTIONS.c,14 :: 		for (i = 0; i < data_len; i++) {
	MOV	#1, W1
	MOV	#lo_addr(_i), W0
	ADD	W1, [W0], [W0]
;FUNCTIONS.c,21 :: 		}
	GOTO	L_MOTOR_COMMAND0
L_MOTOR_COMMAND1:
;FUNCTIONS.c,22 :: 		}
L_end_MOTOR_COMMAND:
	POP	W13
	POP	W12
	RETURN
; end of _MOTOR_COMMAND

_GET_CURRENT_POS:
	LNK	#2

;FUNCTIONS.c,28 :: 		void GET_CURRENT_POS() {
;FUNCTIONS.c,39 :: 		U1STA.UTXEN = 0;
	PUSH	W10
	PUSH	W11
	BCLR	U1STA, #10
;FUNCTIONS.c,40 :: 		U1STA.OERR = 1;
	BSET.B	U1STA, #1
;FUNCTIONS.c,41 :: 		U3STA.OERR = 1;
	BSET.B	U3STA, #1
;FUNCTIONS.c,42 :: 		Delay_ms(5);
	MOV	#13333, W7
L_GET_CURRENT_POS3:
	DEC	W7
	BRA NZ	L_GET_CURRENT_POS3
	NOP
;FUNCTIONS.c,43 :: 		U1STA.UTXEN = 1;
	BSET	U1STA, #10
;FUNCTIONS.c,44 :: 		U1STA.OERR = 0;
	BCLR.B	U1STA, #1
;FUNCTIONS.c,45 :: 		U3STA.OERR = 0;
	BCLR.B	U3STA, #1
;FUNCTIONS.c,46 :: 		Motor_Command(GET_POS, sizeof(GET_POS));
	MOV	#9, W11
	MOV	#lo_addr(FUNCTIONS_GET_POS), W10
	CALL	_MOTOR_COMMAND
;FUNCTIONS.c,52 :: 		while (x <= 9) {
L_GET_CURRENT_POS5:
	MOV	_x, W0
	CP	W0, #9
	BRA LE	L__GET_CURRENT_POS35
	GOTO	L_GET_CURRENT_POS6
L__GET_CURRENT_POS35:
;FUNCTIONS.c,53 :: 		for (i = 0; i < uart3_data_ready(); i++) {
	CLR	W0
	MOV	W0, _i
L_GET_CURRENT_POS7:
	CALL	_UART3_Data_Ready
	MOV	#lo_addr(_i), W1
	CP	W0, [W1]
	BRA GTU	L__GET_CURRENT_POS36
	GOTO	L_GET_CURRENT_POS8
L__GET_CURRENT_POS36:
;FUNCTIONS.c,54 :: 		hex[i] = uart3_read();
	MOV	#lo_addr(_hex), W1
	MOV	#lo_addr(_i), W0
	ADD	W1, [W0], W0
	MOV	W0, [W14+0]
	CALL	_UART3_Read
	MOV	[W14+0], W1
	MOV.B	W0, [W1]
;FUNCTIONS.c,55 :: 		uart1_write(hex[i]);
	MOV	#lo_addr(_hex), W1
	MOV	#lo_addr(_i), W0
	ADD	W1, [W0], W0
	ZE	[W0], W10
	CALL	_UART1_Write
;FUNCTIONS.c,56 :: 		x++;
	MOV	#1, W1
	MOV	#lo_addr(_x), W0
	ADD	W1, [W0], [W0]
;FUNCTIONS.c,53 :: 		for (i = 0; i < uart3_data_ready(); i++) {
	MOV	#1, W1
	MOV	#lo_addr(_i), W0
	ADD	W1, [W0], [W0]
;FUNCTIONS.c,57 :: 		}
	GOTO	L_GET_CURRENT_POS7
L_GET_CURRENT_POS8:
;FUNCTIONS.c,58 :: 		}
	GOTO	L_GET_CURRENT_POS5
L_GET_CURRENT_POS6:
;FUNCTIONS.c,59 :: 		}
L_end_GET_CURRENT_POS:
	POP	W11
	POP	W10
	ULNK
	RETURN
; end of _GET_CURRENT_POS

_HEX2COMP:

;FUNCTIONS.c,61 :: 		int HEX2COMP(char * hex) {
;FUNCTIONS.c,62 :: 		int value = 0, counter = 1;
; value start address is: 8 (W4)
	CLR	W4
;FUNCTIONS.c,63 :: 		for (counter = 1; counter < 18; counter++) {
; counter start address is: 6 (W3)
	MOV	#1, W3
; value end address is: 8 (W4)
; counter end address is: 6 (W3)
L_HEX2COMP10:
; counter start address is: 6 (W3)
; value start address is: 8 (W4)
	CP	W3, #18
	BRA LT	L__HEX2COMP38
	GOTO	L_HEX2COMP11
L__HEX2COMP38:
;FUNCTIONS.c,64 :: 		switch (hex[counter]) {
	ADD	W10, W3, W2
	GOTO	L_HEX2COMP13
;FUNCTIONS.c,65 :: 		case '0':
L_HEX2COMP15:
;FUNCTIONS.c,66 :: 		value = value << 4;
	SL	W4, #4, W0
; value end address is: 8 (W4)
; value start address is: 0 (W0)
;FUNCTIONS.c,67 :: 		break;
	MOV	W0, W4
; value end address is: 0 (W0)
	GOTO	L_HEX2COMP14
;FUNCTIONS.c,68 :: 		case '1':
L_HEX2COMP16:
;FUNCTIONS.c,69 :: 		value = (value << 4) + 1;
; value start address is: 8 (W4)
	SL	W4, #4, W0
; value end address is: 8 (W4)
; value start address is: 0 (W0)
	INC	W0
;FUNCTIONS.c,70 :: 		break;
	MOV	W0, W4
; value end address is: 0 (W0)
	GOTO	L_HEX2COMP14
;FUNCTIONS.c,71 :: 		case '2':
L_HEX2COMP17:
;FUNCTIONS.c,72 :: 		value = (value << 4) + 2;
; value start address is: 8 (W4)
	SL	W4, #4, W0
; value end address is: 8 (W4)
; value start address is: 0 (W0)
	INC2	W0
;FUNCTIONS.c,73 :: 		break;
	MOV	W0, W4
; value end address is: 0 (W0)
	GOTO	L_HEX2COMP14
;FUNCTIONS.c,74 :: 		case '3':
L_HEX2COMP18:
;FUNCTIONS.c,75 :: 		value = (value << 4) + 3;
; value start address is: 8 (W4)
	SL	W4, #4, W0
; value end address is: 8 (W4)
; value start address is: 0 (W0)
	ADD	W0, #3, W0
;FUNCTIONS.c,76 :: 		break;
	MOV	W0, W4
; value end address is: 0 (W0)
	GOTO	L_HEX2COMP14
;FUNCTIONS.c,77 :: 		case '4':
L_HEX2COMP19:
;FUNCTIONS.c,78 :: 		value = (value << 4) + 4;
; value start address is: 8 (W4)
	SL	W4, #4, W0
; value end address is: 8 (W4)
; value start address is: 0 (W0)
	ADD	W0, #4, W0
;FUNCTIONS.c,79 :: 		break;
	MOV	W0, W4
; value end address is: 0 (W0)
	GOTO	L_HEX2COMP14
;FUNCTIONS.c,80 :: 		case '5':
L_HEX2COMP20:
;FUNCTIONS.c,81 :: 		value = (value << 4) + 5;
; value start address is: 8 (W4)
	SL	W4, #4, W0
; value end address is: 8 (W4)
; value start address is: 0 (W0)
	ADD	W0, #5, W0
;FUNCTIONS.c,82 :: 		break;
	MOV	W0, W4
; value end address is: 0 (W0)
	GOTO	L_HEX2COMP14
;FUNCTIONS.c,83 :: 		case '6':
L_HEX2COMP21:
;FUNCTIONS.c,84 :: 		value = (value << 4) + 6;
; value start address is: 8 (W4)
	SL	W4, #4, W0
; value end address is: 8 (W4)
; value start address is: 0 (W0)
	ADD	W0, #6, W0
;FUNCTIONS.c,85 :: 		break;
	MOV	W0, W4
; value end address is: 0 (W0)
	GOTO	L_HEX2COMP14
;FUNCTIONS.c,86 :: 		case '7':
L_HEX2COMP22:
;FUNCTIONS.c,87 :: 		value = (value << 4) + 7;
; value start address is: 8 (W4)
	SL	W4, #4, W0
; value end address is: 8 (W4)
; value start address is: 0 (W0)
	ADD	W0, #7, W0
;FUNCTIONS.c,88 :: 		break;
	MOV	W0, W4
; value end address is: 0 (W0)
	GOTO	L_HEX2COMP14
;FUNCTIONS.c,89 :: 		case '8':
L_HEX2COMP23:
;FUNCTIONS.c,90 :: 		value = (value << 4) + 8;
; value start address is: 8 (W4)
	SL	W4, #4, W0
; value end address is: 8 (W4)
; value start address is: 0 (W0)
	ADD	W0, #8, W0
;FUNCTIONS.c,91 :: 		break;
	MOV	W0, W4
; value end address is: 0 (W0)
	GOTO	L_HEX2COMP14
;FUNCTIONS.c,92 :: 		case '9':
L_HEX2COMP24:
;FUNCTIONS.c,93 :: 		value = (value << 4) + 9;
; value start address is: 8 (W4)
	SL	W4, #4, W0
; value end address is: 8 (W4)
; value start address is: 0 (W0)
	ADD	W0, #9, W0
;FUNCTIONS.c,94 :: 		break;
	MOV	W0, W4
; value end address is: 0 (W0)
	GOTO	L_HEX2COMP14
;FUNCTIONS.c,95 :: 		case 'A':
L_HEX2COMP25:
;FUNCTIONS.c,96 :: 		value = (value << 4) + 10;
; value start address is: 8 (W4)
	SL	W4, #4, W0
; value end address is: 8 (W4)
; value start address is: 0 (W0)
	ADD	W0, #10, W0
;FUNCTIONS.c,97 :: 		break;
	MOV	W0, W4
; value end address is: 0 (W0)
	GOTO	L_HEX2COMP14
;FUNCTIONS.c,98 :: 		case 'B':
L_HEX2COMP26:
;FUNCTIONS.c,99 :: 		value = (value << 4) + 11;
; value start address is: 8 (W4)
	SL	W4, #4, W0
; value end address is: 8 (W4)
; value start address is: 0 (W0)
	ADD	W0, #11, W0
;FUNCTIONS.c,100 :: 		break;
	MOV	W0, W4
; value end address is: 0 (W0)
	GOTO	L_HEX2COMP14
;FUNCTIONS.c,101 :: 		case 'C':
L_HEX2COMP27:
;FUNCTIONS.c,102 :: 		value = (value << 4) + 12;
; value start address is: 8 (W4)
	SL	W4, #4, W0
; value end address is: 8 (W4)
; value start address is: 0 (W0)
	ADD	W0, #12, W0
;FUNCTIONS.c,103 :: 		break;
	MOV	W0, W4
; value end address is: 0 (W0)
	GOTO	L_HEX2COMP14
;FUNCTIONS.c,104 :: 		case 'D':
L_HEX2COMP28:
;FUNCTIONS.c,105 :: 		value = (value << 4) + 13;
; value start address is: 8 (W4)
	SL	W4, #4, W0
; value end address is: 8 (W4)
; value start address is: 0 (W0)
	ADD	W0, #13, W0
;FUNCTIONS.c,106 :: 		break;
	MOV	W0, W4
; value end address is: 0 (W0)
	GOTO	L_HEX2COMP14
;FUNCTIONS.c,107 :: 		case 'E':
L_HEX2COMP29:
;FUNCTIONS.c,108 :: 		value = (value << 4) + 14;
; value start address is: 8 (W4)
	SL	W4, #4, W0
; value end address is: 8 (W4)
; value start address is: 0 (W0)
	ADD	W0, #14, W0
;FUNCTIONS.c,109 :: 		break;
	MOV	W0, W4
; value end address is: 0 (W0)
	GOTO	L_HEX2COMP14
;FUNCTIONS.c,110 :: 		case 'F':
L_HEX2COMP30:
;FUNCTIONS.c,111 :: 		value = (value << 4) + 15;
; value start address is: 8 (W4)
	SL	W4, #4, W0
; value end address is: 8 (W4)
; value start address is: 0 (W0)
	ADD	W0, #15, W0
;FUNCTIONS.c,112 :: 		break;
	MOV	W0, W4
; value end address is: 0 (W0)
	GOTO	L_HEX2COMP14
;FUNCTIONS.c,113 :: 		default:
L_HEX2COMP31:
;FUNCTIONS.c,114 :: 		break;
; value start address is: 8 (W4)
	GOTO	L_HEX2COMP14
;FUNCTIONS.c,115 :: 		}
L_HEX2COMP13:
	MOV.B	[W2], W1
	MOV.B	#48, W0
	CP.B	W1, W0
	BRA NZ	L__HEX2COMP39
	GOTO	L_HEX2COMP15
L__HEX2COMP39:
	MOV.B	[W2], W1
	MOV.B	#49, W0
	CP.B	W1, W0
	BRA NZ	L__HEX2COMP40
	GOTO	L_HEX2COMP16
L__HEX2COMP40:
	MOV.B	[W2], W1
	MOV.B	#50, W0
	CP.B	W1, W0
	BRA NZ	L__HEX2COMP41
	GOTO	L_HEX2COMP17
L__HEX2COMP41:
	MOV.B	[W2], W1
	MOV.B	#51, W0
	CP.B	W1, W0
	BRA NZ	L__HEX2COMP42
	GOTO	L_HEX2COMP18
L__HEX2COMP42:
	MOV.B	[W2], W1
	MOV.B	#52, W0
	CP.B	W1, W0
	BRA NZ	L__HEX2COMP43
	GOTO	L_HEX2COMP19
L__HEX2COMP43:
	MOV.B	[W2], W1
	MOV.B	#53, W0
	CP.B	W1, W0
	BRA NZ	L__HEX2COMP44
	GOTO	L_HEX2COMP20
L__HEX2COMP44:
	MOV.B	[W2], W1
	MOV.B	#54, W0
	CP.B	W1, W0
	BRA NZ	L__HEX2COMP45
	GOTO	L_HEX2COMP21
L__HEX2COMP45:
	MOV.B	[W2], W1
	MOV.B	#55, W0
	CP.B	W1, W0
	BRA NZ	L__HEX2COMP46
	GOTO	L_HEX2COMP22
L__HEX2COMP46:
	MOV.B	[W2], W1
	MOV.B	#56, W0
	CP.B	W1, W0
	BRA NZ	L__HEX2COMP47
	GOTO	L_HEX2COMP23
L__HEX2COMP47:
	MOV.B	[W2], W1
	MOV.B	#57, W0
	CP.B	W1, W0
	BRA NZ	L__HEX2COMP48
	GOTO	L_HEX2COMP24
L__HEX2COMP48:
	MOV.B	[W2], W1
	MOV.B	#65, W0
	CP.B	W1, W0
	BRA NZ	L__HEX2COMP49
	GOTO	L_HEX2COMP25
L__HEX2COMP49:
	MOV.B	[W2], W1
	MOV.B	#66, W0
	CP.B	W1, W0
	BRA NZ	L__HEX2COMP50
	GOTO	L_HEX2COMP26
L__HEX2COMP50:
	MOV.B	[W2], W1
	MOV.B	#67, W0
	CP.B	W1, W0
	BRA NZ	L__HEX2COMP51
	GOTO	L_HEX2COMP27
L__HEX2COMP51:
	MOV.B	[W2], W1
	MOV.B	#68, W0
	CP.B	W1, W0
	BRA NZ	L__HEX2COMP52
	GOTO	L_HEX2COMP28
L__HEX2COMP52:
	MOV.B	[W2], W1
	MOV.B	#69, W0
	CP.B	W1, W0
	BRA NZ	L__HEX2COMP53
	GOTO	L_HEX2COMP29
L__HEX2COMP53:
	MOV.B	[W2], W1
	MOV.B	#70, W0
	CP.B	W1, W0
	BRA NZ	L__HEX2COMP54
	GOTO	L_HEX2COMP30
L__HEX2COMP54:
	GOTO	L_HEX2COMP31
; value end address is: 8 (W4)
L_HEX2COMP14:
;FUNCTIONS.c,63 :: 		for (counter = 1; counter < 18; counter++) {
; value start address is: 8 (W4)
	INC	W3
;FUNCTIONS.c,116 :: 		}
; counter end address is: 6 (W3)
	GOTO	L_HEX2COMP10
L_HEX2COMP11:
;FUNCTIONS.c,117 :: 		return value;
	MOV	W4, W0
; value end address is: 8 (W4)
;FUNCTIONS.c,118 :: 		}
L_end_HEX2COMP:
	RETURN
; end of _HEX2COMP
