#line 1 "H:/Programming/T3439/TestOK design nieuw/Firmware Manuals/T3439_Tariq/T3439.c"
#line 1 "h:/programming/mikroc pro for dspic/include/stdbool.h"



 typedef char _Bool;
#line 6 "H:/Programming/T3439/TestOK design nieuw/Firmware Manuals/T3439_Tariq/T3439.c"
 _Bool  Debug =  0 ;
 _Bool  TestMode =  1 ;


int Safety1;
int Safety3;
int Nullstand;



char receive;
char input[16] = "";


unsigned char hex[127];
char nutsdeez[127];
int x;
int completedtask = 0;




char COMMAND_GET_POS[10] = "GET_POS";
char COMMMAND_SET_0_POS[16] = "SET_0_POS";
char COMMMAND_MV_ABS_0[12] = "MV_ABS_0";
char COMMMAND_RORAT5[10] = "RORAT5";
char COMMMAND_ROLAT5[10] = "ROLAT5";
char COMMMAND_STOP[10] = "STOP";


char COMMAND_START[8] = "START";
char COMMAND_RESET[8] = "RESET";


char TOK_OK_SF1[8] = "SF1_OK";



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


char CompileDate[] =  "Oct  3 2020" ;
char CompileTime[] =  "14:48:56" ;
#line 128 "H:/Programming/T3439/TestOK design nieuw/Firmware Manuals/T3439_Tariq/T3439.c"
int i;
void Motor_Command(unsigned char * data_get, int data_len) {
 for (i = 0; i < data_len; i++) {
 if (Debug) {

 UART_Set_Active( & UART1_Read, & UART1_Write, & UART1_Data_Ready, & UART1_Tx_Idle);
 UART1_Write(data_get[i]);
 }

 UART_Set_Active( & UART3_Read, & UART3_Write, & UART3_Data_Ready, & UART3_Tx_Idle);
 UART3_Write(data_get[i]);


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



 ByteToHex(hex[i],nutsdeez[i]);



 x++;
 }
 }



}



void interrupt1() iv 0x000003C ics ICS_AUTO {

 IFS1.INT1IF = 0;
 Delay_ms(10);
 if (Debug) {
 UART1_Write_Text("Triggered Null\n\r");
 }

 if (PORTD.F3 == 1 && TestMode) {
#line 194 "H:/Programming/T3439/TestOK design nieuw/Firmware Manuals/T3439_Tariq/T3439.c"
 Motor_Command(STOP, sizeof(STOP));
 GET_CURRENT_POS();






 Delay_ms(100);
 Motor_Command(SET_0_POS, sizeof(SET_0_POS));
 Delay_ms(100);
 Motor_Command(ROLAT5, sizeof(ROLAT5));


 IFS1.INT1IF = 0;

 IEC1.INT1IE = 0;
 IEC1.INT2IE = 1;
 }

}


void interrupt2_low() iv 0x000004E ics ICS_AUTO {

 if (Debug) {
 UART1_Write_Text("Triggered Safety 1\r");
 }

 if (PORTD.F4 == 1 && TestMode) {
#line 229 "H:/Programming/T3439/TestOK design nieuw/Firmware Manuals/T3439_Tariq/T3439.c"
 Motor_Command(STOP, sizeof(STOP));
#line 241 "H:/Programming/T3439/TestOK design nieuw/Firmware Manuals/T3439_Tariq/T3439.c"
 U1STA.UTXEN = 0;
 U1STA.OERR = 1;
 U3STA.OERR = 1;
 Delay_ms(5);
 U1STA.UTXEN = 1;
 U1STA.OERR = 0;
 U3STA.OERR = 0;
 Motor_Command(GET_POS, sizeof(GET_POS));
#line 254 "H:/Programming/T3439/TestOK design nieuw/Firmware Manuals/T3439_Tariq/T3439.c"
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
#line 267 "H:/Programming/T3439/TestOK design nieuw/Firmware Manuals/T3439_Tariq/T3439.c"
 while (completedtask == 1) {
 if (uart1_data_ready()) {
 uart1_read_text(input, "\r\n", sizeof(input));
 if (strcmp(input, TOK_OK_SF1) == 0) {
 Motor_Command(RORAT5, sizeof(RORAT5));
 delay_ms(2500);
 IFS1.INT2IF = 0;
 completedtask = 0;
 }
 }
 }


 IEC1.INT2IE = 0;
 IEC3.INT3IE = 1;
 }
}

void interrupt3() iv 0x000007E ics ICS_AUTO {

 if (Debug) {
 UART1_Write_Text("Triggered Safety 2\r");
 }

 if (PORTD.F5 == 1 && TestMode) {

 Motor_Command(STOP, sizeof(STOP));


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


 IFS1.INT3IF = 0;
 IEC3.INT3IE = 0;
 }

}

void Get_Command() {

 if (uart1_Data_Ready()) {
 char input[20];
 uart1_read_text(input, "\r\n", sizeof(input));

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
 uart1_write_text("Unrecognized command: ");
 uart1_write_text(input);
 input[20] = 0;
 }
 }
}


void main() {


 TRISB = 0x7EEF;
 TRISC = 0xFFFF;
 TRISD = 0xFFFF;
 TRISE = 0xFFFF;
 TRISF = 0x0000;
 TRISG = 0xFFF3;
 ANSD = 0x0000;
 ANSB = 0x0000;


 UART1_Init(9600);
 UART3_Init(9600);

 Delay_ms(3000);
 LATB.F8 = 1;

 Unlock_IOLOCK();

 PPS_Mapping_NoLock(28, _INPUT, _U1RX);
 PPS_Mapping_NoLock(18, _OUTPUT, _U1TX);


 PPS_Mapping_NoLock(14, _INPUT, _U3RX);
 PPS_Mapping_NoLock(29, _OUTPUT, _U3TX);


 PPS_Mapping_NoLock(22, _INPUT, _INT1);
 PPS_Mapping_NoLock(25, _INPUT, _INT2);
 PPS_Mapping_NoLock(20, _INPUT, _INT3);

 Lock_IOLOCK();


 U1RXREG = 0;
 U3RXREG = 0;


 INTCON1.NSTDIS = 0;

 IEC3.INT3IE = 0;
 IEC1.INT2IE = 0;
 IEC1.INT1IE = 1;


 if (debug) {
 Delay_ms(3000);
 UART1_Write_text(CompileDate);
 UART1_Write_Text(" ");
 UART1_Write_text(CompileTime);
 UART1_Write_Text("\r\n");
 }

 while ( 1 ) {

 Get_Command();

 }
}