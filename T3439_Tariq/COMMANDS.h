#ifndef COMMANDS_H
#define COMMANDS_H
/*Command Definitions*/
static char COMMMAND_RORAT5[8] = "RORAT5";
static char COMMMAND_ROLAT5[8] = "ROLAT5";
//Commands that stars the normal testing sequence
static char COMMAND_START[8] = "START";
static char COMMAND_RESET[8] = "RESET";
static char COMMMAND_STOP[8] = "STOP";



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