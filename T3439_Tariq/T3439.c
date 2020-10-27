#include "FUNCTIONS.h"

#include "COMMANDS.h"

/*Code written by Tariq Dinmohamed*/

/*This version works with hand movements, next is adding automated motor movements*/

/* Definitions Chars/ints for calculations related to UART*/
//Char for receiving
char receive;
char input[8];

//Version control
char CompileDate[] = __DATE__;
char CompileTime[] = __TIME__;

int _flag_1 = 1;
int _flag_2 = 0;
int _flag_3 = 0;
int _flag_4 = 0;
int _flag_5 = 0;
int _flag_6 = 0;

//Chars for saving return data
char Pos1data[] = {""};
char Pos2data[] = {""};
char Pos3data[] = {""};
char Pos4data[] = {""};
char Pos5data[] = {""};
char Pos6data[] = {""};

//First interrupt mapped, Get from register 0x000003C(defined by datasheet). ICS is left at auto.
void interrupt1() iv 0x000003C ics ICS_AUTO {

  if (_flag_1 == 1) {
    GET_CURRENT_POS(Pos1data);
    delay_ms(500);
    _flag_1 = 0;
    _flag_2 = 1;

    //Disable interrupt 1 and enable interrupt 2
    //Clear interrupt flag:
    IFS1.INT1IF = 0; // Clear interrupt nul bit
    IEC1.INT1IE = 0; // Disable interrupt nul bit
    IEC1.INT2IE = 1; // Enable interrupt saftey 2
  }
  if (_flag_4 == 1) {
    GET_CURRENT_POS(Pos4data);
    _flag_4 = 0;
    _flag_5 = 1;

    //Clear interrupt flag:
    IFS1.INT1IF = 0; // Clear interrupt nul bit
    IEC1.INT1IE = 0; // Disable interrupt nul bit
    IEC3.INT3IE = 1; // Enable interrupt saftey 2
  }
}

//Second interrupt mapped, Get from register 0x000004E(defined by datasheet). ICS is left at auto.
void interrupt2_low() iv 0x000004E ics ICS_AUTO {

  if (PORTD.F4 == 1 && _flag_2 == 1) {
    GET_CURRENT_POS(Pos2data);
    _flag_2 = 0;
    _flag_3 = 1;
    delay_ms(300);
    Motor_Command(RORAT5, sizeof(RORAT5));

    IFS1.INT2IF = 0; // Clear Safety flag bit
    INTCON2.INT2EP = 1; //Set Safety bit to negative edge detect.
  }
  if (PORTD.F4 == 0 && _flag_3 == 1) {
    GET_CURRENT_POS(Pos3data);
    _flag_3 = 0;
    _flag_4 = 1;

    IEC1.INT2IE = 0; // Disable interrupt saftey 2
    IEC1.INT1IE = 1; // Enable interrupt nul bit

  }

}

void interrupt3() iv 0x000007E ics ICS_AUTO {

  if (PORTD.F5 == 1 && _flag_5 == 1) {
    GET_CURRENT_POS(Pos5data);
    _flag_5 = 0;
    _flag_6 = 1;
    delay_ms(300);
    Motor_Command(ROLAT5, sizeof(ROLAT5));

    IFS1.INT3IF = 0; // Clear interrupt saftey 2 bit
    INTCON2.INT3EP = 1; //Set Safety2 bit to negative edge detect
  }
  if (PORTD.F5 == 0 && _flag_6 == 1) {
    GET_CURRENT_POS(Pos6data);
    _flag_6 = 0;
    delay_ms(50);
    Motor_Command(STOP, sizeof(STOP));

    IEC3.INT3IE = 0; // Enable interrupt saftey 2
    IEC1.INT1IE = 1; // Disable interrupt nul bit
    delay_ms(500);
    
    uart1_write_text
    
    
    asm {
        reset
    }
  }

}

/* Main Program */
void main() {

  //Setting TRIS&ANS register for pinout
  TRISB = 0x7EEF;
  TRISC = 0xFFFF;
  TRISD = 0xFFFF;
  TRISE = 0xFFFF;
  TRISF = 0x0000;
  TRISG = 0xFFF3;
  ANSD = 0x0000;
  ANSB = 0x0000;

  //Init of UART at 9600 Baudrate
  UART1_Init(9600);
  UART3_Init(9600);

  Delay_ms(3000);
  LATB.F8 = 1;

  Unlock_IOLOCK();
  //UART 1 for device to PC
  PPS_Mapping_NoLock(28, _INPUT, _U1RX); // Sets pin 15 to be Input, and maps RX3/DT3 Input to it
  PPS_Mapping_NoLock(18, _OUTPUT, _U1TX); // Sets pin 5 to be Output

  //UART3 for device to stepperdriver
  PPS_Mapping_NoLock(14, _INPUT, _U3RX); // Sets pin 15 to be Input, and maps RX3/DT3 Input to it
  PPS_Mapping_NoLock(29, _OUTPUT, _U3TX); // Sets pin 5 to be Output

  //interrupt to remappable pins
  PPS_Mapping_NoLock(22, _INPUT, _INT1); // Sets pin 22 to be Input, and maps interrupt
  PPS_Mapping_NoLock(25, _INPUT, _INT2); // Sets pin 25 to be Input, and maps interrupt
  PPS_Mapping_NoLock(20, _INPUT, _INT3); // Sets pin 20 to be Input, and maps interrupt

  Lock_IOLOCK();

  //Interrupt nesting enable
  INTCON1.NSTDIS = 0;
  //Interrupt enable bits
  IEC3.INT3IE = 0; // Disable interrupt saftey 2
  IEC1.INT2IE = 0; // Disable interrupt saftey 1
  IEC1.INT1IE = 1; //Nul ENABLE TO START TEST

  while (1) {
    //if there is data do something.
    if (UART1_Data_Ready() > 0) {
      uart1_read_text(input, "\r\n", 16); // Read String data up to 10th charachter if \r if found stop looking and put data in input.

      //compare what we got in input to whatever we define as a commmand up at the variables.
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
        //uart1_write_text("Unrecognized command: "); //Failed to recognize.
        //uart_write_text(input); //output failed command.
      }
    }
  }

}