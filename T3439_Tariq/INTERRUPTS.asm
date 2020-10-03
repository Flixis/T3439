
_interrupt1_null:
	PUSH	DSWPAG
	PUSH	50
	PUSH	RCOUNT
	PUSH	W0
	MOV	#2, W0
	REPEAT	#12
	PUSH	[W0++]

;INTERRUPTS.c,5 :: 		void interrupt1_null() iv 0x000003C ics ICS_AUTO {
;INTERRUPTS.c,7 :: 		IFS1.INT1IF = 0;
	PUSH	W10
	PUSH	W11
	BCLR.B	IFS1, #4
;INTERRUPTS.c,8 :: 		if (PORTD.F3 == 1) {
	BTSS	PORTD, #3
	GOTO	L_interrupt1_null0
;INTERRUPTS.c,14 :: 		Motor_Command(STOP, sizeof(STOP));
	MOV	#9, W11
	MOV	#lo_addr(INTERRUPTS_STOP), W10
	CALL	_Motor_Command
;INTERRUPTS.c,15 :: 		Delay_ms(25);
	MOV	#2, W8
	MOV	#1130, W7
L_interrupt1_null1:
	DEC	W7
	BRA NZ	L_interrupt1_null1
	DEC	W8
	BRA NZ	L_interrupt1_null1
;INTERRUPTS.c,16 :: 		GET_CURRENT_POS();
	CALL	_GET_CURRENT_POS
;INTERRUPTS.c,17 :: 		Delay_ms(25);
	MOV	#2, W8
	MOV	#1130, W7
L_interrupt1_null3:
	DEC	W7
	BRA NZ	L_interrupt1_null3
	DEC	W8
	BRA NZ	L_interrupt1_null3
;INTERRUPTS.c,18 :: 		Motor_Command(SET_0_POS, sizeof(SET_0_POS));
	MOV	#9, W11
	MOV	#lo_addr(INTERRUPTS_SET_0_POS), W10
	CALL	_Motor_Command
;INTERRUPTS.c,19 :: 		Delay_ms(25);
	MOV	#2, W8
	MOV	#1130, W7
L_interrupt1_null5:
	DEC	W7
	BRA NZ	L_interrupt1_null5
	DEC	W8
	BRA NZ	L_interrupt1_null5
;INTERRUPTS.c,20 :: 		Motor_Command(ROLAT5, sizeof(ROLAT5));
	MOV	#9, W11
	MOV	#lo_addr(INTERRUPTS_ROLAT5), W10
	CALL	_Motor_Command
;INTERRUPTS.c,23 :: 		IFS1.INT1IF = 0; // Clear interrupt nul bit
	BCLR.B	IFS1, #4
;INTERRUPTS.c,25 :: 		IEC1.INT1IE = 0; // Disable interrupt nul bit
	BCLR.B	IEC1, #4
;INTERRUPTS.c,26 :: 		IEC1.INT2IE = 1; // Enable interrupt saftey 2
	BSET	IEC1, #13
;INTERRUPTS.c,27 :: 		}
L_interrupt1_null0:
;INTERRUPTS.c,29 :: 		}
L_end_interrupt1_null:
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
; end of _interrupt1_null

_interrupt2_safety1:
	PUSH	DSWPAG
	PUSH	50
	PUSH	RCOUNT
	PUSH	W0
	MOV	#2, W0
	REPEAT	#12
	PUSH	[W0++]

;INTERRUPTS.c,32 :: 		void interrupt2_safety1() iv 0x000004E ics ICS_AUTO {
;INTERRUPTS.c,34 :: 		if (PORTD.F4 == 1) {
	PUSH	W10
	PUSH	W11
	BTSS	PORTD, #4
	GOTO	L_interrupt2_safety17
;INTERRUPTS.c,36 :: 		Motor_Command(STOP, sizeof(STOP));
	MOV	#9, W11
	MOV	#lo_addr(INTERRUPTS_STOP), W10
	CALL	_Motor_Command
;INTERRUPTS.c,39 :: 		IEC1.INT2IE = 0; // Disable interrupt saftey 1
	BCLR	IEC1, #13
;INTERRUPTS.c,40 :: 		IEC3.INT3IE = 1; // Enable interrupt saftey 2
	BSET.B	IEC3, #5
;INTERRUPTS.c,41 :: 		}
L_interrupt2_safety17:
;INTERRUPTS.c,42 :: 		}
L_end_interrupt2_safety1:
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
; end of _interrupt2_safety1

_interrupt3_safety2:
	PUSH	DSWPAG
	PUSH	50
	PUSH	RCOUNT
	PUSH	W0
	MOV	#2, W0
	REPEAT	#12
	PUSH	[W0++]

;INTERRUPTS.c,44 :: 		void interrupt3_safety2() iv 0x000007E ics ICS_AUTO {
;INTERRUPTS.c,46 :: 		if (PORTD.F5 == 1) {
	PUSH	W10
	PUSH	W11
	BTSS	PORTD, #5
	GOTO	L_interrupt3_safety28
;INTERRUPTS.c,48 :: 		Motor_Command(STOP, sizeof(STOP));
	MOV	#9, W11
	MOV	#lo_addr(INTERRUPTS_STOP), W10
	CALL	_Motor_Command
;INTERRUPTS.c,51 :: 		IFS1.INT3IF = 0; // Clear interrupt saftey 2 bit
	BCLR.B	IFS1, #5
;INTERRUPTS.c,52 :: 		IEC3.INT3IE = 0; // Disable interrupt saftey 2
	BCLR.B	IEC3, #5
;INTERRUPTS.c,53 :: 		}
L_interrupt3_safety28:
;INTERRUPTS.c,55 :: 		}
L_end_interrupt3_safety2:
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
; end of _interrupt3_safety2
