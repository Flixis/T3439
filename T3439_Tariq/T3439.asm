
_interrupt1:
	PUSH	DSWPAG
	PUSH	50
	PUSH	RCOUNT
	PUSH	W0
	MOV	#2, W0
	REPEAT	#12
	PUSH	[W0++]

;T3439.c,14 :: 		void interrupt1() iv 0x000003C ics ICS_AUTO {
;T3439.c,16 :: 		IFS1.INT1IF = 0;
	PUSH	W10
	PUSH	W11
	BCLR.B	IFS1, #4
;T3439.c,17 :: 		if (PORTD.F3 == 1) {
	BTSS	PORTD, #3
	GOTO	L_interrupt10
;T3439.c,23 :: 		Motor_Command(STOP, sizeof(STOP));
	MOV	#9, W11
	MOV	#lo_addr(T3439_STOP), W10
	CALL	_Motor_Command
;T3439.c,24 :: 		Delay_ms(25);
	MOV	#2, W8
	MOV	#1130, W7
L_interrupt11:
	DEC	W7
	BRA NZ	L_interrupt11
	DEC	W8
	BRA NZ	L_interrupt11
;T3439.c,25 :: 		GET_CURRENT_POS();
	CALL	_GET_CURRENT_POS
;T3439.c,26 :: 		Delay_ms(25);
	MOV	#2, W8
	MOV	#1130, W7
L_interrupt13:
	DEC	W7
	BRA NZ	L_interrupt13
	DEC	W8
	BRA NZ	L_interrupt13
;T3439.c,27 :: 		Motor_Command(SET_0_POS, sizeof(SET_0_POS));
	MOV	#9, W11
	MOV	#lo_addr(T3439_SET_0_POS), W10
	CALL	_Motor_Command
;T3439.c,28 :: 		Delay_ms(25);
	MOV	#2, W8
	MOV	#1130, W7
L_interrupt15:
	DEC	W7
	BRA NZ	L_interrupt15
	DEC	W8
	BRA NZ	L_interrupt15
;T3439.c,29 :: 		Motor_Command(ROLAT5, sizeof(ROLAT5));
	MOV	#9, W11
	MOV	#lo_addr(T3439_ROLAT5), W10
	CALL	_Motor_Command
;T3439.c,32 :: 		IFS1.INT1IF = 0; // Clear interrupt nul bit
	BCLR.B	IFS1, #4
;T3439.c,34 :: 		IEC1.INT1IE = 0; // Disable interrupt nul bit
	BCLR.B	IEC1, #4
;T3439.c,35 :: 		IEC1.INT2IE = 1; // Enable interrupt saftey 2
	BSET	IEC1, #13
;T3439.c,36 :: 		}
L_interrupt10:
;T3439.c,38 :: 		}
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

;T3439.c,41 :: 		void interrupt2_low() iv 0x000004E ics ICS_AUTO {
;T3439.c,43 :: 		if (PORTD.F4 == 1) {
	PUSH	W10
	PUSH	W11
	BTSS	PORTD, #4
	GOTO	L_interrupt2_low7
;T3439.c,49 :: 		Motor_Command(STOP, sizeof(STOP));
	MOV	#9, W11
	MOV	#lo_addr(T3439_STOP), W10
	CALL	_Motor_Command
;T3439.c,52 :: 		IEC1.INT2IE = 0; // Disable interrupt saftey 1
	BCLR	IEC1, #13
;T3439.c,53 :: 		IEC3.INT3IE = 1; // Enable interrupt saftey 2
	BSET.B	IEC3, #5
;T3439.c,54 :: 		}
L_interrupt2_low7:
;T3439.c,55 :: 		}
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

;T3439.c,57 :: 		void interrupt3() iv 0x000007E ics ICS_AUTO {
;T3439.c,59 :: 		if (PORTD.F5 == 1) {
	PUSH	W10
	PUSH	W11
	BTSS	PORTD, #5
	GOTO	L_interrupt38
;T3439.c,61 :: 		Motor_Command(STOP, sizeof(STOP));
	MOV	#9, W11
	MOV	#lo_addr(T3439_STOP), W10
	CALL	_Motor_Command
;T3439.c,64 :: 		IFS1.INT3IF = 0; // Clear interrupt saftey 2 bit
	BCLR.B	IFS1, #5
;T3439.c,65 :: 		IEC3.INT3IE = 0; // Disable interrupt saftey 2
	BCLR.B	IEC3, #5
;T3439.c,66 :: 		}
L_interrupt38:
;T3439.c,68 :: 		}
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

