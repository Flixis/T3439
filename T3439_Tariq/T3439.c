#include "FUNCTIONS.H"

#include "COMMANDS.H"


/*Code written by Tariq Dinmohamed*/

//Version control
char CompileDate[] = __DATE__;
char CompileTime[] = __TIME__;

int xx = 1;
int yy = 1;

/* Definitions Chars/ints for calculations related to UART*/
char receive;
char input[16];

int _flag_1 = 0;
//First interrupt mapped, Get from register 0x000003C(defined by datasheet). ICS is left at auto.
void interrupt1() iv 0x000003C ics ICS_AUTO {
  //Disable interrupt 1 and enable interrupt 2
  IEC1.INT1IE = 0; // Disable interrupt nul bit
  IEC1.INT2IE = 1; // Enable interrupt saftey 2

  IFS1.INT1IF = 0;
  GET_CURRENT_POS();
  _flag_1 = 1;
  //Clear the interrupt flag

}

int _flag_2 = 0;
//Second interrupt mapped, Get from register 0x000004E(defined by datasheet). ICS is left at auto.
void interrupt2() iv 0x000004E ics ICS_AUTO {
  //Clear the interrupt flag
  //IFS1.INT2IF = 0;
  _flag_2 = 1;

  uart1_write_text("interrupt2");

  if (_flag_2 == 1 && PORTD.F4 == 1) {
    uart1_write_text("flag2");
    GET_CURRENT_POS();
    _flag_2 = 0;
    delay_ms(150);
    MOTOR_COMMAND(RORAT5, sizeof(RORAT5));
    while (xx) {
      if (PORTD.F4 == 0) {
        GET_CURRENT_POS();
        xx = 0;
        /*Disable interrupt saftey 1, Enable interrupt saftey 2*/
        IEC1.INT1IE = 1;
        IEC1.INT2IE = 0;
        IEC3.INT3IE = 1;
      }
    }
  }

}

int _flag_3 = 0;
void interrupt3() iv 0x000007E ics ICS_AUTO {
  //Clear the interrupt flag
  IFS1.INT3IF = 0; // Clear interrupt saftey 2 bit
  _flag_3 = 1;

  if (_flag_3 && PORTD.F5 == 1) {
    GET_CURRENT_POS();
    _flag_3 = 0;
    delay_ms(150);
    MOTOR_COMMAND(RORAT5, sizeof(RORAT5));
    while (yy) {
      if (PORTD.F5 == 0) {
        GET_CURRENT_POS();
        yy = 0;
        //Disable interrupt 3
        IEC1.INT1IE = 0;
        IEC1.INT2IE = 0;
        IEC3.INT3IE = 0; // Disable interrupt saftey 2    
      }
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

  Delay_ms(1500);
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

  while (1) {

    //if there is data do something.
    if (uart1_Data_Ready()) {
      uart1_read_text(input, "\r\n", sizeof(input)); // Read String data up to 10th charachter if \r if found stop looking and put data in input.
      //compare what we got in input to whatever we define as a commmand up at the variables.
      if (strcmp(input, COMMAND_START) == 0) {
        /*Actual T3439 testing routine*/
        //Start by moving the UUT right
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

    if (PORTD.F4 == 0 && PORTD.F5 == 0) {
      IEC1.INT1IE = 1; //Nul ENABLE TO START TEST    
    }

  }
}