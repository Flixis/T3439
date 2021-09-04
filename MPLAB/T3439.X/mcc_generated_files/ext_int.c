
/**
  EXT_INT Generated Driver File 

  @Company:
    Microchip Technology Inc.

  @File Name:
    ext_int.c

  @Summary
    This is the generated driver implementation file for the EXT_INT 
    driver using PIC24 / dsPIC33 / PIC32MM MCUs

  @Description:
    This source file provides implementations for driver APIs for EXT_INT. 
    Generation Information : 
        Product Revision  :  PIC24 / dsPIC33 / PIC32MM MCUs - 1.170.0
        Device            :  PIC24FJ128GA306
    The generated drivers are tested against the following:
        Compiler          :  XC16 v1.61
        MPLAB             :  MPLAB X v5.45
 */

/*
    (c) 2020 Microchip Technology Inc. and its subsidiaries. You may use this
    software and any derivatives exclusively with Microchip products.

    THIS SOFTWARE IS SUPPLIED BY MICROCHIP "AS IS". NO WARRANTIES, WHETHER
    EXPRESS, IMPLIED OR STATUTORY, APPLY TO THIS SOFTWARE, INCLUDING ANY IMPLIED
    WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY, AND FITNESS FOR A
    PARTICULAR PURPOSE, OR ITS INTERACTION WITH MICROCHIP PRODUCTS, COMBINATION
    WITH ANY OTHER PRODUCTS, OR USE IN ANY APPLICATION.

    IN NO EVENT WILL MICROCHIP BE LIABLE FOR ANY INDIRECT, SPECIAL, PUNITIVE,
    INCIDENTAL OR CONSEQUENTIAL LOSS, DAMAGE, COST OR EXPENSE OF ANY KIND
    WHATSOEVER RELATED TO THE SOFTWARE, HOWEVER CAUSED, EVEN IF MICROCHIP HAS
    BEEN ADVISED OF THE POSSIBILITY OR THE DAMAGES ARE FORESEEABLE. TO THE
    FULLEST EXTENT ALLOWED BY LAW, MICROCHIP'S TOTAL LIABILITY ON ALL CLAIMS IN
    ANY WAY RELATED TO THIS SOFTWARE WILL NOT EXCEED THE AMOUNT OF FEES, IF ANY,
    THAT YOU HAVE PAID DIRECTLY TO MICROCHIP FOR THIS SOFTWARE.

    MICROCHIP PROVIDES THIS SOFTWARE CONDITIONALLY UPON YOUR ACCEPTANCE OF THESE
    TERMS.
 */

/**
   Section: Includes
 */

#include <stdio.h>

#include "ext_int.h"
#include "../functions.h"
#include "../motor_commands.h"
#include "pin_manager.h"

//***User Area Begin->code: Add External Interrupt handler specific headers 

//***User Area End->code: Add External Interrupt handler specific headers

/**
   Section: External Interrupt Handlers
 */

int _flag_1 = 0;
int _flag_2 = 0;
int _flag_3 = 0;
int _setting_0_pos = 1;

/*EXT INT 0 remains unused in the codebase, its also connected internally to nothing*/
void __attribute__((weak)) EX_INT0_CallBack(void) {
    // Add your custom callback code here
}

/**
  Interrupt Handler for EX_INT0 - INT0
 */
void __attribute__((interrupt, no_auto_psv)) _INT0Interrupt(void) {
    //***User Area Begin->code: INT0 - External Interrupt 0***

    EX_INT0_CallBack();

    //***User Area End->code: INT0 - External Interrupt 0***
    EX_INT0_InterruptFlagClear();
}

/*EXT INT 1 is connected to the 0 point measure or LED in schematics, it triggers the 0 point*/
void __attribute__((weak)) EX_INT1_CallBack(void) {
    // Add your custom callback code here
    // make sure its actually in the 0 pos
    while (_setting_0_pos == 1 && NUL_GetValue() == 1) {
        __delay_ms(108);
        write_motor_command(STOP, sizeof (STOP), 0);
        __delay_ms(150);
        write_motor_command(SET_POS, sizeof (SET_POS), 0);
        _setting_0_pos = 0;
    }

    while (_flag_1 == 1) {
        write_motor_command(GET_POS, sizeof (GET_POS) ,1);
        __delay_ms(100);
        write_motor_command(STOP, sizeof (STOP), 0);
        _flag_1 = 0;
    }
}

