
_main:
	MOV	#2048, W15
	MOV	#6142, W0
	MOV	WREG, 32
	MOV	#1, W0
	MOV	WREG, 50
	MOV	#4, W0
	IOR	68
	LNK	#114

;MEETKAART_V1_0_joysticks.c,1 :: 		void main() {
;MEETKAART_V1_0_joysticks.c,12 :: 		int Cal_anin1 = 0;
	PUSH	W10
	PUSH	W11
	PUSH	W12
	PUSH	W13
	ADD	W14, #6, W1
	MOV	#___Lib_System_DefaultPage, W0
	MOV	W0, 50
	MOV	#lo_addr(?ICSmain_Cal_anin1_L0), W0
	REPEAT	#53
	MOV	[W0++], [W1++]
;MEETKAART_V1_0_joysticks.c,13 :: 		int Cal_anin2 = 44;
;MEETKAART_V1_0_joysticks.c,14 :: 		int Cal_anin3 = 56;
;MEETKAART_V1_0_joysticks.c,15 :: 		int Cal_anin4 = 62;
;MEETKAART_V1_0_joysticks.c,16 :: 		int Cal_anin5 = 44;
;MEETKAART_V1_0_joysticks.c,17 :: 		int Cal_anin6 = 62;
;MEETKAART_V1_0_joysticks.c,18 :: 		int Cal_anin7 = 44;
;MEETKAART_V1_0_joysticks.c,19 :: 		int Cal_anin8 = 56;
;MEETKAART_V1_0_joysticks.c,21 :: 		int Cal_anout1_1 = -3;
;MEETKAART_V1_0_joysticks.c,22 :: 		int Cal_anout1_2 = 0;
;MEETKAART_V1_0_joysticks.c,23 :: 		int Cal_anout1_3 = 0;
;MEETKAART_V1_0_joysticks.c,24 :: 		int Cal_anout2_1 = 0;
;MEETKAART_V1_0_joysticks.c,25 :: 		int Cal_anout2_2 = 0;
;MEETKAART_V1_0_joysticks.c,26 :: 		int Cal_anout2_3 = 0;
;MEETKAART_V1_0_joysticks.c,27 :: 		int Cal_anout3_1 = 0;
;MEETKAART_V1_0_joysticks.c,28 :: 		int Cal_anout3_2 = 0;
;MEETKAART_V1_0_joysticks.c,29 :: 		int Cal_anout3_3 = 0;
;MEETKAART_V1_0_joysticks.c,30 :: 		int Cal_anout4_1 = 0;
;MEETKAART_V1_0_joysticks.c,31 :: 		int Cal_anout4_2 = 0;
;MEETKAART_V1_0_joysticks.c,32 :: 		int Cal_anout4_3 = 0;
;MEETKAART_V1_0_joysticks.c,33 :: 		int Cal_anout5_1 = 0;
;MEETKAART_V1_0_joysticks.c,34 :: 		int Cal_anout5_2 = 0;
;MEETKAART_V1_0_joysticks.c,35 :: 		int Cal_anout5_3 = 0;
;MEETKAART_V1_0_joysticks.c,36 :: 		int Cal_anout6_1 = 0;
;MEETKAART_V1_0_joysticks.c,37 :: 		int Cal_anout6_2 = 0;
;MEETKAART_V1_0_joysticks.c,38 :: 		int Cal_anout6_3 = 0;
;MEETKAART_V1_0_joysticks.c,39 :: 		int Cal_anout7_1 = 0;
;MEETKAART_V1_0_joysticks.c,40 :: 		int Cal_anout7_2 = 0;
;MEETKAART_V1_0_joysticks.c,41 :: 		int Cal_anout7_3 = 0;
;MEETKAART_V1_0_joysticks.c,42 :: 		int Cal_anout8_1 = 0;
;MEETKAART_V1_0_joysticks.c,43 :: 		int Cal_anout8_2 = 0;
;MEETKAART_V1_0_joysticks.c,44 :: 		int Cal_anout8_3 = 0;
;MEETKAART_V1_0_joysticks.c,45 :: 		int Cal_anout9_1 = 0;
;MEETKAART_V1_0_joysticks.c,46 :: 		int Cal_anout9_2 = 0;
;MEETKAART_V1_0_joysticks.c,47 :: 		int Cal_anout9_3 = 0;
;MEETKAART_V1_0_joysticks.c,48 :: 		int Cal_anout10_1 = 0;
;MEETKAART_V1_0_joysticks.c,49 :: 		int Cal_anout10_2 = 0;
;MEETKAART_V1_0_joysticks.c,50 :: 		int Cal_anout10_3 = 0;
;MEETKAART_V1_0_joysticks.c,51 :: 		int Cal_anout11_1 = 0;
;MEETKAART_V1_0_joysticks.c,52 :: 		int Cal_anout11_2 = 0;
;MEETKAART_V1_0_joysticks.c,53 :: 		int Cal_anout11_3 = 0;
;MEETKAART_V1_0_joysticks.c,54 :: 		int Cal_anout12_1 = 0;
;MEETKAART_V1_0_joysticks.c,55 :: 		int Cal_anout12_2 = 0;
;MEETKAART_V1_0_joysticks.c,56 :: 		int Cal_anout12_3 = 0;
;MEETKAART_V1_0_joysticks.c,57 :: 		int Cal_anout13_1 = 0;
;MEETKAART_V1_0_joysticks.c,58 :: 		int Cal_anout13_2 = 0;
;MEETKAART_V1_0_joysticks.c,59 :: 		int Cal_anout13_3 = 0;
;MEETKAART_V1_0_joysticks.c,60 :: 		int Cal_anout14_1 = 0;
;MEETKAART_V1_0_joysticks.c,61 :: 		int Cal_anout14_2 = 0;
;MEETKAART_V1_0_joysticks.c,62 :: 		int Cal_anout14_3 = 0;
;MEETKAART_V1_0_joysticks.c,63 :: 		int Cal_anout15_1 = 0;
;MEETKAART_V1_0_joysticks.c,64 :: 		int Cal_anout15_2 = 0;
;MEETKAART_V1_0_joysticks.c,65 :: 		int Cal_anout15_3 = 0;
;MEETKAART_V1_0_joysticks.c,66 :: 		int Cal_anout16_1 = 0;
;MEETKAART_V1_0_joysticks.c,67 :: 		int Cal_anout16_2 = 0;
;MEETKAART_V1_0_joysticks.c,68 :: 		int Cal_anout16_3 = 0;
;MEETKAART_V1_0_joysticks.c,72 :: 		TRISB = 0xFFDF;
	MOV	#65503, W0
	MOV	WREG, TRISB
;MEETKAART_V1_0_joysticks.c,73 :: 		TRISC = 0xFFFF;
	MOV	#65535, W0
	MOV	WREG, TRISC
;MEETKAART_V1_0_joysticks.c,74 :: 		TRISD = 0xF8F4;
	MOV	#63732, W0
	MOV	WREG, TRISD
;MEETKAART_V1_0_joysticks.c,75 :: 		TRISE = 0xFF1F;
	MOV	#65311, W0
	MOV	WREG, TRISE
;MEETKAART_V1_0_joysticks.c,76 :: 		TRISF = 0xBFFF;
	MOV	#49151, W0
	MOV	WREG, TRISF
;MEETKAART_V1_0_joysticks.c,77 :: 		TRISG = 0xFF3F;
	MOV	#65343, W0
	MOV	WREG, TRISG
;MEETKAART_V1_0_joysticks.c,78 :: 		ANSE = 0x0000;
	CLR	ANSE
;MEETKAART_V1_0_joysticks.c,79 :: 		ANSB = 0x0000;
	CLR	ANSB
;MEETKAART_V1_0_joysticks.c,80 :: 		ANSD = 0x0000;
	CLR	ANSD
;MEETKAART_V1_0_joysticks.c,81 :: 		ODCE = 0x0000;
	CLR	ODCE
;MEETKAART_V1_0_joysticks.c,82 :: 		LATF.F14 = 0;
	BCLR	LATF, #14
;MEETKAART_V1_0_joysticks.c,84 :: 		UART1_Init(9600);
	MOV	#9600, W10
	MOV	#0, W11
	CALL	_UART1_Init
;MEETKAART_V1_0_joysticks.c,85 :: 		Delay_ms(100);
	MOV	#5, W8
	MOV	#4523, W7
L_main0:
	DEC	W7
	BRA NZ	L_main0
	DEC	W8
	BRA NZ	L_main0
;MEETKAART_V1_0_joysticks.c,87 :: 		Unlock_IOLOCK();   //Unlock pinmapping
	CALL	_Unlock_IOLOCK
;MEETKAART_V1_0_joysticks.c,89 :: 		PPS_Mapping_NoLock(28, _INPUT, _U1RX);    // Mapping UART1 RX naar RP18
	MOV.B	#28, W12
	MOV.B	#1, W11
	MOV.B	#28, W10
	CALL	_PPS_Mapping_NoLock
;MEETKAART_V1_0_joysticks.c,90 :: 		PPS_Mapping_NoLock(18, _OUTPUT, _U1TX);   // Mapping UART1 TX naar RP28
	MOV.B	#3, W12
	CLR	W11
	MOV.B	#18, W10
	CALL	_PPS_Mapping_NoLock
;MEETKAART_V1_0_joysticks.c,92 :: 		PPS_Mapping_NoLock(22, _OUTPUT, _SDO1);    //  Mapping SPI1 data out naar rp22
	MOV.B	#7, W12
	CLR	W11
	MOV.B	#22, W10
	CALL	_PPS_Mapping_NoLock
;MEETKAART_V1_0_joysticks.c,93 :: 		PPS_Mapping_NoLock(24, _OUTPUT, _SCK1OUT);   //  Mappig SPI1 clock out naar rp24
	MOV.B	#8, W12
	CLR	W11
	MOV.B	#24, W10
	CALL	_PPS_Mapping_NoLock
;MEETKAART_V1_0_joysticks.c,94 :: 		PPS_Mapping_NoLock(23, _INPUT, _SDI1IN);    //  Mapping SPI1
	MOV.B	#17, W12
	MOV.B	#1, W11
	MOV.B	#23, W10
	CALL	_PPS_Mapping_NoLock
;MEETKAART_V1_0_joysticks.c,99 :: 		Lock_IOLOCK();    //Lock pinmapping
	CALL	_Lock_IOLOCK
;MEETKAART_V1_0_joysticks.c,104 :: 		SPI1_Init_Advanced(_SPI_MASTER, _SPI_16_BIT, _SPI_PRESCALE_SEC_8, _SPI_PRESCALE_PRI_1, _SPI_SS_DISABLE, _SPI_DATA_SAMPLE_MIDDLE, _SPI_CLK_IDLE_HIGH, _SPI_ACTIVE_2_IDLE);
	MOV	#3, W13
	CLR	W12
	MOV	#1024, W11
	MOV	#32, W10
	CLR	W0
	PUSH	W0
	MOV	#64, W0
	PUSH	W0
	CLR	W0
	PUSH	W0
	CLR	W0
	PUSH	W0
	CALL	_SPI1_Init_Advanced
	SUB	#8, W15
;MEETKAART_V1_0_joysticks.c,106 :: 		Delay_ms(100);
	MOV	#5, W8
	MOV	#4523, W7
L_main2:
	DEC	W7
	BRA NZ	L_main2
	DEC	W8
	BRA NZ	L_main2
;MEETKAART_V1_0_joysticks.c,108 :: 		LATF.F14 = 1;//release reset mcp2200
	BSET	LATF, #14
;MEETKAART_V1_0_joysticks.c,109 :: 		LATD.F10 = 1;//CS_1
	BSET	LATD, #10
;MEETKAART_V1_0_joysticks.c,110 :: 		LATD.F9 =  1;//CS_2
	BSET	LATD, #9
;MEETKAART_V1_0_joysticks.c,111 :: 		LATD.F0 = 1;//CS_3
	BSET.B	LATD, #0
;MEETKAART_V1_0_joysticks.c,112 :: 		LATD.F8 = 1;//PANIC
	BSET	LATD, #8
;MEETKAART_V1_0_joysticks.c,114 :: 		while(1)
L_main4:
;MEETKAART_V1_0_joysticks.c,124 :: 		if (UART1_Data_Ready() ==1)
	CALL	_UART1_Data_Ready
	CP	W0, #1
	BRA Z	L__main110
	GOTO	L_main6
L__main110:
;MEETKAART_V1_0_joysticks.c,126 :: 		receive = UART1_Read();
	CALL	_UART1_Read
	MOV.B	W0, [W14+0]
;MEETKAART_V1_0_joysticks.c,127 :: 		}
L_main6:
;MEETKAART_V1_0_joysticks.c,129 :: 		if (receive == 0x01)//analoog uit 1 0V
	MOV.B	[W14+0], W0
	CP.B	W0, #1
	BRA Z	L__main111
	GOTO	L_main7
L__main111:
;MEETKAART_V1_0_joysticks.c,131 :: 		Uart1_Write_Text("ok\r");
	MOV	#lo_addr(?lstr1_MEETKAART_V1_0_joysticks), W10
	CALL	_UART1_Write_Text
;MEETKAART_V1_0_joysticks.c,132 :: 		receive = 0x00;
	CLR	W0
	MOV.B	W0, [W14+0]
;MEETKAART_V1_0_joysticks.c,133 :: 		LATD.F10 = 0;
	BCLR	LATD, #10
;MEETKAART_V1_0_joysticks.c,134 :: 		Spi1_write(0x4000);
	MOV	#16384, W10
	CALL	_SPI1_Write
;MEETKAART_V1_0_joysticks.c,135 :: 		LATD.F10 = 1;
	BSET	LATD, #10
;MEETKAART_V1_0_joysticks.c,136 :: 		}
L_main7:
;MEETKAART_V1_0_joysticks.c,138 :: 		if (receive == 0x02)//analoog uit 1 5.0V
	MOV.B	[W14+0], W0
	CP.B	W0, #2
	BRA Z	L__main112
	GOTO	L_main8
L__main112:
;MEETKAART_V1_0_joysticks.c,140 :: 		Uart1_Write_Text("ok\r");
	MOV	#lo_addr(?lstr2_MEETKAART_V1_0_joysticks), W10
	CALL	_UART1_Write_Text
;MEETKAART_V1_0_joysticks.c,141 :: 		receive = 0x00;
	CLR	W0
	MOV.B	W0, [W14+0]
;MEETKAART_V1_0_joysticks.c,142 :: 		LATD.F10 = 0;
	BCLR	LATD, #10
;MEETKAART_V1_0_joysticks.c,143 :: 		Spi1_write(0x49C4 + Cal_anout1_1);
	MOV	#18884, W1
	ADD	W14, #22, W0
	ADD	W1, [W0], W0
	MOV	W0, W10
	CALL	_SPI1_Write
;MEETKAART_V1_0_joysticks.c,144 :: 		LATD.F10 = 1;
	BSET	LATD, #10
;MEETKAART_V1_0_joysticks.c,145 :: 		}
L_main8:
;MEETKAART_V1_0_joysticks.c,147 :: 		if (receive == 0x03)//analoog uit 1 6.418V
	MOV.B	[W14+0], W0
	CP.B	W0, #3
	BRA Z	L__main113
	GOTO	L_main9
