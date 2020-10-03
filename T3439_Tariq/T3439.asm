
_Motor_Command:

;T3439.c,129 :: 		void Motor_Command(unsigned char * data_get, int data_len) {
;T3439.c,130 :: 		for (i = 0; i < data_len; i++) {
	PUSH	W12
	PUSH	W13
	CLR	W0
	MOV	W0, _i
L_Motor_Command0:
	MOV	#lo_addr(_i), W0
	CP	W11, [W0]
	BRA GT	L__Motor_Command88
	GOTO	L_Motor_Command1
L__Motor_Command88:
;T3439.c,131 :: 		if (Debug) {
	MOV	#lo_addr(_Debug), W0
	CP0.B	[W0]
	BRA NZ	L__Motor_Command89
	GOTO	L_Motor_Command3
L__Motor_Command89:
;T3439.c,133 :: 		UART_Set_Active( & UART1_Read, & UART1_Write, & UART1_Data_Ready, & UART1_Tx_Idle);
	PUSH.D	W10
	MOV	#lo_addr(_UART1_Tx_Idle), W13
	MOV	#lo_addr(_UART1_Data_Ready), W12
	MOV	#lo_addr(_UART1_Write), W11
	MOV	#lo_addr(_UART1_Read), W10
	CALL	_UART_Set_Active
	POP.D	W10
;T3439.c,134 :: 		UART1_Write(data_get[i]);
	MOV	#lo_addr(_i), W0
	ADD	W10, [W0], W0
	PUSH	W10
	ZE	[W0], W10
	CALL	_UART1_Write
	POP	W10
;T3439.c,135 :: 		}
L_Motor_Command3:
;T3439.c,137 :: 		UART_Set_Active( & UART3_Read, & UART3_Write, & UART3_Data_Ready, & UART3_Tx_Idle);
	PUSH.D	W10
	MOV	#lo_addr(_UART3_Tx_Idle), W13
	MOV	#lo_addr(_UART3_Data_Ready), W12
	MOV	#lo_addr(_UART3_Write), W11
	MOV	#lo_addr(_UART3_Read), W10
	CALL	_UART_Set_Active
	POP.D	W10
;T3439.c,138 :: 		UART3_Write(data_get[i]);
	MOV	#lo_addr(_i), W0
	ADD	W10, [W0], W0
	PUSH	W10
	ZE	[W0], W10
	CALL	_UART3_Write
	POP	W10
;T3439.c,141 :: 		UART_Set_Active( & UART1_Read, & UART1_Write, & UART1_Data_Ready, & UART1_Tx_Idle);
	PUSH.D	W10
	MOV	#lo_addr(_UART1_Tx_Idle), W13
	MOV	#lo_addr(_UART1_Data_Ready), W12
	MOV	#lo_addr(_UART1_Write), W11
	MOV	#lo_addr(_UART1_Read), W10
	CALL	_UART_Set_Active
	POP.D	W10
;T3439.c,130 :: 		for (i = 0; i < data_len; i++) {
	MOV	#1, W1
	MOV	#lo_addr(_i), W0
	ADD	W1, [W0], [W0]
;T3439.c,142 :: 		}
	GOTO	L_Motor_Command0
L_Motor_Command1:
;T3439.c,143 :: 		}
L_end_Motor_Command:
	POP	W13
	POP	W12
	RETURN
; end of _Motor_Command

_hex_to_signed_2_complement:

;T3439.c,145 :: 		int hex_to_signed_2_complement(char hexdata){
;T3439.c,147 :: 		}
L_end_hex_to_signed_2_complement:
	RETURN
; end of _hex_to_signed_2_complement

_GET_CURRENT_POS:
	LNK	#2

;T3439.c,150 :: 		void GET_CURRENT_POS(){
;T3439.c,151 :: 		U1STA.UTXEN = 0;
	PUSH	W10
	PUSH	W11
	BCLR	U1STA, #10
;T3439.c,152 :: 		U1STA.OERR = 1;
	BSET.B	U1STA, #1
;T3439.c,153 :: 		U3STA.OERR = 1;
	BSET.B	U3STA, #1
;T3439.c,154 :: 		Delay_ms(5);
	MOV	#13333, W7
L_GET_CURRENT_POS4:
	DEC	W7
	BRA NZ	L_GET_CURRENT_POS4
	NOP
;T3439.c,155 :: 		U1STA.UTXEN = 1;
	BSET	U1STA, #10
;T3439.c,156 :: 		U1STA.OERR = 0;
	BCLR.B	U1STA, #1
;T3439.c,157 :: 		U3STA.OERR = 0;
	BCLR.B	U3STA, #1
;T3439.c,158 :: 		Motor_Command(GET_POS, sizeof(GET_POS));
	MOV	#9, W11
	MOV	#lo_addr(_GET_POS), W10
	CALL	_Motor_Command
;T3439.c,160 :: 		while (x <= 9) {
L_GET_CURRENT_POS6:
	MOV	_x, W0
	CP	W0, #9
	BRA LE	L__GET_CURRENT_POS92
	GOTO	L_GET_CURRENT_POS7
L__GET_CURRENT_POS92:
;T3439.c,161 :: 		for (i = 0; i < uart3_data_ready(); i++) {
	CLR	W0
	MOV	W0, _i
L_GET_CURRENT_POS8:
	CALL	_UART3_Data_Ready
	MOV	#lo_addr(_i), W1
	CP	W0, [W1]
	BRA GTU	L__GET_CURRENT_POS93
	GOTO	L_GET_CURRENT_POS9
L__GET_CURRENT_POS93:
;T3439.c,162 :: 		hex[i] = uart3_read();
	MOV	#lo_addr(_hex), W1
	MOV	#lo_addr(_i), W0
	ADD	W1, [W0], W0
	MOV	W0, [W14+0]
	CALL	_UART3_Read
	MOV	[W14+0], W1
	MOV.B	W0, [W1]
;T3439.c,166 :: 		ByteToHex(hex[i],nutsdeez[i]);
	MOV	#lo_addr(_nutsdeez), W1
	MOV	#lo_addr(_i), W0
	ADD	W1, [W0], W2
	MOV	#lo_addr(_hex), W1
	MOV	#lo_addr(_i), W0
	ADD	W1, [W0], W0
	ZE	[W2], W11
	MOV.B	[W0], W10
	CALL	_ByteToHex
;T3439.c,170 :: 		x++;
	MOV	#1, W1
	MOV	#lo_addr(_x), W0
	ADD	W1, [W0], [W0]
;T3439.c,161 :: 		for (i = 0; i < uart3_data_ready(); i++) {
	MOV	#1, W1
	MOV	#lo_addr(_i), W0
	ADD	W1, [W0], [W0]
;T3439.c,171 :: 		}
	GOTO	L_GET_CURRENT_POS8
L_GET_CURRENT_POS9:
;T3439.c,172 :: 		}
	GOTO	L_GET_CURRENT_POS6
L_GET_CURRENT_POS7:
;T3439.c,176 :: 		}
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

;T3439.c,180 :: 		void interrupt1() iv 0x000003C ics ICS_AUTO {
;T3439.c,182 :: 		IFS1.INT1IF = 0;
	PUSH	W10
	PUSH	W11
	BCLR.B	IFS1, #4
;T3439.c,183 :: 		Delay_ms(10);
	MOV	#26666, W7
L_interrupt111:
	DEC	W7
	BRA NZ	L_interrupt111
	NOP
	NOP
;T3439.c,184 :: 		if (Debug) {
	MOV	#lo_addr(_Debug), W0
	CP0.B	[W0]
	BRA NZ	L__interrupt195
	GOTO	L_interrupt113
L__interrupt195:
;T3439.c,185 :: 		UART1_Write_Text("Triggered Null\n\r");
	MOV	#lo_addr(?lstr1_T3439), W10
	CALL	_UART1_Write_Text
;T3439.c,186 :: 		}
L_interrupt113:
;T3439.c,188 :: 		if (PORTD.F3 == 1 && TestMode) {
	BTSS	PORTD, #3
	GOTO	L__interrupt180
	MOV	#lo_addr(_TestMode), W0
	CP0.B	[W0]
	BRA NZ	L__interrupt196
	GOTO	L__interrupt179
L__interrupt196:
L__interrupt178:
;T3439.c,194 :: 		Motor_Command(STOP, sizeof(STOP));
	MOV	#9, W11
	MOV	#lo_addr(_STOP), W10
	CALL	_Motor_Command
;T3439.c,195 :: 		GET_CURRENT_POS();
	CALL	_GET_CURRENT_POS
;T3439.c,202 :: 		Delay_ms(100);
	MOV	#5, W8
	MOV	#4523, W7
L_interrupt117:
	DEC	W7
	BRA NZ	L_interrupt117
	DEC	W8
	BRA NZ	L_interrupt117
;T3439.c,203 :: 		Motor_Command(SET_0_POS, sizeof(SET_0_POS));
	MOV	#9, W11
	MOV	#lo_addr(_SET_0_POS), W10
	CALL	_Motor_Command
;T3439.c,204 :: 		Delay_ms(100);
	MOV	#5, W8
	MOV	#4523, W7
L_interrupt119:
	DEC	W7
	BRA NZ	L_interrupt119
	DEC	W8
	BRA NZ	L_interrupt119
;T3439.c,205 :: 		Motor_Command(ROLAT5, sizeof(ROLAT5));
	MOV	#9, W11
	MOV	#lo_addr(_ROLAT5), W10
	CALL	_Motor_Command
;T3439.c,208 :: 		IFS1.INT1IF = 0; // Clear interrupt nul bit
	BCLR.B	IFS1, #4
;T3439.c,210 :: 		IEC1.INT1IE = 0; // Disable interrupt nul bit
	BCLR.B	IEC1, #4
;T3439.c,211 :: 		IEC1.INT2IE = 1; // Enable interrupt saftey 2
	BSET	IEC1, #13
;T3439.c,188 :: 		if (PORTD.F3 == 1 && TestMode) {
L__interrupt180:
L__interrupt179:
;T3439.c,214 :: 		}
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

;T3439.c,217 :: 		void interrupt2_low() iv 0x000004E ics ICS_AUTO {
;T3439.c,219 :: 		if (Debug) {
	PUSH	W10
	PUSH	W11
	PUSH	W12
	MOV	#lo_addr(_Debug), W0
	CP0.B	[W0]
	BRA NZ	L__interrupt2_low98
	GOTO	L_interrupt2_low21
L__interrupt2_low98:
;T3439.c,220 :: 		UART1_Write_Text("Triggered Safety 1\r");
	MOV	#lo_addr(?lstr2_T3439), W10
	CALL	_UART1_Write_Text
;T3439.c,221 :: 		}
L_interrupt2_low21:
;T3439.c,223 :: 		if (PORTD.F4 == 1 && TestMode) {
	BTSS	PORTD, #4
	GOTO	L__interrupt2_low83
	MOV	#lo_addr(_TestMode), W0
	CP0.B	[W0]
	BRA NZ	L__interrupt2_low99
	GOTO	L__interrupt2_low82
L__interrupt2_low99:
L__interrupt2_low81:
;T3439.c,229 :: 		Motor_Command(STOP, sizeof(STOP));
	MOV	#9, W11
	MOV	#lo_addr(_STOP), W10
	CALL	_Motor_Command
;T3439.c,241 :: 		U1STA.UTXEN = 0;
	BCLR	U1STA, #10
;T3439.c,242 :: 		U1STA.OERR = 1;
	BSET.B	U1STA, #1
;T3439.c,243 :: 		U3STA.OERR = 1;
	BSET.B	U3STA, #1
;T3439.c,244 :: 		Delay_ms(5);
	MOV	#13333, W7
L_interrupt2_low25:
	DEC	W7
	BRA NZ	L_interrupt2_low25
	NOP
;T3439.c,245 :: 		U1STA.UTXEN = 1;
	BSET	U1STA, #10
;T3439.c,246 :: 		U1STA.OERR = 0;
	BCLR.B	U1STA, #1
;T3439.c,247 :: 		U3STA.OERR = 0;
	BCLR.B	U3STA, #1
;T3439.c,248 :: 		Motor_Command(GET_POS, sizeof(GET_POS));
	MOV	#9, W11
	MOV	#lo_addr(_GET_POS), W10
	CALL	_Motor_Command
;T3439.c,254 :: 		while (x <= 9) {
L_interrupt2_low27:
	MOV	_x, W0
	CP	W0, #9
	BRA LE	L__interrupt2_low100
	GOTO	L_interrupt2_low28
L__interrupt2_low100:
;T3439.c,255 :: 		for (i = 0; i < uart3_data_ready(); i++) {
	CLR	W0
	MOV	W0, _i
L_interrupt2_low29:
	CALL	_UART3_Data_Ready
	MOV	#lo_addr(_i), W1
	CP	W0, [W1]
	BRA GTU	L__interrupt2_low101
	GOTO	L_interrupt2_low30
L__interrupt2_low101:
;T3439.c,256 :: 		hex[9] = uart3_read();
	CALL	_UART3_Read
	MOV	#lo_addr(_hex+9), W1
	MOV.B	W0, [W1]
;T3439.c,257 :: 		uart1_write(hex);
	MOV	#lo_addr(_hex), W10
	CALL	_UART1_Write
;T3439.c,258 :: 		x++;
	MOV	#1, W1
	MOV	#lo_addr(_x), W0
	ADD	W1, [W0], [W0]
;T3439.c,259 :: 		if (x >= 8) {
	MOV	_x, W0
	CP	W0, #8
	BRA GE	L__interrupt2_low102
	GOTO	L_interrupt2_low32
L__interrupt2_low102:
;T3439.c,260 :: 		completedtask = 1;
	MOV	#1, W0
	MOV	W0, _completedtask
;T3439.c,261 :: 		}
L_interrupt2_low32:
;T3439.c,255 :: 		for (i = 0; i < uart3_data_ready(); i++) {
	MOV	#1, W1
	MOV	#lo_addr(_i), W0
	ADD	W1, [W0], [W0]
;T3439.c,262 :: 		}
	GOTO	L_interrupt2_low29
L_interrupt2_low30:
;T3439.c,264 :: 		}
	GOTO	L_interrupt2_low27
L_interrupt2_low28:
;T3439.c,267 :: 		while (completedtask == 1) {
L_interrupt2_low33:
	MOV	_completedtask, W0
	CP	W0, #1
	BRA Z	L__interrupt2_low103
	GOTO	L_interrupt2_low34
L__interrupt2_low103:
;T3439.c,268 :: 		if (uart1_data_ready()) {
	CALL	_UART1_Data_Ready
	CP0	W0
	BRA NZ	L__interrupt2_low104
	GOTO	L_interrupt2_low35
L__interrupt2_low104:
;T3439.c,269 :: 		uart1_read_text(input, "\r\n", sizeof(input));
	MOV.B	#16, W12
	MOV	#lo_addr(?lstr3_T3439), W11
	MOV	#lo_addr(_input), W10
	CALL	_UART1_Read_Text
;T3439.c,270 :: 		if (strcmp(input, TOK_OK_SF1) == 0) {
	MOV	#lo_addr(_TOK_OK_SF1), W11
	MOV	#lo_addr(_input), W10
	CALL	_strcmp
	CP	W0, #0
	BRA Z	L__interrupt2_low105
	GOTO	L_interrupt2_low36
L__interrupt2_low105:
;T3439.c,271 :: 		Motor_Command(RORAT5, sizeof(RORAT5));
	MOV	#9, W11
	MOV	#lo_addr(_RORAT5), W10
	CALL	_Motor_Command
;T3439.c,272 :: 		delay_ms(2500);
	MOV	#102, W8
	MOV	#47563, W7
L_interrupt2_low37:
	DEC	W7
	BRA NZ	L_interrupt2_low37
	DEC	W8
	BRA NZ	L_interrupt2_low37
	NOP
;T3439.c,273 :: 		IFS1.INT2IF = 0; // Clear interrupt saftey 1 bit
	BCLR	IFS1, #13
;T3439.c,274 :: 		completedtask = 0;
	CLR	W0
	MOV	W0, _completedtask
;T3439.c,275 :: 		}
L_interrupt2_low36:
;T3439.c,276 :: 		}
L_interrupt2_low35:
;T3439.c,277 :: 		}
	GOTO	L_interrupt2_low33
L_interrupt2_low34:
;T3439.c,280 :: 		IEC1.INT2IE = 0; // Disable interrupt saftey 1
	BCLR	IEC1, #13
;T3439.c,281 :: 		IEC3.INT3IE = 1; // Enable interrupt saftey 2
	BSET.B	IEC3, #5
;T3439.c,223 :: 		if (PORTD.F4 == 1 && TestMode) {
L__interrupt2_low83:
L__interrupt2_low82:
;T3439.c,283 :: 		}
L_end_interrupt2_low:
	POP	W12
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

;T3439.c,285 :: 		void interrupt3() iv 0x000007E ics ICS_AUTO {
;T3439.c,287 :: 		if (Debug) {
	PUSH	W10
	PUSH	W11
	MOV	#lo_addr(_Debug), W0
	CP0.B	[W0]
	BRA NZ	L__interrupt3107
	GOTO	L_interrupt339
L__interrupt3107:
;T3439.c,288 :: 		UART1_Write_Text("Triggered Safety 2\r");
	MOV	#lo_addr(?lstr4_T3439), W10
	CALL	_UART1_Write_Text
;T3439.c,289 :: 		}
L_interrupt339:
;T3439.c,291 :: 		if (PORTD.F5 == 1 && TestMode) {
	BTSS	PORTD, #5
	GOTO	L__interrupt386
	MOV	#lo_addr(_TestMode), W0
	CP0.B	[W0]
	BRA NZ	L__interrupt3108
	GOTO	L__interrupt385
L__interrupt3108:
L__interrupt384:
;T3439.c,293 :: 		Motor_Command(STOP, sizeof(STOP));
	MOV	#9, W11
	MOV	#lo_addr(_STOP), W10
	CALL	_Motor_Command
;T3439.c,296 :: 		U1STA.UTXEN = 0;
	BCLR	U1STA, #10
;T3439.c,297 :: 		U1STA.OERR = 1;
	BSET.B	U1STA, #1
;T3439.c,298 :: 		U3STA.OERR = 1;
	BSET.B	U3STA, #1
;T3439.c,299 :: 		Delay_ms(5);
	MOV	#13333, W7
L_interrupt343:
	DEC	W7
	BRA NZ	L_interrupt343
	NOP
;T3439.c,300 :: 		U1STA.UTXEN = 1;
	BSET	U1STA, #10
;T3439.c,301 :: 		U1STA.OERR = 0;
	BCLR.B	U1STA, #1
;T3439.c,302 :: 		U3STA.OERR = 0;
	BCLR.B	U3STA, #1
;T3439.c,303 :: 		Motor_Command(GET_POS, sizeof(GET_POS));
	MOV	#9, W11
	MOV	#lo_addr(_GET_POS), W10
	CALL	_Motor_Command
;T3439.c,305 :: 		while (x <= 9) {
L_interrupt345:
	MOV	_x, W0
	CP	W0, #9
	BRA LE	L__interrupt3109
	GOTO	L_interrupt346
L__interrupt3109:
;T3439.c,306 :: 		for (i = 0; i < uart3_data_ready(); i++) {
	CLR	W0
	MOV	W0, _i
L_interrupt347:
	CALL	_UART3_Data_Ready
	MOV	#lo_addr(_i), W1
	CP	W0, [W1]
	BRA GTU	L__interrupt3110
	GOTO	L_interrupt348
L__interrupt3110:
;T3439.c,307 :: 		hex[9] = uart3_read();
	CALL	_UART3_Read
	MOV	#lo_addr(_hex+9), W1
	MOV.B	W0, [W1]
;T3439.c,308 :: 		uart1_write(hex);
	MOV	#lo_addr(_hex), W10
	CALL	_UART1_Write
;T3439.c,309 :: 		x++;
	MOV	#1, W1
	MOV	#lo_addr(_x), W0
	ADD	W1, [W0], [W0]
;T3439.c,310 :: 		if (x >= 8) {
	MOV	_x, W0
	CP	W0, #8
	BRA GE	L__interrupt3111
	GOTO	L_interrupt350
L__interrupt3111:
;T3439.c,311 :: 		completedtask = 1;
	MOV	#1, W0
	MOV	W0, _completedtask
;T3439.c,312 :: 		}
L_interrupt350:
;T3439.c,306 :: 		for (i = 0; i < uart3_data_ready(); i++) {
	MOV	#1, W1
	MOV	#lo_addr(_i), W0
	ADD	W1, [W0], [W0]
;T3439.c,313 :: 		}
	GOTO	L_interrupt347
L_interrupt348:
;T3439.c,315 :: 		}
	GOTO	L_interrupt345
L_interrupt346:
;T3439.c,318 :: 		IFS1.INT3IF = 0; // Clear interrupt saftey 2 bit
	BCLR.B	IFS1, #5
;T3439.c,319 :: 		IEC3.INT3IE = 0; // Disable interrupt saftey 2
	BCLR.B	IEC3, #5
;T3439.c,291 :: 		if (PORTD.F5 == 1 && TestMode) {
L__interrupt386:
L__interrupt385:
;T3439.c,322 :: 		}
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

;T3439.c,324 :: 		void Get_Command() {
;T3439.c,326 :: 		if (uart1_Data_Ready()) {
	PUSH	W10
	PUSH	W11
	PUSH	W12
	CALL	_UART1_Data_Ready
	CP0	W0
	BRA NZ	L__Get_Command113
	GOTO	L_Get_Command51
L__Get_Command113:
;T3439.c,328 :: 		uart1_read_text(input, "\r\n", sizeof(input)); // Read String data up to 10th charachter if \r if found stop looking and put data in input.
	ADD	W14, #0, W0
	MOV.B	#20, W12
	MOV	#lo_addr(?lstr5_T3439), W11
	MOV	W0, W10
	CALL	_UART1_Read_Text
;T3439.c,330 :: 		if (strcmp(input, COMMAND_GET_POS) == 0) {
	ADD	W14, #0, W0
	MOV	#lo_addr(_COMMAND_GET_POS), W11
	MOV	W0, W10
	CALL	_strcmp
	CP	W0, #0
	BRA Z	L__Get_Command114
	GOTO	L_Get_Command52
L__Get_Command114:
;T3439.c,331 :: 		Motor_Command(GET_POS, sizeof(GET_POS));
	MOV	#9, W11
	MOV	#lo_addr(_GET_POS), W10
	CALL	_Motor_Command
;T3439.c,332 :: 		} else if (strcmp(input, COMMMAND_SET_0_POS) == 0) {
	GOTO	L_Get_Command53
L_Get_Command52:
	ADD	W14, #0, W0
	MOV	#lo_addr(_COMMMAND_SET_0_POS), W11
	MOV	W0, W10
	CALL	_strcmp
	CP	W0, #0
	BRA Z	L__Get_Command115
	GOTO	L_Get_Command54
L__Get_Command115:
;T3439.c,333 :: 		Motor_Command(SET_0_POS, sizeof(SET_0_POS));
	MOV	#9, W11
	MOV	#lo_addr(_SET_0_POS), W10
	CALL	_Motor_Command
;T3439.c,334 :: 		} else if (strcmp(input, COMMMAND_MV_ABS_0) == 0) {
	GOTO	L_Get_Command55
L_Get_Command54:
	ADD	W14, #0, W0
	MOV	#lo_addr(_COMMMAND_MV_ABS_0), W11
	MOV	W0, W10
	CALL	_strcmp
	CP	W0, #0
	BRA Z	L__Get_Command116
	GOTO	L_Get_Command56
L__Get_Command116:
;T3439.c,335 :: 		Motor_Command(MV_ABS_0, sizeof(MV_ABS_0));
	MOV	#9, W11
	MOV	#lo_addr(_MV_ABS_0), W10
	CALL	_Motor_Command
;T3439.c,336 :: 		} else if (strcmp(input, COMMMAND_RORAT5) == 0) {
	GOTO	L_Get_Command57
L_Get_Command56:
	ADD	W14, #0, W0
	MOV	#lo_addr(_COMMMAND_RORAT5), W11
	MOV	W0, W10
	CALL	_strcmp
	CP	W0, #0
	BRA Z	L__Get_Command117
	GOTO	L_Get_Command58
L__Get_Command117:
;T3439.c,337 :: 		Motor_Command(RORAT5, sizeof(RORAT5));
	MOV	#9, W11
	MOV	#lo_addr(_RORAT5), W10
	CALL	_Motor_Command
;T3439.c,338 :: 		} else if (strcmp(input, COMMMAND_ROLAT5) == 0) {
	GOTO	L_Get_Command59
L_Get_Command58:
	ADD	W14, #0, W0
	MOV	#lo_addr(_COMMMAND_ROLAT5), W11
	MOV	W0, W10
	CALL	_strcmp
	CP	W0, #0
	BRA Z	L__Get_Command118
	GOTO	L_Get_Command60
L__Get_Command118:
;T3439.c,339 :: 		Motor_Command(ROLAT5, sizeof(ROLAT5));
	MOV	#9, W11
	MOV	#lo_addr(_ROLAT5), W10
	CALL	_Motor_Command
;T3439.c,340 :: 		} else if (strcmp(input, COMMAND_START) == 0) {
	GOTO	L_Get_Command61
L_Get_Command60:
	ADD	W14, #0, W0
	MOV	#lo_addr(_COMMAND_START), W11
	MOV	W0, W10
	CALL	_strcmp
	CP	W0, #0
	BRA Z	L__Get_Command119
	GOTO	L_Get_Command62
L__Get_Command119:
;T3439.c,344 :: 		Motor_Command(ROLAT5, sizeof(ROLAT5));
	MOV	#9, W11
	MOV	#lo_addr(_ROLAT5), W10
	CALL	_Motor_Command
;T3439.c,345 :: 		delay_ms(1000);
	MOV	#41, W8
	MOV	#45239, W7
L_Get_Command63:
	DEC	W7
	BRA NZ	L_Get_Command63
	DEC	W8
	BRA NZ	L_Get_Command63
;T3439.c,347 :: 		} else if (strcmp(input, COMMMAND_STOP) == 0) {
	GOTO	L_Get_Command65
L_Get_Command62:
	ADD	W14, #0, W0
	MOV	#lo_addr(_COMMMAND_STOP), W11
	MOV	W0, W10
	CALL	_strcmp
	CP	W0, #0
	BRA Z	L__Get_Command120
	GOTO	L_Get_Command66
L__Get_Command120:
;T3439.c,348 :: 		uart1_write_text("Stopped!");
	MOV	#lo_addr(?lstr6_T3439), W10
	CALL	_UART1_Write_Text
;T3439.c,349 :: 		Motor_Command(STOP, sizeof(STOP));
	MOV	#9, W11
	MOV	#lo_addr(_STOP), W10
	CALL	_Motor_Command
;T3439.c,350 :: 		} else if (strcmp(input, COMMAND_RESET) == 0) {
	GOTO	L_Get_Command67
L_Get_Command66:
	ADD	W14, #0, W0
	MOV	#lo_addr(_COMMAND_RESET), W11
	MOV	W0, W10
	CALL	_strcmp
	CP	W0, #0
	BRA Z	L__Get_Command121
	GOTO	L_Get_Command68
L__Get_Command121:
;T3439.c,352 :: 		reset
	RESET
;T3439.c,354 :: 		} else {
	GOTO	L_Get_Command69
L_Get_Command68:
;T3439.c,355 :: 		if (Debug)
	MOV	#lo_addr(_Debug), W0
	CP0.B	[W0]
	BRA NZ	L__Get_Command122
	GOTO	L_Get_Command70
L__Get_Command122:
;T3439.c,356 :: 		uart1_write_text("Unrecognized command: "); //Failed to recognize.
	MOV	#lo_addr(?lstr7_T3439), W10
	CALL	_UART1_Write_Text
L_Get_Command70:
;T3439.c,357 :: 		uart1_write_text(input); //output failed command.
	ADD	W14, #0, W0
	MOV	W0, W10
	CALL	_UART1_Write_Text
;T3439.c,358 :: 		input[20] = 0;
	ADD	W14, #0, W0
	ADD	W0, #20, W1
	CLR	W0
	MOV.B	W0, [W1]
;T3439.c,359 :: 		}
L_Get_Command69:
L_Get_Command67:
L_Get_Command65:
L_Get_Command61:
L_Get_Command59:
L_Get_Command57:
L_Get_Command55:
L_Get_Command53:
;T3439.c,360 :: 		}
L_Get_Command51:
;T3439.c,361 :: 		}
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

;T3439.c,364 :: 		void main() {
;T3439.c,367 :: 		TRISB = 0x7EEF;
	PUSH	W10
	PUSH	W11
	PUSH	W12
	MOV	#32495, W0
	MOV	WREG, TRISB
;T3439.c,368 :: 		TRISC = 0xFFFF;
	MOV	#65535, W0
	MOV	WREG, TRISC
;T3439.c,369 :: 		TRISD = 0xFFFF;
	MOV	#65535, W0
	MOV	WREG, TRISD
;T3439.c,370 :: 		TRISE = 0xFFFF;
	MOV	#65535, W0
	MOV	WREG, TRISE
;T3439.c,371 :: 		TRISF = 0x0000;
	CLR	TRISF
;T3439.c,372 :: 		TRISG = 0xFFF3;
	MOV	#65523, W0
	MOV	WREG, TRISG
;T3439.c,373 :: 		ANSD = 0x0000;
	CLR	ANSD
;T3439.c,374 :: 		ANSB = 0x0000;
	CLR	ANSB
;T3439.c,377 :: 		UART1_Init(9600);
	MOV	#9600, W10
	MOV	#0, W11
	CALL	_UART1_Init
;T3439.c,378 :: 		UART3_Init(9600);
	MOV	#9600, W10
	MOV	#0, W11
	CALL	_UART3_Init
;T3439.c,380 :: 		Delay_ms(3000);
	MOV	#123, W8
	MOV	#4647, W7
L_main71:
	DEC	W7
	BRA NZ	L_main71
	DEC	W8
	BRA NZ	L_main71
	NOP
	NOP
;T3439.c,381 :: 		LATB.F8 = 1;
	BSET	LATB, #8
;T3439.c,383 :: 		Unlock_IOLOCK();
	CALL	_Unlock_IOLOCK
;T3439.c,385 :: 		PPS_Mapping_NoLock(28, _INPUT, _U1RX); // Sets pin 15 to be Input, and maps RX3/DT3 Input to it
	MOV.B	#28, W12
	MOV.B	#1, W11
	MOV.B	#28, W10
	CALL	_PPS_Mapping_NoLock
;T3439.c,386 :: 		PPS_Mapping_NoLock(18, _OUTPUT, _U1TX); // Sets pin 5 to be Output
	MOV.B	#3, W12
	CLR	W11
	MOV.B	#18, W10
	CALL	_PPS_Mapping_NoLock
;T3439.c,389 :: 		PPS_Mapping_NoLock(14, _INPUT, _U3RX); // Sets pin 15 to be Input, and maps RX3/DT3 Input to it
	MOV.B	#32, W12
	MOV.B	#1, W11
	MOV.B	#14, W10
	CALL	_PPS_Mapping_NoLock
;T3439.c,390 :: 		PPS_Mapping_NoLock(29, _OUTPUT, _U3TX); // Sets pin 5 to be Output
	MOV.B	#28, W12
	CLR	W11
	MOV.B	#29, W10
	CALL	_PPS_Mapping_NoLock
;T3439.c,393 :: 		PPS_Mapping_NoLock(22, _INPUT, _INT1); // Sets pin 22 to be Input, and maps interrupt
	MOV.B	#3, W12
	MOV.B	#1, W11
	MOV.B	#22, W10
	CALL	_PPS_Mapping_NoLock
;T3439.c,394 :: 		PPS_Mapping_NoLock(25, _INPUT, _INT2); // Sets pin 25 to be Input, and maps interrupt
	MOV.B	#4, W12
	MOV.B	#1, W11
	MOV.B	#25, W10
	CALL	_PPS_Mapping_NoLock
;T3439.c,395 :: 		PPS_Mapping_NoLock(20, _INPUT, _INT3); // Sets pin 20 to be Input, and maps interrupt
	MOV.B	#5, W12
	MOV.B	#1, W11
	MOV.B	#20, W10
	CALL	_PPS_Mapping_NoLock
;T3439.c,397 :: 		Lock_IOLOCK();
	CALL	_Lock_IOLOCK
;T3439.c,400 :: 		U1RXREG = 0;
	CLR	U1RXREG
;T3439.c,401 :: 		U3RXREG = 0;
	CLR	U3RXREG
;T3439.c,404 :: 		INTCON1.NSTDIS = 0;
	BCLR	INTCON1, #15
;T3439.c,406 :: 		IEC3.INT3IE = 0; // Disable interrupt saftey 2
	BCLR.B	IEC3, #5
;T3439.c,407 :: 		IEC1.INT2IE = 0; // Disable interrupt saftey 1
	BCLR	IEC1, #13
;T3439.c,408 :: 		IEC1.INT1IE = 1; //Nul ENABLE TO START TEST
	BSET.B	IEC1, #4
;T3439.c,411 :: 		if (debug) {
	MOV	#lo_addr(_Debug), W0
	CP0.B	[W0]
	BRA NZ	L__main124
	GOTO	L_main73
L__main124:
;T3439.c,412 :: 		Delay_ms(3000);
	MOV	#123, W8
	MOV	#4647, W7
L_main74:
	DEC	W7
	BRA NZ	L_main74
	DEC	W8
	BRA NZ	L_main74
	NOP
	NOP
;T3439.c,413 :: 		UART1_Write_text(CompileDate);
	MOV	#lo_addr(_CompileDate), W10
	CALL	_UART1_Write_Text
;T3439.c,414 :: 		UART1_Write_Text(" ");
	MOV	#lo_addr(?lstr8_T3439), W10
	CALL	_UART1_Write_Text
;T3439.c,415 :: 		UART1_Write_text(CompileTime);
	MOV	#lo_addr(_CompileTime), W10
	CALL	_UART1_Write_Text
;T3439.c,416 :: 		UART1_Write_Text("\r\n");
	MOV	#lo_addr(?lstr9_T3439), W10
	CALL	_UART1_Write_Text
;T3439.c,417 :: 		}
L_main73:
;T3439.c,419 :: 		while (true) {
L_main76:
;T3439.c,421 :: 		Get_Command();
	CALL	_Get_Command
;T3439.c,423 :: 		}
	GOTO	L_main76
;T3439.c,424 :: 		}
L_end_main:
	POP	W12
	POP	W11
	POP	W10
L__main_end_loop:
	BRA	L__main_end_loop
; end of _main
