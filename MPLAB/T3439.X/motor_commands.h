/* 
 * File:   motor commands
 * Author: Tariq Dinmohamed
 * Comments:
 * Revision history: 
 */

// This is a guard condition so that contents of this file are not included
// more than once.  
#ifndef _MOTOR_COMMANDS_H
#define	_MOTOR_COMMANDS_H

#include <xc.h> // include processor files - each processor file is guarded.  
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
static unsigned char SET_POS[] = {
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

//Rotate right @ 3 speed
static unsigned char RORAT3[] = {
  0x01,
  0x01,
  0x00,
  0x00,
  0x00,
  0x00,
  0x00,
  0x03,
  0x05
};

//Rotate right @ 1 speed
static unsigned char RORAT1[] = {
  0x01,
  0x01,
  0x00,
  0x00,
  0x00,
  0x00,
  0x00,
  0x01,
  0x03
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

//Rotate Left @ 1 speed
static unsigned char ROLAT1[] = {
  0x01,
  0x02,
  0x00,
  0x00,
  0x00,
  0x00,
  0x00,
  0x01,
  0x04
};

//Stop motor
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



// TODO Insert declarations or function prototypes (right here) to leverage 
// live documentation

#ifdef	__cplusplus
extern "C" {
#endif /* __cplusplus */

    // TODO If C++ is being used, regular C code needs function names to have C 
    // linkage so the functions can be used by the c code. 

#ifdef	__cplusplus
}
#endif /* __cplusplus */

#endif	/* XC_HEADER_TEMPLATE_H */