L__main113:
;MEETKAART_V1_0_joysticks.c,149 :: 		Uart1_Write_Text("ok\r");
	MOV	#lo_addr(?lstr3_MEETKAART_V1_0_joysticks), W10
	CALL	_UART1_Write_Text
;MEETKAART_V1_0_joysticks.c,150 :: 		receive = 0x00;
	CLR	W0
	MOV.B	W0, [W14+0]
;MEETKAART_V1_0_joysticks.c,151 :: 		LATD.F10 = 0;
	BCLR	LATD, #10
;MEETKAART_V1_0_joysticks.c,152 :: 		Spi1_write(0x4C89 + Cal_anout1_2);
	MOV	#19593, W1
	ADD	W14, #24, W0
	ADD	W1, [W0], W0
	MOV	W0, W10
	CALL	_SPI1_Write
;MEETKAART_V1_0_joysticks.c,153 :: 		LATD.F10 = 1;
	BSET	LATD, #10
;MEETKAART_V1_0_joysticks.c,154 :: 		}
L_main9:
;MEETKAART_V1_0_joysticks.c,155 :: 		if (receive == 0x04)//analoog uit 2 0V
	MOV.B	[W14+0], W0
	CP.B	W0, #4
	BRA Z	L__main114
	GOTO	L_main10
L__main114:
;MEETKAART_V1_0_joysticks.c,157 :: 		Uart1_Write_Text("ok\r");
	MOV	#lo_addr(?lstr4_MEETKAART_V1_0_joysticks), W10
	CALL	_UART1_Write_Text
;MEETKAART_V1_0_joysticks.c,158 :: 		receive = 0x00;
	CLR	W0
	MOV.B	W0, [W14+0]
;MEETKAART_V1_0_joysticks.c,159 :: 		LATD.F10 = 0;
	BCLR	LATD, #10
;MEETKAART_V1_0_joysticks.c,160 :: 		Spi1_write(0x5000);
	MOV	#20480, W10
	CALL	_SPI1_Write
;MEETKAART_V1_0_joysticks.c,161 :: 		LATD.F10 = 1;
	BSET	LATD, #10
;MEETKAART_V1_0_joysticks.c,162 :: 		}
L_main10:
;MEETKAART_V1_0_joysticks.c,164 :: 		if (receive == 0x05)//analoog uit 2 5.0V
	MOV.B	[W14+0], W0
	CP.B	W0, #5
	BRA Z	L__main115
	GOTO	L_main11
L__main115:
;MEETKAART_V1_0_joysticks.c,166 :: 		Uart1_Write_Text("ok\r");
	MOV	#lo_addr(?lstr5_MEETKAART_V1_0_joysticks), W10
	CALL	_UART1_Write_Text
;MEETKAART_V1_0_joysticks.c,167 :: 		receive = 0x00;
	CLR	W0
	MOV.B	W0, [W14+0]
;MEETKAART_V1_0_joysticks.c,168 :: 		LATD.F10 = 0;
	BCLR	LATD, #10
;MEETKAART_V1_0_joysticks.c,169 :: 		Spi1_write(0x59C4 + Cal_anout2_1);
	MOV	#22980, W1
	ADD	W14, #28, W0
	ADD	W1, [W0], W0
	MOV	W0, W10
	CALL	_SPI1_Write
;MEETKAART_V1_0_joysticks.c,170 :: 		LATD.F10 = 1;
	BSET	LATD, #10
;MEETKAART_V1_0_joysticks.c,171 :: 		}
L_main11:
;MEETKAART_V1_0_joysticks.c,173 :: 		if (receive == 0x06)//analoog uit 2 6.418V
	MOV.B	[W14+0], W0
	CP.B	W0, #6
	BRA Z	L__main116
	GOTO	L_main12
L__main116:
;MEETKAART_V1_0_joysticks.c,175 :: 		Uart1_Write_Text("ok\r");
	MOV	#lo_addr(?lstr6_MEETKAART_V1_0_joysticks), W10
	CALL	_UART1_Write_Text
;MEETKAART_V1_0_joysticks.c,176 :: 		receive = 0x00;
	CLR	W0
	MOV.B	W0, [W14+0]
;MEETKAART_V1_0_joysticks.c,177 :: 		LATD.F10 = 0;
	BCLR	LATD, #10
;MEETKAART_V1_0_joysticks.c,178 :: 		Spi1_write(0x5C89 + Cal_anout2_2);
	MOV	#23689, W1
	ADD	W14, #30, W0
	ADD	W1, [W0], W0
	MOV	W0, W10
	CALL	_SPI1_Write
;MEETKAART_V1_0_joysticks.c,179 :: 		LATD.F10 = 1;
	BSET	LATD, #10
;MEETKAART_V1_0_joysticks.c,180 :: 		}
L_main12:
;MEETKAART_V1_0_joysticks.c,182 :: 		if (receive == 0x07)//analoog uit 3 0V
	MOV.B	[W14+0], W0
	CP.B	W0, #7
	BRA Z	L__main117
	GOTO	L_main13
L__main117:
;MEETKAART_V1_0_joysticks.c,184 :: 		Uart1_Write_Text("ok\r");
	MOV	#lo_addr(?lstr7_MEETKAART_V1_0_joysticks), W10
	CALL	_UART1_Write_Text
;MEETKAART_V1_0_joysticks.c,185 :: 		receive = 0x00;
	CLR	W0
	MOV.B	W0, [W14+0]
;MEETKAART_V1_0_joysticks.c,186 :: 		LATD.F10 = 0;
	BCLR	LATD, #10
;MEETKAART_V1_0_joysticks.c,187 :: 		Spi1_write(0x6000);
	MOV	#24576, W10
	CALL	_SPI1_Write
;MEETKAART_V1_0_joysticks.c,188 :: 		LATD.F10 = 1;
	BSET	LATD, #10
;MEETKAART_V1_0_joysticks.c,189 :: 		}
L_main13:
;MEETKAART_V1_0_joysticks.c,191 :: 		if (receive == 0x08)//analoog uit 3 5.0V
	MOV.B	[W14+0], W0
	CP.B	W0, #8
	BRA Z	L__main118
	GOTO	L_main14
L__main118:
;MEETKAART_V1_0_joysticks.c,193 :: 		Uart1_Write_Text("ok\r");
	MOV	#lo_addr(?lstr8_MEETKAART_V1_0_joysticks), W10
	CALL	_UART1_Write_Text
;MEETKAART_V1_0_joysticks.c,194 :: 		receive = 0x00;
	CLR	W0
	MOV.B	W0, [W14+0]
;MEETKAART_V1_0_joysticks.c,195 :: 		LATD.F10 = 0;
	BCLR	LATD, #10
;MEETKAART_V1_0_joysticks.c,196 :: 		Spi1_write(0x69C4 + Cal_anout3_1);
	MOV	#27076, W1
	MOV	#34, W0
	ADD	W14, W0, W0
	ADD	W1, [W0], W0
	MOV	W0, W10
	CALL	_SPI1_Write
;MEETKAART_V1_0_joysticks.c,197 :: 		LATD.F10 = 1;
	BSET	LATD, #10
;MEETKAART_V1_0_joysticks.c,198 :: 		}
L_main14:
;MEETKAART_V1_0_joysticks.c,200 :: 		if (receive == 0x09)//analoog uit 3 6.418V
	MOV.B	[W14+0], W0
	CP.B	W0, #9
	BRA Z	L__main119
	GOTO	L_main15
L__main119:
;MEETKAART_V1_0_joysticks.c,202 :: 		Uart1_Write_Text("ok\r");
	MOV	#lo_addr(?lstr9_MEETKAART_V1_0_joysticks), W10
	CALL	_UART1_Write_Text
;MEETKAART_V1_0_joysticks.c,203 :: 		receive = 0x00;
	CLR	W0
	MOV.B	W0, [W14+0]
;MEETKAART_V1_0_joysticks.c,204 :: 		LATD.F10 = 0;
	BCLR	LATD, #10
;MEETKAART_V1_0_joysticks.c,205 :: 		Spi1_write(0x6C89 + Cal_anout3_2);
	MOV	#27785, W1
	MOV	#36, W0
	ADD	W14, W0, W0
	ADD	W1, [W0], W0
	MOV	W0, W10
	CALL	_SPI1_Write
;MEETKAART_V1_0_joysticks.c,206 :: 		LATD.F10 = 1;
	BSET	LATD, #10
;MEETKAART_V1_0_joysticks.c,207 :: 		}
L_main15:
;MEETKAART_V1_0_joysticks.c,209 :: 		if (receive == 0x0A)//analoog uit  4 0V
	MOV.B	[W14+0], W0
	CP.B	W0, #10
	BRA Z	L__main120
	GOTO	L_main16
L__main120:
;MEETKAART_V1_0_joysticks.c,211 :: 		Uart1_Write_Text("ok\r");
	MOV	#lo_addr(?lstr10_MEETKAART_V1_0_joysticks), W10
	CALL	_UART1_Write_Text
;MEETKAART_V1_0_joysticks.c,212 :: 		receive = 0x00;
	CLR	W0
	MOV.B	W0, [W14+0]
;MEETKAART_V1_0_joysticks.c,213 :: 		LATD.F10 = 0;
	BCLR	LATD, #10
;MEETKAART_V1_0_joysticks.c,214 :: 		Spi1_write(0x7000);
	MOV	#28672, W10
	CALL	_SPI1_Write
;MEETKAART_V1_0_joysticks.c,215 :: 		LATD.F10 = 1;
	BSET	LATD, #10
;MEETKAART_V1_0_joysticks.c,216 :: 		}
L_main16:
;MEETKAART_V1_0_joysticks.c,218 :: 		if (receive == 0x0B)//analoog uit 4 5.0V
	MOV.B	[W14+0], W0
	CP.B	W0, #11
	BRA Z	L__main121
	GOTO	L_main17
L__main121:
;MEETKAART_V1_0_joysticks.c,220 :: 		Uart1_Write_Text("ok\r");
	MOV	#lo_addr(?lstr11_MEETKAART_V1_0_joysticks), W10
	CALL	_UART1_Write_Text
;MEETKAART_V1_0_joysticks.c,221 :: 		receive = 0x00;
	CLR	W0
	MOV.B	W0, [W14+0]
;MEETKAART_V1_0_joysticks.c,222 :: 		LATD.F10 = 0;
	BCLR	LATD, #10
;MEETKAART_V1_0_joysticks.c,223 :: 		Spi1_write(0x79C4 + Cal_anout4_1);
	MOV	#31172, W1
	MOV	#40, W0
	ADD	W14, W0, W0
	ADD	W1, [W0], W0
	MOV	W0, W10
	CALL	_SPI1_Write
;MEETKAART_V1_0_joysticks.c,224 :: 		LATD.F10 = 1;
	BSET	LATD, #10
;MEETKAART_V1_0_joysticks.c,225 :: 		}
L_main17:
;MEETKAART_V1_0_joysticks.c,227 :: 		if (receive == 0x0C)//analoog uit 4 6.418V
	MOV.B	[W14+0], W0
	CP.B	W0, #12
	BRA Z	L__main122
	GOTO	L_main18
L__main122:
;MEETKAART_V1_0_joysticks.c,229 :: 		Uart1_Write_Text("ok\r");
	MOV	#lo_addr(?lstr12_MEETKAART_V1_0_joysticks), W10
	CALL	_UART1_Write_Text
;MEETKAART_V1_0_joysticks.c,230 :: 		receive = 0x00;
	CLR	W0
	MOV.B	W0, [W14+0]
;MEETKAART_V1_0_joysticks.c,231 :: 		LATD.F10 = 0;
	BCLR	LATD, #10
;MEETKAART_V1_0_joysticks.c,232 :: 		Spi1_write(0x7C89 + Cal_anout4_2);
	MOV	#31881, W1
	MOV	#42, W0
	ADD	W14, W0, W0
	ADD	W1, [W0], W0
	MOV	W0, W10
	CALL	_SPI1_Write
;MEETKAART_V1_0_joysticks.c,233 :: 		LATD.F10 = 1;
	BSET	LATD, #10
;MEETKAART_V1_0_joysticks.c,234 :: 		}
L_main18:
;MEETKAART_V1_0_joysticks.c,245 :: 		if (receive == 0x0E)//analoog uit 5 5.0V
	MOV.B	[W14+0], W0
	CP.B	W0, #14
	BRA Z	L__main123
	GOTO	L_main19
L__main123:
;MEETKAART_V1_0_joysticks.c,247 :: 		Uart1_Write_Text("ok\r");
	MOV	#lo_addr(?lstr13_MEETKAART_V1_0_joysticks), W10
	CALL	_UART1_Write_Text
;MEETKAART_V1_0_joysticks.c,248 :: 		receive = 0x00;
	CLR	W0
	MOV.B	W0, [W14+0]
;MEETKAART_V1_0_joysticks.c,249 :: 		LATD.F10 = 0;
	BCLR	LATD, #10
;MEETKAART_V1_0_joysticks.c,250 :: 		Spi1_write(0x39C4 + Cal_anout5_1);
	MOV	#14788, W1
	MOV	#46, W0
	ADD	W14, W0, W0
	ADD	W1, [W0], W0
	MOV	W0, W10
	CALL	_SPI1_Write
;MEETKAART_V1_0_joysticks.c,251 :: 		LATD.F10 = 1;
	BSET	LATD, #10
;MEETKAART_V1_0_joysticks.c,252 :: 		}
L_main19:
;MEETKAART_V1_0_joysticks.c,254 :: 		if (receive == 0x0F)//analoog uit 5 6.418V
	MOV.B	[W14+0], W0
	CP.B	W0, #15
	BRA Z	L__main124
	GOTO	L_main20
L__main124:
;MEETKAART_V1_0_joysticks.c,256 :: 		Uart1_Write_Text("ok\r");
	MOV	#lo_addr(?lstr14_MEETKAART_V1_0_joysticks), W10
	CALL	_UART1_Write_Text
;MEETKAART_V1_0_joysticks.c,257 :: 		receive = 0x00;
	CLR	W0
	MOV.B	W0, [W14+0]
;MEETKAART_V1_0_joysticks.c,258 :: 		LATD.F10 = 0;
	BCLR	LATD, #10
;MEETKAART_V1_0_joysticks.c,259 :: 		Spi1_write(0x3C89 + Cal_anout5_2);
	MOV	#15497, W1
	MOV	#48, W0
	ADD	W14, W0, W0
	ADD	W1, [W0], W0
	MOV	W0, W10
	CALL	_SPI1_Write
;MEETKAART_V1_0_joysticks.c,260 :: 		LATD.F10 = 1;
	BSET	LATD, #10
;MEETKAART_V1_0_joysticks.c,261 :: 		}
L_main20:
;MEETKAART_V1_0_joysticks.c,263 :: 		if (receive == 0x10)//analoog uit  6 0V
	MOV.B	[W14+0], W0
	CP.B	W0, #16
	BRA Z	L__main125
	GOTO	L_main21
L__main125:
;MEETKAART_V1_0_joysticks.c,265 :: 		Uart1_Write_Text("ok\r");
	MOV	#lo_addr(?lstr15_MEETKAART_V1_0_joysticks), W10
	CALL	_UART1_Write_Text
