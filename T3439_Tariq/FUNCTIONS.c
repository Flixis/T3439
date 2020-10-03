#include "FUNCTIONS.H"
#include "COMMANDS.H"


/* Definitions Chars/ints for calculations related to UART*/
char receive;
char input[16];
void GET_COMMANDS() {
  //if there is data do something.
  if (uart1_Data_Ready()) {
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
    } else {}
  }
}

/*This function is to make the Hex commands somewhat usuable and readable in the code.
It just loops over the Hex values in the Array, Making sure to get all data by using sizeof().
Then it just prints it over uartX.
*/
int i;
void Motor_Command(unsigned char * data_get, int data_len) {
  for (i = 0; i < data_len; i++) {
    //Motor driver
    UART_Set_Active( & UART3_Read, & UART3_Write, & UART3_Data_Ready, & UART3_Tx_Idle);
    UART3_Write(data_get[i]);

    //Reset UART1 back to active
    UART_Set_Active( & UART1_Read, & UART1_Write, & UART1_Data_Ready, & UART1_Tx_Idle);
  }
}

int x;
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