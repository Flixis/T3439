/**
  UART3 Generated Driver File

  @Company
    Microchip Technology Inc.

  @File Name
    uart3.c

  @Summary
    This is the generated driver implementation file for the UART3 driver using PIC24 / dsPIC33 / PIC32MM MCUs

  @Description
    This header file provides implementations for driver APIs for UART3.
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
  Section: Included Files
*/
#include <xc.h>
#include "uart3.h"

/**
  Section: UART3 APIs
*/

void UART3_Initialize(void)
{
/**    
     Set the UART3 module to the options selected in the user interface.
     Make sure to set LAT bit corresponding to TxPin as high before UART initialization
*/
    // STSEL 1; IREN disabled; PDSEL 8N; UARTEN enabled; RTSMD disabled; USIDL disabled; WAKE disabled; ABAUD disabled; LPBACK disabled; BRGH enabled; RXINV disabled; UEN TX_RX; 
    // Data Bits = 8; Parity = None; Stop Bits = 1;
    U3MODE = (0x8008 & ~(1<<15));  // disabling UARTEN bit
    // UTXISEL0 TX_ONE_CHAR; UTXINV disabled; OERR NO_ERROR_cleared; URXISEL RX_ONE_CHAR; UTXBRK COMPLETED; UTXEN disabled; ADDEN disabled; 
    U3STA = 0x00;
    // BaudRate = 9600; Frequency = 8000000 Hz; BRG 207; 
    U3BRG = 0xCF;
    
    U3MODEbits.UARTEN = 1;   // enabling UART ON bit
    U3STAbits.UTXEN = 1;
}

uint8_t UART3_Read(void)
{
    while(!(U3STAbits.URXDA == 1))
    {
        
    }

    if ((U3STAbits.OERR == 1))
    {
        U3STAbits.OERR = 0;
    }
    
    return U3RXREG;
}

void UART3_Write(uint8_t txData)
{
    while(U3STAbits.UTXBF == 1)
    {
        
    }

    U3TXREG = txData;    // Write the data byte to the USART.
}

bool UART3_IsRxReady(void)
{
    return U3STAbits.URXDA;
}

bool UART3_IsTxReady(void)
{
    return ((!U3STAbits.UTXBF) && U3STAbits.UTXEN );
}

bool UART3_IsTxDone(void)
{
    return U3STAbits.TRMT;
}


/*******************************************************************************

  !!! Deprecated API !!!
  !!! These functions will not be supported in future releases !!!

*******************************************************************************/

uint16_t __attribute__((deprecated)) UART3_StatusGet (void)
{
    return U3STA;
}

void __attribute__((deprecated)) UART3_Enable(void)
{
    U3MODEbits.UARTEN = 1;
    U3STAbits.UTXEN = 1;
}

void __attribute__((deprecated)) UART3_Disable(void)
{
    U3MODEbits.UARTEN = 0;
    U3STAbits.UTXEN = 0;
}