;MEETKAART_V1_0_joysticks.c,266 :: 		receive = 0x00;
	CLR	W0
	MOV.B	W0, [W14+0]
;MEETKAART_V1_0_joysticks.c,267 :: 		LATD.F10 = 0;
	BCLR	LATD, #10
;MEETKAART_V1_0_joysticks.c,268 :: 		Spi1_write(0x2000);
	MOV	#8192, W10
	CALL	_SPI1_Write
;MEETKAART_V1_0_joysticks.c,269 :: 		LATD.F10 = 1;
	BSET	LATD, #10
;MEETKAART_V1_0_joysticks.c,270 :: 		}
L_main21:
;MEETKAART_V1_0_joysticks.c,272 :: 		if (receive == 0x11)//analoog uit 6 5.0V
	MOV.B	[W14+0], W0
	CP.B	W0, #17
	BRA Z	L__main126
	GOTO	L_main22
L__main126:
;MEETKAART_V1_0_joysticks.c,274 :: 		Uart1_Write_Text("ok\r");
	MOV	#lo_addr(?lstr16_MEETKAART_V1_0_joysticks), W10
	CALL	_UART1_Write_Text
;MEETKAART_V1_0_joysticks.c,275 :: 		receive = 0x00;
	CLR	W0
	MOV.B	W0, [W14+0]
;MEETKAART_V1_0_joysticks.c,276 :: 		LATD.F10 = 0;
	BCLR	LATD, #10
;MEETKAART_V1_0_joysticks.c,277 :: 		Spi1_write(0x29C4 + Cal_anout6_1);
	MOV	#10692, W1
	MOV	#52, W0
	ADD	W14, W0, W0
	ADD	W1, [W0], W0
	MOV	W0, W10
	CALL	_SPI1_Write
;MEETKAART_V1_0_joysticks.c,278 :: 		LATD.F10 = 1;
	BSET	LATD, #10
;MEETKAART_V1_0_joysticks.c,279 :: 		}
L_main22:
;MEETKAART_V1_0_joysticks.c,281 :: 		if (receive == 0x12)//analoog uit 6 6.418V
	MOV.B	[W14+0], W0
	CP.B	W0, #18
	BRA Z	L__main127
	GOTO	L_main23
L__main127:
;MEETKAART_V1_0_joysticks.c,283 :: 		Uart1_Write_Text("ok\r");
	MOV	#lo_addr(?lstr17_MEETKAART_V1_0_joysticks), W10
	CALL	_UART1_Write_Text
;MEETKAART_V1_0_joysticks.c,284 :: 		receive = 0x00;
	CLR	W0
	MOV.B	W0, [W14+0]
;MEETKAART_V1_0_joysticks.c,285 :: 		LATD.F10 = 0;
	BCLR	LATD, #10
;MEETKAART_V1_0_joysticks.c,286 :: 		Spi1_write(0x2C89 + Cal_anout6_2);
	MOV	#11401, W1
	MOV	#54, W0
	ADD	W14, W0, W0
	ADD	W1, [W0], W0
	MOV	W0, W10
	CALL	_SPI1_Write
;MEETKAART_V1_0_joysticks.c,287 :: 		LATD.F10 = 1;
	BSET	LATD, #10
;MEETKAART_V1_0_joysticks.c,288 :: 		}
L_main23:
;MEETKAART_V1_0_joysticks.c,289 :: 		if (receive == 0x13)//analoog uit 7 0V
	MOV.B	[W14+0], W0
	CP.B	W0, #19
	BRA Z	L__main128
	GOTO	L_main24
L__main128:
;MEETKAART_V1_0_joysticks.c,291 :: 		Uart1_Write_Text("ok\r");
	MOV	#lo_addr(?lstr18_MEETKAART_V1_0_joysticks), W10
	CALL	_UART1_Write_Text
;MEETKAART_V1_0_joysticks.c,292 :: 		receive = 0x00;
	CLR	W0
	MOV.B	W0, [W14+0]
;MEETKAART_V1_0_joysticks.c,293 :: 		LATD.F10 = 0;
	BCLR	LATD, #10
;MEETKAART_V1_0_joysticks.c,294 :: 		Spi1_write(0x1000);
	MOV	#4096, W10
	CALL	_SPI1_Write
;MEETKAART_V1_0_joysticks.c,295 :: 		LATD.F10 = 1;
	BSET	LATD, #10
;MEETKAART_V1_0_joysticks.c,296 :: 		}
L_main24:
;MEETKAART_V1_0_joysticks.c,298 :: 		if (receive == 0x14)//analoog uit 7 5.0V
	MOV.B	[W14+0], W0
	CP.B	W0, #20
	BRA Z	L__main129
	GOTO	L_main25
L__main129:
;MEETKAART_V1_0_joysticks.c,300 :: 		Uart1_Write_Text("ok\r");
	MOV	#lo_addr(?lstr19_MEETKAART_V1_0_joysticks), W10
	CALL	_UART1_Write_Text
;MEETKAART_V1_0_joysticks.c,301 :: 		receive = 0x00;
	CLR	W0
	MOV.B	W0, [W14+0]
;MEETKAART_V1_0_joysticks.c,302 :: 		LATD.F10 = 0;
	BCLR	LATD, #10
;MEETKAART_V1_0_joysticks.c,303 :: 		Spi1_write(0x19C4 + Cal_anout7_1);
	MOV	#6596, W1
	MOV	#58, W0
	ADD	W14, W0, W0
	ADD	W1, [W0], W0
	MOV	W0, W10
	CALL	_SPI1_Write
;MEETKAART_V1_0_joysticks.c,304 :: 		LATD.F10 = 1;
	BSET	LATD, #10
;MEETKAART_V1_0_joysticks.c,305 :: 		}
L_main25:
;MEETKAART_V1_0_joysticks.c,307 :: 		if (receive == 0x15)//analoog uit 7 6.418V
	MOV.B	[W14+0], W0
	CP.B	W0, #21
	BRA Z	L__main130
	GOTO	L_main26
L__main130:
;MEETKAART_V1_0_joysticks.c,309 :: 		Uart1_Write_Text("ok\r");
	MOV	#lo_addr(?lstr20_MEETKAART_V1_0_joysticks), W10
	CALL	_UART1_Write_Text
;MEETKAART_V1_0_joysticks.c,310 :: 		receive = 0x00;
	CLR	W0
	MOV.B	W0, [W14+0]
;MEETKAART_V1_0_joysticks.c,311 :: 		LATD.F10 = 0;
	BCLR	LATD, #10
;MEETKAART_V1_0_joysticks.c,312 :: 		Spi1_write(0x1C89 + Cal_anout7_2);
	MOV	#7305, W1
	MOV	#60, W0
	ADD	W14, W0, W0
	ADD	W1, [W0], W0
	MOV	W0, W10
	CALL	_SPI1_Write
;MEETKAART_V1_0_joysticks.c,313 :: 		LATD.F10 = 1;
	BSET	LATD, #10
;MEETKAART_V1_0_joysticks.c,314 :: 		}
L_main26:
;MEETKAART_V1_0_joysticks.c,316 :: 		if (receive == 0x16)//analoog uit 8 0V
	MOV.B	[W14+0], W0
	CP.B	W0, #22
	BRA Z	L__main131
	GOTO	L_main27
L__main131:
;MEETKAART_V1_0_joysticks.c,318 :: 		Uart1_Write_Text("ok\r");
	MOV	#lo_addr(?lstr21_MEETKAART_V1_0_joysticks), W10
	CALL	_UART1_Write_Text
;MEETKAART_V1_0_joysticks.c,319 :: 		receive = 0x00;
	CLR	W0
	MOV.B	W0, [W14+0]
;MEETKAART_V1_0_joysticks.c,320 :: 		LATD.F10 = 0;
	BCLR	LATD, #10
;MEETKAART_V1_0_joysticks.c,321 :: 		Spi1_write(0x0000);
	CLR	W10
	CALL	_SPI1_Write
;MEETKAART_V1_0_joysticks.c,322 :: 		LATD.F10 = 1;
	BSET	LATD, #10
;MEETKAART_V1_0_joysticks.c,323 :: 		}
L_main27:
;MEETKAART_V1_0_joysticks.c,325 :: 		if (receive == 0x17)//analgoog uit 8 5.0V
	MOV.B	[W14+0], W0
	CP.B	W0, #23
	BRA Z	L__main132
	GOTO	L_main28
L__main132:
;MEETKAART_V1_0_joysticks.c,327 :: 		Uart1_Write_Text("ok\r");
	MOV	#lo_addr(?lstr22_MEETKAART_V1_0_joysticks), W10
	CALL	_UART1_Write_Text
;MEETKAART_V1_0_joysticks.c,328 :: 		receive = 0x00;
	CLR	W0
	MOV.B	W0, [W14+0]
;MEETKAART_V1_0_joysticks.c,329 :: 		LATD.F10 = 0;
	BCLR	LATD, #10
;MEETKAART_V1_0_joysticks.c,330 :: 		Spi1_write(0x09C4 + Cal_anout8_1);
	MOV	#2500, W1
	MOV	#62, W0
	ADD	W14, W0, W0
	ADD	W1, [W0], W0
	MOV	W0, W10
	CALL	_SPI1_Write
;MEETKAART_V1_0_joysticks.c,331 :: 		LATD.F10 = 1;
	BSET	LATD, #10
;MEETKAART_V1_0_joysticks.c,332 :: 		}
L_main28:
;MEETKAART_V1_0_joysticks.c,334 :: 		if (receive == 0x18)//analoog uit 8 6.418V
	MOV.B	[W14+0], W0
	CP.B	W0, #24
	BRA Z	L__main133
	GOTO	L_main29
L__main133:
;MEETKAART_V1_0_joysticks.c,336 :: 		Uart1_Write_Text("ok\r");
	MOV	#lo_addr(?lstr23_MEETKAART_V1_0_joysticks), W10
	CALL	_UART1_Write_Text
;MEETKAART_V1_0_joysticks.c,337 :: 		receive = 0x00;
	CLR	W0
	MOV.B	W0, [W14+0]
;MEETKAART_V1_0_joysticks.c,338 :: 		LATD.F10 = 0;
	BCLR	LATD, #10
;MEETKAART_V1_0_joysticks.c,339 :: 		Spi1_write(0x0C89 + Cal_anout8_2);
	MOV	#3209, W1
	MOV	#64, W0
	ADD	W14, W0, W0
	ADD	W1, [W0], W0
	MOV	W0, W10
	CALL	_SPI1_Write
;MEETKAART_V1_0_joysticks.c,340 :: 		LATD.F10 = 1;
	BSET	LATD, #10
;MEETKAART_V1_0_joysticks.c,341 :: 		}
L_main29:
;MEETKAART_V1_0_joysticks.c,343 :: 		if (receive == 0x19)//analoog uit 9 0V
	MOV.B	[W14+0], W0
	CP.B	W0, #25
	BRA Z	L__main134
	GOTO	L_main30
L__main134:
;MEETKAART_V1_0_joysticks.c,345 :: 		Uart1_Write_Text("ok\r");
	MOV	#lo_addr(?lstr24_MEETKAART_V1_0_joysticks), W10
	CALL	_UART1_Write_Text
;MEETKAART_V1_0_joysticks.c,346 :: 		receive = 0x00;
	CLR	W0
	MOV.B	W0, [W14+0]
;MEETKAART_V1_0_joysticks.c,347 :: 		LATD.F9 = 0;
	BCLR	LATD, #9
;MEETKAART_V1_0_joysticks.c,348 :: 		Spi1_write(0x4000);
	MOV	#16384, W10
	CALL	_SPI1_Write
;MEETKAART_V1_0_joysticks.c,349 :: 		LATD.F9 = 1;
	BSET	LATD, #9
;MEETKAART_V1_0_joysticks.c,350 :: 		}
L_main30:
;MEETKAART_V1_0_joysticks.c,352 :: 		if (receive == 0x1A)//analoog uit 9 5.0V
	MOV.B	[W14+0], W0
	CP.B	W0, #26
	BRA Z	L__main135
	GOTO	L_main31
L__main135:
;MEETKAART_V1_0_joysticks.c,354 :: 		Uart1_Write_Text("ok\r");
	MOV	#lo_addr(?lstr25_MEETKAART_V1_0_joysticks), W10
	CALL	_UART1_Write_Text
;MEETKAART_V1_0_joysticks.c,355 :: 		receive = 0x00;
	CLR	W0
	MOV.B	W0, [W14+0]
;MEETKAART_V1_0_joysticks.c,356 :: 		LATD.F9 = 0;
	BCLR	LATD, #9
;MEETKAART_V1_0_joysticks.c,357 :: 		Spi1_write(0x49C4 + Cal_anout9_1);
	MOV	#18884, W1
	MOV	#68, W0
	ADD	W14, W0, W0
	ADD	W1, [W0], W0
	MOV	W0, W10
	CALL	_SPI1_Write
;MEETKAART_V1_0_joysticks.c,358 :: 		LATD.F9 = 1;
	BSET	LATD, #9
;MEETKAART_V1_0_joysticks.c,359 :: 		}
L_main31:
;MEETKAART_V1_0_joysticks.c,361 :: 		if (receive == 0x1B)//analoog uit 9 6.418V
	MOV.B	[W14+0], W0
	CP.B	W0, #27
	BRA Z	L__main136
	GOTO	L_main32
L__main136:
;MEETKAART_V1_0_joysticks.c,363 :: 		Uart1_Write_Text("ok\r");
	MOV	#lo_addr(?lstr26_MEETKAART_V1_0_joysticks), W10
	CALL	_UART1_Write_Text
;MEETKAART_V1_0_joysticks.c,364 :: 		receive = 0x00;
	CLR	W0
	MOV.B	W0, [W14+0]
;MEETKAART_V1_0_joysticks.c,365 :: 		LATD.F9 = 0;
	BCLR	LATD, #9
;MEETKAART_V1_0_joysticks.c,366 :: 		Spi1_write(0x4C89 + Cal_anout9_2);
	MOV	#19593, W1
	MOV	#70, W0
	ADD	W14, W0, W0
	ADD	W1, [W0], W0
	MOV	W0, W10
	CALL	_SPI1_Write
;MEETKAART_V1_0_joysticks.c,367 :: 		LATD.F9 = 1;
	BSET	LATD, #9
;MEETKAART_V1_0_joysticks.c,368 :: 		}
L_main32:
;MEETKAART_V1_0_joysticks.c,370 :: 		if (receive == 0x1C)//analoog uit 10 0V
	MOV.B	[W14+0], W0
	CP.B	W0, #28
	BRA Z	L__main137
	GOTO	L_main33
L__main137:
;MEETKAART_V1_0_joysticks.c,372 :: 		Uart1_Write_Text("ok\r");
	MOV	#lo_addr(?lstr27_MEETKAART_V1_0_joysticks), W10
	CALL	_UART1_Write_Text
;MEETKAART_V1_0_joysticks.c,373 :: 		receive = 0x00;
	CLR	W0
	MOV.B	W0, [W14+0]
;MEETKAART_V1_0_joysticks.c,374 :: 		LATD.F9 = 0;
	BCLR	LATD, #9
;MEETKAART_V1_0_joysticks.c,375 :: 		Spi1_write(0x5000);
	MOV	#20480, W10
	CALL	_SPI1_Write
