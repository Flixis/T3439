#line 1 "//disk1/Maindisk/Archief/M3400/M3439/M3439a/TestOK design nieuw/Firmware Manuals/T3439_Tariq/FUNCTIONS.C"
#line 1 "//disk1/maindisk/archief/m3400/m3439/m3439a/testok design nieuw/firmware manuals/t3439_tariq/commands.h"



static char COMMMAND_RORAT5[8] = "RORAT5";
static char COMMMAND_ROLAT5[8] = "ROLAT5";

static char COMMAND_START[8] = "START";
static char COMMAND_RESET[8] = "RESET";
static char COMMMAND_STOP[8] = "STOP";





static unsigned char GET_POS[] = {
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


static unsigned char MV_ABS_0[] = {
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


static unsigned char RORAT5[] = {
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


static unsigned char ROLAT5[] = {
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

static unsigned char STOP[] = {
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
#line 6 "//disk1/Maindisk/Archief/M3400/M3439/M3439a/TestOK design nieuw/Firmware Manuals/T3439_Tariq/FUNCTIONS.C"
char destroy;
int i;
void MOTOR_COMMAND(unsigned char * data_get, int data_len) {
 for (i = 0; i < data_len; i++) {

 UART_Set_Active( & UART3_Read, & UART3_Write, & UART3_Data_Ready, & UART3_Tx_Idle);
 UART3_Write(data_get[i]);
 destroy = UART3_read();


 UART_Set_Active( & UART1_Read, & UART1_Write, & UART1_Data_Ready, & UART1_Tx_Idle);
 }
}



int x;
void GET_CURRENT_POS(char* Hexoutput){
#line 35 "//disk1/Maindisk/Archief/M3400/M3439/M3439a/TestOK design nieuw/Firmware Manuals/T3439_Tariq/FUNCTIONS.C"
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
