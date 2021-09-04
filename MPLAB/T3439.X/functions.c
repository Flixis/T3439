/*
 * File:   functions.c
 * Author: tariq
 *
 * Created on 19 juli 2021, 11:23
 */


#include <stdio.h>
#include "xc.h"
#include "functions.h"
#include "motor_commands.h"
#include "mcc_generated_files/uart3.h"

/*Get command from motor_commands.h -> data_get, then pass its own length(data_len) and
 * print it over uart3 to the motor driver.
 * Usage becomes: write_command(ROLAT5, sizeof(ROLAT5));
 */
int i;
int x;
size_t store[9];
size_t destroy[9];
void write_motor_command(unsigned char * data_get, int data_len, int data_return) {
    for (i = 0; i < data_len; i++) {
        UART3_Write(data_get[i]);
    }
    if (data_return > 0) {
        for (x = 0; x < 9; x++) {
            store[x] = UART3_Read();
            UART1_Write(store[x]);
        }
    } else {
        for (x = 0; x < 9; x++) {
            destroy[x] = UART3_Read();
        }
    }
}