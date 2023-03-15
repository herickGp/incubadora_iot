/*****************************************************************************************************************
  PROYECTO FINAL PARA EL DIPLOMADO DE IOT EN LA UNIVERSIDAD DEL MAGDALENA

  NOMBRE: INCUBADORA IoT
  DESCRIPCION: LECTURA Y CONTROL DE LA VARIABLE DE TEMPERATURA Y HUMEDAD DENTRO DE UN ESPACIO EN DONDE
               SE LLEVARA A CABO LA INCUBACION DE HUEVOS DE AVES, CON EL FIN DE MANTENER UN AMBIENTE APROPIADO
               PARA LA INCUBACION.
  SENSOR: DHT11
  PIC:16F887A
  FOS: 4MHZ
  LCD: 16X2


*******************************************************************************************************************/
//==================================================DEFINICIONES

// pins LCD
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
// pin perifericos
sbit PIN_CALENTADOR at RD2_bit;
sbit PIN_VENTILADOR at RD1_bit;
sbit PIN_HUMIFICADOR at RD3_bit;
sbit PIN_PULSADOR_ENTER at RD6_bit;
sbit PIN_PULSADOR_IZQ at RD5_bit;
sbit PIN_PULSADOR_DER at RD7_bit;
sbit PIN_SENSOR at RD0_bit;
sbit PIN_SENSOR_Direction at TRISD0_bit;
#define PIN_BUZZER  RA0_bit


 //==================================================VARIABLES
unsigned char temperatura=0;
unsigned char humedad=0;
unsigned short stpointH=0;
unsigned short stpointT=0;
unsigned int i=0;


//==================================================FUNCIONES

void lcd_Print(unsigned char screen){             //funcion para imprimir las diferentes pantallas en la lcd16x2
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

      default:  Lcd_Out(1,7,"NULL");
                break;

   }//fin switch
}//fin lcdPrint

//================================================BODY
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







  } //fin while
}//fin main