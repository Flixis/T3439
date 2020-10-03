//Note! This is a custom stdbool.h file, the normal compiler doesn't support boolean type. Can be found under Header/ folder.
#include <stdbool.h>
#include "FUNCTIONS.H"
#include "COMMANDS.H"


/*Code written by Tariq Dinmohamed*/

//Version control only relevant if Debug is enabled
char CompileDate[] = __DATE__;
char CompileTime[] = __TIME__;

//First interrupt mapped, Get from register 0x000003C(defined by datasheet). ICS is left at auto.
void interrupt1() iv 0x000003C ics ICS_AUTO {
  //Clear the interrupt flag
  IFS1.INT1IF = 0;
  if (PORTD.F3 == 1) {
    /*When conditions are met,
    First we STOP the motor on the 0 point of the PCB.
    Then we set the current pos of the Motor to the 0 point of the encoder.
    Then we move the UUT to the left and wait for the safety line to trigger, in this instance safety line 1.
    */
    Motor_Command(STOP, sizeof(STOP));
    Delay_ms(25);
	GET_CURRENT_POS();
    Delay_ms(25);
    Motor_Command(SET_0_POS, sizeof(SET_0_POS));
    Delay_ms(25);
    Motor_Command(ROLAT5, sizeof(ROLAT5));

    //Clear interrupt flag:
    IFS1.INT1IF = 0; // Clear interrupt nul bit
    //Disable interrupt 1 and enable interrupt 2
    IEC1.INT1IE = 0; // Disable interrupt nul bit
    IEC1.INT2IE = 1; // Enable interrupt saftey 2
  }

}

//Second interrupt mapped, Get from register 0x000004E(defined by datasheet). ICS is left at auto.
void interrupt2_low() iv 0x000004E ics ICS_AUTO {

  if (PORTD.F4 == 1) {
    /*When conditions are met,
    Stop the motor, get the current position of the driver.
    Print this data over UART1 to Test-Track. Test-Track will process this data and confirm wheter or not the UUT has triggerd at the right Pos.
    if this is OK move the UUT to the right.
    */
    Motor_Command(STOP, sizeof(STOP));

    //** it is necessary to clear manually the interrupt flag:
    IEC1.INT2IE = 0; // Disable interrupt saftey 1
    IEC3.INT3IE = 1; // Enable interrupt saftey 2
  }
}

void interrupt3() iv 0x000007E ics ICS_AUTO {

  if (PORTD.F5 == 1) {

    Motor_Command(STOP, sizeof(STOP));

    //** it is necessary to clear manually the interrupt flag:
    IFS1.INT3IF = 0; // Clear interrupt saftey 2 bit
    IEC3.INT3IE = 0; // Disable interrupt saftey 2           
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
  IEC1.INT1IE = 1; //Nul ENABLE TO START TEST

  while (1) {
	  
    GET_COMMANDS();

  }
}