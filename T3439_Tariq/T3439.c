//Note! This is a custom stdbool.h file, the normal compiler doesn't support boolean type. Can be found under Header/ folder.
#include <stdbool.h>


/*Code written by Tariq Dinmohamed*/
bool Debug = false;
bool TestMode = true;

/* Definitions I/O to int */
int Safety1;
int Safety3;
int Nullstand;

/* Definitions Chars/ints for calculations related to UART*/
//Char for receiving
char receive;
char input[16] = "";

//random assortment of VARs used all over the damn place
unsigned char hex[127];
char nutsdeez[127];
int x;
int completedtask = 0;

/*Command Definitions*/

//Commands if statements
char COMMAND_GET_POS[10] = "GET_POS";
char COMMMAND_SET_0_POS[16] = "SET_0_POS";
char COMMMAND_MV_ABS_0[12] = "MV_ABS_0";
char COMMMAND_RORAT5[10] = "RORAT5";
char COMMMAND_ROLAT5[10] = "ROLAT5";
char COMMMAND_STOP[10] = "STOP";

//Commands that stars the normal testing sequence
char COMMAND_START[8] = "START";
char COMMAND_RESET[8] = "RESET";

//Test-Track response
char TOK_OK_SF1[8] = "SF1_OK";

//Commands Motor driver
//Get current encoder position
unsigned char GET_POS[] = {
  0x01,
  0x06,
  0x01,
  0x00,
  0x00,
  0x00,
  0x00,
  0x00,
  0x08
};

//Set zero point
unsigned char SET_0_POS[] = {
  0x01,
  0x05,
  0x01,
  0x00,
  0x00,
  0x00,
  0x00,
  0x00,
  0x07
};

//Move to absolute 0
unsigned char MV_ABS_0[] = {
  0x01,
  0x04,
  0x00,
  0x00,
  0x00,
  0x00,
  0x00,
  0x00,
  0x05
};

//Rotate right @ 5 speed
unsigned char RORAT5[] = {
  0x01,
  0x01,
  0x00,
  0x00,
  0x00,
  0x00,
  0x00,
  0x05,
  0x07
};

//Rotate Left @ 5 speed
unsigned char ROLAT5[] = {
  0x01,
  0x02,
  0x00,
  0x00,
  0x00,
  0x00,
  0x00,
  0x05,
  0x08
};

unsigned char STOP[] = {
  0x01,
  0x03,
  0x00,
  0x00,
  0x00,
  0x00,
  0x00,
  0x0a,
  0x0e
};

//Version control only relevant if Debug is enabled
char CompileDate[] = __DATE__;
char CompileTime[] = __TIME__;

/*This function is to make the Hex commands somewhat usuable and readable in the code.
It just loops over the Hex values in the Array, Making sure to get all data by using sizeof().
Then it just prints it over uartX.
*/
int i;
void Motor_Command(unsigned char * data_get, int data_len) {
  for (i = 0; i < data_len; i++) {
    if (Debug) {
      //Debug UART1
      UART_Set_Active( & UART1_Read, & UART1_Write, & UART1_Data_Ready, & UART1_Tx_Idle);
      UART1_Write(data_get[i]);
    }
    //Motor driver
    UART_Set_Active( & UART3_Read, & UART3_Write, & UART3_Data_Ready, & UART3_Tx_Idle);
    UART3_Write(data_get[i]);

    //Reset UART1 back to active
    UART_Set_Active( & UART1_Read, & UART1_Write, & UART1_Data_Ready, & UART1_Tx_Idle);
  }
}

int hex_to_signed_2_complement(char hexdata){

}


void GET_CURRENT_POS(){
    U1STA.UTXEN = 0;
    U1STA.OERR = 1;
    U3STA.OERR = 1;
    Delay_ms(5);
    U1STA.UTXEN = 1;
    U1STA.OERR = 0;
    U3STA.OERR = 0;
    Motor_Command(GET_POS, sizeof(GET_POS));

    while (x <= 9) {
      for (i = 0; i < uart3_data_ready(); i++) {
        hex[i] = uart3_read();
        //uart1_write(hex[i]);
        

        ByteToHex(hex[i],nutsdeez[i]);
        
        
        
        x++;
      }
    }


    
}


