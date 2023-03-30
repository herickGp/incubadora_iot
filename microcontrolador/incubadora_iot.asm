
_buzzer:

;incubadora_iot.c,54 :: 		void buzzer(unsigned int millis,unsigned int repeticiones){
;incubadora_iot.c,55 :: 		unsigned int i=0;
	CLRF       buzzer_i_L0+0
	CLRF       buzzer_i_L0+1
	CLRF       buzzer_u_L0+0
	CLRF       buzzer_u_L0+1
;incubadora_iot.c,57 :: 		for(u=0;u<repeticiones;u++){
	CLRF       buzzer_u_L0+0
	CLRF       buzzer_u_L0+1
L_buzzer0:
	MOVF       FARG_buzzer_repeticiones+1, 0
	SUBWF      buzzer_u_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__buzzer109
	MOVF       FARG_buzzer_repeticiones+0, 0
	SUBWF      buzzer_u_L0+0, 0
L__buzzer109:
	BTFSC      STATUS+0, 0
	GOTO       L_buzzer1
;incubadora_iot.c,58 :: 		PIN_BUZZER=1;
	BSF        RA0_bit+0, BitPos(RA0_bit+0)
;incubadora_iot.c,59 :: 		for(i=0;i<millis;i++){
	CLRF       buzzer_i_L0+0
	CLRF       buzzer_i_L0+1
L_buzzer3:
	MOVF       FARG_buzzer_millis+1, 0
	SUBWF      buzzer_i_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__buzzer110
	MOVF       FARG_buzzer_millis+0, 0
	SUBWF      buzzer_i_L0+0, 0
L__buzzer110:
	BTFSC      STATUS+0, 0
	GOTO       L_buzzer4
;incubadora_iot.c,60 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_buzzer6:
	DECFSZ     R13+0, 1
	GOTO       L_buzzer6
	DECFSZ     R12+0, 1
	GOTO       L_buzzer6
;incubadora_iot.c,59 :: 		for(i=0;i<millis;i++){
	INCF       buzzer_i_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       buzzer_i_L0+1, 1
;incubadora_iot.c,61 :: 		}
	GOTO       L_buzzer3
L_buzzer4:
;incubadora_iot.c,62 :: 		PIN_BUZZER=0;
	BCF        RA0_bit+0, BitPos(RA0_bit+0)
;incubadora_iot.c,63 :: 		for(i=0;i<millis;i++){
	CLRF       buzzer_i_L0+0
	CLRF       buzzer_i_L0+1
L_buzzer7:
	MOVF       FARG_buzzer_millis+1, 0
	SUBWF      buzzer_i_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__buzzer111
	MOVF       FARG_buzzer_millis+0, 0
	SUBWF      buzzer_i_L0+0, 0
L__buzzer111:
	BTFSC      STATUS+0, 0
	GOTO       L_buzzer8
	INCF       buzzer_i_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       buzzer_i_L0+1, 1
;incubadora_iot.c,64 :: 		}
	GOTO       L_buzzer7
L_buzzer8:
;incubadora_iot.c,57 :: 		for(u=0;u<repeticiones;u++){
	INCF       buzzer_u_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       buzzer_u_L0+1, 1
;incubadora_iot.c,65 :: 		}
	GOTO       L_buzzer0
L_buzzer1:
;incubadora_iot.c,67 :: 		}//fin buzzer
L_end_buzzer:
	RETURN
; end of _buzzer

_read_dth11:

;incubadora_iot.c,69 :: 		char read_dth11(){            //funcion para realizar la lectura del sensor dht11
;incubadora_iot.c,71 :: 		unsigned char i=0;
	CLRF       read_dth11_i_L0+0
	CLRF       read_dth11_j_L0+0
	CLRF       read_dth11_hum_L0+0
	CLRF       read_dth11_hum_L0+1
	CLRF       read_dth11_temp_L0+0
	CLRF       read_dth11_temp_L0+1
	MOVLW      10
	MOVWF      read_dth11_base_L0+0
	MOVLW      0
	MOVWF      read_dth11_base_L0+1
;incubadora_iot.c,78 :: 		temperatura=0;
	CLRF       _temperatura+0
;incubadora_iot.c,79 :: 		humedad=0;
	CLRF       _humedad+0
;incubadora_iot.c,83 :: 		PIN_SENSOR_Direction=0;  //rb0 de salida
	BCF        TRISD0_bit+0, BitPos(TRISD0_bit+0)
;incubadora_iot.c,84 :: 		PIN_SENSOR=1;  //rb0 en alto
	BSF        RD0_bit+0, BitPos(RD0_bit+0)
;incubadora_iot.c,85 :: 		delay_us(20);
	MOVLW      6
	MOVWF      R13+0
L_read_dth1112:
	DECFSZ     R13+0, 1
	GOTO       L_read_dth1112
	NOP
;incubadora_iot.c,86 :: 		PIN_SENSOR=0;     //rbo en bajo
	BCF        RD0_bit+0, BitPos(RD0_bit+0)
;incubadora_iot.c,87 :: 		delay_ms(18);
	MOVLW      24
	MOVWF      R12+0
	MOVLW      95
	MOVWF      R13+0
L_read_dth1113:
	DECFSZ     R13+0, 1
	GOTO       L_read_dth1113
	DECFSZ     R12+0, 1
	GOTO       L_read_dth1113
;incubadora_iot.c,88 :: 		PIN_SENSOR=1;     //rbo en alto
	BSF        RD0_bit+0, BitPos(RD0_bit+0)
;incubadora_iot.c,89 :: 		delay_us(22);
	MOVLW      7
	MOVWF      R13+0
L_read_dth1114:
	DECFSZ     R13+0, 1
	GOTO       L_read_dth1114
;incubadora_iot.c,90 :: 		PIN_SENSOR_Direction=1; //rbo como entrada para leer la respuesta del sensor
	BSF        TRISD0_bit+0, BitPos(TRISD0_bit+0)
;incubadora_iot.c,91 :: 		delay_us(10);
	MOVLW      3
	MOVWF      R13+0
L_read_dth1115:
	DECFSZ     R13+0, 1
	GOTO       L_read_dth1115
;incubadora_iot.c,92 :: 		if(PIN_SENSOR){return -1;}    //comprueba si el sensor envio un estado bajo
	BTFSS      RD0_bit+0, BitPos(RD0_bit+0)
	GOTO       L_read_dth1116
	MOVLW      255
	MOVWF      R0+0
	GOTO       L_end_read_dth11
L_read_dth1116:
;incubadora_iot.c,93 :: 		delay_us(80);
	MOVLW      26
	MOVWF      R13+0
L_read_dth1117:
	DECFSZ     R13+0, 1
	GOTO       L_read_dth1117
	NOP
;incubadora_iot.c,94 :: 		if(PIN_SENSOR==0){return -1;}      //comprueba si el sensor envio un estado alto despues de 80ms
	BTFSC      RD0_bit+0, BitPos(RD0_bit+0)
	GOTO       L_read_dth1118
	MOVLW      255
	MOVWF      R0+0
	GOTO       L_end_read_dth11
L_read_dth1118:
;incubadora_iot.c,95 :: 		delay_us(80);
	MOVLW      26
	MOVWF      R13+0
L_read_dth1119:
	DECFSZ     R13+0, 1
	GOTO       L_read_dth1119
	NOP
;incubadora_iot.c,97 :: 		for(i=0;i<5;i++){
	CLRF       read_dth11_i_L0+0
L_read_dth1120:
	MOVLW      5
	SUBWF      read_dth11_i_L0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_read_dth1121
;incubadora_iot.c,98 :: 		for(j=0;j<8;j++){
	CLRF       read_dth11_j_L0+0
L_read_dth1123:
	MOVLW      8
	SUBWF      read_dth11_j_L0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_read_dth1124
;incubadora_iot.c,99 :: 		while(PIN_SENSOR==0);   //espera a que la entrada sea distinta de 0
L_read_dth1126:
	BTFSC      RD0_bit+0, BitPos(RD0_bit+0)
	GOTO       L_read_dth1127
	GOTO       L_read_dth1126
L_read_dth1127:
;incubadora_iot.c,100 :: 		delay_us(30);     //espera 30 us
	MOVLW      9
	MOVWF      R13+0
L_read_dth1128:
	DECFSZ     R13+0, 1
	GOTO       L_read_dth1128
	NOP
	NOP
;incubadora_iot.c,101 :: 		if(PIN_SENSOR){    // si el pulso despues de 30us esta en alto es porque es un 1
	BTFSS      RD0_bit+0, BitPos(RD0_bit+0)
	GOTO       L_read_dth1129
;incubadora_iot.c,102 :: 		dato[i]=(dato[i]<<1) | 0x01;   // se le agrega un 1 al bit
	MOVF       read_dth11_i_L0+0, 0
	ADDLW      read_dth11_dato_L0+0
	MOVWF      R3+0
	MOVF       R3+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R2+0
	MOVF       R2+0, 0
	MOVWF      R0+0
	RLF        R0+0, 1
	BCF        R0+0, 0
	BSF        R0+0, 0
	MOVF       R3+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;incubadora_iot.c,103 :: 		}
L_read_dth1129:
;incubadora_iot.c,104 :: 		if(PIN_SENSOR==0){       // si el pulso despues de 30us esta en bajo es porque es un 0
	BTFSC      RD0_bit+0, BitPos(RD0_bit+0)
	GOTO       L_read_dth1130
;incubadora_iot.c,105 :: 		dato[i]=(dato[i]<<1);}  // se le agrega un 0 corriendo a la izquierda            }
	MOVF       read_dth11_i_L0+0, 0
	ADDLW      read_dth11_dato_L0+0
	MOVWF      R3+0
	MOVF       R3+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R2+0
	MOVF       R2+0, 0
	MOVWF      R0+0
	RLF        R0+0, 1
	BCF        R0+0, 0
	MOVF       R3+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
L_read_dth1130:
;incubadora_iot.c,106 :: 		while(PIN_SENSOR==1);
L_read_dth1131:
	BTFSS      RD0_bit+0, BitPos(RD0_bit+0)
	GOTO       L_read_dth1132
	GOTO       L_read_dth1131
L_read_dth1132:
;incubadora_iot.c,98 :: 		for(j=0;j<8;j++){
	INCF       read_dth11_j_L0+0, 1
;incubadora_iot.c,107 :: 		}//fin for de 8
	GOTO       L_read_dth1123
L_read_dth1124:
;incubadora_iot.c,97 :: 		for(i=0;i<5;i++){
	INCF       read_dth11_i_L0+0, 1
;incubadora_iot.c,108 :: 		}// fin for de 5
	GOTO       L_read_dth1120
L_read_dth1121:
;incubadora_iot.c,109 :: 		PIN_SENSOR_Direction=0;    //rb0 de salida
	BCF        TRISD0_bit+0, BitPos(TRISD0_bit+0)
;incubadora_iot.c,110 :: 		PIN_SENSOR=1;     //rb0  en alto
	BSF        RD0_bit+0, BitPos(RD0_bit+0)
;incubadora_iot.c,112 :: 		if((dato[0]+dato[1]+dato[2]+dato[3])==dato[4]){
	MOVF       read_dth11_dato_L0+1, 0
	ADDWF      read_dth11_dato_L0+0, 0
	MOVWF      R0+0
	CLRF       R0+1
	BTFSC      STATUS+0, 0
	INCF       R0+1, 1
	MOVF       read_dth11_dato_L0+2, 0
	ADDWF      R0+0, 1
	BTFSC      STATUS+0, 0
	INCF       R0+1, 1
	MOVF       read_dth11_dato_L0+3, 0
	ADDWF      R0+0, 0
	MOVWF      R2+0
	MOVF       R0+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	MOVWF      R2+1
	MOVLW      0
	XORWF      R2+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__read_dth11113
	MOVF       read_dth11_dato_L0+4, 0
	XORWF      R2+0, 0
L__read_dth11113:
	BTFSS      STATUS+0, 2
	GOTO       L_read_dth1133
;incubadora_iot.c,113 :: 		hum=dato[0];
	MOVF       read_dth11_dato_L0+0, 0
	MOVWF      read_dth11_hum_L0+0
	CLRF       read_dth11_hum_L0+1
;incubadora_iot.c,114 :: 		temp=dato[2];
	MOVF       read_dth11_dato_L0+2, 0
	MOVWF      read_dth11_temp_L0+0
	CLRF       read_dth11_temp_L0+1
;incubadora_iot.c,116 :: 		base=10;
	MOVLW      10
	MOVWF      read_dth11_base_L0+0
	MOVLW      0
	MOVWF      read_dth11_base_L0+1
;incubadora_iot.c,117 :: 		for(i=0;i<2;i++){
	CLRF       read_dth11_i_L0+0
L_read_dth1134:
	MOVLW      2
	SUBWF      read_dth11_i_L0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_read_dth1135
;incubadora_iot.c,118 :: 		valor[i]=(hum/base);
	MOVF       read_dth11_i_L0+0, 0
	ADDLW      read_dth11_valor_L0+0
	MOVWF      FLOC__read_dth11+0
	MOVF       read_dth11_base_L0+0, 0
	MOVWF      R4+0
	MOVF       read_dth11_base_L0+1, 0
	MOVWF      R4+1
	MOVF       read_dth11_hum_L0+0, 0
	MOVWF      R0+0
	MOVF       read_dth11_hum_L0+1, 0
	MOVWF      R0+1
	CALL       _Div_16X16_U+0
	MOVF       FLOC__read_dth11+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;incubadora_iot.c,119 :: 		hum=hum-(valor[i]*base);
	MOVF       read_dth11_i_L0+0, 0
	ADDLW      read_dth11_valor_L0+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R0+0
	MOVLW      0
	MOVWF      R0+1
	MOVF       read_dth11_base_L0+0, 0
	MOVWF      R4+0
	MOVF       read_dth11_base_L0+1, 0
	MOVWF      R4+1
	CALL       _Mul_16X16_U+0
	MOVF       R0+0, 0
	SUBWF      read_dth11_hum_L0+0, 1
	BTFSS      STATUS+0, 0
	DECF       read_dth11_hum_L0+1, 1
	MOVF       R0+1, 0
	SUBWF      read_dth11_hum_L0+1, 1
;incubadora_iot.c,120 :: 		base=base/10;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       read_dth11_base_L0+0, 0
	MOVWF      R0+0
	MOVF       read_dth11_base_L0+1, 0
	MOVWF      R0+1
	CALL       _Div_16X16_U+0
	MOVF       R0+0, 0
	MOVWF      read_dth11_base_L0+0
	MOVF       R0+1, 0
	MOVWF      read_dth11_base_L0+1
;incubadora_iot.c,117 :: 		for(i=0;i<2;i++){
	INCF       read_dth11_i_L0+0, 1
;incubadora_iot.c,121 :: 		}
	GOTO       L_read_dth1134
L_read_dth1135:
;incubadora_iot.c,122 :: 		base=10;
	MOVLW      10
	MOVWF      read_dth11_base_L0+0
	MOVLW      0
	MOVWF      read_dth11_base_L0+1
;incubadora_iot.c,123 :: 		for(i=2;i<4;i++){
	MOVLW      2
	MOVWF      read_dth11_i_L0+0
L_read_dth1137:
	MOVLW      4
	SUBWF      read_dth11_i_L0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_read_dth1138
;incubadora_iot.c,124 :: 		valor[i]=(temp/base);
	MOVF       read_dth11_i_L0+0, 0
	ADDLW      read_dth11_valor_L0+0
	MOVWF      FLOC__read_dth11+0
	MOVF       read_dth11_base_L0+0, 0
	MOVWF      R4+0
	MOVF       read_dth11_base_L0+1, 0
	MOVWF      R4+1
	MOVF       read_dth11_temp_L0+0, 0
	MOVWF      R0+0
	MOVF       read_dth11_temp_L0+1, 0
	MOVWF      R0+1
	CALL       _Div_16X16_U+0
	MOVF       FLOC__read_dth11+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;incubadora_iot.c,125 :: 		temp=temp-(valor[i]*base);
	MOVF       read_dth11_i_L0+0, 0
	ADDLW      read_dth11_valor_L0+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R0+0
	MOVLW      0
	MOVWF      R0+1
	MOVF       read_dth11_base_L0+0, 0
	MOVWF      R4+0
	MOVF       read_dth11_base_L0+1, 0
	MOVWF      R4+1
	CALL       _Mul_16X16_U+0
	MOVF       R0+0, 0
	SUBWF      read_dth11_temp_L0+0, 1
	BTFSS      STATUS+0, 0
	DECF       read_dth11_temp_L0+1, 1
	MOVF       R0+1, 0
	SUBWF      read_dth11_temp_L0+1, 1
;incubadora_iot.c,126 :: 		base=base/10;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       read_dth11_base_L0+0, 0
	MOVWF      R0+0
	MOVF       read_dth11_base_L0+1, 0
	MOVWF      R0+1
	CALL       _Div_16X16_U+0
	MOVF       R0+0, 0
	MOVWF      read_dth11_base_L0+0
	MOVF       R0+1, 0
	MOVWF      read_dth11_base_L0+1
;incubadora_iot.c,123 :: 		for(i=2;i<4;i++){
	INCF       read_dth11_i_L0+0, 1
;incubadora_iot.c,127 :: 		}
	GOTO       L_read_dth1137
L_read_dth1138:
;incubadora_iot.c,129 :: 		temperatura=(valor[2]*10)+valor[3];
	MOVF       read_dth11_valor_L0+2, 0
	MOVWF      R0+0
	MOVLW      10
	MOVWF      R4+0
	CALL       _Mul_8X8_U+0
	MOVF       read_dth11_valor_L0+3, 0
	ADDWF      R0+0, 0
	MOVWF      _temperatura+0
;incubadora_iot.c,130 :: 		humedad=(valor[0]*10)+valor[1];
	MOVF       read_dth11_valor_L0+0, 0
	MOVWF      R0+0
	MOVLW      10
	MOVWF      R4+0
	CALL       _Mul_8X8_U+0
	MOVF       read_dth11_valor_L0+1, 0
	ADDWF      R0+0, 0
	MOVWF      _humedad+0
;incubadora_iot.c,131 :: 		return 1;
	MOVLW      1
	MOVWF      R0+0
	GOTO       L_end_read_dth11
;incubadora_iot.c,133 :: 		}else{return -1;}
L_read_dth1133:
	MOVLW      255
	MOVWF      R0+0
;incubadora_iot.c,135 :: 		}//fin read_dht
L_end_read_dth11:
	RETURN
; end of _read_dth11

_lcd_Print:

;incubadora_iot.c,137 :: 		void lcd_Print(unsigned char screen){             //funcion para imprimir las diferentes pantallas en la lcd16x2
;incubadora_iot.c,139 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;incubadora_iot.c,140 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;incubadora_iot.c,142 :: 		switch(screen){
	GOTO       L_lcd_Print41
;incubadora_iot.c,144 :: 		case 'I':
L_lcd_Print43:
;incubadora_iot.c,145 :: 		ByteToStr(temperatura,txtInt);
	MOVF       _temperatura+0, 0
	MOVWF      FARG_ByteToStr_input+0
	MOVLW      lcd_Print_txtInt_L0+0
	MOVWF      FARG_ByteToStr_output+0
	CALL       _ByteToStr+0
;incubadora_iot.c,146 :: 		Lcd_Out(1,13,txtInt);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      13
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      lcd_Print_txtInt_L0+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;incubadora_iot.c,147 :: 		ByteToStr(humedad,txtInt);
	MOVF       _humedad+0, 0
	MOVWF      FARG_ByteToStr_input+0
	MOVLW      lcd_Print_txtInt_L0+0
	MOVWF      FARG_ByteToStr_output+0
	CALL       _ByteToStr+0
;incubadora_iot.c,148 :: 		Lcd_Out(2,13,txtInt);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      13
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      lcd_Print_txtInt_L0+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;incubadora_iot.c,149 :: 		Lcd_Out(1,1,"TEMPERATURA:");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_incubadora_iot+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;incubadora_iot.c,150 :: 		Lcd_Out(2,1,"HUMEDAD:");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_incubadora_iot+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;incubadora_iot.c,151 :: 		Lcd_Out(1,16,"C");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      16
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr3_incubadora_iot+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;incubadora_iot.c,152 :: 		Lcd_Out(2,16,"%");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      16
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr4_incubadora_iot+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;incubadora_iot.c,153 :: 		break;
	GOTO       L_lcd_Print42
;incubadora_iot.c,155 :: 		case 'E': Lcd_Out(1,7,"[X]");
L_lcd_Print44:
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      7
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr5_incubadora_iot+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;incubadora_iot.c,156 :: 		Lcd_Out(2,2,"ERROR EN DHT11");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr6_incubadora_iot+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;incubadora_iot.c,157 :: 		break;
	GOTO       L_lcd_Print42
;incubadora_iot.c,159 :: 		case 'C': Lcd_Out(1,3,"CONFIGURACION");
L_lcd_Print45:
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      3
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr7_incubadora_iot+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;incubadora_iot.c,160 :: 		break;
	GOTO       L_lcd_Print42
;incubadora_iot.c,162 :: 		case 'T': Lcd_Out(1,3,"-TEMPERATURA-");
L_lcd_Print46:
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      3
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr8_incubadora_iot+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;incubadora_iot.c,163 :: 		Lcd_Out(2,1,"<>");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr9_incubadora_iot+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;incubadora_iot.c,164 :: 		Lcd_Out(2,16,"C");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      16
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr10_incubadora_iot+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;incubadora_iot.c,165 :: 		ByteToStr(stpointT,txtInt);
	MOVF       _stpointT+0, 0
	MOVWF      FARG_ByteToStr_input+0
	MOVLW      lcd_Print_txtInt_L0+0
	MOVWF      FARG_ByteToStr_output+0
	CALL       _ByteToStr+0
;incubadora_iot.c,166 :: 		Lcd_Out(2,13,txtInt);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      13
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      lcd_Print_txtInt_L0+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;incubadora_iot.c,167 :: 		break;
	GOTO       L_lcd_Print42
;incubadora_iot.c,169 :: 		case 'H': Lcd_Out(1,4,"-HUMEDAD-");
L_lcd_Print47:
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      4
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr11_incubadora_iot+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;incubadora_iot.c,170 :: 		Lcd_Out(2,1,"<>");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr12_incubadora_iot+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;incubadora_iot.c,171 :: 		Lcd_Out(2,16,"%");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      16
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr13_incubadora_iot+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;incubadora_iot.c,172 :: 		ByteToStr(stpointH,txtInt);
	MOVF       _stpointH+0, 0
	MOVWF      FARG_ByteToStr_input+0
	MOVLW      lcd_Print_txtInt_L0+0
	MOVWF      FARG_ByteToStr_output+0
	CALL       _ByteToStr+0
;incubadora_iot.c,173 :: 		Lcd_Out(2,13,txtInt);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      13
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      lcd_Print_txtInt_L0+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;incubadora_iot.c,174 :: 		break;
	GOTO       L_lcd_Print42
;incubadora_iot.c,176 :: 		case 'X': Lcd_Out(1,7,"");
L_lcd_Print48:
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      7
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr14_incubadora_iot+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;incubadora_iot.c,177 :: 		Lcd_Out(2,2,"ERROR EN DHT11");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr15_incubadora_iot+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;incubadora_iot.c,178 :: 		break;
	GOTO       L_lcd_Print42
;incubadora_iot.c,180 :: 		default:  Lcd_Out(1,7,"NULL");
L_lcd_Print49:
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      7
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr16_incubadora_iot+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;incubadora_iot.c,181 :: 		break;
	GOTO       L_lcd_Print42
;incubadora_iot.c,183 :: 		}//fin switch
L_lcd_Print41:
	MOVF       FARG_lcd_Print_screen+0, 0
	XORLW      73
	BTFSC      STATUS+0, 2
	GOTO       L_lcd_Print43
	MOVF       FARG_lcd_Print_screen+0, 0
	XORLW      69
	BTFSC      STATUS+0, 2
	GOTO       L_lcd_Print44
	MOVF       FARG_lcd_Print_screen+0, 0
	XORLW      67
	BTFSC      STATUS+0, 2
	GOTO       L_lcd_Print45
	MOVF       FARG_lcd_Print_screen+0, 0
	XORLW      84
	BTFSC      STATUS+0, 2
	GOTO       L_lcd_Print46
	MOVF       FARG_lcd_Print_screen+0, 0
	XORLW      72
	BTFSC      STATUS+0, 2
	GOTO       L_lcd_Print47
	MOVF       FARG_lcd_Print_screen+0, 0
	XORLW      88
	BTFSC      STATUS+0, 2
	GOTO       L_lcd_Print48
	GOTO       L_lcd_Print49
L_lcd_Print42:
;incubadora_iot.c,184 :: 		}//fin lcdPrint
L_end_lcd_Print:
	RETURN
; end of _lcd_Print

_menu_configuracion:

;incubadora_iot.c,186 :: 		void menu_configuracion(){                        //funcion para antender la configuraion de los set points haciendo uso de los 3 pulsadores
;incubadora_iot.c,187 :: 		unsigned int contador=0;
	CLRF       menu_configuracion_contador_L0+0
	CLRF       menu_configuracion_contador_L0+1
;incubadora_iot.c,189 :: 		if(PIN_PULSADOR_ENTER){      // menu de configuracion
	BTFSS      RD6_bit+0, BitPos(RD6_bit+0)
	GOTO       L_menu_configuracion50
;incubadora_iot.c,190 :: 		contador=0;
	CLRF       menu_configuracion_contador_L0+0
	CLRF       menu_configuracion_contador_L0+1
;incubadora_iot.c,191 :: 		while(PIN_PULSADOR_ENTER){
L_menu_configuracion51:
	BTFSS      RD6_bit+0, BitPos(RD6_bit+0)
	GOTO       L_menu_configuracion52
;incubadora_iot.c,192 :: 		Delay_ms(10);
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_menu_configuracion53:
	DECFSZ     R13+0, 1
	GOTO       L_menu_configuracion53
	DECFSZ     R12+0, 1
	GOTO       L_menu_configuracion53
	NOP
	NOP
;incubadora_iot.c,193 :: 		contador++;
	INCF       menu_configuracion_contador_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       menu_configuracion_contador_L0+1, 1
;incubadora_iot.c,194 :: 		if(contador>=100){
	MOVLW      0
	SUBWF      menu_configuracion_contador_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__menu_configuracion116
	MOVLW      100
	SUBWF      menu_configuracion_contador_L0+0, 0
L__menu_configuracion116:
	BTFSS      STATUS+0, 0
	GOTO       L_menu_configuracion54
;incubadora_iot.c,195 :: 		lcd_Print('C');
	MOVLW      67
	MOVWF      FARG_lcd_Print_screen+0
	CALL       _lcd_Print+0
;incubadora_iot.c,196 :: 		buzzer(500,1);
	MOVLW      244
	MOVWF      FARG_buzzer_millis+0
	MOVLW      1
	MOVWF      FARG_buzzer_millis+1
	MOVLW      1
	MOVWF      FARG_buzzer_repeticiones+0
	MOVLW      0
	MOVWF      FARG_buzzer_repeticiones+1
	CALL       _buzzer+0
;incubadora_iot.c,197 :: 		contador=0;
	CLRF       menu_configuracion_contador_L0+0
	CLRF       menu_configuracion_contador_L0+1
;incubadora_iot.c,198 :: 		while(PIN_PULSADOR_ENTER){}
L_menu_configuracion55:
	BTFSS      RD6_bit+0, BitPos(RD6_bit+0)
	GOTO       L_menu_configuracion56
	GOTO       L_menu_configuracion55
L_menu_configuracion56:
;incubadora_iot.c,200 :: 		while(contador<2){
L_menu_configuracion57:
	MOVLW      0
	SUBWF      menu_configuracion_contador_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__menu_configuracion117
	MOVLW      2
	SUBWF      menu_configuracion_contador_L0+0, 0
L__menu_configuracion117:
	BTFSC      STATUS+0, 0
	GOTO       L_menu_configuracion58
;incubadora_iot.c,202 :: 		if(contador==0){
	MOVLW      0
	XORWF      menu_configuracion_contador_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__menu_configuracion118
	MOVLW      0
	XORWF      menu_configuracion_contador_L0+0, 0
L__menu_configuracion118:
	BTFSS      STATUS+0, 2
	GOTO       L_menu_configuracion59
;incubadora_iot.c,203 :: 		lcd_Print('T');
	MOVLW      84
	MOVWF      FARG_lcd_Print_screen+0
	CALL       _lcd_Print+0
;incubadora_iot.c,204 :: 		}else if(contador==1){
	GOTO       L_menu_configuracion60
L_menu_configuracion59:
	MOVLW      0
	XORWF      menu_configuracion_contador_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__menu_configuracion119
	MOVLW      1
	XORWF      menu_configuracion_contador_L0+0, 0
L__menu_configuracion119:
	BTFSS      STATUS+0, 2
	GOTO       L_menu_configuracion61
;incubadora_iot.c,205 :: 		lcd_Print('H');
	MOVLW      72
	MOVWF      FARG_lcd_Print_screen+0
	CALL       _lcd_Print+0
;incubadora_iot.c,206 :: 		}
L_menu_configuracion61:
L_menu_configuracion60:
;incubadora_iot.c,208 :: 		while(1){
L_menu_configuracion62:
;incubadora_iot.c,210 :: 		if(PIN_PULSADOR_DER){      //pulsador derecha
	BTFSS      RD7_bit+0, BitPos(RD7_bit+0)
	GOTO       L_menu_configuracion64
;incubadora_iot.c,212 :: 		Delay_ms(200);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_menu_configuracion65:
	DECFSZ     R13+0, 1
	GOTO       L_menu_configuracion65
	DECFSZ     R12+0, 1
	GOTO       L_menu_configuracion65
	DECFSZ     R11+0, 1
	GOTO       L_menu_configuracion65
	NOP
;incubadora_iot.c,213 :: 		if(contador==0){
	MOVLW      0
	XORWF      menu_configuracion_contador_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__menu_configuracion120
	MOVLW      0
	XORWF      menu_configuracion_contador_L0+0, 0
L__menu_configuracion120:
	BTFSS      STATUS+0, 2
	GOTO       L_menu_configuracion66
;incubadora_iot.c,214 :: 		if(stpointT<50){stpointT++;}
	MOVLW      50
	SUBWF      _stpointT+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_menu_configuracion67
	INCF       _stpointT+0, 1
L_menu_configuracion67:
;incubadora_iot.c,215 :: 		lcd_Print('T');
	MOVLW      84
	MOVWF      FARG_lcd_Print_screen+0
	CALL       _lcd_Print+0
;incubadora_iot.c,216 :: 		}else if(contador==1){
	GOTO       L_menu_configuracion68
L_menu_configuracion66:
	MOVLW      0
	XORWF      menu_configuracion_contador_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__menu_configuracion121
	MOVLW      1
	XORWF      menu_configuracion_contador_L0+0, 0
L__menu_configuracion121:
	BTFSS      STATUS+0, 2
	GOTO       L_menu_configuracion69
;incubadora_iot.c,217 :: 		if(stpointH<90){stpointH++;}
	MOVLW      90
	SUBWF      _stpointH+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_menu_configuracion70
	INCF       _stpointH+0, 1
L_menu_configuracion70:
;incubadora_iot.c,218 :: 		lcd_Print('H');
	MOVLW      72
	MOVWF      FARG_lcd_Print_screen+0
	CALL       _lcd_Print+0
;incubadora_iot.c,219 :: 		}
L_menu_configuracion69:
L_menu_configuracion68:
;incubadora_iot.c,221 :: 		}else if(PIN_PULSADOR_IZQ){   //pulsador izquierda
	GOTO       L_menu_configuracion71
L_menu_configuracion64:
	BTFSS      RD5_bit+0, BitPos(RD5_bit+0)
	GOTO       L_menu_configuracion72
;incubadora_iot.c,223 :: 		Delay_ms(200);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_menu_configuracion73:
	DECFSZ     R13+0, 1
	GOTO       L_menu_configuracion73
	DECFSZ     R12+0, 1
	GOTO       L_menu_configuracion73
	DECFSZ     R11+0, 1
	GOTO       L_menu_configuracion73
	NOP
;incubadora_iot.c,224 :: 		if(contador==0){
	MOVLW      0
	XORWF      menu_configuracion_contador_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__menu_configuracion122
	MOVLW      0
	XORWF      menu_configuracion_contador_L0+0, 0
L__menu_configuracion122:
	BTFSS      STATUS+0, 2
	GOTO       L_menu_configuracion74
;incubadora_iot.c,225 :: 		if(stpointT>0){stpointT--;}
	MOVF       _stpointT+0, 0
	SUBLW      0
	BTFSC      STATUS+0, 0
	GOTO       L_menu_configuracion75
	DECF       _stpointT+0, 1
L_menu_configuracion75:
;incubadora_iot.c,226 :: 		lcd_Print('T');
	MOVLW      84
	MOVWF      FARG_lcd_Print_screen+0
	CALL       _lcd_Print+0
;incubadora_iot.c,227 :: 		}else if(contador==1){
	GOTO       L_menu_configuracion76
L_menu_configuracion74:
	MOVLW      0
	XORWF      menu_configuracion_contador_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__menu_configuracion123
	MOVLW      1
	XORWF      menu_configuracion_contador_L0+0, 0
L__menu_configuracion123:
	BTFSS      STATUS+0, 2
	GOTO       L_menu_configuracion77
;incubadora_iot.c,228 :: 		if(stpointH>20){stpointH--;}
	MOVF       _stpointH+0, 0
	SUBLW      20
	BTFSC      STATUS+0, 0
	GOTO       L_menu_configuracion78
	DECF       _stpointH+0, 1
L_menu_configuracion78:
;incubadora_iot.c,229 :: 		lcd_Print('H');
	MOVLW      72
	MOVWF      FARG_lcd_Print_screen+0
	CALL       _lcd_Print+0
;incubadora_iot.c,230 :: 		}
L_menu_configuracion77:
L_menu_configuracion76:
;incubadora_iot.c,232 :: 		}else if(PIN_PULSADOR_ENTER){   // pulsador central
	GOTO       L_menu_configuracion79
L_menu_configuracion72:
	BTFSS      RD6_bit+0, BitPos(RD6_bit+0)
	GOTO       L_menu_configuracion80
;incubadora_iot.c,233 :: 		while(PIN_PULSADOR_ENTER){}
L_menu_configuracion81:
	BTFSS      RD6_bit+0, BitPos(RD6_bit+0)
	GOTO       L_menu_configuracion82
	GOTO       L_menu_configuracion81
L_menu_configuracion82:
;incubadora_iot.c,234 :: 		buzzer(100,1);
	MOVLW      100
	MOVWF      FARG_buzzer_millis+0
	MOVLW      0
	MOVWF      FARG_buzzer_millis+1
	MOVLW      1
	MOVWF      FARG_buzzer_repeticiones+0
	MOVLW      0
	MOVWF      FARG_buzzer_repeticiones+1
	CALL       _buzzer+0
;incubadora_iot.c,235 :: 		break;
	GOTO       L_menu_configuracion63
;incubadora_iot.c,236 :: 		}
L_menu_configuracion80:
L_menu_configuracion79:
L_menu_configuracion71:
;incubadora_iot.c,238 :: 		}
	GOTO       L_menu_configuracion62
L_menu_configuracion63:
;incubadora_iot.c,239 :: 		contador++;
	INCF       menu_configuracion_contador_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       menu_configuracion_contador_L0+1, 1
;incubadora_iot.c,240 :: 		}
	GOTO       L_menu_configuracion57
L_menu_configuracion58:
;incubadora_iot.c,241 :: 		EEPROM_Write(0x02,stpointT);
	MOVLW      2
	MOVWF      FARG_EEPROM_Write_Address+0
	MOVF       _stpointT+0, 0
	MOVWF      FARG_EEPROM_Write_data_+0
	CALL       _EEPROM_Write+0
;incubadora_iot.c,242 :: 		EEPROM_Write(0x03,stpointH);
	MOVLW      3
	MOVWF      FARG_EEPROM_Write_Address+0
	MOVF       _stpointH+0, 0
	MOVWF      FARG_EEPROM_Write_data_+0
	CALL       _EEPROM_Write+0
;incubadora_iot.c,245 :: 		}
L_menu_configuracion54:
;incubadora_iot.c,246 :: 		}
	GOTO       L_menu_configuracion51
L_menu_configuracion52:
;incubadora_iot.c,247 :: 		}
L_menu_configuracion50:
;incubadora_iot.c,248 :: 		}// fin menu  de configuracion
L_end_menu_configuracion:
	RETURN
; end of _menu_configuracion

_proceso_control:

;incubadora_iot.c,250 :: 		void proceso_control(){                           // funcion para gestionar el control automatico de los perifericos para mantener las variables estables
;incubadora_iot.c,252 :: 		if(ENABLE_CONTROL_AUTOMATICO && error==0){
	MOVF       _error+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_proceso_control85
L__proceso_control107:
;incubadora_iot.c,254 :: 		if(temperatura==stpointT){
	MOVF       _temperatura+0, 0
	XORWF      _stpointT+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_proceso_control86
;incubadora_iot.c,255 :: 		PIN_CALENTADOR=0;
	BCF        RD2_bit+0, BitPos(RD2_bit+0)
;incubadora_iot.c,256 :: 		PIN_VENTILADOR=0;
	BCF        RD1_bit+0, BitPos(RD1_bit+0)
;incubadora_iot.c,257 :: 		}else if(temperatura<stpointT){
	GOTO       L_proceso_control87
L_proceso_control86:
	MOVF       _stpointT+0, 0
	SUBWF      _temperatura+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_proceso_control88
;incubadora_iot.c,258 :: 		PIN_CALENTADOR=1;
	BSF        RD2_bit+0, BitPos(RD2_bit+0)
;incubadora_iot.c,259 :: 		PIN_VENTILADOR=0;
	BCF        RD1_bit+0, BitPos(RD1_bit+0)
;incubadora_iot.c,260 :: 		}else if(temperatura>stpointT){
	GOTO       L_proceso_control89
L_proceso_control88:
	MOVF       _temperatura+0, 0
	SUBWF      _stpointT+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_proceso_control90
;incubadora_iot.c,261 :: 		PIN_CALENTADOR=0;
	BCF        RD2_bit+0, BitPos(RD2_bit+0)
;incubadora_iot.c,262 :: 		PIN_VENTILADOR=1;
	BSF        RD1_bit+0, BitPos(RD1_bit+0)
;incubadora_iot.c,263 :: 		}
L_proceso_control90:
L_proceso_control89:
L_proceso_control87:
;incubadora_iot.c,265 :: 		if(humedad==stpointH){
	MOVF       _humedad+0, 0
	XORWF      _stpointH+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_proceso_control91
;incubadora_iot.c,266 :: 		PIN_HUMIFICADOR=0;
	BCF        RD3_bit+0, BitPos(RD3_bit+0)
;incubadora_iot.c,267 :: 		}else if(humedad<stpointH){
	GOTO       L_proceso_control92
L_proceso_control91:
	MOVF       _stpointH+0, 0
	SUBWF      _humedad+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_proceso_control93
;incubadora_iot.c,268 :: 		PIN_HUMIFICADOR=1;
	BSF        RD3_bit+0, BitPos(RD3_bit+0)
;incubadora_iot.c,269 :: 		}else if(humedad>stpointH){
	GOTO       L_proceso_control94
L_proceso_control93:
	MOVF       _humedad+0, 0
	SUBWF      _stpointH+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_proceso_control95
;incubadora_iot.c,270 :: 		PIN_HUMIFICADOR=0;
	BCF        RD3_bit+0, BitPos(RD3_bit+0)
;incubadora_iot.c,271 :: 		}
L_proceso_control95:
L_proceso_control94:
L_proceso_control92:
;incubadora_iot.c,273 :: 		}else{
	GOTO       L_proceso_control96
L_proceso_control85:
;incubadora_iot.c,274 :: 		PIN_HUMIFICADOR=0;
	BCF        RD3_bit+0, BitPos(RD3_bit+0)
;incubadora_iot.c,275 :: 		PIN_CALENTADOR=0;
	BCF        RD2_bit+0, BitPos(RD2_bit+0)
;incubadora_iot.c,276 :: 		PIN_VENTILADOR=0;
	BCF        RD1_bit+0, BitPos(RD1_bit+0)
;incubadora_iot.c,277 :: 		}
L_proceso_control96:
;incubadora_iot.c,278 :: 		}//fin proceso control
L_end_proceso_control:
	RETURN
; end of _proceso_control

_uart_transmitir_datos:

;incubadora_iot.c,280 :: 		void uart_transmitir_datos(){
;incubadora_iot.c,282 :: 		unsigned char msg[]="T00A00H00B00S000E00\n\r";
	MOVLW      84
	MOVWF      uart_transmitir_datos_msg_L0+0
	MOVLW      48
	MOVWF      uart_transmitir_datos_msg_L0+1
	MOVLW      48
	MOVWF      uart_transmitir_datos_msg_L0+2
	MOVLW      65
	MOVWF      uart_transmitir_datos_msg_L0+3
	MOVLW      48
	MOVWF      uart_transmitir_datos_msg_L0+4
	MOVLW      48
	MOVWF      uart_transmitir_datos_msg_L0+5
	MOVLW      72
	MOVWF      uart_transmitir_datos_msg_L0+6
	MOVLW      48
	MOVWF      uart_transmitir_datos_msg_L0+7
	MOVLW      48
	MOVWF      uart_transmitir_datos_msg_L0+8
	MOVLW      66
	MOVWF      uart_transmitir_datos_msg_L0+9
	MOVLW      48
	MOVWF      uart_transmitir_datos_msg_L0+10
	MOVLW      48
	MOVWF      uart_transmitir_datos_msg_L0+11
	MOVLW      83
	MOVWF      uart_transmitir_datos_msg_L0+12
	MOVLW      48
	MOVWF      uart_transmitir_datos_msg_L0+13
	MOVLW      48
	MOVWF      uart_transmitir_datos_msg_L0+14
	MOVLW      48
	MOVWF      uart_transmitir_datos_msg_L0+15
	MOVLW      69
	MOVWF      uart_transmitir_datos_msg_L0+16
	MOVLW      48
	MOVWF      uart_transmitir_datos_msg_L0+17
	MOVLW      48
	MOVWF      uart_transmitir_datos_msg_L0+18
	MOVLW      10
	MOVWF      uart_transmitir_datos_msg_L0+19
	MOVLW      13
	MOVWF      uart_transmitir_datos_msg_L0+20
	CLRF       uart_transmitir_datos_msg_L0+21
;incubadora_iot.c,288 :: 		decimal=temperatura/10;
	MOVLW      10
	MOVWF      R4+0
	MOVF       _temperatura+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_U+0
	MOVF       R0+0, 0
	MOVWF      FLOC__uart_transmitir_datos+0
	MOVF       FLOC__uart_transmitir_datos+0, 0
	MOVWF      R0+0
	MOVLW      10
	MOVWF      R4+0
	CALL       _Mul_8X8_U+0
;incubadora_iot.c,289 :: 		unidad=temperatura-(decimal*10);
	MOVF       R0+0, 0
	SUBWF      _temperatura+0, 0
	MOVWF      R0+0
;incubadora_iot.c,290 :: 		msg[1]=decimal+48;
	MOVLW      48
	ADDWF      FLOC__uart_transmitir_datos+0, 0
	MOVWF      uart_transmitir_datos_msg_L0+1
;incubadora_iot.c,291 :: 		msg[2]=unidad+48;
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      uart_transmitir_datos_msg_L0+2
;incubadora_iot.c,293 :: 		decimal=stpointT/10;
	MOVLW      10
	MOVWF      R4+0
	MOVF       _stpointT+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_U+0
	MOVF       R0+0, 0
	MOVWF      FLOC__uart_transmitir_datos+0
	MOVF       FLOC__uart_transmitir_datos+0, 0
	MOVWF      R0+0
	MOVLW      10
	MOVWF      R4+0
	CALL       _Mul_8X8_U+0
;incubadora_iot.c,294 :: 		unidad=stpointT-(decimal*10);
	MOVF       R0+0, 0
	SUBWF      _stpointT+0, 0
	MOVWF      R0+0
;incubadora_iot.c,295 :: 		msg[4]=decimal+48;
	MOVLW      48
	ADDWF      FLOC__uart_transmitir_datos+0, 0
	MOVWF      uart_transmitir_datos_msg_L0+4
;incubadora_iot.c,296 :: 		msg[5]=unidad+48;
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      uart_transmitir_datos_msg_L0+5
;incubadora_iot.c,298 :: 		decimal=humedad/10;
	MOVLW      10
	MOVWF      R4+0
	MOVF       _humedad+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_U+0
	MOVF       R0+0, 0
	MOVWF      FLOC__uart_transmitir_datos+0
	MOVF       FLOC__uart_transmitir_datos+0, 0
	MOVWF      R0+0
	MOVLW      10
	MOVWF      R4+0
	CALL       _Mul_8X8_U+0
;incubadora_iot.c,299 :: 		unidad=humedad-(decimal*10);
	MOVF       R0+0, 0
	SUBWF      _humedad+0, 0
	MOVWF      R0+0
;incubadora_iot.c,300 :: 		msg[7]=decimal+48;
	MOVLW      48
	ADDWF      FLOC__uart_transmitir_datos+0, 0
	MOVWF      uart_transmitir_datos_msg_L0+7
;incubadora_iot.c,301 :: 		msg[8]=unidad+48;
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      uart_transmitir_datos_msg_L0+8
;incubadora_iot.c,303 :: 		decimal=stpointH/10;
	MOVLW      10
	MOVWF      R4+0
	MOVF       _stpointH+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_U+0
	MOVF       R0+0, 0
	MOVWF      FLOC__uart_transmitir_datos+0
	MOVF       FLOC__uart_transmitir_datos+0, 0
	MOVWF      R0+0
	MOVLW      10
	MOVWF      R4+0
	CALL       _Mul_8X8_U+0
;incubadora_iot.c,304 :: 		unidad=stpointH-(decimal*10);
	MOVF       R0+0, 0
	SUBWF      _stpointH+0, 0
	MOVWF      R0+0
;incubadora_iot.c,305 :: 		msg[10]=decimal+48;
	MOVLW      48
	ADDWF      FLOC__uart_transmitir_datos+0, 0
	MOVWF      uart_transmitir_datos_msg_L0+10
;incubadora_iot.c,306 :: 		msg[11]=unidad+48;
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      uart_transmitir_datos_msg_L0+11
;incubadora_iot.c,308 :: 		msg[13]=PIN_VENTILADOR+48;
	MOVLW      0
	BTFSC      RD1_bit+0, BitPos(RD1_bit+0)
	MOVLW      1
	MOVWF      uart_transmitir_datos_msg_L0+13
	MOVLW      48
	ADDWF      uart_transmitir_datos_msg_L0+13, 1
;incubadora_iot.c,309 :: 		msg[14]=PIN_CALENTADOR+48;
	MOVLW      0
	BTFSC      RD2_bit+0, BitPos(RD2_bit+0)
	MOVLW      1
	MOVWF      uart_transmitir_datos_msg_L0+14
	MOVLW      48
	ADDWF      uart_transmitir_datos_msg_L0+14, 1
;incubadora_iot.c,310 :: 		msg[15]=PIN_HUMIFICADOR+48;
	MOVLW      0
	BTFSC      RD3_bit+0, BitPos(RD3_bit+0)
	MOVLW      1
	MOVWF      uart_transmitir_datos_msg_L0+15
	MOVLW      48
	ADDWF      uart_transmitir_datos_msg_L0+15, 1
;incubadora_iot.c,312 :: 		decimal=error/10;
	MOVLW      10
	MOVWF      R4+0
	MOVF       _error+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_U+0
	MOVF       R0+0, 0
	MOVWF      FLOC__uart_transmitir_datos+0
	MOVF       FLOC__uart_transmitir_datos+0, 0
	MOVWF      R0+0
	MOVLW      10
	MOVWF      R4+0
	CALL       _Mul_8X8_U+0
;incubadora_iot.c,313 :: 		unidad=error-(decimal*10);
	MOVF       R0+0, 0
	SUBWF      _error+0, 0
	MOVWF      R0+0
;incubadora_iot.c,314 :: 		msg[17]=decimal+48;
	MOVLW      48
	ADDWF      FLOC__uart_transmitir_datos+0, 0
	MOVWF      uart_transmitir_datos_msg_L0+17
;incubadora_iot.c,315 :: 		msg[18]=unidad+48;
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      uart_transmitir_datos_msg_L0+18
;incubadora_iot.c,318 :: 		UART1_Write_Text(msg);
	MOVLW      uart_transmitir_datos_msg_L0+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;incubadora_iot.c,320 :: 		}//fin transmitir datos
L_end_uart_transmitir_datos:
	RETURN
; end of _uart_transmitir_datos

_uart_recibir_datos:

;incubadora_iot.c,322 :: 		void uart_recibir_datos(){
;incubadora_iot.c,325 :: 		if (UART1_Data_Ready() == 1) {
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_uart_recibir_datos97
;incubadora_iot.c,326 :: 		UART1_Read_Text(msg, "X", 15);
	MOVLW      uart_recibir_datos_msg_L0+0
	MOVWF      FARG_UART1_Read_Text_Output+0
	MOVLW      ?lstr17_incubadora_iot+0
	MOVWF      FARG_UART1_Read_Text_Delimiter+0
	MOVLW      15
	MOVWF      FARG_UART1_Read_Text_Attempts+0
	CALL       _UART1_Read_Text+0
;incubadora_iot.c,327 :: 		UART1_Write_Text(msg);
	MOVLW      uart_recibir_datos_msg_L0+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;incubadora_iot.c,328 :: 		UART1_Write_Text("\n\r");
	MOVLW      ?lstr18_incubadora_iot+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;incubadora_iot.c,329 :: 		}
L_uart_recibir_datos97:
;incubadora_iot.c,331 :: 		}//fin uart recibir datos
L_end_uart_recibir_datos:
	RETURN
; end of _uart_recibir_datos

_main:

;incubadora_iot.c,333 :: 		void main() {
;incubadora_iot.c,334 :: 		ANSEL=0X00;
	CLRF       ANSEL+0
;incubadora_iot.c,335 :: 		ANSELH=0X00;
	CLRF       ANSELH+0
;incubadora_iot.c,336 :: 		TRISD=0XE0;
	MOVLW      224
	MOVWF      TRISD+0
;incubadora_iot.c,337 :: 		TRISA=0X00;
	CLRF       TRISA+0
;incubadora_iot.c,338 :: 		PORTA=0X00;
	CLRF       PORTA+0
;incubadora_iot.c,339 :: 		PORTD=0x01;
	MOVLW      1
	MOVWF      PORTD+0
;incubadora_iot.c,340 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;incubadora_iot.c,341 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;incubadora_iot.c,342 :: 		stpointT=EEPROM_Read(0x02);
	MOVLW      2
	MOVWF      FARG_EEPROM_Read_Address+0
	CALL       _EEPROM_Read+0
	MOVF       R0+0, 0
	MOVWF      _stpointT+0
;incubadora_iot.c,343 :: 		stpointH=EEPROM_Read(0x03);
	MOVLW      3
	MOVWF      FARG_EEPROM_Read_Address+0
	CALL       _EEPROM_Read+0
	MOVF       R0+0, 0
	MOVWF      _stpointH+0
;incubadora_iot.c,344 :: 		UART1_Init(9600);
	MOVLW      25
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;incubadora_iot.c,345 :: 		buzzer(600,1);
	MOVLW      88
	MOVWF      FARG_buzzer_millis+0
	MOVLW      2
	MOVWF      FARG_buzzer_millis+1
	MOVLW      1
	MOVWF      FARG_buzzer_repeticiones+0
	MOVLW      0
	MOVWF      FARG_buzzer_repeticiones+1
	CALL       _buzzer+0
;incubadora_iot.c,348 :: 		while(1){
L_main98:
;incubadora_iot.c,352 :: 		if(read_dth11()==1){
	CALL       _read_dth11+0
	MOVF       R0+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_main100
;incubadora_iot.c,353 :: 		lcd_Print('I');
	MOVLW      73
	MOVWF      FARG_lcd_Print_screen+0
	CALL       _lcd_Print+0
;incubadora_iot.c,354 :: 		error=0;
	CLRF       _error+0
;incubadora_iot.c,355 :: 		}else {
	GOTO       L_main101
L_main100:
;incubadora_iot.c,356 :: 		lcd_Print('E');
	MOVLW      69
	MOVWF      FARG_lcd_Print_screen+0
	CALL       _lcd_Print+0
;incubadora_iot.c,357 :: 		error=1;
	MOVLW      1
	MOVWF      _error+0
;incubadora_iot.c,358 :: 		buzzer(200,3);
	MOVLW      200
	MOVWF      FARG_buzzer_millis+0
	CLRF       FARG_buzzer_millis+1
	MOVLW      3
	MOVWF      FARG_buzzer_repeticiones+0
	MOVLW      0
	MOVWF      FARG_buzzer_repeticiones+1
	CALL       _buzzer+0
;incubadora_iot.c,359 :: 		delay_ms(500);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_main102:
	DECFSZ     R13+0, 1
	GOTO       L_main102
	DECFSZ     R12+0, 1
	GOTO       L_main102
	DECFSZ     R11+0, 1
	GOTO       L_main102
	NOP
	NOP
;incubadora_iot.c,360 :: 		}
L_main101:
;incubadora_iot.c,362 :: 		uart_transmitir_datos();
	CALL       _uart_transmitir_datos+0
;incubadora_iot.c,365 :: 		for(i=0;i<MILISEG_ACTUALIZACION_LECTURA;i++){
	CLRF       _i+0
	CLRF       _i+1
L_main103:
	MOVLW      3
	SUBWF      _i+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main128
	MOVLW      232
	SUBWF      _i+0, 0
L__main128:
	BTFSC      STATUS+0, 0
	GOTO       L_main104
;incubadora_iot.c,366 :: 		delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_main106:
	DECFSZ     R13+0, 1
	GOTO       L_main106
	DECFSZ     R12+0, 1
	GOTO       L_main106
;incubadora_iot.c,367 :: 		uart_recibir_datos();
	CALL       _uart_recibir_datos+0
;incubadora_iot.c,368 :: 		menu_configuracion();
	CALL       _menu_configuracion+0
;incubadora_iot.c,369 :: 		proceso_control();
	CALL       _proceso_control+0
;incubadora_iot.c,365 :: 		for(i=0;i<MILISEG_ACTUALIZACION_LECTURA;i++){
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;incubadora_iot.c,370 :: 		}
	GOTO       L_main103
L_main104:
;incubadora_iot.c,373 :: 		} //fin while
	GOTO       L_main98
;incubadora_iot.c,374 :: 		}//fin main
L_end_main:
	GOTO       $+0
; end of _main