/**
  Interrupt Handler for EX_INT1 - INT1
 */
void __attribute__((interrupt, no_auto_psv)) _INT1Interrupt(void) {
    //***User Area Begin->code: INT1 - External Interrupt 1***
    EX_INT1_CallBack();

    //***User Area End->code: INT1 - External Interrupt 1***
    EX_INT1_InterruptFlagClear();
}

/*EXT INT 2 is connected to one of the safety lines in the schematics, it triggers the safety routine*/
void __attribute__((weak)) EX_INT2_CallBack(void) {
    // Add your custom callback code here
    while (_flag_2 == 1 && SAFETY_1_GetValue() == 1) {
        write_motor_command(GET_POS, sizeof (GET_POS) ,1);
        __delay_ms(100);
        write_motor_command(STOP, sizeof (STOP), 0);
        _flag_2 = 0;
        EX_INT2_InterruptDisable();
    }
}

/**
  Interrupt Handler for EX_INT2 - INT2
 */
void __attribute__((interrupt, no_auto_psv)) _INT2Interrupt(void) {
    //***User Area Begin->code: INT2 - External Interrupt 2***

    EX_INT2_CallBack();

    //***User Area End->code: INT2 - External Interrupt 2***
    EX_INT2_InterruptFlagClear();
}

/*EXT INT 3 does the same as EXT INT 2, except this one is connected to the other safety line*/
void __attribute__((weak)) EX_INT3_CallBack(void) {
    // Add your custom callback code here
    while (_flag_3 == 1 && SAFETY_2_GetValue() == 1) {
        write_motor_command(GET_POS, sizeof (GET_POS) ,1);
        __delay_ms(100);
        write_motor_command(STOP, sizeof (STOP), 0);
        EX_INT3_InterruptDisable();
        _flag_3 = 0;
    }
}

/**
  Interrupt Handler for EX_INT3 - INT3
 */
void __attribute__((interrupt, no_auto_psv)) _INT3Interrupt(void) {
    //***User Area Begin->code: INT3 - External Interrupt 3***

    EX_INT3_CallBack();

    //***User Area End->code: INT3 - External Interrupt 3***
    EX_INT3_InterruptFlagClear();
}
/**
    Section: External Interrupt Initializers
 */

/**
    void EXT_INT_Initialize(void)

    Initializer for the following external interrupts
    INT0
    INT1
    INT2
    INT3
 */
void EXT_INT_Initialize(void) {
    /*******
     * INT0
     * Clear the interrupt flag
     * Set the external interrupt edge detect
     * Enable the interrupt, if enabled in the UI. 
     ********/
    EX_INT0_InterruptFlagClear();
    EX_INT0_PositiveEdgeSet();
    EX_INT0_InterruptEnable();
    /*******
     * INT1
     * Clear the interrupt flag
     * Set the external interrupt edge detect
     * Enable the interrupt, if enabled in the UI. 
     ********/
    EX_INT1_InterruptFlagClear();
    EX_INT1_PositiveEdgeSet();
    EX_INT1_InterruptEnable();
    /*******
     * INT2
     * Clear the interrupt flag
     * Set the external interrupt edge detect
     * Enable the interrupt, if enabled in the UI. 
     ********/
    EX_INT2_InterruptFlagClear();
    EX_INT2_PositiveEdgeSet();
    EX_INT2_InterruptEnable();
    /*******
     * INT3
     * Clear the interrupt flag
     * Set the external interrupt edge detect
     * Enable the interrupt, if enabled in the UI. 
     ********/
    EX_INT3_InterruptFlagClear();
    EX_INT3_PositiveEdgeSet();
    EX_INT3_InterruptEnable();
}
