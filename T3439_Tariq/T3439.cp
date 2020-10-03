#line 1 "H:/Programming/T3439/TestOK design nieuw/Firmware Manuals/T3439_Tariq/T3439.c"
#line 1 "h:/programming/mikroc pro for dspic/include/stdbool.h"



 typedef char _Bool;
#line 1 "h:/programming/t3439/testok design nieuw/firmware manuals/t3439_tariq/functions.h"



void GET_COMMANDS();
void Motor_Command(char* data_get, int data_len);
void GET_CURRENT_POS();
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
#line 10 "H:/Programming/T3439/TestOK design nieuw/Firmware Manuals/T3439_Tariq/T3439.c"
char CompileDate[] =  "Oct  3 2020" ;
char CompileTime[] =  "17:48:57" ;


void interrupt1() iv 0x000003C ics ICS_AUTO {

 IFS1.INT1IF = 0;
 if (PORTD.F3 == 1) {
#line 23 "H:/Programming/T3439/TestOK design nieuw/Firmware Manuals/T3439_Tariq/T3439.c"
 Motor_Command(STOP, sizeof(STOP));
 Delay_ms(25);
 GET_CURRENT_POS();
 Delay_ms(25);
 Motor_Command(SET_0_POS, sizeof(SET_0_POS));
 Delay_ms(25);
 Motor_Command(ROLAT5, sizeof(ROLAT5));


 IFS1.INT1IF = 0;

 IEC1.INT1IE = 0;
 IEC1.INT2IE = 1;
 }

}


void interrupt2_low() iv 0x000004E ics ICS_AUTO {

 if (PORTD.F4 == 1) {
#line 49 "H:/Programming/T3439/TestOK design nieuw/Firmware Manuals/T3439_Tariq/T3439.c"
 Motor_Command(STOP, sizeof(STOP));


 IEC1.INT2IE = 0;
 IEC3.INT3IE = 1;
 }
}

void interrupt3() iv 0x000007E ics ICS_AUTO {

 if (PORTD.F5 == 1) {

 Motor_Command(STOP, sizeof(STOP));


 IFS1.INT3IF = 0;
 IEC3.INT3IE = 0;
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

 Delay_ms(1500);
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


 INTCON1.NSTDIS = 0;

 IEC3.INT3IE = 0;
 IEC1.INT2IE = 0;
 IEC1.INT1IE = 1;

 while (1) {

 GET_COMMANDS();

 }
}