//First interrupt mapped, Get from register 0x000003C(defined by datasheet). ICS is left at auto.
void interrupt1() iv 0x000003C ics ICS_AUTO {
  //Clear the interrupt flag
  IFS1.INT1IF = 0;
  Delay_ms(10);
  if (Debug) {
    UART1_Write_Text("Triggered Null\n\r");
  }

  if (PORTD.F3 == 1 && TestMode) {
    /*When conditions are met,
    First we STOP the motor on the 0 point of the PCB.
    Then we set the current pos of the Motor to the 0 point of the encoder.
    Then we move the UUT to the left and wait for the safety line to trigger, in this instance safety line 1.
    */
    Motor_Command(STOP, sizeof(STOP));
        GET_CURRENT_POS();
        
        
        
        
        

    Delay_ms(100);
    Motor_Command(SET_0_POS, sizeof(SET_0_POS));
    Delay_ms(100);
    Motor_Command(ROLAT5, sizeof(ROLAT5));

    //Clear interrupt flag:
    IFS1.INT1IF = 0; // Clear interrupt nul bit
    //Disable interrupt 1 and enable interrupt 2
    IEC1.INT1IE = 0; // Disable interrupt nul bit
    IEC1.INT2IE = 1; // Enable interrupt saftey 2
  }

}

//Second interrupt mapped, Get from register 0x000004E(defined by datasheet). ICS is left at auto.
void interrupt2_low() iv 0x000004E ics ICS_AUTO {

  if (Debug) {
    UART1_Write_Text("Triggered Safety 1\r");
  }

  if (PORTD.F4 == 1 && TestMode) {
    /*When conditions are met,
    Stop the motor, get the current position of the driver.
    Print this data over UART1 to Test-Track. Test-Track will process this data and confirm wheter or not the UUT has triggerd at the right Pos.
    if this is OK move the UUT to the right.
    */
    Motor_Command(STOP, sizeof(STOP));

    /*So an important thing about this device is that the motor driver is constantly sending out data over it's uart.
    This means that the UART.OERR(overflow bit) is set to true, because the receive buffer is overflown.
    You must first clear this, BUT this must be done in quick succession if not, you'll end up receiving "Fake data".
    Fake date being data that almost looks like the real data, except some of the bytes are either inverted or just simply +X amount in value.
    Anyway, what you're seeing below is a bunch of clearing for UART registers, and then quickly enabling them again.
    This acts as a clear command for the UART buffers. After this is done I send the command and receive whatever data comes in.
    I move this data from buffer to memory and print it to uart to prevent another overflow.
    Funny enough, an overflow still occurs, but not before all the correct data is sent over uart1.
    */
    //Get current POS
    U1STA.UTXEN = 0;
    U1STA.OERR = 1;
    U3STA.OERR = 1;
    Delay_ms(5);
    U1STA.UTXEN = 1;
    U1STA.OERR = 0;
    U3STA.OERR = 0;
    Motor_Command(GET_POS, sizeof(GET_POS));

    /*Move this to a seperate interrupt handeler this could fix the UART problems.
    Get the Test-Track OK signal before moving the UUT.
    Am also only interested in the first 9 bytes. Everything else is junkerino.
    */
    while (x <= 9) {
      for (i = 0; i < uart3_data_ready(); i++) {
        hex[9] = uart3_read();
        uart1_write(hex);
        x++;
        if (x >= 8) {
          completedtask = 1;
        }
      }

    }
    /*After sending out the 9 bytes, I wanna confirm on Test-Track that the value is indeed correct before moving on.
    This waits for Test-Track input before moving anywhere.*/
    while (completedtask == 1) {
      if (uart1_data_ready()) {
        uart1_read_text(input, "\r\n", sizeof(input));
        if (strcmp(input, TOK_OK_SF1) == 0) {
          Motor_Command(RORAT5, sizeof(RORAT5));
                  delay_ms(2500);
          IFS1.INT2IF = 0; // Clear interrupt saftey 1 bit
          completedtask = 0;
        }
      }
    }

    //** it is necessary to clear manually the interrupt flag:
    IEC1.INT2IE = 0; // Disable interrupt saftey 1
    IEC3.INT3IE = 1; // Enable interrupt saftey 2
  }
}

