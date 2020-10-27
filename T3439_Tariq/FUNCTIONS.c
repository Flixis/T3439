#include "COMMANDS.h"
/*This function is to make the Hex commands somewhat usuable and readable in the code.
It just loops over the Hex values in the Array, Making sure to get all data by using sizeof().
Then it just prints it over uartX.
*/
char destroy;
int i;
void MOTOR_COMMAND(unsigned char * data_get, int data_len) {
  for (i = 0; i < data_len; i++) {
    //Motor driver
    UART_Set_Active( & UART3_Read, & UART3_Write, & UART3_Data_Ready, & UART3_Tx_Idle);
    UART3_Write(data_get[i]);
    destroy = UART3_read();

    //Reset UART1 back to active
    UART_Set_Active( & UART1_Read, & UART1_Write, & UART1_Data_Ready, & UART1_Tx_Idle);
  }
}



int x;
void GET_CURRENT_POS(char* Hexoutput){
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
    
    x=1;
    while (x <= 9) {
      for (i = 0; i < uart3_Data_ready(); i++) {
        Hexoutput[i] = uart3_read();
        uart1_write(Hexoutput[i]);
        x++;
      }
    }

    
    
}