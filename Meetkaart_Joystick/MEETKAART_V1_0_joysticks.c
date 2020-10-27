void main() {
 char output;
 char Command;
 char receive;
 unsigned int Spi_Receive;
 char txt[4];
 
 //CALLIBRATIE
 //Joystick calibratie versie
 
 //Analoog in waardes in mV
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


 //Configureer digitale inputs en outputs
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
//pin mapping
Unlock_IOLOCK();   //Unlock pinmapping
//UART MAPPING
PPS_Mapping_NoLock(28, _INPUT, _U1RX);    // Mapping UART1 RX naar RP18
PPS_Mapping_NoLock(18, _OUTPUT, _U1TX);   // Mapping UART1 TX naar RP28
//SPI MAPPING
PPS_Mapping_NoLock(22, _OUTPUT, _SDO1);    //  Mapping SPI1 data out naar rp22
PPS_Mapping_NoLock(24, _OUTPUT, _SCK1OUT);   //  Mappig SPI1 clock out naar rp24
PPS_Mapping_NoLock(23, _INPUT, _SDI1IN);    //  Mapping SPI1
//CHIP SELECT MAPPING
//PPS_Mapping(11, _OUTPUT, _SS1OUT);   // CHIP SELECT ADC1
//PPS_Mapping(3, _OUTPUT, _SS2OUT);   // CHIP SELECT DAC1
//PPS_Mapping(4, _OUTPUT, _SS2OUT);   // CHIP SELECT DAC2
Lock_IOLOCK();    //Lock pinmapping



//UART1_Init(9600);   //UART CONFIGUREER BAUDRATE
SPI1_Init_Advanced(_SPI_MASTER, _SPI_16_BIT, _SPI_PRESCALE_SEC_8, _SPI_PRESCALE_PRI_1, _SPI_SS_DISABLE, _SPI_DATA_SAMPLE_MIDDLE, _SPI_CLK_IDLE_HIGH, _SPI_ACTIVE_2_IDLE);

Delay_ms(100);  

LATF.F14 = 1;//release reset mcp2200
LATD.F10 = 1;//CS_1
LATD.F9 =  1;//CS_2
LATD.F0 = 1;//CS_3
LATD.F8 = 1;//PANIC

while(1)
{


    // if (UART1_Data_Ready() == 1)    // if data is received
    //{
    // UART1_Read_Text(output, 0X0D, 255);    // reads text until 'CR' is found
    //UART1_Write_Text(output);             // sends back text
    //}
    
  if (UART1_Data_Ready() ==1)
  {
   receive = UART1_Read();
   }
  //ANALOOG UIT
   if (receive == 0x01)//analoog uit 1 0V
   {
   Uart1_Write_Text("ok\r");
   receive = 0x00;
   LATD.F10 = 0;
   Spi1_write(0x4000);
   LATD.F10 = 1;
   }

   if (receive == 0x02)//analoog uit 1 5.0V
   {
   Uart1_Write_Text("ok\r");
   receive = 0x00;
   LATD.F10 = 0;
   Spi1_write(0x49C4 + Cal_anout1_1);
   LATD.F10 = 1;
   }
  
   if (receive == 0x03)//analoog uit 1 6.418V
   {
   Uart1_Write_Text("ok\r");
   receive = 0x00;
   LATD.F10 = 0;
   Spi1_write(0x4C89 + Cal_anout1_2);
   LATD.F10 = 1;
   }
   if (receive == 0x04)//analoog uit 2 0V
   {
   Uart1_Write_Text("ok\r");
   receive = 0x00;
   LATD.F10 = 0;
   Spi1_write(0x5000);
   LATD.F10 = 1;
   }
   
   if (receive == 0x05)//analoog uit 2 5.0V
   {
   Uart1_Write_Text("ok\r");
   receive = 0x00;
   LATD.F10 = 0;
   Spi1_write(0x59C4 + Cal_anout2_1);
   LATD.F10 = 1;
   }
  
  if (receive == 0x06)//analoog uit 2 6.418V
  {
   Uart1_Write_Text("ok\r");
   receive = 0x00;
   LATD.F10 = 0;
   Spi1_write(0x5C89 + Cal_anout2_2);
   LATD.F10 = 1;
   }
  
  if (receive == 0x07)//analoog uit 3 0V
  {
   Uart1_Write_Text("ok\r");
   receive = 0x00;
   LATD.F10 = 0;
   Spi1_write(0x6000);
   LATD.F10 = 1;
   }
  
  if (receive == 0x08)//analoog uit 3 5.0V
   {
   Uart1_Write_Text("ok\r");
   receive = 0x00;
   LATD.F10 = 0;
   Spi1_write(0x69C4 + Cal_anout3_1);
   LATD.F10 = 1;
   }
  
  if (receive == 0x09)//analoog uit 3 6.418V
   {
   Uart1_Write_Text("ok\r");
   receive = 0x00;
   LATD.F10 = 0;
   Spi1_write(0x6C89 + Cal_anout3_2);
   LATD.F10 = 1;
   }
  
   if (receive == 0x0A)//analoog uit  4 0V
   {
   Uart1_Write_Text("ok\r");
   receive = 0x00;
   LATD.F10 = 0;
   Spi1_write(0x7000);
   LATD.F10 = 1;
   }
  
   if (receive == 0x0B)//analoog uit 4 5.0V
   {
   Uart1_Write_Text("ok\r");
   receive = 0x00;
   LATD.F10 = 0;
   Spi1_write(0x79C4 + Cal_anout4_1);
   LATD.F10 = 1;
   }
  
   if (receive == 0x0C)//analoog uit 4 6.418V
  {
   Uart1_Write_Text("ok\r");
   receive = 0x00;
   LATD.F10 = 0;
   Spi1_write(0x7C89 + Cal_anout4_2);
   LATD.F10 = 1;
   }
  
  //if (receive == 0x0D)//analoog uit 5 0V
  //{
   //Uart1_Write_Text("ok\r");
   //receive = 0x00;
   //LATD.F10 = 0;
   //Spi1_write(0x3000);
   //LATD.F10 = 1;
  // }
  
  if (receive == 0x0E)//analoog uit 5 5.0V
   {
   Uart1_Write_Text("ok\r");
   receive = 0x00;
   LATD.F10 = 0;
   Spi1_write(0x39C4 + Cal_anout5_1);
   LATD.F10 = 1;
   }
  
  if (receive == 0x0F)//analoog uit 5 6.418V
  {
   Uart1_Write_Text("ok\r");
   receive = 0x00;
   LATD.F10 = 0;
   Spi1_write(0x3C89 + Cal_anout5_2);
   LATD.F10 = 1;
   }
  
  if (receive == 0x10)//analoog uit  6 0V
  {
   Uart1_Write_Text("ok\r");
   receive = 0x00;
   LATD.F10 = 0;
   Spi1_write(0x2000);
   LATD.F10 = 1;
   }
  
  if (receive == 0x11)//analoog uit 6 5.0V
  {
   Uart1_Write_Text("ok\r");
   receive = 0x00;
   LATD.F10 = 0;
   Spi1_write(0x29C4 + Cal_anout6_1);
   LATD.F10 = 1;
   }
  
  if (receive == 0x12)//analoog uit 6 6.418V
  {
   Uart1_Write_Text("ok\r");
   receive = 0x00;
   LATD.F10 = 0;
   Spi1_write(0x2C89 + Cal_anout6_2);
   LATD.F10 = 1;
   }
  if (receive == 0x13)//analoog uit 7 0V
   {
   Uart1_Write_Text("ok\r");
   receive = 0x00;
   LATD.F10 = 0;
   Spi1_write(0x1000);
   LATD.F10 = 1;
   }
  
  if (receive == 0x14)//analoog uit 7 5.0V
  {
   Uart1_Write_Text("ok\r");
   receive = 0x00;
   LATD.F10 = 0;
   Spi1_write(0x19C4 + Cal_anout7_1);
   LATD.F10 = 1;
   }
  
  if (receive == 0x15)//analoog uit 7 6.418V
  {
   Uart1_Write_Text("ok\r");
   receive = 0x00;
   LATD.F10 = 0;
   Spi1_write(0x1C89 + Cal_anout7_2);
   LATD.F10 = 1;
   }
  
  if (receive == 0x16)//analoog uit 8 0V
  {
   Uart1_Write_Text("ok\r");
   receive = 0x00;
   LATD.F10 = 0;
   Spi1_write(0x0000);
   LATD.F10 = 1;
   }
  
  if (receive == 0x17)//analgoog uit 8 5.0V
  {
   Uart1_Write_Text("ok\r");
   receive = 0x00;
   LATD.F10 = 0;
   Spi1_write(0x09C4 + Cal_anout8_1);
   LATD.F10 = 1;
   }
  
  if (receive == 0x18)//analoog uit 8 6.418V
  {
   Uart1_Write_Text("ok\r");
   receive = 0x00;
   LATD.F10 = 0;
   Spi1_write(0x0C89 + Cal_anout8_2);
   LATD.F10 = 1;
   }
  
  if (receive == 0x19)//analoog uit 9 0V
  {
   Uart1_Write_Text("ok\r");
   receive = 0x00;
   LATD.F9 = 0;
   Spi1_write(0x4000);
   LATD.F9 = 1;
   }
  
  if (receive == 0x1A)//analoog uit 9 5.0V
  {
   Uart1_Write_Text("ok\r");
   receive = 0x00;
   LATD.F9 = 0;
   Spi1_write(0x49C4 + Cal_anout9_1);
   LATD.F9 = 1;
   }
  
  if (receive == 0x1B)//analoog uit 9 6.418V
  {
   Uart1_Write_Text("ok\r");
   receive = 0x00;
   LATD.F9 = 0;
   Spi1_write(0x4C89 + Cal_anout9_2);
   LATD.F9 = 1;
   }
  
  if (receive == 0x1C)//analoog uit 10 0V
  {
   Uart1_Write_Text("ok\r");
   receive = 0x00;
   LATD.F9 = 0;
   Spi1_write(0x5000);
   LATD.F9 = 1;
   }
  
  if (receive == 0x1D)//analoog uit 10 5.0V
  {
   Uart1_Write_Text("ok\r");
   receive = 0x00;
   LATD.F9 = 0;
   Spi1_write(0x59C4 + Cal_anout10_1);
   LATD.F9 = 1;
   }
  
  if (receive == 0x1E)//analoog uit 10 6.418V
  {
   Uart1_Write_Text("ok\r");
   receive = 0x00;
   LATD.F9 = 0;
   Spi1_write(0x5C89 + Cal_anout10_2);
   LATD.F9 = 1;
   }
  
   if (receive == 0x1F)//analoog uit 11 0V
   {
   Uart1_Write_Text("ok\r");
   receive = 0x00;
   LATD.F9 = 0;
   Spi1_write(0x6000);
   LATD.F9 = 1;
   }
  
   if (receive == 0x20)//analoog uit 11 5.0V
   {
   Uart1_Write_Text("ok\r");
   receive = 0x00;
   LATD.F9 = 0;
   Spi1_write(0x69C4 + Cal_anout11_1);
   LATD.F9 = 1;
   }
  
   if (receive == 0x21)//analoog uit 11 6.418V
   {
   Uart1_Write_Text("ok\r");
   receive = 0x00;
   LATD.F9 = 0;
   Spi1_write(0x6C89 + Cal_anout11_2);
   LATD.F9 = 1;
   }
  
   if (receive == 0x22)//analoog uit 12 0V
   {
   Uart1_Write_Text("ok\r");
   receive = 0x00;
   LATD.F9 = 0;
   Spi1_write(0x7000);
   LATD.F9 = 1;
   }
  
   if (receive == 0x23)//analoog uit 12 5.0V
   {
   Uart1_Write_Text("ok\r");
   receive = 0x00;
   LATD.F9 = 0;
   Spi1_write(0x79C4 + Cal_anout12_1);
   LATD.F9 = 1;
   }
  
   if (receive == 0x24)//analoog uit 12 6.418V
   {
   Uart1_Write_Text("ok\r");
   receive = 0x00;
   LATD.F9 = 0;
   Spi1_write(0x7C89 + Cal_anout12_2);
   LATD.F9 = 1;
   }
  
   if (receive == 0x25)//analoog uit 13 0V
   {
   Uart1_Write_Text("ok\r");
   receive = 0x00;
   LATD.F9 = 0;
   Spi1_write(0x3000);
   LATD.F9 = 1;
   }
  
   if (receive == 0x26)//analoog uit 13 5.0V
   {
   Uart1_Write_Text("ok\r");
   receive = 0x00;
   LATD.F9 = 0;
   Spi1_write(0x39C4 + Cal_anout13_1);
   LATD.F9 = 1;
   }
  
   if (receive == 0x27)//analoog uit 13 6.418V
   {
   Uart1_Write_Text("ok\r");
   receive = 0x00;
   LATD.F9 = 0;
   Spi1_write(0x3C89 + Cal_anout13_2);
   LATD.F9 = 1;
   }
  
   if (receive == 0x28)//analoog uit 14 0V
   {
   Uart1_Write_Text("ok\r");
   receive = 0x00;
   LATD.F9 = 0;
   Spi1_write(0x2000);
   LATD.F9 = 1;
   }
  
   if (receive == 0x29)//analoog uit 14 5.0V
   {
   Uart1_Write_Text("ok\r");
   receive = 0x00;
   LATD.F9 = 0;
  Spi1_write(0x29C4 + Cal_anout14_1);
   LATD.F9 = 1;
   }
  
   if (receive == 0x2A)//analoog uit 14 6.418V
   {
   Uart1_Write_Text("ok\r");
   receive = 0x00;
   LATD.F9 = 0;
   Spi1_write(0x2C89 + Cal_anout14_2);
   LATD.F9 = 1;
   }
  
   if (receive == 0x2B)//analoog uit 15 0V
   {
   Uart1_Write_Text("ok\r");
   receive = 0x00;
   LATD.F9 = 0;
   Spi1_write(0x1000);
   LATD.F9 = 1;
   }
  
   if (receive == 0x2C)//analoog uit 15 5.0V
   {
   Uart1_Write_Text("ok\r");
   receive = 0x00;
   LATD.F9 = 0;
   Spi1_write(0x19C4 + Cal_anout15_1);
   LATD.F9 = 1;
   }
  
   if (receive == 0x2D)//analoog uit 15 6.418V
   {
   Uart1_Write_Text("ok\r");
   receive = 0x00;
   LATD.F9 = 0;
   Spi1_write(0x1C89 + Cal_anout15_2);
   LATD.F9 = 1;
   }
  
   if (receive == 0x2E)//analoog uit 16 0V
   {
   Uart1_Write_Text("ok\r");
   receive = 0x00;
   LATD.F9 = 0;
   Spi1_write(0x0000);
   LATD.F9 = 1;
   }

   if (receive == 0x2F)//analoog uit 16 5.0V
   {
   Uart1_Write_Text("ok\r");
   receive = 0x00;
   LATD.F9 = 0;
   Spi1_write(0x09C4 + Cal_anout16_1);
   LATD.F9 = 1;
   }
  
   if (receive == 0x30)//analoog uit 16 6.418V
   {
   Uart1_Write_Text("ok\r");
   receive = 0x00;
   LATD.F9 = 0;
   Spi1_write(0x0C89 + Cal_anout1_2);
   LATD.F9 = 1;
   }
  
  
  //ANALOOG IN

   if (receive == 0x31)//analoog in 1
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

   if (receive == 0x32)//analoog in 2
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

   if (receive == 0x33)//analoog in 3
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

   if (receive == 0x34)//analoog in 4
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

   if (receive == 0x35)//analoog in 5
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

   if (receive == 0x36)//analoog in 6
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

    if (receive == 0x37)//analoog in 7
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

   if (receive == 0x38)//analoog in 8
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
   
   
   //digitaal uit
   
   if (receive == 0x39)//digitaal uit 1
   {
   UART1_Write_Text("ok\r");
   receive = 0x00;
   LATG.F7 = 1;
   Delay_ms(600);
   LATG.F7 = 0;
   }

   if(receive == 0x3A)//digitaal uit 2
   {
    Uart1_Write_Text("ok\r");
    receive = 0x01;
    LATG.F6 =1;
    Delay_ms(600);
    LATG.F6 = 0;
   }

   if (receive == 0x3B)//digitaal uit 3
   {
    Uart1_Write_Text("ok\r");
    receive = 0x00;
    LATE.F7 = 1;
    Delay_ms(600);
    LATE.F7 = 0;
   }

   if (receive == 0x3C)//digitaal uit 4
   {
   Uart1_Write_Text("ok\r");
   receive = 0x00;
   LATE.F5 = 1;
   Delay_ms(600);
   LATE.F5 = 0;
   }

   if (receive == 0x3D)//digitaal uit 5
   {
   Uart1_Write_Text("ok\r");
   receive = 0x00;
   LATE.F6 = 1;
   Delay_ms(600);
   LATE.F6 = 0;
   }

    //Digitaal in

    // if (PORTE.F3 == 1){// Digitaal in 1
     //UART1_Write_Text("ok\r");
     //receive = 0x00;
     //LATG.F7 = 1;
    // Delay_ms(600);
    // LATG.F7 = 0;
    //}

    // if (PORTE.F4 == 1){// Digitaal in 2
     //Uart1_Write_Text("ok\r");
     //receive = 0x00;
     //LATG.F6 =1;
     //Delay_ms(600);
     //LATG.F6 = 0;
    //}

     //if (PORTE.F2 == 1){// Digitaal in 3
     //Uart1_Write_Text("ok\r");
     //receive = 0x00;
     //LATE.F7 = 1;
     //Delay_ms(600);
     //LATE.F7 = 0;
    //}

     //if (PORTE.F0 == 1){// Digitaal in 4
     //Uart1_Write_Text("ok\r");
     //receive = 0x00;
    //LATE.F5 = 1;
    // Delay_ms(600);
     //LATE.F5 = 0;
    //}

     //if (PORTE.F1 == 1){// Digitaal in 5
     //Uart1_Write_Text("ok\r");
     //receive = 0x00;
     //LATE.F6 = 1;
     //Delay_ms(600);
     //LATE.F6 = 0;
    //}
    
    //ANALOOG UIT
   if (receive == 0x3E)//analoog uit 1 0.5V
   {
   Uart1_Write_Text("ok\r");
   receive = 0x00;
   LATD.F10 = 0;
   Spi1_write(0x40FA + Cal_anout1_3);
   LATD.F10 = 1;
   }

   if (receive == 0x3F)//analoog uit 2 0.5V
   {
   Uart1_Write_Text("ok\r");
   receive = 0x00;
   LATD.F10 = 0;
   Spi1_write(0x50FA + Cal_anout2_3);
   LATD.F10 = 1;
   }

  if (receive == 0x40)//analoog uit 3 0.5V
  {
   Uart1_Write_Text("ok\r");
   receive = 0x00;
   LATD.F10 = 0;
   Spi1_write(0x60FA + Cal_anout3_3 );
   LATD.F10 = 1;
   }

   if (receive == 0x41)//analoog uit  4 0.5V
   {
   Uart1_Write_Text("ok\r");
   receive = 0x00;
   LATD.F10 = 0;
   Spi1_write(0x70FA + Cal_anout4_3);
   LATD.F10 = 1;
   }

  if (receive == 0x42)//analoog uit 5 0.5V
  {
   Uart1_Write_Text("ok\r");
   receive = 0x00;
   LATD.F10 = 0;
   Spi1_write(0x30FA + Cal_anout5_3);
   LATD.F10 = 1;
   }

  if (receive == 0x43)//analoog uit  6 0.5V
  {
   Uart1_Write_Text("ok\r");
   receive = 0x00;
   LATD.F10 = 0;
   Spi1_write(0x20FA + Cal_anout6_3);
   LATD.F10 = 1;
   }

  if (receive == 0x44)//analoog uit 7 0.5V
   {
   Uart1_Write_Text("ok\r");
   receive = 0x00;
   LATD.F10 = 0;
   Spi1_write(0x10FA);
   LATD.F10 = 1;
   }

  if (receive == 0x45)//analoog uit 8 0.5V
  {
   Uart1_Write_Text("ok\r");
   receive = 0x00;
   LATD.F10 = 0;
   Spi1_write(0x00FA + Cal_anout8_3);
   LATD.F10 = 1;
   }



  if (receive == 0x46)//analoog uit 9 0.5V
  {
   Uart1_Write_Text("ok\r");
   receive = 0x00;
   LATD.F9 = 0;
   Spi1_write(0x40FA + Cal_anout9_3);
   LATD.F9 = 1;
   }



  if (receive == 0x47)//analoog uit 10 0.5V
  {
   Uart1_Write_Text("ok\r");
   receive = 0x00;
   LATD.F9 = 0;
   Spi1_write(0x50FA + Cal_anout10_3);
   LATD.F9 = 1;
   }

   if (receive == 0x48)//analoog uit 11 0.5V
   {
   Uart1_Write_Text("ok\r");
   receive = 0x00;
   LATD.F9 = 0;
   Spi1_write(0x60FA + Cal_anout11_3);
   LATD.F9 = 1;
   }

   if (receive == 0x49)//analoog uit 12 0.5V
   {
   Uart1_Write_Text("ok\r");
   receive = 0x00;
   LATD.F9 = 0;
   Spi1_write(0x70FA + Cal_anout12_3);
   LATD.F9 = 1;
   }

   if (receive == 0x4A)//analoog uit 13 0.5V
   {
   Uart1_Write_Text("ok\r");
   receive = 0x00;
   LATD.F9 = 0;
   Spi1_write(0x30FA + Cal_anout13_3);
   LATD.F9 = 1;
   }



   if (receive == 0x4B)//analoog uit 14 0.5V
   {
   Uart1_Write_Text("ok\r");
   receive = 0x00;
   LATD.F9 = 0;
   Spi1_write(0x20FA + Cal_anout14_3);
   LATD.F9 = 1;
   }

   if (receive == 0x4C)//analoog uit 15 0.5V
   {
   Uart1_Write_Text("ok\r");
   receive = 0x00;
   LATD.F9 = 0;
   Spi1_write(0x10FA + Cal_anout15_3);
   LATD.F9 = 1;
   }




   if (receive == 0x4D)//analoog uit 16 0.5V
   {
   Uart1_Write_Text("ok\r");
   receive = 0x00;
   LATD.F9 = 0;
   Spi1_write(0x00FA + Cal_anout16_3);
   LATD.F9 = 1;
   }
  }
 }