;T3439.c,71 :: 		void main() {
;T3439.c,74 :: 		TRISB = 0x7EEF;
	PUSH	W10
	PUSH	W11
	PUSH	W12
	MOV	#32495, W0
	MOV	WREG, TRISB
;T3439.c,75 :: 		TRISC = 0xFFFF;
	MOV	#65535, W0
	MOV	WREG, TRISC
;T3439.c,76 :: 		TRISD = 0xFFFF;
	MOV	#65535, W0
	MOV	WREG, TRISD
;T3439.c,77 :: 		TRISE = 0xFFFF;
	MOV	#65535, W0
	MOV	WREG, TRISE
;T3439.c,78 :: 		TRISF = 0x0000;
	CLR	TRISF
;T3439.c,79 :: 		TRISG = 0xFFF3;
	MOV	#65523, W0
	MOV	WREG, TRISG
;T3439.c,80 :: 		ANSD = 0x0000;
	CLR	ANSD
;T3439.c,81 :: 		ANSB = 0x0000;
	CLR	ANSB
;T3439.c,84 :: 		UART1_Init(9600);
	MOV	#9600, W10
	MOV	#0, W11
	CALL	_UART1_Init
;T3439.c,85 :: 		UART3_Init(9600);
	MOV	#9600, W10
	MOV	#0, W11
	CALL	_UART3_Init
;T3439.c,87 :: 		Delay_ms(1500);
	MOV	#62, W8
	MOV	#2323, W7
L_main9:
	DEC	W7
	BRA NZ	L_main9
	DEC	W8
	BRA NZ	L_main9
	NOP
;T3439.c,88 :: 		LATB.F8 = 1;
	BSET	LATB, #8
;T3439.c,90 :: 		Unlock_IOLOCK();
	CALL	_Unlock_IOLOCK
;T3439.c,92 :: 		PPS_Mapping_NoLock(28, _INPUT, _U1RX); // Sets pin 15 to be Input, and maps RX3/DT3 Input to it
	MOV.B	#28, W12
	MOV.B	#1, W11
	MOV.B	#28, W10
	CALL	_PPS_Mapping_NoLock
;T3439.c,93 :: 		PPS_Mapping_NoLock(18, _OUTPUT, _U1TX); // Sets pin 5 to be Output
	MOV.B	#3, W12
	CLR	W11
	MOV.B	#18, W10
	CALL	_PPS_Mapping_NoLock
;T3439.c,96 :: 		PPS_Mapping_NoLock(14, _INPUT, _U3RX); // Sets pin 15 to be Input, and maps RX3/DT3 Input to it
	MOV.B	#32, W12
	MOV.B	#1, W11
	MOV.B	#14, W10
	CALL	_PPS_Mapping_NoLock
;T3439.c,97 :: 		PPS_Mapping_NoLock(29, _OUTPUT, _U3TX); // Sets pin 5 to be Output
	MOV.B	#28, W12
	CLR	W11
	MOV.B	#29, W10
	CALL	_PPS_Mapping_NoLock
;T3439.c,100 :: 		PPS_Mapping_NoLock(22, _INPUT, _INT1); // Sets pin 22 to be Input, and maps interrupt
	MOV.B	#3, W12
	MOV.B	#1, W11
	MOV.B	#22, W10
	CALL	_PPS_Mapping_NoLock
;T3439.c,101 :: 		PPS_Mapping_NoLock(25, _INPUT, _INT2); // Sets pin 25 to be Input, and maps interrupt
	MOV.B	#4, W12
	MOV.B	#1, W11
	MOV.B	#25, W10
	CALL	_PPS_Mapping_NoLock
;T3439.c,102 :: 		PPS_Mapping_NoLock(20, _INPUT, _INT3); // Sets pin 20 to be Input, and maps interrupt
	MOV.B	#5, W12
	MOV.B	#1, W11
	MOV.B	#20, W10
	CALL	_PPS_Mapping_NoLock
;T3439.c,104 :: 		Lock_IOLOCK();
	CALL	_Lock_IOLOCK
;T3439.c,107 :: 		INTCON1.NSTDIS = 0;
	BCLR	INTCON1, #15
;T3439.c,109 :: 		IEC3.INT3IE = 0; // Disable interrupt saftey 2
	BCLR.B	IEC3, #5
;T3439.c,110 :: 		IEC1.INT2IE = 0; // Disable interrupt saftey 1
	BCLR	IEC1, #13
;T3439.c,111 :: 		IEC1.INT1IE = 1; //Nul ENABLE TO START TEST
	BSET.B	IEC1, #4
;T3439.c,113 :: 		while (1) {
L_main11:
;T3439.c,115 :: 		GET_COMMANDS();
	CALL	_GET_COMMANDS
;T3439.c,117 :: 		}
	GOTO	L_main11
;T3439.c,118 :: 		}
L_end_main:
	POP	W12
	POP	W11
	POP	W10
L__main_end_loop:
	BRA	L__main_end_loop
; end of _main
