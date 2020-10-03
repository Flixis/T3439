#line 1 "H:/Programming/T3439/TestOK design nieuw/Firmware Manuals/T3439_Tariq/FUNCTIONS.c"
#line 1 "h:/programming/t3439/testok design nieuw/firmware manuals/t3439_tariq/functions.h"



void GET_COMMANDS();
void MOTOR_COMMAND(char* data_get, int data_len);
void GET_CURRENT_POS();
int HEX2COMP(char* hex);
#line 1 "h:/programming/t3439/testok design nieuw/firmware manuals/t3439_tariq/commands.h"





static char COMMAND_GET_POS[10] = "GET_POS";
static char COMMMAND_SET_0_POS[16] = "SET_0_POS";
static char COMMMAND_MV_ABS_0[12] = "MV_ABS_0";
static char COMMMAND_RORAT5[10] = "RORAT5";
static char COMMMAND_ROLAT5[10] = "ROLAT5";
static char COMMMAND_STOP[10] = "STOP";


static char COMMAND_START[8] = "START";
static char COMMAND_RESET[8] = "RESET";


static char TOK_OK_SF1[8] = "SF1_OK";



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


static unsigned char SET_0_POS[] = {
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
#line 7 "H:/Programming/T3439/TestOK design nieuw/Firmware Manuals/T3439_Tariq/FUNCTIONS.c"
char receive;
char input[16];
void GET_COMMANDS() {

 if (uart1_Data_Ready()) {
 uart1_read_text(input, "\r\n", sizeof(input));

 if (strcmp(input, COMMAND_GET_POS) == 0) {
 MOTOR_COMMAND(GET_POS, sizeof(GET_POS));
 } else if (strcmp(input, COMMMAND_SET_0_POS) == 0) {
 MOTOR_COMMAND(SET_0_POS, sizeof(SET_0_POS));
 } else if (strcmp(input, COMMMAND_MV_ABS_0) == 0) {
 MOTOR_COMMAND(MV_ABS_0, sizeof(MV_ABS_0));
 } else if (strcmp(input, COMMMAND_RORAT5) == 0) {
 MOTOR_COMMAND(RORAT5, sizeof(RORAT5));
 } else if (strcmp(input, COMMMAND_ROLAT5) == 0) {
 MOTOR_COMMAND(ROLAT5, sizeof(ROLAT5));
 } else if (strcmp(input, COMMAND_START) == 0) {


 MOTOR_COMMAND(ROLAT5, sizeof(ROLAT5));

 } else if (strcmp(input, COMMMAND_STOP) == 0) {
 uart1_write_text("Stopped!");
 MOTOR_COMMAND(STOP, sizeof(STOP));
 } else if (strcmp(input, COMMAND_RESET) == 0) {
 asm {
 reset
 }
 } else {}
 }
}
#line 44 "H:/Programming/T3439/TestOK design nieuw/Firmware Manuals/T3439_Tariq/FUNCTIONS.c"
int i;
void MOTOR_COMMAND(unsigned char * data_get, int data_len) {
 for (i = 0; i < data_len; i++) {

 UART_Set_Active( & UART3_Read, & UART3_Write, & UART3_Data_Ready, & UART3_Tx_Idle);
 UART3_Write(data_get[i]);


 UART_Set_Active( & UART1_Read, & UART1_Write, & UART1_Data_Ready, & UART1_Tx_Idle);
 }
}

int x;
int y;
char data_temp[127];
unsigned char hex[127];
void GET_CURRENT_POS() {
#line 71 "H:/Programming/T3439/TestOK design nieuw/Firmware Manuals/T3439_Tariq/FUNCTIONS.c"
 U1STA.UTXEN = 0;
 U1STA.OERR = 1;
 U3STA.OERR = 1;
 Delay_ms(5);
 U1STA.UTXEN = 1;
 U1STA.OERR = 0;
 U3STA.OERR = 0;
 Motor_Command(GET_POS, sizeof(GET_POS));
#line 84 "H:/Programming/T3439/TestOK design nieuw/Firmware Manuals/T3439_Tariq/FUNCTIONS.c"
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