;MEETKAART_V1_0_joysticks.c,376 :: 		LATD.F9 = 1;
	BSET	LATD, #9
;MEETKAART_V1_0_joysticks.c,377 :: 		}
L_main33:
;MEETKAART_V1_0_joysticks.c,379 :: 		if (receive == 0x1D)//analoog uit 10 5.0V
	MOV.B	[W14+0], W0
	CP.B	W0, #29
	BRA Z	L__main138
	GOTO	L_main34
L__main138:
;MEETKAART_V1_0_joysticks.c,381 :: 		Uart1_Write_Text("ok\r");
	MOV	#lo_addr(?lstr28_MEETKAART_V1_0_joysticks), W10
	CALL	_UART1_Write_Text
;MEETKAART_V1_0_joysticks.c,382 :: 		receive = 0x00;
	CLR	W0
	MOV.B	W0, [W14+0]
;MEETKAART_V1_0_joysticks.c,383 :: 		LATD.F9 = 0;
	BCLR	LATD, #9
;MEETKAART_V1_0_joysticks.c,384 :: 		Spi1_write(0x59C4 + Cal_anout10_1);
	MOV	#22980, W1
	MOV	#74, W0
	ADD	W14, W0, W0
	ADD	W1, [W0], W0
	MOV	W0, W10
	CALL	_SPI1_Write
;MEETKAART_V1_0_joysticks.c,385 :: 		LATD.F9 = 1;
	BSET	LATD, #9
;MEETKAART_V1_0_joysticks.c,386 :: 		}
L_main34:
;MEETKAART_V1_0_joysticks.c,388 :: 		if (receive == 0x1E)//analoog uit 10 6.418V
	MOV.B	[W14+0], W0
	CP.B	W0, #30
	BRA Z	L__main139
	GOTO	L_main35
L__main139:
;MEETKAART_V1_0_joysticks.c,390 :: 		Uart1_Write_Text("ok\r");
	MOV	#lo_addr(?lstr29_MEETKAART_V1_0_joysticks), W10
	CALL	_UART1_Write_Text
;MEETKAART_V1_0_joysticks.c,391 :: 		receive = 0x00;
	CLR	W0
	MOV.B	W0, [W14+0]
;MEETKAART_V1_0_joysticks.c,392 :: 		LATD.F9 = 0;
	BCLR	LATD, #9
;MEETKAART_V1_0_joysticks.c,393 :: 		Spi1_write(0x5C89 + Cal_anout10_2);
	MOV	#23689, W1
	MOV	#76, W0
	ADD	W14, W0, W0
	ADD	W1, [W0], W0
	MOV	W0, W10
	CALL	_SPI1_Write
;MEETKAART_V1_0_joysticks.c,394 :: 		LATD.F9 = 1;
	BSET	LATD, #9
;MEETKAART_V1_0_joysticks.c,395 :: 		}
L_main35:
;MEETKAART_V1_0_joysticks.c,397 :: 		if (receive == 0x1F)//analoog uit 11 0V
	MOV.B	[W14+0], W0
	CP.B	W0, #31
	BRA Z	L__main140
	GOTO	L_main36
L__main140:
;MEETKAART_V1_0_joysticks.c,399 :: 		Uart1_Write_Text("ok\r");
	MOV	#lo_addr(?lstr30_MEETKAART_V1_0_joysticks), W10
	CALL	_UART1_Write_Text
;MEETKAART_V1_0_joysticks.c,400 :: 		receive = 0x00;
	CLR	W0
	MOV.B	W0, [W14+0]
;MEETKAART_V1_0_joysticks.c,401 :: 		LATD.F9 = 0;
	BCLR	LATD, #9
;MEETKAART_V1_0_joysticks.c,402 :: 		Spi1_write(0x6000);
	MOV	#24576, W10
	CALL	_SPI1_Write
;MEETKAART_V1_0_joysticks.c,403 :: 		LATD.F9 = 1;
	BSET	LATD, #9
;MEETKAART_V1_0_joysticks.c,404 :: 		}
L_main36:
;MEETKAART_V1_0_joysticks.c,406 :: 		if (receive == 0x20)//analoog uit 11 5.0V
	MOV.B	[W14+0], W1
	MOV.B	#32, W0
	CP.B	W1, W0
	BRA Z	L__main141
	GOTO	L_main37
L__main141:
;MEETKAART_V1_0_joysticks.c,408 :: 		Uart1_Write_Text("ok\r");
	MOV	#lo_addr(?lstr31_MEETKAART_V1_0_joysticks), W10
	CALL	_UART1_Write_Text
;MEETKAART_V1_0_joysticks.c,409 :: 		receive = 0x00;
	CLR	W0
	MOV.B	W0, [W14+0]
;MEETKAART_V1_0_joysticks.c,410 :: 		LATD.F9 = 0;
	BCLR	LATD, #9
;MEETKAART_V1_0_joysticks.c,411 :: 		Spi1_write(0x69C4 + Cal_anout11_1);
	MOV	#27076, W1
	MOV	#80, W0
	ADD	W14, W0, W0
	ADD	W1, [W0], W0
	MOV	W0, W10
	CALL	_SPI1_Write
;MEETKAART_V1_0_joysticks.c,412 :: 		LATD.F9 = 1;
	BSET	LATD, #9
;MEETKAART_V1_0_joysticks.c,413 :: 		}
L_main37:
;MEETKAART_V1_0_joysticks.c,415 :: 		if (receive == 0x21)//analoog uit 11 6.418V
	MOV.B	[W14+0], W1
	MOV.B	#33, W0
	CP.B	W1, W0
	BRA Z	L__main142
	GOTO	L_main38
L__main142:
;MEETKAART_V1_0_joysticks.c,417 :: 		Uart1_Write_Text("ok\r");
	MOV	#lo_addr(?lstr32_MEETKAART_V1_0_joysticks), W10
	CALL	_UART1_Write_Text
;MEETKAART_V1_0_joysticks.c,418 :: 		receive = 0x00;
	CLR	W0
	MOV.B	W0, [W14+0]
;MEETKAART_V1_0_joysticks.c,419 :: 		LATD.F9 = 0;
	BCLR	LATD, #9
;MEETKAART_V1_0_joysticks.c,420 :: 		Spi1_write(0x6C89 + Cal_anout11_2);
	MOV	#27785, W1
	MOV	#82, W0
	ADD	W14, W0, W0
	ADD	W1, [W0], W0
	MOV	W0, W10
	CALL	_SPI1_Write
;MEETKAART_V1_0_joysticks.c,421 :: 		LATD.F9 = 1;
	BSET	LATD, #9
;MEETKAART_V1_0_joysticks.c,422 :: 		}
L_main38:
;MEETKAART_V1_0_joysticks.c,424 :: 		if (receive == 0x22)//analoog uit 12 0V
	MOV.B	[W14+0], W1
	MOV.B	#34, W0
	CP.B	W1, W0
	BRA Z	L__main143
	GOTO	L_main39
L__main143:
;MEETKAART_V1_0_joysticks.c,426 :: 		Uart1_Write_Text("ok\r");
	MOV	#lo_addr(?lstr33_MEETKAART_V1_0_joysticks), W10
	CALL	_UART1_Write_Text
;MEETKAART_V1_0_joysticks.c,427 :: 		receive = 0x00;
	CLR	W0
	MOV.B	W0, [W14+0]
;MEETKAART_V1_0_joysticks.c,428 :: 		LATD.F9 = 0;
	BCLR	LATD, #9
;MEETKAART_V1_0_joysticks.c,429 :: 		Spi1_write(0x7000);
	MOV	#28672, W10
	CALL	_SPI1_Write
;MEETKAART_V1_0_joysticks.c,430 :: 		LATD.F9 = 1;
	BSET	LATD, #9
;MEETKAART_V1_0_joysticks.c,431 :: 		}
L_main39:
;MEETKAART_V1_0_joysticks.c,433 :: 		if (receive == 0x23)//analoog uit 12 5.0V
	MOV.B	[W14+0], W1
	MOV.B	#35, W0
	CP.B	W1, W0
	BRA Z	L__main144
	GOTO	L_main40
L__main144:
;MEETKAART_V1_0_joysticks.c,435 :: 		Uart1_Write_Text("ok\r");
	MOV	#lo_addr(?lstr34_MEETKAART_V1_0_joysticks), W10
	CALL	_UART1_Write_Text
;MEETKAART_V1_0_joysticks.c,436 :: 		receive = 0x00;
	CLR	W0
	MOV.B	W0, [W14+0]
;MEETKAART_V1_0_joysticks.c,437 :: 		LATD.F9 = 0;
	BCLR	LATD, #9
;MEETKAART_V1_0_joysticks.c,438 :: 		Spi1_write(0x79C4 + Cal_anout12_1);
	MOV	#31172, W1
	MOV	#86, W0
	ADD	W14, W0, W0
	ADD	W1, [W0], W0
	MOV	W0, W10
	CALL	_SPI1_Write
;MEETKAART_V1_0_joysticks.c,439 :: 		LATD.F9 = 1;
	BSET	LATD, #9
;MEETKAART_V1_0_joysticks.c,440 :: 		}
L_main40:
;MEETKAART_V1_0_joysticks.c,442 :: 		if (receive == 0x24)//analoog uit 12 6.418V
	MOV.B	[W14+0], W1
	MOV.B	#36, W0
	CP.B	W1, W0
	BRA Z	L__main145
	GOTO	L_main41
L__main145:
;MEETKAART_V1_0_joysticks.c,444 :: 		Uart1_Write_Text("ok\r");
	MOV	#lo_addr(?lstr35_MEETKAART_V1_0_joysticks), W10
	CALL	_UART1_Write_Text
;MEETKAART_V1_0_joysticks.c,445 :: 		receive = 0x00;
	CLR	W0
	MOV.B	W0, [W14+0]
;MEETKAART_V1_0_joysticks.c,446 :: 		LATD.F9 = 0;
	BCLR	LATD, #9
;MEETKAART_V1_0_joysticks.c,447 :: 		Spi1_write(0x7C89 + Cal_anout12_2);
	MOV	#31881, W1
	MOV	#88, W0
	ADD	W14, W0, W0
	ADD	W1, [W0], W0
	MOV	W0, W10
	CALL	_SPI1_Write
;MEETKAART_V1_0_joysticks.c,448 :: 		LATD.F9 = 1;
	BSET	LATD, #9
;MEETKAART_V1_0_joysticks.c,449 :: 		}
L_main41:
;MEETKAART_V1_0_joysticks.c,451 :: 		if (receive == 0x25)//analoog uit 13 0V
	MOV.B	[W14+0], W1
	MOV.B	#37, W0
	CP.B	W1, W0
	BRA Z	L__main146
	GOTO	L_main42
L__main146:
;MEETKAART_V1_0_joysticks.c,453 :: 		Uart1_Write_Text("ok\r");
	MOV	#lo_addr(?lstr36_MEETKAART_V1_0_joysticks), W10
	CALL	_UART1_Write_Text
;MEETKAART_V1_0_joysticks.c,454 :: 		receive = 0x00;
	CLR	W0
	MOV.B	W0, [W14+0]
;MEETKAART_V1_0_joysticks.c,455 :: 		LATD.F9 = 0;
	BCLR	LATD, #9
;MEETKAART_V1_0_joysticks.c,456 :: 		Spi1_write(0x3000);
	MOV	#12288, W10
	CALL	_SPI1_Write
;MEETKAART_V1_0_joysticks.c,457 :: 		LATD.F9 = 1;
	BSET	LATD, #9
;MEETKAART_V1_0_joysticks.c,458 :: 		}
L_main42:
;MEETKAART_V1_0_joysticks.c,460 :: 		if (receive == 0x26)//analoog uit 13 5.0V
	MOV.B	[W14+0], W1
	MOV.B	#38, W0
	CP.B	W1, W0
	BRA Z	L__main147
	GOTO	L_main43
L__main147:
;MEETKAART_V1_0_joysticks.c,462 :: 		Uart1_Write_Text("ok\r");
	MOV	#lo_addr(?lstr37_MEETKAART_V1_0_joysticks), W10
	CALL	_UART1_Write_Text
;MEETKAART_V1_0_joysticks.c,463 :: 		receive = 0x00;
	CLR	W0
	MOV.B	W0, [W14+0]
;MEETKAART_V1_0_joysticks.c,464 :: 		LATD.F9 = 0;
	BCLR	LATD, #9
;MEETKAART_V1_0_joysticks.c,465 :: 		Spi1_write(0x39C4 + Cal_anout13_1);
	MOV	#14788, W1
	MOV	#92, W0
	ADD	W14, W0, W0
	ADD	W1, [W0], W0
	MOV	W0, W10
	CALL	_SPI1_Write
;MEETKAART_V1_0_joysticks.c,466 :: 		LATD.F9 = 1;
	BSET	LATD, #9
;MEETKAART_V1_0_joysticks.c,467 :: 		}
L_main43:
;MEETKAART_V1_0_joysticks.c,469 :: 		if (receive == 0x27)//analoog uit 13 6.418V
	MOV.B	[W14+0], W1
	MOV.B	#39, W0
	CP.B	W1, W0
	BRA Z	L__main148
	GOTO	L_main44
L__main148:
;MEETKAART_V1_0_joysticks.c,471 :: 		Uart1_Write_Text("ok\r");
	MOV	#lo_addr(?lstr38_MEETKAART_V1_0_joysticks), W10
	CALL	_UART1_Write_Text
;MEETKAART_V1_0_joysticks.c,472 :: 		receive = 0x00;
	CLR	W0
	MOV.B	W0, [W14+0]
;MEETKAART_V1_0_joysticks.c,473 :: 		LATD.F9 = 0;
	BCLR	LATD, #9
;MEETKAART_V1_0_joysticks.c,474 :: 		Spi1_write(0x3C89 + Cal_anout13_2);
	MOV	#15497, W1
	MOV	#94, W0
	ADD	W14, W0, W0
	ADD	W1, [W0], W0
	MOV	W0, W10
	CALL	_SPI1_Write
;MEETKAART_V1_0_joysticks.c,475 :: 		LATD.F9 = 1;
	BSET	LATD, #9
;MEETKAART_V1_0_joysticks.c,476 :: 		}
L_main44:
;MEETKAART_V1_0_joysticks.c,478 :: 		if (receive == 0x28)//analoog uit 14 0V
	MOV.B	[W14+0], W1
	MOV.B	#40, W0
	CP.B	W1, W0
	BRA Z	L__main149
	GOTO	L_main45
L__main149:
;MEETKAART_V1_0_joysticks.c,480 :: 		Uart1_Write_Text("ok\r");
	MOV	#lo_addr(?lstr39_MEETKAART_V1_0_joysticks), W10
	CALL	_UART1_Write_Text
;MEETKAART_V1_0_joysticks.c,481 :: 		receive = 0x00;
	CLR	W0
	MOV.B	W0, [W14+0]
;MEETKAART_V1_0_joysticks.c,482 :: 		LATD.F9 = 0;
	BCLR	LATD, #9
;MEETKAART_V1_0_joysticks.c,483 :: 		Spi1_write(0x2000);
	MOV	#8192, W10
	CALL	_SPI1_Write
