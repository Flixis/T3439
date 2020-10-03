
_Motor_Command:

;T3439.c,26 :: 		void Motor_Command(unsigned char * data_get, int data_len) {
;T3439.c,27 :: 		for (i = 0; i < data_len; i++) {
	PUSH	W12
	PUSH	W13
	CLR	W0
	MOV	W0, _i
L_Motor_Command0:
	MOV	#lo_addr(_i), W0
	CP	W11, [W0]
	BRA GT	L__Motor_Command41
	GOTO	L_Motor_Command1
L__Motor_Command41:
;T3439.c,29 :: 		UART_Set_Active( & UART3_Read, & UART3_Write, & UART3_Data_Ready, & UART3_Tx_Idle);
	PUSH.D	W10
	MOV	#lo_addr(_UART3_Tx_Idle), W13
	MOV	#lo_addr(_UART3_Data_Ready), W12
	MOV	#lo_addr(_UART3_Write), W11
	MOV	#lo_addr(_UART3_Read), W10
	CALL	_UART_Set_Active
	POP.D	W10
;T3439.c,30 :: 		UART3_Write(data_get[i]);
	MOV	#lo_addr(_i), W0
	ADD	W10, [W0], W0
	PUSH	W10
	ZE	[W0], W10
	CALL	_UART3_Write
	POP	W10
;T3439.c,33 :: 		UART_Set_Active( & UART1_Read, & UART1_Write, & UART1_Data_Ready, & UART1_Tx_Idle);
	PUSH.D	W10
	MOV	#lo_addr(_UART1_Tx_Idle), W13
	MOV	#lo_addr(_UART1_Data_Ready), W12
	MOV	#lo_addr(_UART1_Write), W11
	MOV	#lo_addr(_UART1_Read), W10
	CALL	_UART_Set_Active
	POP.D	W10
;T3439.c,27 :: 		for (i = 0; i < data_len; i++) {
	MOV	#1, W1
	MOV	#lo_addr(_i), W0
	ADD	W1, [W0], [W0]
;T3439.c,34 :: 		}
	GOTO	L_Motor_Command0
L_Motor_Command1:
;T3439.c,35 :: 		}
L_end_Motor_Command:
	POP	W13
	POP	W12
	RETURN
; end of _Motor_Command

_GET_CURRENT_POS:
	LNK	#2

;T3439.c,37 :: 		void GET_CURRENT_POS(){
;T3439.c,49 :: 		U1STA.UTXEN = 0;
	PUSH	W10
	PUSH	W11
	BCLR	U1STA, #10
;T3439.c,50 :: 		U1STA.OERR = 1;
	BSET.B	U1STA, #1
;T3439.c,51 :: 		U3STA.OERR = 1;
	BSET.B	U3STA, #1
;T3439.c,52 :: 		Delay_ms(5);
	MOV	#13333, W7
L_GET_CURRENT_POS3:
	DEC	W7
	BRA NZ	L_GET_CURRENT_POS3
	NOP
;T3439.c,53 :: 		U1STA.UTXEN = 1;
	BSET	U1STA, #10
;T3439.c,54 :: 		U1STA.OERR = 0;
	BCLR.B	U1STA, #1
;T3439.c,55 :: 		U3STA.OERR = 0;
	BCLR.B	U3STA, #1
;T3439.c,56 :: 		Motor_Command(GET_POS, sizeof(GET_POS));
	MOV	#9, W11
	MOV	#lo_addr(T3439_GET_POS), W10
	CALL	_Motor_Command
;T3439.c,63 :: 		while (x <= 9) {
L_GET_CURRENT_POS5:
	MOV	_x, W0
	CP	W0, #9
	BRA LE	L__GET_CURRENT_POS43
	GOTO	L_GET_CURRENT_POS6
L__GET_CURRENT_POS43:
;T3439.c,64 :: 		for (i = 0; i < uart3_data_ready(); i++) {
	CLR	W0
	MOV	W0, _i
L_GET_CURRENT_POS7:
	CALL	_UART3_Data_Ready
	MOV	#lo_addr(_i), W1
	CP	W0, [W1]
	BRA GTU	L__GET_CURRENT_POS44
	GOTO	L_GET_CURRENT_POS8
L__GET_CURRENT_POS44:
;T3439.c,65 :: 		hex[i] = uart3_read();
	MOV	#lo_addr(_hex), W1
	MOV	#lo_addr(_i), W0
	ADD	W1, [W0], W0
	MOV	W0, [W14+0]
	CALL	_UART3_Read
	MOV	[W14+0], W1
	MOV.B	W0, [W1]
;T3439.c,66 :: 		uart1_write(hex[i]);
	MOV	#lo_addr(_hex), W1
	MOV	#lo_addr(_i), W0
	ADD	W1, [W0], W0
	ZE	[W0], W10
	CALL	_UART1_Write
;T3439.c,67 :: 		x++;
	MOV	#1, W1
	MOV	#lo_addr(_x), W0
	ADD	W1, [W0], [W0]
;T3439.c,64 :: 		for (i = 0; i < uart3_data_ready(); i++) {
	MOV	#1, W1
	MOV	#lo_addr(_i), W0
	ADD	W1, [W0], [W0]
;T3439.c,68 :: 		}
	GOTO	L_GET_CURRENT_POS7
L_GET_CURRENT_POS8:
;T3439.c,69 :: 		}
	GOTO	L_GET_CURRENT_POS5
L_GET_CURRENT_POS6:
;T3439.c,73 :: 		}
L_end_GET_CURRENT_POS:
	POP	W11
	POP	W10
	ULNK
	RETURN
; end of _GET_CURRENT_POS

_interrupt1:
	PUSH	DSWPAG
	PUSH	50
	PUSH	RCOUNT
	PUSH	W0
	MOV	#2, W0
	REPEAT	#12
	PUSH	[W0++]

;T3439.c,77 :: 		void interrupt1() iv 0x000003C ics ICS_AUTO {
;T3439.c,79 :: 		IFS1.INT1IF = 0;
	PUSH	W10
	PUSH	W11
	BCLR.B	IFS1, #4
;T3439.c,80 :: 		if (PORTD.F3 == 1) {
	BTSS	PORTD, #3
	GOTO	L_interrupt110
;T3439.c,86 :: 		Motor_Command(STOP, sizeof(STOP));
	MOV	#9, W11
	MOV	#lo_addr(T3439_STOP), W10
	CALL	_Motor_Command
;T3439.c,87 :: 		GET_CURRENT_POS();
	CALL	_GET_CURRENT_POS
;T3439.c,94 :: 		Delay_ms(100);
	MOV	#5, W8
	MOV	#4523, W7
L_interrupt111:
	DEC	W7
	BRA NZ	L_interrupt111
	DEC	W8
	BRA NZ	L_interrupt111
;T3439.c,95 :: 		Motor_Command(SET_0_POS, sizeof(SET_0_POS));
	MOV	#9, W11
	MOV	#lo_addr(T3439_SET_0_POS), W10
	CALL	_Motor_Command
;T3439.c,96 :: 		Delay_ms(100);
	MOV	#5, W8
	MOV	#4523, W7
L_interrupt113:
	DEC	W7
	BRA NZ	L_interrupt113
	DEC	W8
	BRA NZ	L_interrupt113
;T3439.c,97 :: 		Motor_Command(ROLAT5, sizeof(ROLAT5));
	MOV	#9, W11
	MOV	#lo_addr(T3439_ROLAT5), W10
	CALL	_Motor_Command
;T3439.c,100 :: 		IFS1.INT1IF = 0; // Clear interrupt nul bit
	BCLR.B	IFS1, #4
;T3439.c,102 :: 		IEC1.INT1IE = 0; // Disable interrupt nul bit
	BCLR.B	IEC1, #4
;T3439.c,103 :: 		IEC1.INT2IE = 1; // Enable interrupt saftey 2
	BSET	IEC1, #13
;T3439.c,104 :: 		}
L_interrupt110:
;T3439.c,106 :: 		}
L_end_interrupt1:
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
; end of _interrupt1

_interrupt2_low:
	PUSH	DSWPAG
	PUSH	50
	PUSH	RCOUNT
	PUSH	W0
	MOV	#2, W0
	REPEAT	#12
	PUSH	[W0++]

;T3439.c,109 :: 		void interrupt2_low() iv 0x000004E ics ICS_AUTO {
;T3439.c,111 :: 		if (PORTD.F4 == 1) {
	PUSH	W10
	PUSH	W11
	BTSS	PORTD, #4
	GOTO	L_interrupt2_low15
;T3439.c,117 :: 		Motor_Command(STOP, sizeof(STOP));
	MOV	#9, W11
	MOV	#lo_addr(T3439_STOP), W10
	CALL	_Motor_Command
;T3439.c,121 :: 		IEC1.INT2IE = 0; // Disable interrupt saftey 1
	BCLR	IEC1, #13
;T3439.c,122 :: 		IEC3.INT3IE = 1; // Enable interrupt saftey 2
	BSET.B	IEC3, #5
;T3439.c,123 :: 		}
L_interrupt2_low15:
;T3439.c,124 :: 		}
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

;T3439.c,126 :: 		void interrupt3() iv 0x000007E ics ICS_AUTO {
;T3439.c,128 :: 		if (PORTD.F5 == 1) {
	PUSH	W10
	PUSH	W11
	BTSS	PORTD, #5
	GOTO	L_interrupt316
;T3439.c,130 :: 		Motor_Command(STOP, sizeof(STOP));
	MOV	#9, W11
	MOV	#lo_addr(T3439_STOP), W10
	CALL	_Motor_Command
;T3439.c,133 :: 		IFS1.INT3IF = 0; // Clear interrupt saftey 2 bit
	BCLR.B	IFS1, #5
;T3439.c,134 :: 		IEC3.INT3IE = 0; // Disable interrupt saftey 2
	BCLR.B	IEC3, #5
;T3439.c,135 :: 		}
L_interrupt316:
;T3439.c,137 :: 		}
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

_Get_Command:
	LNK	#20

;T3439.c,139 :: 		void Get_Command() {
;T3439.c,141 :: 		if (uart1_Data_Ready()) {
	PUSH	W10
	PUSH	W11
	PUSH	W12
	CALL	_UART1_Data_Ready
	CP0	W0
	BRA NZ	L__Get_Command49
	GOTO	L_Get_Command17
L__Get_Command49:
;T3439.c,143 :: 		uart1_read_text(input, "\r\n", sizeof(input)); // Read String data up to 10th charachter if \r if found stop looking and put data in input.
	ADD	W14, #0, W0
	MOV.B	#20, W12
	MOV	#lo_addr(?lstr1_T3439), W11
	MOV	W0, W10
	CALL	_UART1_Read_Text
;T3439.c,145 :: 		if (strcmp(input, COMMAND_GET_POS) == 0) {
	ADD	W14, #0, W0
	MOV	#lo_addr(T3439_COMMAND_GET_POS), W11
	MOV	W0, W10
	CALL	_strcmp
	CP	W0, #0
	BRA Z	L__Get_Command50
	GOTO	L_Get_Command18
L__Get_Command50:
;T3439.c,146 :: 		Motor_Command(GET_POS, sizeof(GET_POS));
	MOV	#9, W11
	MOV	#lo_addr(T3439_GET_POS), W10
	CALL	_Motor_Command
;T3439.c,147 :: 		} else if (strcmp(input, COMMMAND_SET_0_POS) == 0) {
	GOTO	L_Get_Command19
L_Get_Command18:
	ADD	W14, #0, W0
	MOV	#lo_addr(T3439_COMMMAND_SET_0_POS), W11
	MOV	W0, W10
	CALL	_strcmp
	CP	W0, #0
	BRA Z	L__Get_Command51
	GOTO	L_Get_Command20
L__Get_Command51:
;T3439.c,148 :: 		Motor_Command(SET_0_POS, sizeof(SET_0_POS));
	MOV	#9, W11
	MOV	#lo_addr(T3439_SET_0_POS), W10
	CALL	_Motor_Command
;T3439.c,149 :: 		} else if (strcmp(input, COMMMAND_MV_ABS_0) == 0) {
	GOTO	L_Get_Command21
L_Get_Command20:
	ADD	W14, #0, W0
	MOV	#lo_addr(T3439_COMMMAND_MV_ABS_0), W11
	MOV	W0, W10
	CALL	_strcmp
	CP	W0, #0
	BRA Z	L__Get_Command52
	GOTO	L_Get_Command22
L__Get_Command52:
;T3439.c,150 :: 		Motor_Command(MV_ABS_0, sizeof(MV_ABS_0));
	MOV	#9, W11
	MOV	#lo_addr(T3439_MV_ABS_0), W10
	CALL	_Motor_Command
;T3439.c,151 :: 		} else if (strcmp(input, COMMMAND_RORAT5) == 0) {
	GOTO	L_Get_Command23
L_Get_Command22:
	ADD	W14, #0, W0
	MOV	#lo_addr(T3439_COMMMAND_RORAT5), W11
	MOV	W0, W10
	CALL	_strcmp
	CP	W0, #0
	BRA Z	L__Get_Command53
	GOTO	L_Get_Command24
L__Get_Command53:
;T3439.c,152 :: 		Motor_Command(RORAT5, sizeof(RORAT5));
	MOV	#9, W11
	MOV	#lo_addr(T3439_RORAT5), W10
	CALL	_Motor_Command
;T3439.c,153 :: 		} else if (strcmp(input, COMMMAND_ROLAT5) == 0) {
	GOTO	L_Get_Command25
L_Get_Command24:
	ADD	W14, #0, W0
	MOV	#lo_addr(T3439_COMMMAND_ROLAT5), W11
	MOV	W0, W10
	CALL	_strcmp
	CP	W0, #0
	BRA Z	L__Get_Command54
	GOTO	L_Get_Command26
L__Get_Command54:
;T3439.c,154 :: 		Motor_Command(ROLAT5, sizeof(ROLAT5));
	MOV	#9, W11
	MOV	#lo_addr(T3439_ROLAT5), W10
	CALL	_Motor_Command
;T3439.c,155 :: 		} else if (strcmp(input, COMMAND_START) == 0) {
	GOTO	L_Get_Command27
L_Get_Command26:
	ADD	W14, #0, W0
	MOV	#lo_addr(T3439_COMMAND_START), W11
	MOV	W0, W10
	CALL	_strcmp
	CP	W0, #0
	BRA Z	L__Get_Command55
	GOTO	L_Get_Command28
L__Get_Command55:
;T3439.c,159 :: 		Motor_Command(ROLAT5, sizeof(ROLAT5));
	MOV	#9, W11
	MOV	#lo_addr(T3439_ROLAT5), W10
	CALL	_Motor_Command
;T3439.c,160 :: 		delay_ms(1000);
	MOV	#41, W8
	MOV	#45239, W7
L_Get_Command29:
	DEC	W7
	BRA NZ	L_Get_Command29
	DEC	W8
	BRA NZ	L_Get_Command29
;T3439.c,162 :: 		} else if (strcmp(input, COMMMAND_STOP) == 0) {
	GOTO	L_Get_Command31
L_Get_Command28:
	ADD	W14, #0, W0
	MOV	#lo_addr(T3439_COMMMAND_STOP), W11
	MOV	W0, W10
	CALL	_strcmp
	CP	W0, #0
	BRA Z	L__Get_Command56
	GOTO	L_Get_Command32
L__Get_Command56:
;T3439.c,163 :: 		uart1_write_text("Stopped!");
	MOV	#lo_addr(?lstr2_T3439), W10
	CALL	_UART1_Write_Text
;T3439.c,164 :: 		Motor_Command(STOP, sizeof(STOP));
	MOV	#9, W11
	MOV	#lo_addr(T3439_STOP), W10
	CALL	_Motor_Command
;T3439.c,165 :: 		} else if (strcmp(input, COMMAND_RESET) == 0) {
	GOTO	L_Get_Command33
L_Get_Command32:
	ADD	W14, #0, W0
	MOV	#lo_addr(T3439_COMMAND_RESET), W11
	MOV	W0, W10
	CALL	_strcmp
	CP	W0, #0
	BRA Z	L__Get_Command57
	GOTO	L_Get_Command34
L__Get_Command57:
;T3439.c,167 :: 		reset
	RESET
;T3439.c,169 :: 		} else {
	GOTO	L_Get_Command35
L_Get_Command34:
;T3439.c,170 :: 		}
L_Get_Command35:
L_Get_Command33:
L_Get_Command31:
L_Get_Command27:
L_Get_Command25:
L_Get_Command23:
L_Get_Command21:
L_Get_Command19:
;T3439.c,171 :: 		}
L_Get_Command17:
;T3439.c,172 :: 		}
L_end_Get_Command:
	POP	W12
	POP	W11
	POP	W10
	ULNK
	RETURN
; end of _Get_Command

_main:
	MOV	#2048, W15
	MOV	#6142, W0
	MOV	WREG, 32
	MOV	#1, W0
	MOV	WREG, 50
	MOV	#4, W0
	IOR	68

;T3439.c,175 :: 		void main() {
;T3439.c,178 :: 		TRISB = 0x7EEF;
	PUSH	W10
	PUSH	W11
	PUSH	W12
	MOV	#32495, W0
	MOV	WREG, TRISB
;T3439.c,179 :: 		TRISC = 0xFFFF;
	MOV	#65535, W0
	MOV	WREG, TRISC
;T3439.c,180 :: 		TRISD = 0xFFFF;
	MOV	#65535, W0
	MOV	WREG, TRISD
;T3439.c,181 :: 		TRISE = 0xFFFF;
	MOV	#65535, W0
	MOV	WREG, TRISE
;T3439.c,182 :: 		TRISF = 0x0000;
	CLR	TRISF
;T3439.c,183 :: 		TRISG = 0xFFF3;
	MOV	#65523, W0
	MOV	WREG, TRISG
;T3439.c,184 :: 		ANSD = 0x0000;
	CLR	ANSD
;T3439.c,185 :: 		ANSB = 0x0000;
	CLR	ANSB
;T3439.c,188 :: 		UART1_Init(9600);
	MOV	#9600, W10
	MOV	#0, W11
	CALL	_UART1_Init
;T3439.c,189 :: 		UART3_Init(9600);
	MOV	#9600, W10
	MOV	#0, W11
	CALL	_UART3_Init
;T3439.c,191 :: 		Delay_ms(3000);
	MOV	#123, W8
	MOV	#4647, W7
L_main36:
	DEC	W7
	BRA NZ	L_main36
	DEC	W8
	BRA NZ	L_main36
	NOP
	NOP
;T3439.c,192 :: 		LATB.F8 = 1;
	BSET	LATB, #8
;T3439.c,194 :: 		Unlock_IOLOCK();
	CALL	_Unlock_IOLOCK
;T3439.c,196 :: 		PPS_Mapping_NoLock(28, _INPUT, _U1RX); // Sets pin 15 to be Input, and maps RX3/DT3 Input to it
	MOV.B	#28, W12
	MOV.B	#1, W11
	MOV.B	#28, W10
	CALL	_PPS_Mapping_NoLock
;T3439.c,197 :: 		PPS_Mapping_NoLock(18, _OUTPUT, _U1TX); // Sets pin 5 to be Output
	MOV.B	#3, W12
	CLR	W11
	MOV.B	#18, W10
	CALL	_PPS_Mapping_NoLock
;T3439.c,200 :: 		PPS_Mapping_NoLock(14, _INPUT, _U3RX); // Sets pin 15 to be Input, and maps RX3/DT3 Input to it
	MOV.B	#32, W12
	MOV.B	#1, W11
	MOV.B	#14, W10
	CALL	_PPS_Mapping_NoLock
;T3439.c,201 :: 		PPS_Mapping_NoLock(29, _OUTPUT, _U3TX); // Sets pin 5 to be Output
	MOV.B	#28, W12
	CLR	W11
	MOV.B	#29, W10
	CALL	_PPS_Mapping_NoLock
;T3439.c,204 :: 		PPS_Mapping_NoLock(22, _INPUT, _INT1); // Sets pin 22 to be Input, and maps interrupt
	MOV.B	#3, W12
	MOV.B	#1, W11
	MOV.B	#22, W10
	CALL	_PPS_Mapping_NoLock
;T3439.c,205 :: 		PPS_Mapping_NoLock(25, _INPUT, _INT2); // Sets pin 25 to be Input, and maps interrupt
	MOV.B	#4, W12
	MOV.B	#1, W11
	MOV.B	#25, W10
	CALL	_PPS_Mapping_NoLock
;T3439.c,206 :: 		PPS_Mapping_NoLock(20, _INPUT, _INT3); // Sets pin 20 to be Input, and maps interrupt
	MOV.B	#5, W12
	MOV.B	#1, W11
	MOV.B	#20, W10
	CALL	_PPS_Mapping_NoLock
;T3439.c,208 :: 		Lock_IOLOCK();
	CALL	_Lock_IOLOCK
;T3439.c,211 :: 		U1RXREG = 0;
	CLR	U1RXREG
;T3439.c,212 :: 		U3RXREG = 0;
	CLR	U3RXREG
;T3439.c,215 :: 		INTCON1.NSTDIS = 0;
	BCLR	INTCON1, #15
;T3439.c,217 :: 		IEC3.INT3IE = 0; // Disable interrupt saftey 2
	BCLR.B	IEC3, #5
;T3439.c,218 :: 		IEC1.INT2IE = 0; // Disable interrupt saftey 1
	BCLR	IEC1, #13
;T3439.c,219 :: 		IEC1.INT1IE = 1; //Nul ENABLE TO START TEST
	BSET.B	IEC1, #4
;T3439.c,221 :: 		while (true) {
L_main38:
;T3439.c,223 :: 		Get_Command();
	CALL	_Get_Command
;T3439.c,225 :: 		}
	GOTO	L_main38
;T3439.c,226 :: 		}
L_end_main:
	POP	W12
	POP	W11
	POP	W10
L__main_end_loop:
	BRA	L__main_end_loop
; end of _main
