#line 1 "C:/Users/Jaspe/OneDrive/Documenten/Meetkaart_Joystick/MEETKAART_V1_0_joysticks.c"
void main() {
 char output;
 char Command;
 char receive;
 unsigned int Spi_Receive;
 char txt[4];





 int Cal_anin1 = 0;
 int Cal_anin2 = 44;
 int Cal_anin3 = 56;
 int Cal_anin4 = 62;
 int Cal_anin5 = 44;
 int Cal_anin6 = 62;
 int Cal_anin7 = 44;
 int Cal_anin8 = 56;

 int Cal_anout1_1 = -3;
 int Cal_anout1_2 = 0;
 int Cal_anout1_3 = 0;
 int Cal_anout2_1 = 0;
 int Cal_anout2_2 = 0;
 int Cal_anout2_3 = 0;
 int Cal_anout3_1 = 0;
 int Cal_anout3_2 = 0;
 int Cal_anout3_3 = 0;
 int Cal_anout4_1 = 0;
 int Cal_anout4_2 = 0;
 int Cal_anout4_3 = 0;
 int Cal_anout5_1 = 0;
 int Cal_anout5_2 = 0;
 int Cal_anout5_3 = 0;
 int Cal_anout6_1 = 0;
 int Cal_anout6_2 = 0;
 int Cal_anout6_3 = 0;
 int Cal_anout7_1 = 0;
 int Cal_anout7_2 = 0;
 int Cal_anout7_3 = 0;
 int Cal_anout8_1 = 0;
 int Cal_anout8_2 = 0;
 int Cal_anout8_3 = 0;
 int Cal_anout9_1 = 0;
 int Cal_anout9_2 = 0;
 int Cal_anout9_3 = 0;
 int Cal_anout10_1 = 0;
 int Cal_anout10_2 = 0;
 int Cal_anout10_3 = 0;
 int Cal_anout11_1 = 0;
 int Cal_anout11_2 = 0;
 int Cal_anout11_3 = 0;
 int Cal_anout12_1 = 0;
 int Cal_anout12_2 = 0;
 int Cal_anout12_3 = 0;
 int Cal_anout13_1 = 0;
 int Cal_anout13_2 = 0;
 int Cal_anout13_3 = 0;
 int Cal_anout14_1 = 0;
 int Cal_anout14_2 = 0;
 int Cal_anout14_3 = 0;
 int Cal_anout15_1 = 0;
 int Cal_anout15_2 = 0;
 int Cal_anout15_3 = 0;
 int Cal_anout16_1 = 0;
 int Cal_anout16_2 = 0;
 int Cal_anout16_3 = 0;



TRISB = 0xFFDF;
TRISC = 0xFFFF;
TRISD = 0xF8F4;
TRISE = 0xFF1F;
TRISF = 0xBFFF;
TRISG = 0xFF3F;
ANSE = 0x0000;
ANSB = 0x0000;
ANSD = 0x0000;
ODCE = 0x0000;
LATF.F14 = 0;

UART1_Init(9600);
Delay_ms(100);

Unlock_IOLOCK();

PPS_Mapping_NoLock(28, _INPUT, _U1RX);
PPS_Mapping_NoLock(18, _OUTPUT, _U1TX);

PPS_Mapping_NoLock(22, _OUTPUT, _SDO1);
PPS_Mapping_NoLock(24, _OUTPUT, _SCK1OUT);
PPS_Mapping_NoLock(23, _INPUT, _SDI1IN);




Lock_IOLOCK();




SPI1_Init_Advanced(_SPI_MASTER, _SPI_16_BIT, _SPI_PRESCALE_SEC_8, _SPI_PRESCALE_PRI_1, _SPI_SS_DISABLE, _SPI_DATA_SAMPLE_MIDDLE, _SPI_CLK_IDLE_HIGH, _SPI_ACTIVE_2_IDLE);

Delay_ms(100);

LATF.F14 = 1;
LATD.F10 = 1;
LATD.F9 = 1;
LATD.F0 = 1;
LATD.F8 = 1;

while(1)
{








 if (UART1_Data_Ready() ==1)
 {
 receive = UART1_Read();
 }

 if (receive == 0x01)
 {
 Uart1_Write_Text("ok\r");
 receive = 0x00;
 LATD.F10 = 0;
 Spi1_write(0x4000);
 LATD.F10 = 1;
 }

 if (receive == 0x02)
 {
 Uart1_Write_Text("ok\r");
 receive = 0x00;
 LATD.F10 = 0;
 Spi1_write(0x49C4 + Cal_anout1_1);
 LATD.F10 = 1;
 }

 if (receive == 0x03)
 {
 Uart1_Write_Text("ok\r");
 receive = 0x00;
 LATD.F10 = 0;
 Spi1_write(0x4C89 + Cal_anout1_2);
 LATD.F10 = 1;
 }
 if (receive == 0x04)
 {
 Uart1_Write_Text("ok\r");
 receive = 0x00;
 LATD.F10 = 0;
 Spi1_write(0x5000);
 LATD.F10 = 1;
 }

 if (receive == 0x05)
 {
 Uart1_Write_Text("ok\r");
 receive = 0x00;
 LATD.F10 = 0;
 Spi1_write(0x59C4 + Cal_anout2_1);
 LATD.F10 = 1;
 }

 if (receive == 0x06)
 {
 Uart1_Write_Text("ok\r");
 receive = 0x00;
 LATD.F10 = 0;
 Spi1_write(0x5C89 + Cal_anout2_2);
 LATD.F10 = 1;
 }

 if (receive == 0x07)
 {
 Uart1_Write_Text("ok\r");
 receive = 0x00;
 LATD.F10 = 0;
 Spi1_write(0x6000);
 LATD.F10 = 1;
 }

 if (receive == 0x08)
 {
 Uart1_Write_Text("ok\r");
 receive = 0x00;
 LATD.F10 = 0;
 Spi1_write(0x69C4 + Cal_anout3_1);
 LATD.F10 = 1;
 }

 if (receive == 0x09)
 {
 Uart1_Write_Text("ok\r");
 receive = 0x00;
 LATD.F10 = 0;
 Spi1_write(0x6C89 + Cal_anout3_2);
 LATD.F10 = 1;
 }

 if (receive == 0x0A)
 {
 Uart1_Write_Text("ok\r");
 receive = 0x00;
 LATD.F10 = 0;
 Spi1_write(0x7000);
 LATD.F10 = 1;
 }

 if (receive == 0x0B)
 {
 Uart1_Write_Text("ok\r");
 receive = 0x00;
 LATD.F10 = 0;
 Spi1_write(0x79C4 + Cal_anout4_1);
 LATD.F10 = 1;
 }

 if (receive == 0x0C)
 {
 Uart1_Write_Text("ok\r");
 receive = 0x00;
 LATD.F10 = 0;
 Spi1_write(0x7C89 + Cal_anout4_2);
 LATD.F10 = 1;
 }










 if (receive == 0x0E)
 {
 Uart1_Write_Text("ok\r");
 receive = 0x00;
 LATD.F10 = 0;
 Spi1_write(0x39C4 + Cal_anout5_1);
 LATD.F10 = 1;
 }

 if (receive == 0x0F)
 {
 Uart1_Write_Text("ok\r");
 receive = 0x00;
 LATD.F10 = 0;
 Spi1_write(0x3C89 + Cal_anout5_2);
 LATD.F10 = 1;
 }

 if (receive == 0x10)
 {
 Uart1_Write_Text("ok\r");
 receive = 0x00;
 LATD.F10 = 0;
 Spi1_write(0x2000);
 LATD.F10 = 1;
 }

 if (receive == 0x11)
 {
 Uart1_Write_Text("ok\r");
 receive = 0x00;
 LATD.F10 = 0;
 Spi1_write(0x29C4 + Cal_anout6_1);
 LATD.F10 = 1;
 }

 if (receive == 0x12)
 {
 Uart1_Write_Text("ok\r");
 receive = 0x00;
 LATD.F10 = 0;
 Spi1_write(0x2C89 + Cal_anout6_2);
 LATD.F10 = 1;
 }
 if (receive == 0x13)
 {
 Uart1_Write_Text("ok\r");
 receive = 0x00;
 LATD.F10 = 0;
 Spi1_write(0x1000);
 LATD.F10 = 1;
 }

 if (receive == 0x14)
 {
 Uart1_Write_Text("ok\r");
 receive = 0x00;
 LATD.F10 = 0;
 Spi1_write(0x19C4 + Cal_anout7_1);
 LATD.F10 = 1;
 }

 if (receive == 0x15)
 {
 Uart1_Write_Text("ok\r");
 receive = 0x00;
 LATD.F10 = 0;
 Spi1_write(0x1C89 + Cal_anout7_2);
 LATD.F10 = 1;
 }

 if (receive == 0x16)
 {
 Uart1_Write_Text("ok\r");
 receive = 0x00;
 LATD.F10 = 0;
 Spi1_write(0x0000);
 LATD.F10 = 1;
 }

 if (receive == 0x17)
 {
 Uart1_Write_Text("ok\r");
 receive = 0x00;
 LATD.F10 = 0;
 Spi1_write(0x09C4 + Cal_anout8_1);
 LATD.F10 = 1;
 }

 if (receive == 0x18)
 {
 Uart1_Write_Text("ok\r");
 receive = 0x00;
 LATD.F10 = 0;
 Spi1_write(0x0C89 + Cal_anout8_2);
 LATD.F10 = 1;
 }

 if (receive == 0x19)
 {
 Uart1_Write_Text("ok\r");
 receive = 0x00;
 LATD.F9 = 0;
 Spi1_write(0x4000);
 LATD.F9 = 1;
 }

 if (receive == 0x1A)
 {
 Uart1_Write_Text("ok\r");
 receive = 0x00;
 LATD.F9 = 0;
 Spi1_write(0x49C4 + Cal_anout9_1);
 LATD.F9 = 1;
 }

 if (receive == 0x1B)
 {
 Uart1_Write_Text("ok\r");
 receive = 0x00;
 LATD.F9 = 0;
 Spi1_write(0x4C89 + Cal_anout9_2);
 LATD.F9 = 1;
 }

 if (receive == 0x1C)
 {
 Uart1_Write_Text("ok\r");
 receive = 0x00;
 LATD.F9 = 0;
 Spi1_write(0x5000);
 LATD.F9 = 1;
 }

 if (receive == 0x1D)
 {
 Uart1_Write_Text("ok\r");
 receive = 0x00;
 LATD.F9 = 0;
 Spi1_write(0x59C4 + Cal_anout10_1);
 LATD.F9 = 1;
 }

 if (receive == 0x1E)
 {
 Uart1_Write_Text("ok\r");
 receive = 0x00;
 LATD.F9 = 0;
 Spi1_write(0x5C89 + Cal_anout10_2);
 LATD.F9 = 1;
 }

 if (receive == 0x1F)
 {
 Uart1_Write_Text("ok\r");
 receive = 0x00;
 LATD.F9 = 0;
 Spi1_write(0x6000);
 LATD.F9 = 1;
 }

 if (receive == 0x20)
 {
 Uart1_Write_Text("ok\r");
 receive = 0x00;
 LATD.F9 = 0;
 Spi1_write(0x69C4 + Cal_anout11_1);
 LATD.F9 = 1;
 }

 if (receive == 0x21)
 {
 Uart1_Write_Text("ok\r");
 receive = 0x00;
 LATD.F9 = 0;
 Spi1_write(0x6C89 + Cal_anout11_2);
 LATD.F9 = 1;
 }

 if (receive == 0x22)
 {
 Uart1_Write_Text("ok\r");
 receive = 0x00;
 LATD.F9 = 0;
 Spi1_write(0x7000);
 LATD.F9 = 1;
 }

 if (receive == 0x23)
 {
 Uart1_Write_Text("ok\r");
 receive = 0x00;
 LATD.F9 = 0;
 Spi1_write(0x79C4 + Cal_anout12_1);
 LATD.F9 = 1;
 }

 if (receive == 0x24)
 {
 Uart1_Write_Text("ok\r");
 receive = 0x00;
 LATD.F9 = 0;
 Spi1_write(0x7C89 + Cal_anout12_2);
 LATD.F9 = 1;
 }

 if (receive == 0x25)
 {
 Uart1_Write_Text("ok\r");
 receive = 0x00;
 LATD.F9 = 0;
 Spi1_write(0x3000);
 LATD.F9 = 1;
 }

 if (receive == 0x26)
 {
 Uart1_Write_Text("ok\r");
 receive = 0x00;
 LATD.F9 = 0;
 Spi1_write(0x39C4 + Cal_anout13_1);
 LATD.F9 = 1;
 }

 if (receive == 0x27)
 {
 Uart1_Write_Text("ok\r");
 receive = 0x00;
 LATD.F9 = 0;
 Spi1_write(0x3C89 + Cal_anout13_2);
 LATD.F9 = 1;
 }

 if (receive == 0x28)
 {
 Uart1_Write_Text("ok\r");
 receive = 0x00;
 LATD.F9 = 0;
 Spi1_write(0x2000);
 LATD.F9 = 1;
 }

 if (receive == 0x29)
 {
 Uart1_Write_Text("ok\r");
 receive = 0x00;
 LATD.F9 = 0;
 Spi1_write(0x29C4 + Cal_anout14_1);
 LATD.F9 = 1;
 }

 if (receive == 0x2A)
 {
 Uart1_Write_Text("ok\r");
 receive = 0x00;
 LATD.F9 = 0;
 Spi1_write(0x2C89 + Cal_anout14_2);
 LATD.F9 = 1;
 }

 if (receive == 0x2B)
 {
 Uart1_Write_Text("ok\r");
 receive = 0x00;
 LATD.F9 = 0;
 Spi1_write(0x1000);
 LATD.F9 = 1;
 }

 if (receive == 0x2C)
 {
 Uart1_Write_Text("ok\r");
 receive = 0x00;
 LATD.F9 = 0;
 Spi1_write(0x19C4 + Cal_anout15_1);
 LATD.F9 = 1;
 }

 if (receive == 0x2D)
 {
 Uart1_Write_Text("ok\r");
 receive = 0x00;
 LATD.F9 = 0;
 Spi1_write(0x1C89 + Cal_anout15_2);
 LATD.F9 = 1;
 }

 if (receive == 0x2E)
 {
 Uart1_Write_Text("ok\r");
 receive = 0x00;
 LATD.F9 = 0;
 Spi1_write(0x0000);
 LATD.F9 = 1;
 }

 if (receive == 0x2F)
 {
 Uart1_Write_Text("ok\r");
 receive = 0x00;
 LATD.F9 = 0;
 Spi1_write(0x09C4 + Cal_anout16_1);
 LATD.F9 = 1;
 }

 if (receive == 0x30)
 {
 Uart1_Write_Text("ok\r");
 receive = 0x00;
 LATD.F9 = 0;
 Spi1_write(0x0C89 + Cal_anout1_2);
 LATD.F9 = 1;
 }




 if (receive == 0x31)
 {
 Uart1_Write_Text("ok\r");
 receive = 0x00;
 LATD.F0 = 0;
 Spi_Receive = Spi1_Read(0x0800);
 LATD.F0 = 1;
 Delay_ms(2);
 LATD.F0 = 0;
 Spi_Receive = Spi1_Read(0x0800);
 LATD.F0 = 1;
 Spi_Receive = Spi_Receive * 6;
 Spi_Receive = Spi_Receive + Cal_anin1;
 IntToStr(Spi_Receive,txt);
 UART1_Write_Text(txt);
 UART1_Write_Text("\r");
 }

 if (receive == 0x32)
 {
 Uart1_Write_Text("ok\r");
 receive = 0x00;
 LATD.F0 = 0;
 Spi_Receive = Spi1_Read(0x1600);
 LATD.F0 = 1;
 Delay_ms(2);
 LATD.F0 = 0;
 Spi_Receive = Spi1_Read(0x1600);
 LATD.F0 = 1;
 Spi_Receive = Spi_Receive * 6;
 Spi_Receive = Spi_Receive + Cal_anin2;
 IntToStr(Spi_Receive,txt);
 UART1_Write_Text(txt);
 UART1_Write_Text("\r");
 }

 if (receive == 0x33)
 {
 Uart1_Write_Text("ok\r");
 receive = 0x00;
 LATD.F0 = 0;
 Spi_Receive = Spi1_Read(0x0000);
 LATD.F0 = 1;
 Delay_ms(2);
 LATD.F0 = 0;
 Spi_Receive = Spi1_Read(0x0000);
 LATD.F0 = 1;
 Spi_Receive = Spi_Receive * 6;
 Spi_Receive = Spi_Receive + Cal_anin3;
 IntToStr(Spi_Receive,txt);
 UART1_Write_Text(txt);
 UART1_Write_Text("\r");
 }

 if (receive == 0x34)
 {
 Uart1_Write_Text("ok\r");
 receive = 0x00;
 LATD.F0 = 0;
 Spi_Receive = Spi1_Read(0x1800);
 LATD.F0 = 1;
 Delay_ms(2);
 LATD.F0 = 0;
 Spi_Receive = Spi1_Read(0x1800);
 LATD.F0 = 1;
 Spi_Receive = Spi_Receive * 6;
 Spi_Receive = Spi_Receive + Cal_anin4;
 IntToStr(Spi_Receive,txt);
 UART1_Write_Text(txt);
 UART1_Write_Text("\r");
 }

 if (receive == 0x35)
 {
 Uart1_Write_Text("ok\r");
 receive = 0x00;
 LATD.F0 = 0;
 Spi_Receive = Spi1_Read(0x2800);
 LATD.F0 = 1;
 Delay_ms(2);
 LATD.F0 = 0;
 Spi_Receive = Spi1_Read(0x2800);
 LATD.F0 = 1;
 Spi_Receive = Spi_Receive * 6;
 Spi_Receive = Spi_Receive + Cal_anin5;
 IntToStr(Spi_Receive,txt);
 UART1_Write_Text(txt);
 UART1_Write_Text("\r");
 }

 if (receive == 0x36)
 {
 Uart1_Write_Text("ok\r");
 receive = 0x00;
 LATD.F0 = 0;
 Spi_Receive = Spi1_Read(0x3000);
 LATD.F0 = 1;
 Delay_ms(2);
 LATD.F0 = 0;
 Spi_Receive = Spi1_Read(0x3000);
 LATD.F0 = 1;
 Spi_Receive = Spi_Receive * 6;
 Spi_Receive = Spi_Receive + Cal_anin6;
 IntToStr(Spi_Receive,txt);
 UART1_Write_Text(txt);
 UART1_Write_Text("\r");
 }

 if (receive == 0x37)
 {
 Uart1_Write_Text("ok\r");
 receive = 0x00;
 LATD.F0 = 0;
 Spi_Receive = Spi1_Read(0x3800);
 LATD.F0 = 1;
 Delay_ms(2);
 LATD.F0 = 0;
 Spi_Receive = Spi1_Read(0x3800);
 LATD.F0 = 1;
 Spi_Receive = Spi_Receive * 6;
 Spi_Receive = Spi_Receive + Cal_anin7;
 IntToStr(Spi_Receive,txt);
 UART1_Write_Text(txt);
 UART1_Write_Text("\r");
 }

 if (receive == 0x38)
 {
 Uart1_Write_Text("ok\r");
 receive = 0x00;
 LATD.F0 = 0;
 Spi_Receive = Spi1_Read(0x2000);
 LATD.F0 = 1;
 Delay_ms(2);
 LATD.F0 = 0;
 Spi_Receive = Spi1_Read(0x2000);
 LATD.F0 = 1;
 Spi_Receive = Spi_Receive * 6;
 Spi_Receive = Spi_Receive + Cal_anin8;
 IntToStr(Spi_Receive,txt);
 UART1_Write_Text(txt);
 UART1_Write_Text("\r");
 }




 if (receive == 0x39)
 {
 UART1_Write_Text("ok\r");
 receive = 0x00;
 LATG.F7 = 1;
 Delay_ms(600);
 LATG.F7 = 0;
 }

 if(receive == 0x3A)
 {
 Uart1_Write_Text("ok\r");
 receive = 0x01;
 LATG.F6 =1;
 Delay_ms(600);
 LATG.F6 = 0;
 }

 if (receive == 0x3B)
 {
 Uart1_Write_Text("ok\r");
 receive = 0x00;
 LATE.F7 = 1;
 Delay_ms(600);
 LATE.F7 = 0;
 }

 if (receive == 0x3C)
 {
 Uart1_Write_Text("ok\r");
 receive = 0x00;
 LATE.F5 = 1;
 Delay_ms(600);
 LATE.F5 = 0;
 }

 if (receive == 0x3D)
 {
 Uart1_Write_Text("ok\r");
 receive = 0x00;
 LATE.F6 = 1;
 Delay_ms(600);
 LATE.F6 = 0;
 }
#line 797 "C:/Users/Jaspe/OneDrive/Documenten/Meetkaart_Joystick/MEETKAART_V1_0_joysticks.c"
 if (receive == 0x3E)
 {
 Uart1_Write_Text("ok\r");
 receive = 0x00;
 LATD.F10 = 0;
 Spi1_write(0x40FA + Cal_anout1_3);
 LATD.F10 = 1;
 }

 if (receive == 0x3F)
 {
 Uart1_Write_Text("ok\r");
 receive = 0x00;
 LATD.F10 = 0;
 Spi1_write(0x50FA + Cal_anout2_3);
 LATD.F10 = 1;
 }

 if (receive == 0x40)
 {
 Uart1_Write_Text("ok\r");
 receive = 0x00;
 LATD.F10 = 0;
 Spi1_write(0x60FA + Cal_anout3_3 );
 LATD.F10 = 1;
 }

 if (receive == 0x41)
 {
 Uart1_Write_Text("ok\r");
 receive = 0x00;
 LATD.F10 = 0;
 Spi1_write(0x70FA + Cal_anout4_3);
 LATD.F10 = 1;
 }

 if (receive == 0x42)
 {
 Uart1_Write_Text("ok\r");
 receive = 0x00;
 LATD.F10 = 0;
 Spi1_write(0x30FA + Cal_anout5_3);
 LATD.F10 = 1;
 }

 if (receive == 0x43)
 {
 Uart1_Write_Text("ok\r");
 receive = 0x00;
 LATD.F10 = 0;
 Spi1_write(0x20FA + Cal_anout6_3);
 LATD.F10 = 1;
 }

 if (receive == 0x44)
 {
 Uart1_Write_Text("ok\r");
 receive = 0x00;
 LATD.F10 = 0;
 Spi1_write(0x10FA);
 LATD.F10 = 1;
 }

 if (receive == 0x45)
 {
 Uart1_Write_Text("ok\r");
 receive = 0x00;
 LATD.F10 = 0;
 Spi1_write(0x00FA + Cal_anout8_3);
 LATD.F10 = 1;
 }



 if (receive == 0x46)
 {
 Uart1_Write_Text("ok\r");
 receive = 0x00;
 LATD.F9 = 0;
 Spi1_write(0x40FA + Cal_anout9_3);
 LATD.F9 = 1;
 }



 if (receive == 0x47)
 {
 Uart1_Write_Text("ok\r");
 receive = 0x00;
 LATD.F9 = 0;
 Spi1_write(0x50FA + Cal_anout10_3);
 LATD.F9 = 1;
 }

 if (receive == 0x48)
 {
 Uart1_Write_Text("ok\r");
 receive = 0x00;
 LATD.F9 = 0;
 Spi1_write(0x60FA + Cal_anout11_3);
 LATD.F9 = 1;
 }

 if (receive == 0x49)
 {
 Uart1_Write_Text("ok\r");
 receive = 0x00;
 LATD.F9 = 0;
 Spi1_write(0x70FA + Cal_anout12_3);
 LATD.F9 = 1;
 }

 if (receive == 0x4A)
 {
 Uart1_Write_Text("ok\r");
 receive = 0x00;
 LATD.F9 = 0;
 Spi1_write(0x30FA + Cal_anout13_3);
 LATD.F9 = 1;
 }



 if (receive == 0x4B)
 {
 Uart1_Write_Text("ok\r");
 receive = 0x00;
 LATD.F9 = 0;
 Spi1_write(0x20FA + Cal_anout14_3);
 LATD.F9 = 1;
 }

 if (receive == 0x4C)
 {
 Uart1_Write_Text("ok\r");
 receive = 0x00;
 LATD.F9 = 0;
 Spi1_write(0x10FA + Cal_anout15_3);
 LATD.F9 = 1;
 }




 if (receive == 0x4D)
 {
 Uart1_Write_Text("ok\r");
 receive = 0x00;
 LATD.F9 = 0;
 Spi1_write(0x00FA + Cal_anout16_3);
 LATD.F9 = 1;
 }
 }
 }
