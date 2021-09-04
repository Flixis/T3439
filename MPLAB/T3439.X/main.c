/**
  Generated main.c file from MPLAB Code Configurator
 * 
 * @User
 * Tariq Dinmohamed

  @Company
    Matas Electronics B.V.

  @File Name
    main.c

  @Summary
    This is the generated main.c using PIC24 / dsPIC33 / PIC32MM MCUs.

  @Description
    This source file provides main entry point for system initialization and application code development.
    Generation Information :
        Product Revision  :  PIC24 / dsPIC33 / PIC32MM MCUs - 1.170.0
        Device            :  PIC24FJ128GA306
    The generated drivers are tested against the following:
        Compiler          :  XC16 v1.61
        MPLAB 	          :  MPLAB X v5.45
 */

/**
  Section: Included Files
 */
#define RESET() asm("reset")
#define MAX_COMMAND_LEN 8

#include "mcc_generated_files/system.h"
#include "mcc_generated_files/pin_manager.h"
#include "mcc_generated_files/uart1.h"
#include <stdio.h>
#include <string.h>
#include "motor_commands.h"
#include "mcc_generated_files/interrupt_manager.h"
#include "mcc_generated_files/ext_int.h"
#include "functions.h"

/*
                         Main application
 */
extern int _flag_1;
extern int _flag_2;
extern int _flag_3;
extern int _setting_0_pos;

void execute_mcu_command(char *command) {

    if (strcmp(command, "a") == 0) {
        //Move too and set 0 pos
        _setting_0_pos = 1;
        NUL_SetDigitalInput();
        EX_INT1_PositiveEdgeSet();
        write_motor_command(ROLAT5, sizeof (ROLAT5), 0);
        __delay_ms(3000);
        EX_INT1_InterruptEnable();
    } else if (strcmp(command, "b") == 0) {
        //Move LED1 pos
        _flag_1 = 1;
        EX_INT1_NegativeEdgeSet();
        write_motor_command(RORAT1, sizeof (RORAT1), 0);
    } else if (strcmp(command, "c") == 0) {
        //Move LED2 pos
        write_motor_command(MV_ABS_0, sizeof (MV_ABS_0), 0);
        __delay_ms(2000);
        _flag_1 = 1;
        write_motor_command(ROLAT1, sizeof (ROLAT1), 0);
    } else if (strcmp(command, "d") == 0) {
        //move to safety 1
        _flag_2 = 1;
        EX_INT1_InterruptDisable();
        write_motor_command(MV_ABS_0, sizeof (MV_ABS_0), 0);
        EX_INT2_PositiveEdgeSet();
        EX_INT2_InterruptEnable();
        write_motor_command(ROLAT1, sizeof (ROLAT1), 0);
    } else if (strcmp(command, "e") == 0) {
        // move to safety 2
        _flag_3 = 1;
        EX_INT1_InterruptDisable();
        EX_INT2_InterruptDisable();
        write_motor_command(RORAT3, sizeof (RORAT3), 0);
        __delay_ms(1500);
        EX_INT3_PositiveEdgeSet();
        EX_INT3_InterruptEnable();
        write_motor_command(RORAT1, sizeof (RORAT1), 0);

    } else if (strcmp(command, "f") == 0) {
        EX_INT1_InterruptDisable();
        EX_INT2_InterruptDisable();
        EX_INT3_InterruptDisable();
        write_motor_command(RORAT5, sizeof (RORAT5), 0);
    } else if (strcmp(command, "z") == 0) {
        //Possible reset in software, makes use of MACRO in asm
        write_motor_command(STOP, sizeof (STOP), 0);
        __delay_ms(50)
        RESET();
    } else if (strcmp(command, "x") == 0) {
        //Firmware versioning on compile time.
        printf("Firmware info:\r\n");
        printf(__DATE__);
        printf(" ");
        printf(__TIME__);
        printf("\r\n");
        printf("Written by: Tariq Dinmohamed\r\n");
        printf("PIC24FJ128GA306 @ 16MHz\r\n");
    } else {
        printf("Incorrect command.\r\n");
    }
}

int main(void) {
    // initialize the device
    SYSTEM_Initialize();
    //Interrupt nesting enabled
    INTCON1bits.NSTDIS = 0;

    //Enable only the first interrupt
    EX_INT1_InterruptDisable();
    EX_INT2_InterruptDisable();
    EX_INT3_InterruptDisable();

    //USB enable
    USB_ENABLE_SetHigh();

    char command[MAX_COMMAND_LEN];
    uint8_t index = 0;
    char c;

    while (1) {

        //Status indicator for running status
        STATUS_LED1_SetHigh();
        __delay_ms(500);
        STATUS_LED1_SetLow();

        STATUS_LED2_SetHigh();
        __delay_ms(500);
        STATUS_LED2_SetLow();

        //Only do this if RX buffer has data
        if (UART1_RX_DATA_AVAILABLE > 0) {
            c = UART1_Read();
            if (c != '\n' && c != '\r') {
                command[index++] = c;
                if (index > MAX_COMMAND_LEN) {

                    index = 0;
                }
            }
            if (c == '\n') {
                command[index] = '\0';
                index = 0;
                execute_mcu_command(command);
            }
        }
    }

    return 1;
}


/**
 End of File
 */

