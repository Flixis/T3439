#include "FUNCTIONS.H"

#include "COMMANDS.H"

#include "INTERRUPTS.H"


_temp_flag = 0;
//First interrupt mapped, Get from register 0x000003C(defined by datasheet). ICS is left at auto.
void interrupt1() iv 0x000003C ics ICS_AUTO {
	
	IFS1.INT1IF = 0;
	GET_CURRENT_POS();
	_temp_flag = 1;
  
  //Clear the interrupt flag

  //Disable interrupt 1 and enable interrupt 2
  //IEC1.INT1IE = 1; // Disable interrupt nul bit
  //IEC1.INT2IE = 1; // Enable interrupt saftey 2
}

//Second interrupt mapped, Get from register 0x000004E(defined by datasheet). ICS is left at auto.
void interrupt2() iv 0x000004E ics ICS_AUTO {
  //Clear the interrupt flag
  IFS1.INT2IF = 0;

  if (PORTD.F4 == 1) {

    MOTOR_COMMAND(STOP, sizeof(STOP));

    /*Disable interrupt saftey 1, Enable interrupt saftey 2*/
    IEC1.INT2IE = 0;
    IEC3.INT3IE = 1;
  }
}

void interrupt3() iv 0x000007E ics ICS_AUTO {
  //Clear the interrupt flag
  IFS1.INT3IF = 0; // Clear interrupt saftey 2 bit

  if (PORTD.F5 == 1) {

    MOTOR_COMMAND(STOP, sizeof(STOP));

    //Disable interrupt 3
    IEC3.INT3IE = 0; // Disable interrupt saftey 2           
  }


}