;MEETKAART_V1_0_joysticks.c,484 :: 		LATD.F9 = 1;
	BSET	LATD, #9
;MEETKAART_V1_0_joysticks.c,485 :: 		}
L_main45:
;MEETKAART_V1_0_joysticks.c,487 :: 		if (receive == 0x29)//analoog uit 14 5.0V
	MOV.B	[W14+0], W1
	MOV.B	#41, W0
	CP.B	W1, W0
	BRA Z	L__main150
	GOTO	L_main46
L__main150:
;MEETKAART_V1_0_joysticks.c,489 :: 		Uart1_Write_Text("ok\r");
	MOV	#lo_addr(?lstr40_MEETKAART_V1_0_joysticks), W10
	CALL	_UART1_Write_Text
;MEETKAART_V1_0_joysticks.c,490 :: 		receive = 0x00;
	CLR	W0
	MOV.B	W0, [W14+0]
;MEETKAART_V1_0_joysticks.c,491 :: 		LATD.F9 = 0;
	BCLR	LATD, #9
;MEETKAART_V1_0_joysticks.c,492 :: 		Spi1_write(0x29C4 + Cal_anout14_1);
	MOV	#10692, W1
	MOV	#98, W0
	ADD	W14, W0, W0
	ADD	W1, [W0], W0
	MOV	W0, W10
	CALL	_SPI1_Write
;MEETKAART_V1_0_joysticks.c,493 :: 		LATD.F9 = 1;
	BSET	LATD, #9
;MEETKAART_V1_0_joysticks.c,494 :: 		}
L_main46:
;MEETKAART_V1_0_joysticks.c,496 :: 		if (receive == 0x2A)//analoog uit 14 6.418V
	MOV.B	[W14+0], W1
	MOV.B	#42, W0
	CP.B	W1, W0
	BRA Z	L__main151
	GOTO	L_main47
L__main151:
;MEETKAART_V1_0_joysticks.c,498 :: 		Uart1_Write_Text("ok\r");
	MOV	#lo_addr(?lstr41_MEETKAART_V1_0_joysticks), W10
	CALL	_UART1_Write_Text
;MEETKAART_V1_0_joysticks.c,499 :: 		receive = 0x00;
	CLR	W0
	MOV.B	W0, [W14+0]
;MEETKAART_V1_0_joysticks.c,500 :: 		LATD.F9 = 0;
	BCLR	LATD, #9
;MEETKAART_V1_0_joysticks.c,501 :: 		Spi1_write(0x2C89 + Cal_anout14_2);
	MOV	#11401, W1
	MOV	#100, W0
	ADD	W14, W0, W0
	ADD	W1, [W0], W0
	MOV	W0, W10
	CALL	_SPI1_Write
;MEETKAART_V1_0_joysticks.c,502 :: 		LATD.F9 = 1;
	BSET	LATD, #9
;MEETKAART_V1_0_joysticks.c,503 :: 		}
L_main47:
;MEETKAART_V1_0_joysticks.c,505 :: 		if (receive == 0x2B)//analoog uit 15 0V
	MOV.B	[W14+0], W1
	MOV.B	#43, W0
	CP.B	W1, W0
	BRA Z	L__main152
	GOTO	L_main48
L__main152:
;MEETKAART_V1_0_joysticks.c,507 :: 		Uart1_Write_Text("ok\r");
	MOV	#lo_addr(?lstr42_MEETKAART_V1_0_joysticks), W10
	CALL	_UART1_Write_Text
;MEETKAART_V1_0_joysticks.c,508 :: 		receive = 0x00;
	CLR	W0
	MOV.B	W0, [W14+0]
;MEETKAART_V1_0_joysticks.c,509 :: 		LATD.F9 = 0;
	BCLR	LATD, #9
;MEETKAART_V1_0_joysticks.c,510 :: 		Spi1_write(0x1000);
	MOV	#4096, W10
	CALL	_SPI1_Write
;MEETKAART_V1_0_joysticks.c,511 :: 		LATD.F9 = 1;
	BSET	LATD, #9
;MEETKAART_V1_0_joysticks.c,512 :: 		}
L_main48:
;MEETKAART_V1_0_joysticks.c,514 :: 		if (receive == 0x2C)//analoog uit 15 5.0V
	MOV.B	[W14+0], W1
	MOV.B	#44, W0
	CP.B	W1, W0
	BRA Z	L__main153
	GOTO	L_main49
L__main153:
;MEETKAART_V1_0_joysticks.c,516 :: 		Uart1_Write_Text("ok\r");
	MOV	#lo_addr(?lstr43_MEETKAART_V1_0_joysticks), W10
	CALL	_UART1_Write_Text
;MEETKAART_V1_0_joysticks.c,517 :: 		receive = 0x00;
	CLR	W0
	MOV.B	W0, [W14+0]
;MEETKAART_V1_0_joysticks.c,518 :: 		LATD.F9 = 0;
	BCLR	LATD, #9
;MEETKAART_V1_0_joysticks.c,519 :: 		Spi1_write(0x19C4 + Cal_anout15_1);
	MOV	#6596, W1
	MOV	#104, W0
	ADD	W14, W0, W0
	ADD	W1, [W0], W0
	MOV	W0, W10
	CALL	_SPI1_Write
;MEETKAART_V1_0_joysticks.c,520 :: 		LATD.F9 = 1;
	BSET	LATD, #9
;MEETKAART_V1_0_joysticks.c,521 :: 		}
L_main49:
;MEETKAART_V1_0_joysticks.c,523 :: 		if (receive == 0x2D)//analoog uit 15 6.418V
	MOV.B	[W14+0], W1
	MOV.B	#45, W0
	CP.B	W1, W0
	BRA Z	L__main154
	GOTO	L_main50
L__main154:
;MEETKAART_V1_0_joysticks.c,525 :: 		Uart1_Write_Text("ok\r");
	MOV	#lo_addr(?lstr44_MEETKAART_V1_0_joysticks), W10
	CALL	_UART1_Write_Text
;MEETKAART_V1_0_joysticks.c,526 :: 		receive = 0x00;
	CLR	W0
	MOV.B	W0, [W14+0]
;MEETKAART_V1_0_joysticks.c,527 :: 		LATD.F9 = 0;
	BCLR	LATD, #9
;MEETKAART_V1_0_joysticks.c,528 :: 		Spi1_write(0x1C89 + Cal_anout15_2);
	MOV	#7305, W1
	MOV	#106, W0
	ADD	W14, W0, W0
	ADD	W1, [W0], W0
	MOV	W0, W10
	CALL	_SPI1_Write
;MEETKAART_V1_0_joysticks.c,529 :: 		LATD.F9 = 1;
	BSET	LATD, #9
;MEETKAART_V1_0_joysticks.c,530 :: 		}
L_main50:
;MEETKAART_V1_0_joysticks.c,532 :: 		if (receive == 0x2E)//analoog uit 16 0V
	MOV.B	[W14+0], W1
	MOV.B	#46, W0
	CP.B	W1, W0
	BRA Z	L__main155
	GOTO	L_main51
L__main155:
;MEETKAART_V1_0_joysticks.c,534 :: 		Uart1_Write_Text("ok\r");
	MOV	#lo_addr(?lstr45_MEETKAART_V1_0_joysticks), W10
	CALL	_UART1_Write_Text
;MEETKAART_V1_0_joysticks.c,535 :: 		receive = 0x00;
	CLR	W0
	MOV.B	W0, [W14+0]
;MEETKAART_V1_0_joysticks.c,536 :: 		LATD.F9 = 0;
	BCLR	LATD, #9
;MEETKAART_V1_0_joysticks.c,537 :: 		Spi1_write(0x0000);
	CLR	W10
	CALL	_SPI1_Write
;MEETKAART_V1_0_joysticks.c,538 :: 		LATD.F9 = 1;
	BSET	LATD, #9
;MEETKAART_V1_0_joysticks.c,539 :: 		}
L_main51:
;MEETKAART_V1_0_joysticks.c,541 :: 		if (receive == 0x2F)//analoog uit 16 5.0V
	MOV.B	[W14+0], W1
	MOV.B	#47, W0
	CP.B	W1, W0
	BRA Z	L__main156
	GOTO	L_main52
L__main156:
;MEETKAART_V1_0_joysticks.c,543 :: 		Uart1_Write_Text("ok\r");
	MOV	#lo_addr(?lstr46_MEETKAART_V1_0_joysticks), W10
	CALL	_UART1_Write_Text
;MEETKAART_V1_0_joysticks.c,544 :: 		receive = 0x00;
	CLR	W0
	MOV.B	W0, [W14+0]
;MEETKAART_V1_0_joysticks.c,545 :: 		LATD.F9 = 0;
	BCLR	LATD, #9
;MEETKAART_V1_0_joysticks.c,546 :: 		Spi1_write(0x09C4 + Cal_anout16_1);
	MOV	#2500, W1
	MOV	#110, W0
	ADD	W14, W0, W0
	ADD	W1, [W0], W0
	MOV	W0, W10
	CALL	_SPI1_Write
;MEETKAART_V1_0_joysticks.c,547 :: 		LATD.F9 = 1;
	BSET	LATD, #9
;MEETKAART_V1_0_joysticks.c,548 :: 		}
L_main52:
;MEETKAART_V1_0_joysticks.c,550 :: 		if (receive == 0x30)//analoog uit 16 6.418V
	MOV.B	[W14+0], W1
	MOV.B	#48, W0
	CP.B	W1, W0
	BRA Z	L__main157
	GOTO	L_main53
L__main157:
;MEETKAART_V1_0_joysticks.c,552 :: 		Uart1_Write_Text("ok\r");
	MOV	#lo_addr(?lstr47_MEETKAART_V1_0_joysticks), W10
	CALL	_UART1_Write_Text
;MEETKAART_V1_0_joysticks.c,553 :: 		receive = 0x00;
	CLR	W0
	MOV.B	W0, [W14+0]
;MEETKAART_V1_0_joysticks.c,554 :: 		LATD.F9 = 0;
	BCLR	LATD, #9
;MEETKAART_V1_0_joysticks.c,555 :: 		Spi1_write(0x0C89 + Cal_anout1_2);
	MOV	#3209, W1
	ADD	W14, #24, W0
	ADD	W1, [W0], W0
	MOV	W0, W10
	CALL	_SPI1_Write
;MEETKAART_V1_0_joysticks.c,556 :: 		LATD.F9 = 1;
	BSET	LATD, #9
;MEETKAART_V1_0_joysticks.c,557 :: 		}
L_main53:
;MEETKAART_V1_0_joysticks.c,562 :: 		if (receive == 0x31)//analoog in 1
	MOV.B	[W14+0], W1
	MOV.B	#49, W0
	CP.B	W1, W0
	BRA Z	L__main158
	GOTO	L_main54
L__main158:
;MEETKAART_V1_0_joysticks.c,564 :: 		Uart1_Write_Text("ok\r");
	MOV	#lo_addr(?lstr48_MEETKAART_V1_0_joysticks), W10
	CALL	_UART1_Write_Text
;MEETKAART_V1_0_joysticks.c,565 :: 		receive = 0x00;
	CLR	W0
	MOV.B	W0, [W14+0]
;MEETKAART_V1_0_joysticks.c,566 :: 		LATD.F0 = 0;
	BCLR.B	LATD, #0
;MEETKAART_V1_0_joysticks.c,567 :: 		Spi_Receive = Spi1_Read(0x0800);
	MOV	#2048, W10
	CALL	_SPI1_Read
;MEETKAART_V1_0_joysticks.c,568 :: 		LATD.F0 = 1;
	BSET.B	LATD, #0
;MEETKAART_V1_0_joysticks.c,569 :: 		Delay_ms(2);
	MOV	#5333, W7
L_main55:
	DEC	W7
	BRA NZ	L_main55
	NOP
;MEETKAART_V1_0_joysticks.c,570 :: 		LATD.F0 = 0;
	BCLR.B	LATD, #0
;MEETKAART_V1_0_joysticks.c,571 :: 		Spi_Receive = Spi1_Read(0x0800);
	MOV	#2048, W10
	CALL	_SPI1_Read
;MEETKAART_V1_0_joysticks.c,572 :: 		LATD.F0 = 1;
	BSET.B	LATD, #0
;MEETKAART_V1_0_joysticks.c,573 :: 		Spi_Receive = Spi_Receive * 6;
	MOV	#6, W1
	MUL.UU	W0, W1, W2
;MEETKAART_V1_0_joysticks.c,574 :: 		Spi_Receive = Spi_Receive + Cal_anin1;
	ADD	W14, #6, W0
	ADD	W2, [W0], W1
;MEETKAART_V1_0_joysticks.c,575 :: 		IntToStr(Spi_Receive,txt);
	ADD	W14, #1, W0
	MOV	W0, W11
	MOV	W1, W10
	CALL	_IntToStr
;MEETKAART_V1_0_joysticks.c,576 :: 		UART1_Write_Text(txt);
	ADD	W14, #1, W0
	MOV	W0, W10
	CALL	_UART1_Write_Text
;MEETKAART_V1_0_joysticks.c,577 :: 		UART1_Write_Text("\r");
	MOV	#lo_addr(?lstr49_MEETKAART_V1_0_joysticks), W10
	CALL	_UART1_Write_Text
;MEETKAART_V1_0_joysticks.c,578 :: 		}
L_main54:
;MEETKAART_V1_0_joysticks.c,580 :: 		if (receive == 0x32)//analoog in 2
	MOV.B	[W14+0], W1
	MOV.B	#50, W0
	CP.B	W1, W0
	BRA Z	L__main159
	GOTO	L_main57
L__main159:
;MEETKAART_V1_0_joysticks.c,582 :: 		Uart1_Write_Text("ok\r");
	MOV	#lo_addr(?lstr50_MEETKAART_V1_0_joysticks), W10
	CALL	_UART1_Write_Text
;MEETKAART_V1_0_joysticks.c,583 :: 		receive = 0x00;
	CLR	W0
	MOV.B	W0, [W14+0]
;MEETKAART_V1_0_joysticks.c,584 :: 		LATD.F0 = 0;
	BCLR.B	LATD, #0
;MEETKAART_V1_0_joysticks.c,585 :: 		Spi_Receive = Spi1_Read(0x1600);
	MOV	#5632, W10
	CALL	_SPI1_Read
;MEETKAART_V1_0_joysticks.c,586 :: 		LATD.F0 = 1;
	BSET.B	LATD, #0
;MEETKAART_V1_0_joysticks.c,587 :: 		Delay_ms(2);
	MOV	#5333, W7
L_main58:
	DEC	W7
	BRA NZ	L_main58
	NOP
;MEETKAART_V1_0_joysticks.c,588 :: 		LATD.F0 = 0;
	BCLR.B	LATD, #0
;MEETKAART_V1_0_joysticks.c,589 :: 		Spi_Receive = Spi1_Read(0x1600);
	MOV	#5632, W10
	CALL	_SPI1_Read
;MEETKAART_V1_0_joysticks.c,590 :: 		LATD.F0 = 1;
	BSET.B	LATD, #0
;MEETKAART_V1_0_joysticks.c,591 :: 		Spi_Receive = Spi_Receive * 6;
	MOV	#6, W1
	MUL.UU	W0, W1, W2
