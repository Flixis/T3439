#line 1 "//disk1/Maindisk/Archief/M3400/M3439/M3439a/TestOK design nieuw/Firmware Manuals/T3439_Tariq/T3439.c"
#line 1 "//disk1/maindisk/archief/m3400/m3439/m3439a/testok design nieuw/firmware manuals/t3439_tariq/functions.h"



void MOTOR_COMMAND(char* data_get, int data_len);
void GET_CURRENT_POS(char* Hexoutput);
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
#line 11 "//disk1/Maindisk/Archief/M3400/M3439/M3439a/TestOK design nieuw/Firmware Manuals/T3439_Tariq/T3439.c"
char receive;
char input[8];


char CompileDate[] =  "Oct 23 2020" ;
char CompileTime[] =  "10:46:22" ;

int _flag_1 = 1;
int _flag_2 = 0;
int _flag_3 = 0;
int _flag_4 = 0;
int _flag_5 = 0;
int _flag_6 = 0;


char Pos1data[] = {""};
char Pos2data[] = {""};
char Pos3data[] = {""};
char Pos4data[] = {""};
char Pos5data[] = {""};
char Pos6data[] = {""};


void interrupt1() iv 0x000003C ics ICS_AUTO {

 if (_flag_1 == 1) {
 GET_CURRENT_POS(Pos1data);
 delay_ms(500);
 _flag_1 = 0;
 _flag_2 = 1;



 IFS1.INT1IF = 0;
 IEC1.INT1IE = 0;
 IEC1.INT2IE = 1;
 }
 if (_flag_4 == 1) {
 GET_CURRENT_POS(Pos4data);
 _flag_4 = 0;
 _flag_5 = 1;


 IFS1.INT1IF = 0;
 IEC1.INT1IE = 0;
 IEC3.INT3IE = 1;
 }
}


void interrupt2_low() iv 0x000004E ics ICS_AUTO {

 if (PORTD.F4 == 1 && _flag_2 == 1) {
 GET_CURRENT_POS(Pos2data);
 _flag_2 = 0;
 _flag_3 = 1;
 delay_ms(300);
 Motor_Command(RORAT5, sizeof(RORAT5));

 IFS1.INT2IF = 0;
 INTCON2.INT2EP = 1;
 }
 if (PORTD.F4 == 0 && _flag_3 == 1) {
 GET_CURRENT_POS(Pos3data);
 _flag_3 = 0;
 _flag_4 = 1;

 IEC1.INT2IE = 0;
 IEC1.INT1IE = 1;

 }

}

void interrupt3() iv 0x000007E ics ICS_AUTO {

 if (PORTD.F5 == 1 && _flag_5 == 1) {
 GET_CURRENT_POS(Pos5data);
 _flag_5 = 0;
 _flag_6 = 1;
 delay_ms(300);
 Motor_Command(ROLAT5, sizeof(ROLAT5));

 IFS1.INT3IF = 0;
 INTCON2.INT3EP = 1;
 }
 if (PORTD.F5 == 0 && _flag_6 == 1) {
 GET_CURRENT_POS(Pos6data);
 _flag_6 = 0;
 delay_ms(50);
 Motor_Command(STOP, sizeof(STOP));

 IEC3.INT3IE = 0;
 IEC1.INT1IE = 1;
 delay_ms(500);
 asm {
 reset
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


 INTCON1.NSTDIS = 0;

 IEC3.INT3IE = 0;
 IEC1.INT2IE = 0;
 IEC1.INT1IE = 1;

 while (1) {

 if (UART1_Data_Ready() > 0) {
 uart1_read_text(input, "\r\n", 16);


 if (strcmp(input, COMMAND_START) == 0) {
 Motor_Command(ROLAT5, sizeof(ROLAT5));
 } else if (strcmp(input, COMMMAND_STOP) == 0) {
 uart1_write_text("Stopped!");
 Motor_Command(STOP, sizeof(STOP));
 } else if (strcmp(input, COMMAND_RESET) == 0) {
 asm {
 reset
 }
 } else {


 }
 }
 }

}
