#ifndef COMMANDS_H
#define COMMANDS_H
/*Command Definitions*/

//Commands if statements
static char COMMAND_GET_POS[10] = "GET_POS";
static char COMMMAND_SET_0_POS[16] = "SET_0_POS";
static char COMMMAND_MV_ABS_0[12] = "MV_ABS_0";
static char COMMMAND_RORAT5[10] = "RORAT5";
static char COMMMAND_ROLAT5[10] = "ROLAT5";
static char COMMMAND_STOP[10] = "STOP";

//Commands that stars the normal testing sequence
static char COMMAND_START[8] = "START";
static char COMMAND_RESET[8] = "RESET";


//Commands Motor driver
//Get current encoder position
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

//Set zero point
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

//Move to absolute 0
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

//Rotate right @ 5 speed
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

//Rotate Left @ 5 speed
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

#endif