;MEETKAART_V1_0_joysticks.c,592 :: 		Spi_Receive = Spi_Receive + Cal_anin2;
	ADD	W14, #8, W0
	ADD	W2, [W0], W1
;MEETKAART_V1_0_joysticks.c,593 :: 		IntToStr(Spi_Receive,txt);
	ADD	W14, #1, W0
	MOV	W0, W11
	MOV	W1, W10
	CALL	_IntToStr
;MEETKAART_V1_0_joysticks.c,594 :: 		UART1_Write_Text(txt);
	ADD	W14, #1, W0
	MOV	W0, W10
	CALL	_UART1_Write_Text
;MEETKAART_V1_0_joysticks.c,595 :: 		UART1_Write_Text("\r");
	MOV	#lo_addr(?lstr51_MEETKAART_V1_0_joysticks), W10
	CALL	_UART1_Write_Text
;MEETKAART_V1_0_joysticks.c,596 :: 		}
L_main57:
;MEETKAART_V1_0_joysticks.c,598 :: 		if (receive == 0x33)//analoog in 3
	MOV.B	[W14+0], W1
	MOV.B	#51, W0
	CP.B	W1, W0
	BRA Z	L__main160
	GOTO	L_main60
L__main160:
;MEETKAART_V1_0_joysticks.c,600 :: 		Uart1_Write_Text("ok\r");
	MOV	#lo_addr(?lstr52_MEETKAART_V1_0_joysticks), W10
	CALL	_UART1_Write_Text
;MEETKAART_V1_0_joysticks.c,601 :: 		receive = 0x00;
	CLR	W0
	MOV.B	W0, [W14+0]
;MEETKAART_V1_0_joysticks.c,602 :: 		LATD.F0 = 0;
	BCLR.B	LATD, #0
;MEETKAART_V1_0_joysticks.c,603 :: 		Spi_Receive = Spi1_Read(0x0000);
	CLR	W10
	CALL	_SPI1_Read
;MEETKAART_V1_0_joysticks.c,604 :: 		LATD.F0 = 1;
	BSET.B	LATD, #0
;MEETKAART_V1_0_joysticks.c,605 :: 		Delay_ms(2);
	MOV	#5333, W7
L_main61:
	DEC	W7
	BRA NZ	L_main61
	NOP
;MEETKAART_V1_0_joysticks.c,606 :: 		LATD.F0 = 0;
	BCLR.B	LATD, #0
;MEETKAART_V1_0_joysticks.c,607 :: 		Spi_Receive = Spi1_Read(0x0000);
	CLR	W10
	CALL	_SPI1_Read
;MEETKAART_V1_0_joysticks.c,608 :: 		LATD.F0 = 1;
	BSET.B	LATD, #0
;MEETKAART_V1_0_joysticks.c,609 :: 		Spi_Receive = Spi_Receive * 6;
	MOV	#6, W1
	MUL.UU	W0, W1, W2
;MEETKAART_V1_0_joysticks.c,610 :: 		Spi_Receive = Spi_Receive + Cal_anin3;
	ADD	W14, #10, W0
	ADD	W2, [W0], W1
;MEETKAART_V1_0_joysticks.c,611 :: 		IntToStr(Spi_Receive,txt);
	ADD	W14, #1, W0
	MOV	W0, W11
	MOV	W1, W10
	CALL	_IntToStr
;MEETKAART_V1_0_joysticks.c,612 :: 		UART1_Write_Text(txt);
	ADD	W14, #1, W0
	MOV	W0, W10
	CALL	_UART1_Write_Text
;MEETKAART_V1_0_joysticks.c,613 :: 		UART1_Write_Text("\r");
	MOV	#lo_addr(?lstr53_MEETKAART_V1_0_joysticks), W10
	CALL	_UART1_Write_Text
;MEETKAART_V1_0_joysticks.c,614 :: 		}
L_main60:
;MEETKAART_V1_0_joysticks.c,616 :: 		if (receive == 0x34)//analoog in 4
	MOV.B	[W14+0], W1
	MOV.B	#52, W0
	CP.B	W1, W0
	BRA Z	L__main161
	GOTO	L_main63
L__main161:
;MEETKAART_V1_0_joysticks.c,618 :: 		Uart1_Write_Text("ok\r");
	MOV	#lo_addr(?lstr54_MEETKAART_V1_0_joysticks), W10
	CALL	_UART1_Write_Text
;MEETKAART_V1_0_joysticks.c,619 :: 		receive = 0x00;
	CLR	W0
	MOV.B	W0, [W14+0]
;MEETKAART_V1_0_joysticks.c,620 :: 		LATD.F0 = 0;
	BCLR.B	LATD, #0
;MEETKAART_V1_0_joysticks.c,621 :: 		Spi_Receive = Spi1_Read(0x1800);
	MOV	#6144, W10
	CALL	_SPI1_Read
;MEETKAART_V1_0_joysticks.c,622 :: 		LATD.F0 = 1;
	BSET.B	LATD, #0
;MEETKAART_V1_0_joysticks.c,623 :: 		Delay_ms(2);
	MOV	#5333, W7
L_main64:
	DEC	W7
	BRA NZ	L_main64
	NOP
;MEETKAART_V1_0_joysticks.c,624 :: 		LATD.F0 = 0;
	BCLR.B	LATD, #0
;MEETKAART_V1_0_joysticks.c,625 :: 		Spi_Receive = Spi1_Read(0x1800);
	MOV	#6144, W10
	CALL	_SPI1_Read
;MEETKAART_V1_0_joysticks.c,626 :: 		LATD.F0 = 1;
	BSET.B	LATD, #0
;MEETKAART_V1_0_joysticks.c,627 :: 		Spi_Receive = Spi_Receive * 6;
	MOV	#6, W1
	MUL.UU	W0, W1, W2
;MEETKAART_V1_0_joysticks.c,628 :: 		Spi_Receive = Spi_Receive + Cal_anin4;
	ADD	W14, #12, W0
	ADD	W2, [W0], W1
;MEETKAART_V1_0_joysticks.c,629 :: 		IntToStr(Spi_Receive,txt);
	ADD	W14, #1, W0
	MOV	W0, W11
	MOV	W1, W10
	CALL	_IntToStr
;MEETKAART_V1_0_joysticks.c,630 :: 		UART1_Write_Text(txt);
	ADD	W14, #1, W0
	MOV	W0, W10
	CALL	_UART1_Write_Text
;MEETKAART_V1_0_joysticks.c,631 :: 		UART1_Write_Text("\r");
	MOV	#lo_addr(?lstr55_MEETKAART_V1_0_joysticks), W10
	CALL	_UART1_Write_Text
;MEETKAART_V1_0_joysticks.c,632 :: 		}
L_main63:
;MEETKAART_V1_0_joysticks.c,634 :: 		if (receive == 0x35)//analoog in 5
	MOV.B	[W14+0], W1
	MOV.B	#53, W0
	CP.B	W1, W0
	BRA Z	L__main162
	GOTO	L_main66
L__main162:
;MEETKAART_V1_0_joysticks.c,636 :: 		Uart1_Write_Text("ok\r");
	MOV	#lo_addr(?lstr56_MEETKAART_V1_0_joysticks), W10
	CALL	_UART1_Write_Text
;MEETKAART_V1_0_joysticks.c,637 :: 		receive = 0x00;
	CLR	W0
	MOV.B	W0, [W14+0]
;MEETKAART_V1_0_joysticks.c,638 :: 		LATD.F0 = 0;
	BCLR.B	LATD, #0
;MEETKAART_V1_0_joysticks.c,639 :: 		Spi_Receive = Spi1_Read(0x2800);
	MOV	#10240, W10
	CALL	_SPI1_Read
;MEETKAART_V1_0_joysticks.c,640 :: 		LATD.F0 = 1;
	BSET.B	LATD, #0
;MEETKAART_V1_0_joysticks.c,641 :: 		Delay_ms(2);
	MOV	#5333, W7
L_main67:
	DEC	W7
	BRA NZ	L_main67
	NOP
;MEETKAART_V1_0_joysticks.c,642 :: 		LATD.F0 = 0;
	BCLR.B	LATD, #0
;MEETKAART_V1_0_joysticks.c,643 :: 		Spi_Receive = Spi1_Read(0x2800);
	MOV	#10240, W10
	CALL	_SPI1_Read
;MEETKAART_V1_0_joysticks.c,644 :: 		LATD.F0 = 1;
	BSET.B	LATD, #0
;MEETKAART_V1_0_joysticks.c,645 :: 		Spi_Receive = Spi_Receive * 6;
	MOV	#6, W1
	MUL.UU	W0, W1, W2
;MEETKAART_V1_0_joysticks.c,646 :: 		Spi_Receive = Spi_Receive + Cal_anin5;
	ADD	W14, #14, W0
	ADD	W2, [W0], W1
;MEETKAART_V1_0_joysticks.c,647 :: 		IntToStr(Spi_Receive,txt);
	ADD	W14, #1, W0
	MOV	W0, W11
	MOV	W1, W10
	CALL	_IntToStr
;MEETKAART_V1_0_joysticks.c,648 :: 		UART1_Write_Text(txt);
	ADD	W14, #1, W0
	MOV	W0, W10
	CALL	_UART1_Write_Text
;MEETKAART_V1_0_joysticks.c,649 :: 		UART1_Write_Text("\r");
	MOV	#lo_addr(?lstr57_MEETKAART_V1_0_joysticks), W10
	CALL	_UART1_Write_Text
;MEETKAART_V1_0_joysticks.c,650 :: 		}
L_main66:
;MEETKAART_V1_0_joysticks.c,652 :: 		if (receive == 0x36)//analoog in 6
	MOV.B	[W14+0], W1
	MOV.B	#54, W0
	CP.B	W1, W0
	BRA Z	L__main163
	GOTO	L_main69
L__main163:
;MEETKAART_V1_0_joysticks.c,654 :: 		Uart1_Write_Text("ok\r");
	MOV	#lo_addr(?lstr58_MEETKAART_V1_0_joysticks), W10
	CALL	_UART1_Write_Text
;MEETKAART_V1_0_joysticks.c,655 :: 		receive = 0x00;
	CLR	W0
	MOV.B	W0, [W14+0]
;MEETKAART_V1_0_joysticks.c,656 :: 		LATD.F0 = 0;
	BCLR.B	LATD, #0
;MEETKAART_V1_0_joysticks.c,657 :: 		Spi_Receive = Spi1_Read(0x3000);
	MOV	#12288, W10
	CALL	_SPI1_Read
;MEETKAART_V1_0_joysticks.c,658 :: 		LATD.F0 = 1;
	BSET.B	LATD, #0
;MEETKAART_V1_0_joysticks.c,659 :: 		Delay_ms(2);
	MOV	#5333, W7
L_main70:
	DEC	W7
	BRA NZ	L_main70
	NOP
;MEETKAART_V1_0_joysticks.c,660 :: 		LATD.F0 = 0;
	BCLR.B	LATD, #0
;MEETKAART_V1_0_joysticks.c,661 :: 		Spi_Receive = Spi1_Read(0x3000);
	MOV	#12288, W10
	CALL	_SPI1_Read
;MEETKAART_V1_0_joysticks.c,662 :: 		LATD.F0 = 1;
	BSET.B	LATD, #0
;MEETKAART_V1_0_joysticks.c,663 :: 		Spi_Receive = Spi_Receive * 6;
	MOV	#6, W1
	MUL.UU	W0, W1, W2
;MEETKAART_V1_0_joysticks.c,664 :: 		Spi_Receive = Spi_Receive + Cal_anin6;
	ADD	W14, #16, W0
	ADD	W2, [W0], W1
;MEETKAART_V1_0_joysticks.c,665 :: 		IntToStr(Spi_Receive,txt);
	ADD	W14, #1, W0
	MOV	W0, W11
	MOV	W1, W10
	CALL	_IntToStr
;MEETKAART_V1_0_joysticks.c,666 :: 		UART1_Write_Text(txt);
	ADD	W14, #1, W0
	MOV	W0, W10
	CALL	_UART1_Write_Text
;MEETKAART_V1_0_joysticks.c,667 :: 		UART1_Write_Text("\r");
	MOV	#lo_addr(?lstr59_MEETKAART_V1_0_joysticks), W10
	CALL	_UART1_Write_Text
;MEETKAART_V1_0_joysticks.c,668 :: 		}
L_main69:
;MEETKAART_V1_0_joysticks.c,670 :: 		if (receive == 0x37)//analoog in 7
	MOV.B	[W14+0], W1
	MOV.B	#55, W0
	CP.B	W1, W0
	BRA Z	L__main164
	GOTO	L_main72
L__main164:
;MEETKAART_V1_0_joysticks.c,672 :: 		Uart1_Write_Text("ok\r");
	MOV	#lo_addr(?lstr60_MEETKAART_V1_0_joysticks), W10
	CALL	_UART1_Write_Text
;MEETKAART_V1_0_joysticks.c,673 :: 		receive = 0x00;
	CLR	W0
	MOV.B	W0, [W14+0]
;MEETKAART_V1_0_joysticks.c,674 :: 		LATD.F0 = 0;
	BCLR.B	LATD, #0
;MEETKAART_V1_0_joysticks.c,675 :: 		Spi_Receive = Spi1_Read(0x3800);
	MOV	#14336, W10
	CALL	_SPI1_Read
;MEETKAART_V1_0_joysticks.c,676 :: 		LATD.F0 = 1;
	BSET.B	LATD, #0
;MEETKAART_V1_0_joysticks.c,677 :: 		Delay_ms(2);
	MOV	#5333, W7
L_main73:
	DEC	W7
	BRA NZ	L_main73
	NOP
;MEETKAART_V1_0_joysticks.c,678 :: 		LATD.F0 = 0;
	BCLR.B	LATD, #0
;MEETKAART_V1_0_joysticks.c,679 :: 		Spi_Receive = Spi1_Read(0x3800);
	MOV	#14336, W10
	CALL	_SPI1_Read
;MEETKAART_V1_0_joysticks.c,680 :: 		LATD.F0 = 1;
	BSET.B	LATD, #0
;MEETKAART_V1_0_joysticks.c,681 :: 		Spi_Receive = Spi_Receive * 6;
	MOV	#6, W1
	MUL.UU	W0, W1, W2
;MEETKAART_V1_0_joysticks.c,682 :: 		Spi_Receive = Spi_Receive + Cal_anin7;
	ADD	W14, #18, W0
	ADD	W2, [W0], W1
;MEETKAART_V1_0_joysticks.c,683 :: 		IntToStr(Spi_Receive,txt);
	ADD	W14, #1, W0
	MOV	W0, W11
	MOV	W1, W10
	CALL	_IntToStr
;MEETKAART_V1_0_joysticks.c,684 :: 		UART1_Write_Text(txt);
	ADD	W14, #1, W0
	MOV	W0, W10
	CALL	_UART1_Write_Text
;MEETKAART_V1_0_joysticks.c,685 :: 		UART1_Write_Text("\r");
	MOV	#lo_addr(?lstr61_MEETKAART_V1_0_joysticks), W10
	CALL	_UART1_Write_Text
