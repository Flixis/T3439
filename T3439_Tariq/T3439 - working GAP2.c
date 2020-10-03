/*Code written by Tariq Dinmohamed*/

/* Definitions I/O to int */
int Safety1;
int Safety3;
int Nullstand;


/* Definitions Chars/ints for calculations related to UART*/
//Char for receiving
char receive;
char input[16] = "";

//char for receiving data from uart3
unsigned char hex;
char hextostring;


/*Command Definitions*/

//Commands if statements
char COMMAND_GET_POS[20] = "GET_POS";
char COMMMAND_RORAT5[20] = "RORAT5";

//Commands
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

//Version control
char CompileDate[] = __DATE__;
char CompileTime[] = __TIME__;

//Processing Hex to string over uart1
int i;
void Motor_Command(unsigned char * data_get, int data_len) {
  for (i = 0; i < data_len; i++) {
    //Debug UART1
    UART_Set_Active( & UART1_Read, & UART1_Write, & UART1_Data_Ready, & UART1_Tx_Idle);
    UART1_Write(data_get[i]);
    //Motor driver
    UART_Set_Active( & UART3_Read, & UART3_Write, & UART3_Data_Ready, & UART3_Tx_Idle);
    UART3_Write(data_get[i]);
  }
}

void Debug_Command(unsigned char * data_get, int data_len) {
  for (i = 0; i < data_len; i++) {
    //Debug UART1
    UART1_Write(data_get[i]);
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
  Lock_IOLOCK();

  U1RXREG = 0;
  U3RXREG = 0;

  //Compile date and time
  Delay_ms(3000);
  UART1_Write_text(CompileDate);
  UART1_Write_Text(" ");
  UART1_Write_text(CompileTime);
  UART1_Write_Text("\r\n");

  while (1) {
    
    //If there is data in uart3 buffer read it out till buffer is empty.
    if(uart3_data_ready() > 0) {
     for(i=0; i < uart3_data_ready(); i++){
      hex = uart3_read();
      uart1_write(hex);
      //trying to convert hex values coming out of the motor driver to int or str. This can then be used in Test-Track for conversion to degrees.
      hextostring = xtoi(hex);
      uart1_write_text(hextostring);
     }
    }

    //if there is data do something.
    if (uart1_Data_Ready() > 0) {
      uart1_read_text(input, "\r\n", 20); // Read String data up to 10th charachter if \r if found stop looking and put data in input.
      //compare what we got in input to whatever we define as a commmand up at the variables.
      if (strcmp(input, COMMAND_GET_POS) == 0) {
        Motor_Command(GET_POS, sizeof(GET_POS));
        //Read the value from the motor driver
        UART_Set_Active( & UART3_Read, & UART3_Write, & UART3_Data_Ready, & UART3_Tx_Idle);

      } else if (strcmp(input, COMMMAND_RORAT5) == 0) {
        Motor_Command(RORAT5, sizeof(RORAT5));
      } else {
        uart1_write_text("Unrecognized command: "); //Failed to recognize.
        uart1_write_text(input); //output failed command.
      }
    }
  }
}