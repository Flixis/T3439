#line 1 "H:/Programming/T3439/TestOK design nieuw/Firmware Manuals/T3439_Tariq/INTERRUPTS.c"
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
#line 1 "h:/programming/t3439/testok design nieuw/firmware manuals/t3439_tariq/interrupts.h"



void interrupt1();
void interrupt2();
void interrupt3();

int _temp_flag;
#line 8 "H:/Programming/T3439/TestOK design nieuw/Firmware Manuals/T3439_Tariq/INTERRUPTS.c"
_temp_flag = 0;

void interrupt1() iv 0x000003C ics ICS_AUTO {

 IFS1.INT1IF = 0;
 GET_CURRENT_POS();
 _temp_flag = 1;






}


void interrupt2() iv 0x000004E ics ICS_AUTO {

 IFS1.INT2IF = 0;

 if (PORTD.F4 == 1) {

 MOTOR_COMMAND(STOP, sizeof(STOP));


 IEC1.INT2IE = 0;
 IEC3.INT3IE = 1;
 }
}

void interrupt3() iv 0x000007E ics ICS_AUTO {

 IFS1.INT3IF = 0;

 if (PORTD.F5 == 1) {

 MOTOR_COMMAND(STOP, sizeof(STOP));


 IEC3.INT3IE = 0;
 }


}
