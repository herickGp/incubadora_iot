
_lcd_Print:

;incubadora_iot.c,52 :: 		void lcd_Print(unsigned char screen){             //funcion para imprimir las diferentes pantallas en la lcd16x2
;incubadora_iot.c,54 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;incubadora_iot.c,55 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;incubadora_iot.c,57 :: 		switch(screen){
	GOTO       L_lcd_Print0
;incubadora_iot.c,59 :: 		case 'I':
L_lcd_Print2:
;incubadora_iot.c,60 :: 		ByteToStr(temperatura,txtInt);
	MOVF       _temperatura+0, 0
	MOVWF      FARG_ByteToStr_input+0
	MOVLW      lcd_Print_txtInt_L0+0
	MOVWF      FARG_ByteToStr_output+0
	CALL       _ByteToStr+0
;incubadora_iot.c,61 :: 		Lcd_Out(1,13,txtInt);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      13
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      lcd_Print_txtInt_L0+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;incubadora_iot.c,62 :: 		ByteToStr(humedad,txtInt);
	MOVF       _humedad+0, 0
	MOVWF      FARG_ByteToStr_input+0
	MOVLW      lcd_Print_txtInt_L0+0
	MOVWF      FARG_ByteToStr_output+0
	CALL       _ByteToStr+0
;incubadora_iot.c,63 :: 		Lcd_Out(2,13,txtInt);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      13
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      lcd_Print_txtInt_L0+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;incubadora_iot.c,64 :: 		Lcd_Out(1,1,"TEMPERATURA:");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_incubadora_iot+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;incubadora_iot.c,65 :: 		Lcd_Out(2,1,"HUMEDAD:");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_incubadora_iot+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;incubadora_iot.c,66 :: 		Lcd_Out(1,16,"C");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      16
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr3_incubadora_iot+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;incubadora_iot.c,67 :: 		Lcd_Out(2,16,"%");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      16
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr4_incubadora_iot+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;incubadora_iot.c,68 :: 		break;
	GOTO       L_lcd_Print1
;incubadora_iot.c,70 :: 		case 'E': Lcd_Out(1,7,"[X]");
L_lcd_Print3:
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      7
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr5_incubadora_iot+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;incubadora_iot.c,71 :: 		Lcd_Out(2,2,"ERROR EN DHT11");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr6_incubadora_iot+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;incubadora_iot.c,72 :: 		break;
	GOTO       L_lcd_Print1
;incubadora_iot.c,74 :: 		case 'C': Lcd_Out(1,3,"CONFIGURACION");
L_lcd_Print4:
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      3
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr7_incubadora_iot+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;incubadora_iot.c,75 :: 		break;
	GOTO       L_lcd_Print1
;incubadora_iot.c,77 :: 		case 'T': Lcd_Out(1,3,"-TEMPERATURA-");
L_lcd_Print5:
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      3
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr8_incubadora_iot+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;incubadora_iot.c,78 :: 		Lcd_Out(2,1,"<>");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr9_incubadora_iot+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;incubadora_iot.c,79 :: 		Lcd_Out(2,16,"C");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      16
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr10_incubadora_iot+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;incubadora_iot.c,80 :: 		ByteToStr(stpointT,txtInt);
	MOVF       _stpointT+0, 0
	MOVWF      FARG_ByteToStr_input+0
	MOVLW      lcd_Print_txtInt_L0+0
	MOVWF      FARG_ByteToStr_output+0
	CALL       _ByteToStr+0
;incubadora_iot.c,81 :: 		Lcd_Out(2,13,txtInt);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      13
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      lcd_Print_txtInt_L0+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;incubadora_iot.c,82 :: 		break;
	GOTO       L_lcd_Print1
;incubadora_iot.c,84 :: 		case 'H': Lcd_Out(1,4,"-HUMEDAD-");
L_lcd_Print6:
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      4
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr11_incubadora_iot+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;incubadora_iot.c,85 :: 		Lcd_Out(2,1,"<>");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr12_incubadora_iot+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;incubadora_iot.c,86 :: 		Lcd_Out(2,16,"%");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      16
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr13_incubadora_iot+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;incubadora_iot.c,87 :: 		ByteToStr(stpointH,txtInt);
	MOVF       _stpointH+0, 0
	MOVWF      FARG_ByteToStr_input+0
	MOVLW      lcd_Print_txtInt_L0+0
	MOVWF      FARG_ByteToStr_output+0
	CALL       _ByteToStr+0
;incubadora_iot.c,88 :: 		Lcd_Out(2,13,txtInt);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      13
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      lcd_Print_txtInt_L0+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;incubadora_iot.c,89 :: 		break;
	GOTO       L_lcd_Print1
;incubadora_iot.c,91 :: 		case 'X': Lcd_Out(1,7,"");
L_lcd_Print7:
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      7
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr14_incubadora_iot+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;incubadora_iot.c,92 :: 		Lcd_Out(2,2,"ERROR EN DHT11");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr15_incubadora_iot+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;incubadora_iot.c,93 :: 		break;
	GOTO       L_lcd_Print1
;incubadora_iot.c,95 :: 		default:  Lcd_Out(1,7,"NULL");
L_lcd_Print8:
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      7
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr16_incubadora_iot+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;incubadora_iot.c,96 :: 		break;
	GOTO       L_lcd_Print1
;incubadora_iot.c,98 :: 		}//fin switch
L_lcd_Print0:
	MOVF       FARG_lcd_Print_screen+0, 0
	XORLW      73
	BTFSC      STATUS+0, 2
	GOTO       L_lcd_Print2
	MOVF       FARG_lcd_Print_screen+0, 0
	XORLW      69
	BTFSC      STATUS+0, 2
	GOTO       L_lcd_Print3
	MOVF       FARG_lcd_Print_screen+0, 0
	XORLW      67
	BTFSC      STATUS+0, 2
	GOTO       L_lcd_Print4
	MOVF       FARG_lcd_Print_screen+0, 0
	XORLW      84
	BTFSC      STATUS+0, 2
	GOTO       L_lcd_Print5
	MOVF       FARG_lcd_Print_screen+0, 0
	XORLW      72
	BTFSC      STATUS+0, 2
	GOTO       L_lcd_Print6
	MOVF       FARG_lcd_Print_screen+0, 0
	XORLW      88
	BTFSC      STATUS+0, 2
	GOTO       L_lcd_Print7
	GOTO       L_lcd_Print8
L_lcd_Print1:
;incubadora_iot.c,99 :: 		}//fin lcdPrint
L_end_lcd_Print:
	RETURN
; end of _lcd_Print

_main:

;incubadora_iot.c,102 :: 		void main() {
;incubadora_iot.c,103 :: 		ANSEL =0X00;
	CLRF       ANSEL+0
;incubadora_iot.c,104 :: 		ANSELH = 0X00;
	CLRF       ANSELH+0
;incubadora_iot.c,105 :: 		TRISD=0XE0;
	MOVLW      224
	MOVWF      TRISD+0
;incubadora_iot.c,106 :: 		TRISA=0X00;
	CLRF       TRISA+0
;incubadora_iot.c,107 :: 		PORTA=0X00;
	CLRF       PORTA+0
;incubadora_iot.c,108 :: 		PORTD=0x01;
	MOVLW      1
	MOVWF      PORTD+0
;incubadora_iot.c,109 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;incubadora_iot.c,110 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;incubadora_iot.c,113 :: 		while(1){
L_main9:
;incubadora_iot.c,121 :: 		} //fin while
	GOTO       L_main9
;incubadora_iot.c,122 :: 		}//fin main
L_end_main:
	GOTO       $+0
; end of _main