;MEETKAART_V1_0_joysticks.c,686 :: 		}
L_main72:
;MEETKAART_V1_0_joysticks.c,688 :: 		if (receive == 0x38)//analoog in 8
	MOV.B	[W14+0], W1
	MOV.B	#56, W0
	CP.B	W1, W0
	BRA Z	L__main165
	GOTO	L_main75
L__main165:
;MEETKAART_V1_0_joysticks.c,690 :: 		Uart1_Write_Text("ok\r");
	MOV	#lo_addr(?lstr62_MEETKAART_V1_0_joysticks), W10
	CALL	_UART1_Write_Text
;MEETKAART_V1_0_joysticks.c,691 :: 		receive = 0x00;
	CLR	W0
	MOV.B	W0, [W14+0]
;MEETKAART_V1_0_joysticks.c,692 :: 		LATD.F0 = 0;
	BCLR.B	LATD, #0
;MEETKAART_V1_0_joysticks.c,693 :: 		Spi_Receive = Spi1_Read(0x2000);
	MOV	#8192, W10
	CALL	_SPI1_Read
;MEETKAART_V1_0_joysticks.c,694 :: 		LATD.F0 = 1;
	BSET.B	LATD, #0
;MEETKAART_V1_0_joysticks.c,695 :: 		Delay_ms(2);
	MOV	#5333, W7
L_main76:
	DEC	W7
	BRA NZ	L_main76
	NOP
;MEETKAART_V1_0_joysticks.c,696 :: 		LATD.F0 = 0;
	BCLR.B	LATD, #0
;MEETKAART_V1_0_joysticks.c,697 :: 		Spi_Receive = Spi1_Read(0x2000);
	MOV	#8192, W10
	CALL	_SPI1_Read
;MEETKAART_V1_0_joysticks.c,698 :: 		LATD.F0 = 1;
	BSET.B	LATD, #0
;MEETKAART_V1_0_joysticks.c,699 :: 		Spi_Receive = Spi_Receive * 6;
	MOV	#6, W1
	MUL.UU	W0, W1, W2
;MEETKAART_V1_0_joysticks.c,700 :: 		Spi_Receive = Spi_Receive + Cal_anin8;
	ADD	W14, #20, W0
	ADD	W2, [W0], W1
;MEETKAART_V1_0_joysticks.c,701 :: 		IntToStr(Spi_Receive,txt);
	ADD	W14, #1, W0
	MOV	W0, W11
	MOV	W1, W10
	CALL	_IntToStr
;MEETKAART_V1_0_joysticks.c,702 :: 		UART1_Write_Text(txt);
	ADD	W14, #1, W0
	MOV	W0, W10
	CALL	_UART1_Write_Text
;MEETKAART_V1_0_joysticks.c,703 :: 		UART1_Write_Text("\r");
	MOV	#lo_addr(?lstr63_MEETKAART_V1_0_joysticks), W10
	CALL	_UART1_Write_Text
;MEETKAART_V1_0_joysticks.c,704 :: 		}
L_main75:
;MEETKAART_V1_0_joysticks.c,709 :: 		if (receive == 0x39)//digitaal uit 1
	MOV.B	[W14+0], W1
	MOV.B	#57, W0
	CP.B	W1, W0
	BRA Z	L__main166
	GOTO	L_main78
L__main166:
;MEETKAART_V1_0_joysticks.c,711 :: 		UART1_Write_Text("ok\r");
	MOV	#lo_addr(?lstr64_MEETKAART_V1_0_joysticks), W10
	CALL	_UART1_Write_Text
;MEETKAART_V1_0_joysticks.c,712 :: 		receive = 0x00;
	CLR	W0
	MOV.B	W0, [W14+0]
;MEETKAART_V1_0_joysticks.c,713 :: 		LATG.F7 = 1;
	BSET.B	LATG, #7
;MEETKAART_V1_0_joysticks.c,714 :: 		Delay_ms(600);
	MOV	#25, W8
	MOV	#27143, W7
L_main79:
	DEC	W7
	BRA NZ	L_main79
	DEC	W8
	BRA NZ	L_main79
;MEETKAART_V1_0_joysticks.c,715 :: 		LATG.F7 = 0;
	BCLR.B	LATG, #7
;MEETKAART_V1_0_joysticks.c,716 :: 		}
L_main78:
;MEETKAART_V1_0_joysticks.c,718 :: 		if(receive == 0x3A)//digitaal uit 2
	MOV.B	[W14+0], W1
	MOV.B	#58, W0
	CP.B	W1, W0
	BRA Z	L__main167
	GOTO	L_main81
L__main167:
;MEETKAART_V1_0_joysticks.c,720 :: 		Uart1_Write_Text("ok\r");
	MOV	#lo_addr(?lstr65_MEETKAART_V1_0_joysticks), W10
	CALL	_UART1_Write_Text
;MEETKAART_V1_0_joysticks.c,721 :: 		receive = 0x01;
	MOV.B	#1, W0
	MOV.B	W0, [W14+0]
;MEETKAART_V1_0_joysticks.c,722 :: 		LATG.F6 =1;
	BSET.B	LATG, #6
;MEETKAART_V1_0_joysticks.c,723 :: 		Delay_ms(600);
	MOV	#25, W8
	MOV	#27143, W7
L_main82:
	DEC	W7
	BRA NZ	L_main82
	DEC	W8
	BRA NZ	L_main82
;MEETKAART_V1_0_joysticks.c,724 :: 		LATG.F6 = 0;
	BCLR.B	LATG, #6
;MEETKAART_V1_0_joysticks.c,725 :: 		}
L_main81:
;MEETKAART_V1_0_joysticks.c,727 :: 		if (receive == 0x3B)//digitaal uit 3
	MOV.B	[W14+0], W1
	MOV.B	#59, W0
	CP.B	W1, W0
	BRA Z	L__main168
	GOTO	L_main84
L__main168:
;MEETKAART_V1_0_joysticks.c,729 :: 		Uart1_Write_Text("ok\r");
	MOV	#lo_addr(?lstr66_MEETKAART_V1_0_joysticks), W10
	CALL	_UART1_Write_Text
;MEETKAART_V1_0_joysticks.c,730 :: 		receive = 0x00;
	CLR	W0
	MOV.B	W0, [W14+0]
;MEETKAART_V1_0_joysticks.c,731 :: 		LATE.F7 = 1;
	BSET.B	LATE, #7
;MEETKAART_V1_0_joysticks.c,732 :: 		Delay_ms(600);
	MOV	#25, W8
	MOV	#27143, W7
L_main85:
	DEC	W7
	BRA NZ	L_main85
	DEC	W8
	BRA NZ	L_main85
;MEETKAART_V1_0_joysticks.c,733 :: 		LATE.F7 = 0;
	BCLR.B	LATE, #7
;MEETKAART_V1_0_joysticks.c,734 :: 		}
L_main84:
;MEETKAART_V1_0_joysticks.c,736 :: 		if (receive == 0x3C)//digitaal uit 4
	MOV.B	[W14+0], W1
	MOV.B	#60, W0
	CP.B	W1, W0
	BRA Z	L__main169
	GOTO	L_main87
L__main169:
;MEETKAART_V1_0_joysticks.c,738 :: 		Uart1_Write_Text("ok\r");
	MOV	#lo_addr(?lstr67_MEETKAART_V1_0_joysticks), W10
	CALL	_UART1_Write_Text
;MEETKAART_V1_0_joysticks.c,739 :: 		receive = 0x00;
	CLR	W0
	MOV.B	W0, [W14+0]
;MEETKAART_V1_0_joysticks.c,740 :: 		LATE.F5 = 1;
	BSET.B	LATE, #5
;MEETKAART_V1_0_joysticks.c,741 :: 		Delay_ms(600);
	MOV	#25, W8
	MOV	#27143, W7
L_main88:
	DEC	W7
	BRA NZ	L_main88
	DEC	W8
	BRA NZ	L_main88
;MEETKAART_V1_0_joysticks.c,742 :: 		LATE.F5 = 0;
	BCLR.B	LATE, #5
;MEETKAART_V1_0_joysticks.c,743 :: 		}
L_main87:
;MEETKAART_V1_0_joysticks.c,745 :: 		if (receive == 0x3D)//digitaal uit 5
	MOV.B	[W14+0], W1
	MOV.B	#61, W0
	CP.B	W1, W0
	BRA Z	L__main170
	GOTO	L_main90
L__main170:
;MEETKAART_V1_0_joysticks.c,747 :: 		Uart1_Write_Text("ok\r");
	MOV	#lo_addr(?lstr68_MEETKAART_V1_0_joysticks), W10
	CALL	_UART1_Write_Text
;MEETKAART_V1_0_joysticks.c,748 :: 		receive = 0x00;
	CLR	W0
	MOV.B	W0, [W14+0]
;MEETKAART_V1_0_joysticks.c,749 :: 		LATE.F6 = 1;
	BSET.B	LATE, #6
;MEETKAART_V1_0_joysticks.c,750 :: 		Delay_ms(600);
	MOV	#25, W8
	MOV	#27143, W7
L_main91:
	DEC	W7
	BRA NZ	L_main91
	DEC	W8
	BRA NZ	L_main91
;MEETKAART_V1_0_joysticks.c,751 :: 		LATE.F6 = 0;
	BCLR.B	LATE, #6
;MEETKAART_V1_0_joysticks.c,752 :: 		}
L_main90:
;MEETKAART_V1_0_joysticks.c,797 :: 		if (receive == 0x3E)//analoog uit 1 0.5V
	MOV.B	[W14+0], W1
	MOV.B	#62, W0
	CP.B	W1, W0
	BRA Z	L__main171
	GOTO	L_main93
L__main171:
;MEETKAART_V1_0_joysticks.c,799 :: 		Uart1_Write_Text("ok\r");
	MOV	#lo_addr(?lstr69_MEETKAART_V1_0_joysticks), W10
	CALL	_UART1_Write_Text
;MEETKAART_V1_0_joysticks.c,800 :: 		receive = 0x00;
	CLR	W0
	MOV.B	W0, [W14+0]
;MEETKAART_V1_0_joysticks.c,801 :: 		LATD.F10 = 0;
	BCLR	LATD, #10
;MEETKAART_V1_0_joysticks.c,802 :: 		Spi1_write(0x40FA + Cal_anout1_3);
	MOV	#16634, W1
	ADD	W14, #26, W0
	ADD	W1, [W0], W0
	MOV	W0, W10
	CALL	_SPI1_Write
;MEETKAART_V1_0_joysticks.c,803 :: 		LATD.F10 = 1;
	BSET	LATD, #10
;MEETKAART_V1_0_joysticks.c,804 :: 		}
L_main93:
;MEETKAART_V1_0_joysticks.c,806 :: 		if (receive == 0x3F)//analoog uit 2 0.5V
	MOV.B	[W14+0], W1
	MOV.B	#63, W0
	CP.B	W1, W0
	BRA Z	L__main172
	GOTO	L_main94
L__main172:
;MEETKAART_V1_0_joysticks.c,808 :: 		Uart1_Write_Text("ok\r");
	MOV	#lo_addr(?lstr70_MEETKAART_V1_0_joysticks), W10
	CALL	_UART1_Write_Text
;MEETKAART_V1_0_joysticks.c,809 :: 		receive = 0x00;
	CLR	W0
	MOV.B	W0, [W14+0]
;MEETKAART_V1_0_joysticks.c,810 :: 		LATD.F10 = 0;
	BCLR	LATD, #10
;MEETKAART_V1_0_joysticks.c,811 :: 		Spi1_write(0x50FA + Cal_anout2_3);
	MOV	#20730, W1
	MOV	#32, W0
	ADD	W14, W0, W0
	ADD	W1, [W0], W0
	MOV	W0, W10
	CALL	_SPI1_Write
;MEETKAART_V1_0_joysticks.c,812 :: 		LATD.F10 = 1;
	BSET	LATD, #10
;MEETKAART_V1_0_joysticks.c,813 :: 		}
L_main94:
;MEETKAART_V1_0_joysticks.c,815 :: 		if (receive == 0x40)//analoog uit 3 0.5V
	MOV.B	[W14+0], W1
	MOV.B	#64, W0
	CP.B	W1, W0
	BRA Z	L__main173
	GOTO	L_main95
L__main173:
;MEETKAART_V1_0_joysticks.c,817 :: 		Uart1_Write_Text("ok\r");
	MOV	#lo_addr(?lstr71_MEETKAART_V1_0_joysticks), W10
	CALL	_UART1_Write_Text
;MEETKAART_V1_0_joysticks.c,818 :: 		receive = 0x00;
	CLR	W0
	MOV.B	W0, [W14+0]
;MEETKAART_V1_0_joysticks.c,819 :: 		LATD.F10 = 0;
	BCLR	LATD, #10
;MEETKAART_V1_0_joysticks.c,820 :: 		Spi1_write(0x60FA + Cal_anout3_3 );
	MOV	#24826, W1
	MOV	#38, W0
	ADD	W14, W0, W0
	ADD	W1, [W0], W0
	MOV	W0, W10
	CALL	_SPI1_Write
;MEETKAART_V1_0_joysticks.c,821 :: 		LATD.F10 = 1;
	BSET	LATD, #10
;MEETKAART_V1_0_joysticks.c,822 :: 		}
L_main95:
;MEETKAART_V1_0_joysticks.c,824 :: 		if (receive == 0x41)//analoog uit  4 0.5V
	MOV.B	[W14+0], W1
	MOV.B	#65, W0
	CP.B	W1, W0
	BRA Z	L__main174
	GOTO	L_main96
L__main174:
;MEETKAART_V1_0_joysticks.c,826 :: 		Uart1_Write_Text("ok\r");
	MOV	#lo_addr(?lstr72_MEETKAART_V1_0_joysticks), W10
	CALL	_UART1_Write_Text
;MEETKAART_V1_0_joysticks.c,827 :: 		receive = 0x00;
	CLR	W0
	MOV.B	W0, [W14+0]
;MEETKAART_V1_0_joysticks.c,828 :: 		LATD.F10 = 0;
	BCLR	LATD, #10
;MEETKAART_V1_0_joysticks.c,829 :: 		Spi1_write(0x70FA + Cal_anout4_3);
	MOV	#28922, W1
	MOV	#44, W0
	ADD	W14, W0, W0
	ADD	W1, [W0], W0
	MOV	W0, W10
	CALL	_SPI1_Write
;MEETKAART_V1_0_joysticks.c,830 :: 		LATD.F10 = 1;
	BSET	LATD, #10
;MEETKAART_V1_0_joysticks.c,831 :: 		}
L_main96:
;MEETKAART_V1_0_joysticks.c,833 :: 		if (receive == 0x42)//analoog uit 5 0.5V
	MOV.B	[W14+0], W1
	MOV.B	#66, W0
	CP.B	W1, W0
	BRA Z	L__main175
	GOTO	L_main97
L__main175:
;MEETKAART_V1_0_joysticks.c,835 :: 		Uart1_Write_Text("ok\r");
	MOV	#lo_addr(?lstr73_MEETKAART_V1_0_joysticks), W10
	CALL	_UART1_Write_Text
;MEETKAART_V1_0_joysticks.c,836 :: 		receive = 0x00;
	CLR	W0
	MOV.B	W0, [W14+0]
;MEETKAART_V1_0_joysticks.c,837 :: 		LATD.F10 = 0;
	BCLR	LATD, #10
