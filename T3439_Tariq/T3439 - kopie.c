/* Definitions I/O to int */

int Safety1;
int Safety2;
int Nullstand;
int USB_Enable;

//chars for receiving data and sending data.
char Receive;
char Input[16] = "";
char Command1[14] = "command1";

//Version control
char CompileDate[] = __DATE__;
char CompileTime[] = __TIME__;

/*interrupt 1 Null*/
void interrupt1() iv 0x000003C ics ICS_AUTO {

  UART1_Write_Text("Triggered Null\n\r");

  //Stop Motor
  UART2_Write(0x01);
  UART2_Write(0x03);
  UART2_Write(0x00);
  UART2_Write(0x00);
  UART2_Write(0x00);
  UART2_Write(0x00);
  UART2_Write(0x00);
  UART2_Write(0x0a);
  UART2_Write(0x0e);
  Delay_ms(1000);

  //Get current position
  UART2_Write(0x01);
  UART2_Write(0x06);
  UART2_Write(0x01);
  UART2_Write(0x00);
  UART2_Write(0x00);
  UART2_Write(0x00);
  UART2_Write(0x00);
  UART2_Write(0x0a);
  UART2_Write(0x08);
  Delay_ms(50);
  U2RXREG = 0;
  U2STA.OERR = 0;
  if (UART2_Data_Ready() == 1)
    receive = UART2_Read();
    UART1_Write(Receive);
    UART1_Write_Text("Data received!\r\n");
    Delay_ms(1000);

  //MVL 5 - Relative rechts
  UART2_Write(0x01);
  UART2_Write(0x02);
  UART2_Write(0x00);
  UART2_Write(0x00);
  UART2_Write(0x00);
  UART2_Write(0x00);
  UART2_Write(0x00);
  UART2_Write(0x05);
  UART2_Write(0x08);
  Delay_ms(2000);

  //** it is necessary to clear manually the interrupt flag:
  IFS1.INT1IF = 0; // Clear interrupt nul bit
  IEC1.INT1IE = 0; // Disable interrupt nul bit
  IEC1.INT2IE = 1; // Enable interrupt saftey 2

}

/*interrupt 1 Saftey*/
void interrupt2() iv 0x000004E ics ICS_AUTO {

  UART1_Write_Text("Triggered Safety 1\r");

  //** user code starts here
  UART2_Write(0x01);
  UART2_Write(0x03);
  UART2_Write(0x00);
  UART2_Write(0x00);
  UART2_Write(0x00);
  UART2_Write(0x00);
  UART2_Write(0x00);
  UART2_Write(0x0a);
  UART2_Write(0x0e);
  Delay_ms(3000);

  //MVR 10 - Relative links
  UART2_Write(0x01);
  UART2_Write(0x01);
  UART2_Write(0x00);
  UART2_Write(0x00);
  UART2_Write(0x00);
  UART2_Write(0x00);
  UART2_Write(0x00);
  UART2_Write(0x05);
  UART2_Write(0x07);
  Delay_ms(2500);

  //** it is necessary to clear manually the interrupt flag:
  IFS1.INT2IF = 0; // Clear interrupt saftey 1 bit
  IEC1.INT2IE = 0; // Disable interrupt saftey 1
  IEC3.INT3IE = 1; // Enable interrupt saftey 2

}

/*interrupt 2 Saftey*/
void interrupt3() iv 0x000007E ics ICS_AUTO {

  UART1_Write_Text("Triggered Safety 2\r");

  //** user code starts here
  UART2_Write(0x01);
  UART2_Write(0x03);
  UART2_Write(0x00);
  UART2_Write(0x00);
  UART2_Write(0x00);
  UART2_Write(0x00);
  UART2_Write(0x00);
  UART2_Write(0x0a);
  UART2_Write(0x0e);
  Delay_ms(3000);

  //** it is necessary to clear manually the interrupt flag:
  IFS1.INT3IF = 0; // Clear interrupt saftey 2 bit
  IEC3.INT3IE = 0; // Disable interrupt saftey 2

}

/* Main Program */
void main() {

  //Setting TRIS&ANS register for pinout
  TRISB = 0x7EEF;
  TRISC = 0xFFFF;
  TRISD = 0xFFFF;
  TRISE = 0xFFFF;
  TRISF = 0x0000;
  TRISG = 0xFFF3;
  ANSD = 0x0000;

  //Init of UART at 9600 Baudrate
  UART1_Init(9600);
  UART2_Init(9600);

  Delay_ms(200);
  LATB.F8 = 1;

  Unlock_IOLOCK();
  //UART 1 for device to PC
  PPS_Mapping_NoLock(28, _INPUT, _U1RX); // Sets pin 15 to be Input, and maps RX2/DT2 Input to it
  PPS_Mapping_NoLock(18, _OUTPUT, _U1TX); // Sets pin 5 to be Output

  //UART2 for device to stepperdriver
  PPS_Mapping_NoLock(14, _INPUT, _U2RX); // Sets pin 15 to be Input, and maps RX2/DT2 Input to it
  PPS_Mapping_NoLock(29, _OUTPUT, _U2TX); // Sets pin 5 to be Output

  //interrupt to remappable pins
  PPS_Mapping_NoLock(22, _INPUT, _INT1); // Sets pin 22 to be Input, and maps interrupt
  PPS_Mapping_NoLock(25, _INPUT, _INT2); // Sets pin 25 to be Input, and maps interrupt
  PPS_Mapping_NoLock(20, _INPUT, _INT3); // Sets pin 20 to be Input, and maps interrupt
  Lock_IOLOCK();

  LATB.F8 = 1;
  Delay_ms(1000);

  //Interrupt nesting enable
  INTCON1.NSTDIS = 0;
  //Interrupt enable bits
  IEC3.INT3IE = 0; // Disable interrupt saftey 2
  IEC1.INT2IE = 0; // Disable interrupt saftey 1
  IEC1.INT1IE = 0; //Nul ENABLE TO START TEST
  Delay_ms(5000);

  //Compile date and time
  UART1_Write_text(CompileDate);
  UART1_Write_Text(" ");
  UART1_Write_text(CompileTime);
  UART1_Write_Text("\r\n");

/*//MVL 10 - Relative rechts
  UART2_Write(0x01);
  UART2_Write(0x02);
  UART2_Write(0x00);
  UART2_Write(0x00);
  UART2_Write(0x00);
  UART2_Write(0x00);
  UART2_Write(0x00);
  UART2_Write(0x0a);
  UART2_Write(0x0d);*/

  while (1) {
	  
      //Get current position
	  UART2_Write(0x01);
	  UART2_Write(0x06);
	  UART2_Write(0x01);
	  UART2_Write(0x00);
	  UART2_Write(0x00);
	  UART2_Write(0x00);
	  UART2_Write(0x00);
	  UART2_Write(0x0a);
	  UART2_Write(0x08);
	  Delay_ms(5000);
	  U2RXREG = 0;
	  U2STA.OERR = 0;
	  if (UART2_Data_Ready() == 1)
		receive = UART2_Read();
		UART1_Write(Receive);
		UART1_Write_Text("Data received!\r\n");
		Delay_ms(1000);

    /*Blinking LED showing that the MCU is stil alive and running*/
    LATF.F2 = 1;
    LATF.F3 = 0;
    Delay_ms(500);
    LATF.F2 = 0;
    LATF.F3 = 1;
    Delay_ms(500);
    
   }
}