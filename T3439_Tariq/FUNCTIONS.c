#include "FUNCTIONS.H"

#include "COMMANDS.H"


/* Definitions Chars/ints for calculations related to UART*/

/*This function is to make the Hex commands somewhat usuable and readable in the code.
It just loops over the Hex values in the Array, Making sure to get all data by using sizeof().
Then it just prints it over uartX.
*/
int i;
void MOTOR_COMMAND(unsigned char * data_get, int data_len) {
  for (i = 0; i < data_len; i++) {
    //Motor driver
    UART_Set_Active( & UART3_Read, & UART3_Write, & UART3_Data_Ready, & UART3_Tx_Idle);
    UART3_Write(data_get[i]);

    //Reset UART1 back to active
    UART_Set_Active( & UART1_Read, & UART1_Write, & UART1_Data_Ready, & UART1_Tx_Idle);
  }
}

int x;
int y;
char data_temp[127]; 
unsigned char hex[127];
void GET_CURRENT_POS() {

  /*So an important thing about this device is that the motor driver is constantly sending out data over it's uart.
  This means that the UART.OERR(overflow bit) is set to true, because the receive buffer is overflown.
  You must first clear this, BUT this must be done in quick succession if not, you'll end up receiving "Fake data".
  Fake date being data that almost looks like the real data, except some of the bytes are either inverted or just simply +X amount in value.
  Anyway, what you're seeing below is a bunch of clearing for UART registers, and then quickly enabling them again.
  This acts as a clear command for the UART buffers. After this is done I send the command and receive whatever data comes in.
  I move this data from buffer to memory and print it to uart to prevent another overflow.
  Funny enough, an overflow still occurs, but not before all the correct data is sent over uart1.
  */
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
      hex[i] = uart3_read();
      uart1_write(hex[i]);
	  x++;
    }
  }
}

int HEX2COMP(char * hex) {
  int value = 0, counter = 1;
  for (counter = 1; counter < 18; counter++) {
    switch (hex[counter]) {
    case '0':
      value = value << 4;
      break;
    case '1':
      value = (value << 4) + 1;
      break;
    case '2':
      value = (value << 4) + 2;
      break;
    case '3':
      value = (value << 4) + 3;
      break;
    case '4':
      value = (value << 4) + 4;
      break;
    case '5':
      value = (value << 4) + 5;
      break;
    case '6':
      value = (value << 4) + 6;
      break;
    case '7':
      value = (value << 4) + 7;
      break;
    case '8':
      value = (value << 4) + 8;
      break;
    case '9':
      value = (value << 4) + 9;
      break;
    case 'A':
      value = (value << 4) + 10;
      break;
    case 'B':
      value = (value << 4) + 11;
      break;
    case 'C':
      value = (value << 4) + 12;
      break;
    case 'D':
      value = (value << 4) + 13;
      break;
    case 'E':
      value = (value << 4) + 14;
      break;
    case 'F':
      value = (value << 4) + 15;
      break;
    default:
      break;
    }
  }
  return value;
}