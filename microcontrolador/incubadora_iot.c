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
#define ENABLE_CONTROL_AUTOMATICO 1
#define ENABLE_BUZZER 1
#define MILISEG_ACTUALIZACION_LECTURA 1000

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
void buzzer(unsigned int millis,unsigned int repeticiones){
  unsigned int i=0;
  unsigned int u=0;
  for(u=0;u<repeticiones;u++){
    PIN_BUZZER=1;
    for(i=0;i<millis;i++){
     Delay_ms(1);
    }
    PIN_BUZZER=0;
    for(i=0;i<millis;i++){
    }
  }

}//fin buzzer

char read_dth11(unsigned char sensor){            //funcion para realizar la lectura del sensor dht11
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
    //protocolo
    PIN_SENSOR_Direction=0;  //rb0 de salida
    PIN_SENSOR=1;  //rb0 en alto
    delay_us(20);
    PIN_SENSOR=0;     //rbo en bajo
    delay_ms(18);
    PIN_SENSOR=1;     //rbo en alto
    delay_us(22);
    PIN_SENSOR_Direction=1; //rbo como entrada para leer la respuesta del sensor
    delay_us(10);
    if(PIN_SENSOR){return -1;}    //comprueba si el sensor envio un estado bajo
    delay_us(80);
    if(PIN_SENSOR==0){return -1;}      //comprueba si el sensor envio un estado alto despues de 80ms
    delay_us(80);
       //inicia la transmision
       for(i=0;i<5;i++){
         for(j=0;j<8;j++){
              while(PIN_SENSOR==0);   //espera a que la entrada sea distinta de 0
              delay_us(30);     //espera 30 us
              if(PIN_SENSOR){    // si el pulso despues de 30us esta en alto es porque es un 1
                 dato[i]=(dato[i]<<1) | 0x01;   // se le agrega un 1 al bit
              }
              if(PIN_SENSOR==0){       // si el pulso despues de 30us esta en bajo es porque es un 0
                 dato[i]=(dato[i]<<1);}  // se le agrega un 0 corriendo a la izquierda            }
              while(PIN_SENSOR==1);
         }//fin for de 8
       }// fin for de 5
    PIN_SENSOR_Direction=0;    //rb0 de salida
    PIN_SENSOR=1;     //rb0  en alto
    //operacion binaria
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
}//fin read_dht

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

void menu_configuracion(){                        //funcion para antender la configuraion de los set points haciendo uso de los 3 pulsadores
 unsigned int contador=0;

 if(PIN_PULSADOR_ENTER){      // menu de configuracion
       contador=0;
       while(PIN_PULSADOR_ENTER){
         Delay_ms(10);
         contador++;
         if(contador>=100){
           lcd_Print('C');
           buzzer(500,1);
           contador=0;
           while(PIN_PULSADOR_ENTER){}

           while(contador<2){

            if(contador==0){
               lcd_Print('T');
             }else if(contador==1){
                lcd_Print('H');
             }

             while(1){

               if(PIN_PULSADOR_DER){      //pulsador derecha

                 Delay_ms(200);
                 if(contador==0){
                   if(stpointT<50){stpointT++;}
                   lcd_Print('T');
                 }else if(contador==1){
                    if(stpointH<90){stpointH++;}
                   lcd_Print('H');
                 }

               }else if(PIN_PULSADOR_IZQ){   //pulsador izquierda

                Delay_ms(200);
                if(contador==0){
                   if(stpointT>0){stpointT--;}
                   lcd_Print('T');
                 }else if(contador==1){
                   if(stpointH>20){stpointH--;}
                   lcd_Print('H');
                 }

               }else if(PIN_PULSADOR_ENTER){   // pulsador central
                 while(PIN_PULSADOR_ENTER){}
                 buzzer(100,1);
                 break;
               }

             }
              contador++;
           }
             EEPROM_Write(0x02,stpointT);
             EEPROM_Write(0x03,stpointH);


         }
       }
    }
}// fin menu  de configuracion

void proceso_control(){                           // funcion para gestionar el control automatico de los perifericos para mantener las variables estables

  if(ENABLE_CONTROL_AUTOMATICO){

    if(temperatura==stpointT){
       PIN_CALENTADOR=0;
       PIN_VENTILADOR=0;
    }else if(temperatura<stpointT){
       PIN_CALENTADOR=1;
       PIN_VENTILADOR=0;
    }else if(temperatura>stpointT){
       PIN_CALENTADOR=0;
       PIN_VENTILADOR=1;
    }

    if(humedad==stpointH){
       PIN_HUMIFICADOR=0;
    }else if(humedad<stpointH){
       PIN_HUMIFICADOR=1;
    }else if(humedad>stpointH){
       PIN_HUMIFICADOR=0;
    }

  }else{
    PIN_HUMIFICADOR=0;
    PIN_CALENTADOR=0;
    PIN_VENTILADOR=0;
  }
}//fin proceso control


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
  stpointT=EEPROM_Read(0x02);
  stpointH=EEPROM_Read(0x03);
  buzzer(600,1);
//UART1_Init(9600);
//delay_ms(100);


 while(1){



   if(read_dth11(1)==1){
     lcd_Print('I');
   }else {
     lcd_Print('E');
     buzzer(200,3);
     delay_ms(500);
   }

   for(i=0;i<MILISEG_ACTUALIZACION_LECTURA;i++){
    delay_ms(1);
    menu_configuracion();
    proceso_control();
   }


  } //fin while
}//fin main