#include "FUNCTIONS.H"
#include "COMMANDS.H"
#include "INTERRUPTS.H"


/*Code written by Tariq Dinmohamed*/

//Version control only relevant if Debug is enabled
char CompileDate[] = __DATE__;
char CompileTime[] = __TIME__;

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
  INTCON.GIE = 1;
  INTCON1.INT1EP = 0;
  //Interrupt enable bits
  IEC3.INT3IE = 0; // Disable interrupt saftey 2
  IEC1.INT2IE = 0; // Disable interrupt saftey 1
  

  
  
  while (1) {
          
    GET_COMMANDS();
	
	if(PORTD.F4 == 0 && PORTD.F5 == 0){
	 IEC1.INT1IE = 1; //Nul ENABLE TO START TEST    
	}
	
	if(_temp_flag == 1){
	  if(PORTD.F3 == 0){
	   GET_CURRENT_POS();
	  _temp_flag = 0;	  
	  }
	}
	
	
	
	
	

  }
}