;MEETKAART_V1_0_joysticks.c,838 :: 		Spi1_write(0x30FA + Cal_anout5_3);
	MOV	#12538, W1
	MOV	#50, W0
	ADD	W14, W0, W0
	ADD	W1, [W0], W0
	MOV	W0, W10
	CALL	_SPI1_Write
;MEETKAART_V1_0_joysticks.c,839 :: 		LATD.F10 = 1;
	BSET	LATD, #10
;MEETKAART_V1_0_joysticks.c,840 :: 		}
L_main97:
;MEETKAART_V1_0_joysticks.c,842 :: 		if (receive == 0x43)//analoog uit  6 0.5V
	MOV.B	[W14+0], W1
	MOV.B	#67, W0
	CP.B	W1, W0
	BRA Z	L__main176
	GOTO	L_main98
L__main176:
;MEETKAART_V1_0_joysticks.c,844 :: 		Uart1_Write_Text("ok\r");
	MOV	#lo_addr(?lstr74_MEETKAART_V1_0_joysticks), W10
	CALL	_UART1_Write_Text
;MEETKAART_V1_0_joysticks.c,845 :: 		receive = 0x00;
	CLR	W0
	MOV.B	W0, [W14+0]
;MEETKAART_V1_0_joysticks.c,846 :: 		LATD.F10 = 0;
	BCLR	LATD, #10
;MEETKAART_V1_0_joysticks.c,847 :: 		Spi1_write(0x20FA + Cal_anout6_3);
	MOV	#8442, W1
	MOV	#56, W0
	ADD	W14, W0, W0
	ADD	W1, [W0], W0
	MOV	W0, W10
	CALL	_SPI1_Write
;MEETKAART_V1_0_joysticks.c,848 :: 		LATD.F10 = 1;
	BSET	LATD, #10
;MEETKAART_V1_0_joysticks.c,849 :: 		}
L_main98:
;MEETKAART_V1_0_joysticks.c,851 :: 		if (receive == 0x44)//analoog uit 7 0.5V
	MOV.B	[W14+0], W1
	MOV.B	#68, W0
	CP.B	W1, W0
	BRA Z	L__main177
	GOTO	L_main99
L__main177:
;MEETKAART_V1_0_joysticks.c,853 :: 		Uart1_Write_Text("ok\r");
	MOV	#lo_addr(?lstr75_MEETKAART_V1_0_joysticks), W10
	CALL	_UART1_Write_Text
;MEETKAART_V1_0_joysticks.c,854 :: 		receive = 0x00;
	CLR	W0
	MOV.B	W0, [W14+0]
;MEETKAART_V1_0_joysticks.c,855 :: 		LATD.F10 = 0;
	BCLR	LATD, #10
;MEETKAART_V1_0_joysticks.c,856 :: 		Spi1_write(0x10FA);
	MOV	#4346, W10
	CALL	_SPI1_Write
;MEETKAART_V1_0_joysticks.c,857 :: 		LATD.F10 = 1;
	BSET	LATD, #10
;MEETKAART_V1_0_joysticks.c,858 :: 		}
L_main99:
;MEETKAART_V1_0_joysticks.c,860 :: 		if (receive == 0x45)//analoog uit 8 0.5V
	MOV.B	[W14+0], W1
	MOV.B	#69, W0
	CP.B	W1, W0
	BRA Z	L__main178
	GOTO	L_main100
L__main178:
;MEETKAART_V1_0_joysticks.c,862 :: 		Uart1_Write_Text("ok\r");
	MOV	#lo_addr(?lstr76_MEETKAART_V1_0_joysticks), W10
	CALL	_UART1_Write_Text
;MEETKAART_V1_0_joysticks.c,863 :: 		receive = 0x00;
	CLR	W0
	MOV.B	W0, [W14+0]
;MEETKAART_V1_0_joysticks.c,864 :: 		LATD.F10 = 0;
	BCLR	LATD, #10
;MEETKAART_V1_0_joysticks.c,865 :: 		Spi1_write(0x00FA + Cal_anout8_3);
	MOV	#250, W1
	MOV	#66, W0
	ADD	W14, W0, W0
	ADD	W1, [W0], W0
	MOV	W0, W10
	CALL	_SPI1_Write
;MEETKAART_V1_0_joysticks.c,866 :: 		LATD.F10 = 1;
	BSET	LATD, #10
;MEETKAART_V1_0_joysticks.c,867 :: 		}
L_main100:
;MEETKAART_V1_0_joysticks.c,871 :: 		if (receive == 0x46)//analoog uit 9 0.5V
	MOV.B	[W14+0], W1
	MOV.B	#70, W0
	CP.B	W1, W0
	BRA Z	L__main179
	GOTO	L_main101
L__main179:
;MEETKAART_V1_0_joysticks.c,873 :: 		Uart1_Write_Text("ok\r");
	MOV	#lo_addr(?lstr77_MEETKAART_V1_0_joysticks), W10
	CALL	_UART1_Write_Text
;MEETKAART_V1_0_joysticks.c,874 :: 		receive = 0x00;
	CLR	W0
	MOV.B	W0, [W14+0]
;MEETKAART_V1_0_joysticks.c,875 :: 		LATD.F9 = 0;
	BCLR	LATD, #9
;MEETKAART_V1_0_joysticks.c,876 :: 		Spi1_write(0x40FA + Cal_anout9_3);
	MOV	#16634, W1
	MOV	#72, W0
	ADD	W14, W0, W0
	ADD	W1, [W0], W0
	MOV	W0, W10
	CALL	_SPI1_Write
;MEETKAART_V1_0_joysticks.c,877 :: 		LATD.F9 = 1;
	BSET	LATD, #9
;MEETKAART_V1_0_joysticks.c,878 :: 		}
L_main101:
;MEETKAART_V1_0_joysticks.c,882 :: 		if (receive == 0x47)//analoog uit 10 0.5V
	MOV.B	[W14+0], W1
	MOV.B	#71, W0
	CP.B	W1, W0
	BRA Z	L__main180
	GOTO	L_main102
L__main180:
;MEETKAART_V1_0_joysticks.c,884 :: 		Uart1_Write_Text("ok\r");
	MOV	#lo_addr(?lstr78_MEETKAART_V1_0_joysticks), W10
	CALL	_UART1_Write_Text
;MEETKAART_V1_0_joysticks.c,885 :: 		receive = 0x00;
	CLR	W0
	MOV.B	W0, [W14+0]
;MEETKAART_V1_0_joysticks.c,886 :: 		LATD.F9 = 0;
	BCLR	LATD, #9
;MEETKAART_V1_0_joysticks.c,887 :: 		Spi1_write(0x50FA + Cal_anout10_3);
	MOV	#20730, W1
	MOV	#78, W0
	ADD	W14, W0, W0
	ADD	W1, [W0], W0
	MOV	W0, W10
	CALL	_SPI1_Write
;MEETKAART_V1_0_joysticks.c,888 :: 		LATD.F9 = 1;
	BSET	LATD, #9
;MEETKAART_V1_0_joysticks.c,889 :: 		}
L_main102:
;MEETKAART_V1_0_joysticks.c,891 :: 		if (receive == 0x48)//analoog uit 11 0.5V
	MOV.B	[W14+0], W1
	MOV.B	#72, W0
	CP.B	W1, W0
	BRA Z	L__main181
	GOTO	L_main103
L__main181:
;MEETKAART_V1_0_joysticks.c,893 :: 		Uart1_Write_Text("ok\r");
	MOV	#lo_addr(?lstr79_MEETKAART_V1_0_joysticks), W10
	CALL	_UART1_Write_Text
;MEETKAART_V1_0_joysticks.c,894 :: 		receive = 0x00;
	CLR	W0
	MOV.B	W0, [W14+0]
;MEETKAART_V1_0_joysticks.c,895 :: 		LATD.F9 = 0;
	BCLR	LATD, #9
;MEETKAART_V1_0_joysticks.c,896 :: 		Spi1_write(0x60FA + Cal_anout11_3);
	MOV	#24826, W1
	MOV	#84, W0
	ADD	W14, W0, W0
	ADD	W1, [W0], W0
	MOV	W0, W10
	CALL	_SPI1_Write
;MEETKAART_V1_0_joysticks.c,897 :: 		LATD.F9 = 1;
	BSET	LATD, #9
;MEETKAART_V1_0_joysticks.c,898 :: 		}
L_main103:
;MEETKAART_V1_0_joysticks.c,900 :: 		if (receive == 0x49)//analoog uit 12 0.5V
	MOV.B	[W14+0], W1
	MOV.B	#73, W0
	CP.B	W1, W0
	BRA Z	L__main182
	GOTO	L_main104
L__main182:
;MEETKAART_V1_0_joysticks.c,902 :: 		Uart1_Write_Text("ok\r");
	MOV	#lo_addr(?lstr80_MEETKAART_V1_0_joysticks), W10
	CALL	_UART1_Write_Text
;MEETKAART_V1_0_joysticks.c,903 :: 		receive = 0x00;
	CLR	W0
	MOV.B	W0, [W14+0]
;MEETKAART_V1_0_joysticks.c,904 :: 		LATD.F9 = 0;
	BCLR	LATD, #9
;MEETKAART_V1_0_joysticks.c,905 :: 		Spi1_write(0x70FA + Cal_anout12_3);
	MOV	#28922, W1
	MOV	#90, W0
	ADD	W14, W0, W0
	ADD	W1, [W0], W0
	MOV	W0, W10
	CALL	_SPI1_Write
;MEETKAART_V1_0_joysticks.c,906 :: 		LATD.F9 = 1;
	BSET	LATD, #9
;MEETKAART_V1_0_joysticks.c,907 :: 		}
L_main104:
;MEETKAART_V1_0_joysticks.c,909 :: 		if (receive == 0x4A)//analoog uit 13 0.5V
	MOV.B	[W14+0], W1
	MOV.B	#74, W0
	CP.B	W1, W0
	BRA Z	L__main183
	GOTO	L_main105
L__main183:
;MEETKAART_V1_0_joysticks.c,911 :: 		Uart1_Write_Text("ok\r");
	MOV	#lo_addr(?lstr81_MEETKAART_V1_0_joysticks), W10
	CALL	_UART1_Write_Text
;MEETKAART_V1_0_joysticks.c,912 :: 		receive = 0x00;
	CLR	W0
	MOV.B	W0, [W14+0]
;MEETKAART_V1_0_joysticks.c,913 :: 		LATD.F9 = 0;
	BCLR	LATD, #9
;MEETKAART_V1_0_joysticks.c,914 :: 		Spi1_write(0x30FA + Cal_anout13_3);
	MOV	#12538, W1
	MOV	#96, W0
	ADD	W14, W0, W0
	ADD	W1, [W0], W0
	MOV	W0, W10
	CALL	_SPI1_Write
;MEETKAART_V1_0_joysticks.c,915 :: 		LATD.F9 = 1;
	BSET	LATD, #9
;MEETKAART_V1_0_joysticks.c,916 :: 		}
L_main105:
;MEETKAART_V1_0_joysticks.c,920 :: 		if (receive == 0x4B)//analoog uit 14 0.5V
	MOV.B	[W14+0], W1
	MOV.B	#75, W0
	CP.B	W1, W0
	BRA Z	L__main184
	GOTO	L_main106
L__main184:
;MEETKAART_V1_0_joysticks.c,922 :: 		Uart1_Write_Text("ok\r");
	MOV	#lo_addr(?lstr82_MEETKAART_V1_0_joysticks), W10
	CALL	_UART1_Write_Text
;MEETKAART_V1_0_joysticks.c,923 :: 		receive = 0x00;
	CLR	W0
	MOV.B	W0, [W14+0]
;MEETKAART_V1_0_joysticks.c,924 :: 		LATD.F9 = 0;
	BCLR	LATD, #9
;MEETKAART_V1_0_joysticks.c,925 :: 		Spi1_write(0x20FA + Cal_anout14_3);
	MOV	#8442, W1
	MOV	#102, W0
	ADD	W14, W0, W0
	ADD	W1, [W0], W0
	MOV	W0, W10
	CALL	_SPI1_Write
;MEETKAART_V1_0_joysticks.c,926 :: 		LATD.F9 = 1;
	BSET	LATD, #9
;MEETKAART_V1_0_joysticks.c,927 :: 		}
L_main106:
;MEETKAART_V1_0_joysticks.c,929 :: 		if (receive == 0x4C)//analoog uit 15 0.5V
	MOV.B	[W14+0], W1
	MOV.B	#76, W0
	CP.B	W1, W0
	BRA Z	L__main185
	GOTO	L_main107
L__main185:
;MEETKAART_V1_0_joysticks.c,931 :: 		Uart1_Write_Text("ok\r");
	MOV	#lo_addr(?lstr83_MEETKAART_V1_0_joysticks), W10
	CALL	_UART1_Write_Text
;MEETKAART_V1_0_joysticks.c,932 :: 		receive = 0x00;
	CLR	W0
	MOV.B	W0, [W14+0]
;MEETKAART_V1_0_joysticks.c,933 :: 		LATD.F9 = 0;
	BCLR	LATD, #9
;MEETKAART_V1_0_joysticks.c,934 :: 		Spi1_write(0x10FA + Cal_anout15_3);
	MOV	#4346, W1
	MOV	#108, W0
	ADD	W14, W0, W0
	ADD	W1, [W0], W0
	MOV	W0, W10
	CALL	_SPI1_Write
;MEETKAART_V1_0_joysticks.c,935 :: 		LATD.F9 = 1;
	BSET	LATD, #9
;MEETKAART_V1_0_joysticks.c,936 :: 		}
L_main107:
;MEETKAART_V1_0_joysticks.c,941 :: 		if (receive == 0x4D)//analoog uit 16 0.5V
	MOV.B	[W14+0], W1
	MOV.B	#77, W0
	CP.B	W1, W0
	BRA Z	L__main186
	GOTO	L_main108
L__main186:
;MEETKAART_V1_0_joysticks.c,943 :: 		Uart1_Write_Text("ok\r");
	MOV	#lo_addr(?lstr84_MEETKAART_V1_0_joysticks), W10
	CALL	_UART1_Write_Text
;MEETKAART_V1_0_joysticks.c,944 :: 		receive = 0x00;
	CLR	W0
	MOV.B	W0, [W14+0]
;MEETKAART_V1_0_joysticks.c,945 :: 		LATD.F9 = 0;
	BCLR	LATD, #9
;MEETKAART_V1_0_joysticks.c,946 :: 		Spi1_write(0x00FA + Cal_anout16_3);
	MOV	#250, W1
	MOV	#112, W0
	ADD	W14, W0, W0
	ADD	W1, [W0], W0
	MOV	W0, W10
	CALL	_SPI1_Write
;MEETKAART_V1_0_joysticks.c,947 :: 		LATD.F9 = 1;
	BSET	LATD, #9
;MEETKAART_V1_0_joysticks.c,948 :: 		}
L_main108:
;MEETKAART_V1_0_joysticks.c,949 :: 		}
	GOTO	L_main4
;MEETKAART_V1_0_joysticks.c,950 :: 		}
L_end_main:
	POP	W13
	POP	W12
	POP	W11
	POP	W10
	ULNK
L__main_end_loop:
	BRA	L__main_end_loop
; end of _main
