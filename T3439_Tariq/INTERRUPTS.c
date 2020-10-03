#include "FUNCTIONS.H"
#include "COMMANDS.H"
#include "INTERRUPTS.H"

//First interrupt mapped, Get from register 0x000003C(defined by datasheet). ICS is left at auto.
void interrupt1_null() iv 0x000003C ics ICS_AUTO {
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
    Delay_ms(50);
    Motor_Command(ROLAT5, sizeof(ROLAT5));

    //Disable interrupt 1 and enable interrupt 2
    IEC1.INT1IE = 0; // Disable interrupt nul bit
    IEC1.INT2IE = 1; // Enable interrupt saftey 2
  }

}

//Second interrupt mapped, Get from register 0x000004E(defined by datasheet). ICS is left at auto.
void interrupt2_safety1() iv 0x000004E ics ICS_AUTO {
  //Clear the interrupt flag
  IFS1.INT2IF = 0;
  
  if (PORTD.F4 == 1) {
	  
    Motor_Command(STOP, sizeof(STOP));

	/*Disable interrupt saftey 1, Enable interrupt saftey 2*/
    IEC1.INT2IE = 0; 
    IEC3.INT3IE = 1; 
  }
}

void interrupt3_safety2() iv 0x000007E ics ICS_AUTO {
  //Clear the interrupt flag
  IFS1.INT3IF = 0; // Clear interrupt saftey 2 bit
  
  if (PORTD.F5 == 1) {

    Motor_Command(STOP, sizeof(STOP));

	//Disable interrupt 3
    IEC3.INT3IE = 0; // Disable interrupt saftey 2           
  }

}