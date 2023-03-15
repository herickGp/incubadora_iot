#line 1 "C:/Users/heric/Desktop/Proyecto final/incubadora_iot/microcontrolador/incubadora_iot.c"
#line 18 "C:/Users/heric/Desktop/Proyecto final/incubadora_iot/microcontrolador/incubadora_iot.c"
sbit LCD_RS at RB4_bit;
sbit LCD_EN at RB5_bit;
sbit LCD_D4 at RB0_bit;
sbit LCD_D5 at RB1_bit;
sbit LCD_D6 at RB2_bit;
sbit LCD_D7 at RB3_bit;
sbit LCD_RS_Direction at TRISB4_bit;
sbit LCD_EN_Direction at TRISB5_bit;
sbit LCD_D4_Direction at TRISB0_bit;
sbit LCD_D5_Direction at TRISB1_bit;
sbit LCD_D6_Direction at TRISB2_bit;
sbit LCD_D7_Direction at TRISB3_bit;

sbit PIN_CALENTADOR at RD2_bit;
sbit PIN_VENTILADOR at RD1_bit;
sbit PIN_HUMIFICADOR at RD3_bit;
sbit PIN_PULSADOR_ENTER at RD6_bit;
sbit PIN_PULSADOR_IZQ at RD5_bit;
sbit PIN_PULSADOR_DER at RD7_bit;
sbit PIN_SENSOR at RD0_bit;
sbit PIN_SENSOR_Direction at TRISD0_bit;




unsigned char temperatura=0;
unsigned char humedad=0;
unsigned short stpointH=0;
unsigned short stpointT=0;
unsigned int i=0;




void buzzer(unsigned int millis,unsigned int repeticiones){
 unsigned int i=0;
 unsigned int u=0;
 for(u=0;u<repeticiones;u++){
  RA0_bit =1;
 for(i=0;i<millis;i++){
 Delay_ms(1);
 }
  RA0_bit =0;
 for(i=0;i<millis;i++){
 }
 }
}

char read_dth11(unsigned char sensor){
 unsigned char dato[5];
 unsigned char i=0;
 unsigned char j=0;
 char valor[4];
 unsigned int hum=0;
 unsigned int temp=0;
 unsigned int base=10;

 temperatura=0;
 humedad=0;

 while(1){

 PIN_SENSOR_Direction=0;
 PIN_SENSOR=1;
 delay_us(20);
 PIN_SENSOR=0;
 delay_ms(18);
 PIN_SENSOR=1;
 delay_us(22);
 PIN_SENSOR_Direction=1;
 delay_us(10);
 if(PIN_SENSOR){return -1;}
 delay_us(80);
 if(PIN_SENSOR==0){return -1;}
 delay_us(80);

 for(i=0;i<5;i++){
 for(j=0;j<8;j++){
 while(PIN_SENSOR==0);
 delay_us(30);
 if(PIN_SENSOR){
 dato[i]=(dato[i]<<1) | 0x01;
 }
 if(PIN_SENSOR==0){
 dato[i]=(dato[i]<<1);}
 while(PIN_SENSOR==1);
 }
 }
 PIN_SENSOR_Direction=0;
 PIN_SENSOR=1;

 if((dato[0]+dato[1]+dato[2]+dato[3])==dato[4]){
 hum=dato[0];
 temp=dato[2];

 base=10;
 for(i=0;i<2;i++){
 valor[i]=(hum/base);
 hum=hum-(valor[i]*base);
 base=base/10;
 }
 base=10;
 for(i=2;i<4;i++){
 valor[i]=(temp/base);
 temp=temp-(valor[i]*base);
 base=base/10;
 }

 temperatura=(valor[2]*10)+valor[3];
 humedad=(valor[0]*10)+valor[1];
 return 1;

 }else{return -1;}
 }
}


void lcd_Print(unsigned char screen){
 char txtInt[4];
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);

 switch(screen){

 case 'I':
 ByteToStr(temperatura,txtInt);
 Lcd_Out(1,13,txtInt);
 ByteToStr(humedad,txtInt);
 Lcd_Out(2,13,txtInt);
 Lcd_Out(1,1,"TEMPERATURA:");
 Lcd_Out(2,1,"HUMEDAD:");
 Lcd_Out(1,16,"C");
 Lcd_Out(2,16,"%");
 break;

 case 'E': Lcd_Out(1,7,"[X]");
 Lcd_Out(2,2,"ERROR EN DHT11");
 break;

 case 'C': Lcd_Out(1,3,"CONFIGURACION");
 break;

 case 'T': Lcd_Out(1,3,"-TEMPERATURA-");
 Lcd_Out(2,1,"<>");
 Lcd_Out(2,16,"C");
 ByteToStr(stpointT,txtInt);
 Lcd_Out(2,13,txtInt);
 break;

 case 'H': Lcd_Out(1,4,"-HUMEDAD-");
 Lcd_Out(2,1,"<>");
 Lcd_Out(2,16,"%");
 ByteToStr(stpointH,txtInt);
 Lcd_Out(2,13,txtInt);
 break;

 case 'X': Lcd_Out(1,7,"");
 Lcd_Out(2,2,"ERROR EN DHT11");
 break;

 default: Lcd_Out(1,7,"NULL");
 break;

 }
}


void main() {
 ANSEL =0X00;
 ANSELH = 0X00;
 TRISD=0XE0;
 TRISA=0X00;
 PORTA=0X00;
 PORTD=0x01;
 Lcd_Init();
 Lcd_Cmd(_LCD_CURSOR_OFF);


 while(1){

 if(read_dth11(1)==1){
 lcd_Print('I');
 }else {
 lcd_Print('E');
 buzzer(200,3);
 delay_ms(500);
 }






 }
}