void interrupt3() iv 0x000007E ics ICS_AUTO {
        
  if (Debug) {
    UART1_Write_Text("Triggered Safety 2\r");
  }

  if (PORTD.F5 == 1 && TestMode) {

    Motor_Command(STOP, sizeof(STOP));

    //Get current POS
    U1STA.UTXEN = 0;
    U1STA.OERR = 1;
    U3STA.OERR = 1;
    Delay_ms(5);
    U1STA.UTXEN = 1;
    U1STA.OERR = 0;
    U3STA.OERR = 0;
    Motor_Command(GET_POS, sizeof(GET_POS));

    while (x <= 9) {
      for (i = 0; i < uart3_data_ready(); i++) {
        hex[9] = uart3_read();
        uart1_write(hex);
        x++;
        if (x >= 8) {
          completedtask = 1;
        }
      }

    }

    //** it is necessary to clear manually the interrupt flag:
    IFS1.INT3IF = 0; // Clear interrupt saftey 2 bit
    IEC3.INT3IE = 0; // Disable interrupt saftey 2           
  }

}

void Get_Command() {
  //if there is data do something.
  if (uart1_Data_Ready()) {
    char input[20];
    uart1_read_text(input, "\r\n", sizeof(input)); // Read String data up to 10th charachter if \r if found stop looking and put data in input.
    //compare what we got in input to whatever we define as a commmand up at the variables.
    if (strcmp(input, COMMAND_GET_POS) == 0) {
      Motor_Command(GET_POS, sizeof(GET_POS));
    } else if (strcmp(input, COMMMAND_SET_0_POS) == 0) {
      Motor_Command(SET_0_POS, sizeof(SET_0_POS));
    } else if (strcmp(input, COMMMAND_MV_ABS_0) == 0) {
      Motor_Command(MV_ABS_0, sizeof(MV_ABS_0));
    } else if (strcmp(input, COMMMAND_RORAT5) == 0) {
      Motor_Command(RORAT5, sizeof(RORAT5));
    } else if (strcmp(input, COMMMAND_ROLAT5) == 0) {
      Motor_Command(ROLAT5, sizeof(ROLAT5));
    } else if (strcmp(input, COMMAND_START) == 0) {

      /*Actual T3439 testing routine*/
      //Start by moving the UUT right
      Motor_Command(ROLAT5, sizeof(ROLAT5));
      delay_ms(1000);

    } else if (strcmp(input, COMMMAND_STOP) == 0) {
      uart1_write_text("Stopped!");
      Motor_Command(STOP, sizeof(STOP));
    } else if (strcmp(input, COMMAND_RESET) == 0) {
      asm {
        reset
      }
    } else {
      if (Debug)
        uart1_write_text("Unrecognized command: "); //Failed to recognize.
      uart1_write_text(input); //output failed command.
      input[20] = 0;
    }
  }
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
  ANSB = 0x0000;

  //Init of UART at 9600 Baudrate
  UART1_Init(9600);
  UART3_Init(9600);

  Delay_ms(3000);
  LATB.F8 = 1;

  Unlock_IOLOCK();
  //UART 1 for device to PC
  PPS_Mapping_NoLock(28, _INPUT, _U1RX); // Sets pin 15 to be Input, and maps RX3/DT3 Input to it
  PPS_Mapping_NoLock(18, _OUTPUT, _U1TX); // Sets pin 5 to be Output

  //UART3 for device to stepperdriver
  PPS_Mapping_NoLock(14, _INPUT, _U3RX); // Sets pin 15 to be Input, and maps RX3/DT3 Input to it
  PPS_Mapping_NoLock(29, _OUTPUT, _U3TX); // Sets pin 5 to be Output

  //interrupt to remappable pins
  PPS_Mapping_NoLock(22, _INPUT, _INT1); // Sets pin 22 to be Input, and maps interrupt
  PPS_Mapping_NoLock(25, _INPUT, _INT2); // Sets pin 25 to be Input, and maps interrupt
  PPS_Mapping_NoLock(20, _INPUT, _INT3); // Sets pin 20 to be Input, and maps interrupt

  Lock_IOLOCK();

  //Clear UART receive register after assigning pinout
  U1RXREG = 0;
  U3RXREG = 0;

  //Interrupt nesting enable
  INTCON1.NSTDIS = 0;
  //Interrupt enable bits
  IEC3.INT3IE = 0; // Disable interrupt saftey 2
  IEC1.INT2IE = 0; // Disable interrupt saftey 1
  IEC1.INT1IE = 1; //Nul ENABLE TO START TEST

  //Compile date and time printout , it's inside an if statement to prevent multiple prints after an interrupt occurs.
  if (debug) {
    Delay_ms(3000);
    UART1_Write_text(CompileDate);
    UART1_Write_Text(" ");
    UART1_Write_text(CompileTime);
    UART1_Write_Text("\r\n");
  }

  while (true) {

    Get_Command();

  }
}