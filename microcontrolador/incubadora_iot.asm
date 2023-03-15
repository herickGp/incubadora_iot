
_buzzer:

;incubadora_iot.c,55 :: 		void buzzer(unsigned int millis,unsigned int repeticiones){
;incubadora_iot.c,56 :: 		unsigned int i=0;
	CLRF       buzzer_i_L0+0
	CLRF       buzzer_i_L0+1
	CLRF       buzzer_u_L0+0
	CLRF       buzzer_u_L0+1
;incubadora_iot.c,58 :: 		for(u=0;u<repeticiones;u++){
	CLRF       buzzer_u_L0+0
	CLRF       buzzer_u_L0+1
L_buzzer0:
	MOVF       FARG_buzzer_repeticiones+1, 0
	SUBWF      buzzer_u_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__buzzer93
	MOVF       FARG_buzzer_repeticiones+0, 0
	SUBWF      buzzer_u_L0+0, 0
L__buzzer93:
	BTFSC      STATUS+0, 0
	GOTO       L_buzzer1
;incubadora_iot.c,59 :: 		PIN_BUZZER=1;
	BSF        RA0_bit+0, BitPos(RA0_bit+0)
;incubadora_iot.c,60 :: 		for(i=0;i<millis;i++){
	CLRF       buzzer_i_L0+0
	CLRF       buzzer_i_L0+1
L_buzzer3:
	MOVF       FARG_buzzer_millis+1, 0
	SUBWF      buzzer_i_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__buzzer94
	MOVF       FARG_buzzer_millis+0, 0
	SUBWF      buzzer_i_L0+0, 0
L__buzzer94:
	BTFSC      STATUS+0, 0
	GOTO       L_buzzer4
;incubadora_iot.c,61 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_buzzer6:
	DECFSZ     R13+0, 1
	GOTO       L_buzzer6
	DECFSZ     R12+0, 1
	GOTO       L_buzzer6
;incubadora_iot.c,60 :: 		for(i=0;i<millis;i++){
	INCF       buzzer_i_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       buzzer_i_L0+1, 1
;incubadora_iot.c,62 :: 		}
	GOTO       L_buzzer3
L_buzzer4:
;incubadora_iot.c,63 :: 		PIN_BUZZER=0;
	BCF        RA0_bit+0, BitPos(RA0_bit+0)
;incubadora_iot.c,64 :: 		for(i=0;i<millis;i++){
	CLRF       buzzer_i_L0+0
	CLRF       buzzer_i_L0+1
L_buzzer7:
	MOVF       FARG_buzzer_millis+1, 0
	SUBWF      buzzer_i_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__buzzer95
	MOVF       FARG_buzzer_millis+0, 0
	SUBWF      buzzer_i_L0+0, 0
L__buzzer95:
	BTFSC      STATUS+0, 0
	GOTO       L_buzzer8
	INCF       buzzer_i_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       buzzer_i_L0+1, 1
;incubadora_iot.c,65 :: 		}
	GOTO       L_buzzer7
L_buzzer8:
;incubadora_iot.c,58 :: 		for(u=0;u<repeticiones;u++){
	INCF       buzzer_u_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       buzzer_u_L0+1, 1
;incubadora_iot.c,66 :: 		}
	GOTO       L_buzzer0
L_buzzer1:
;incubadora_iot.c,67 :: 		}//fin buzzer
L_end_buzzer:
	RETURN
; end of _buzzer

_read_dth11:

;incubadora_iot.c,69 :: 		char read_dth11(unsigned char sensor){            //funcion para realizar la lectura del sensor dht11
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
	GOTO       L__read_dth1197
	MOVF       read_dth11_dato_L0+4, 0
	XORWF      R2+0, 0
L__read_dth1197:
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

;incubadora_iot.c,138 :: 		void lcd_Print(unsigned char screen){             //funcion para imprimir las diferentes pantallas en la lcd16x2
;incubadora_iot.c,140 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;incubadora_iot.c,141 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;incubadora_iot.c,143 :: 		switch(screen){
	GOTO       L_lcd_Print41
;incubadora_iot.c,145 :: 		case 'I':
L_lcd_Print43:
;incubadora_iot.c,146 :: 		ByteToStr(temperatura,txtInt);
	MOVF       _temperatura+0, 0
	MOVWF      FARG_ByteToStr_input+0
	MOVLW      lcd_Print_txtInt_L0+0
	MOVWF      FARG_ByteToStr_output+0
	CALL       _ByteToStr+0
;incubadora_iot.c,147 :: 		Lcd_Out(1,13,txtInt);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      13
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      lcd_Print_txtInt_L0+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;incubadora_iot.c,148 :: 		ByteToStr(humedad,txtInt);
	MOVF       _humedad+0, 0
	MOVWF      FARG_ByteToStr_input+0
	MOVLW      lcd_Print_txtInt_L0+0
	MOVWF      FARG_ByteToStr_output+0
	CALL       _ByteToStr+0
;incubadora_iot.c,149 :: 		Lcd_Out(2,13,txtInt);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      13
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      lcd_Print_txtInt_L0+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;incubadora_iot.c,150 :: 		Lcd_Out(1,1,"TEMPERATURA:");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_incubadora_iot+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;incubadora_iot.c,151 :: 		Lcd_Out(2,1,"HUMEDAD:");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_incubadora_iot+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;incubadora_iot.c,152 :: 		Lcd_Out(1,16,"C");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      16
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr3_incubadora_iot+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;incubadora_iot.c,153 :: 		Lcd_Out(2,16,"%");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      16
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr4_incubadora_iot+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;incubadora_iot.c,154 :: 		break;
	GOTO       L_lcd_Print42
;incubadora_iot.c,156 :: 		case 'E': Lcd_Out(1,7,"[X]");
L_lcd_Print44:
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      7
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr5_incubadora_iot+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;incubadora_iot.c,157 :: 		Lcd_Out(2,2,"ERROR EN DHT11");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr6_incubadora_iot+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;incubadora_iot.c,158 :: 		break;
	GOTO       L_lcd_Print42
;incubadora_iot.c,160 :: 		case 'C': Lcd_Out(1,3,"CONFIGURACION");
L_lcd_Print45:
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      3
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr7_incubadora_iot+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;incubadora_iot.c,161 :: 		break;
	GOTO       L_lcd_Print42
;incubadora_iot.c,163 :: 		case 'T': Lcd_Out(1,3,"-TEMPERATURA-");
L_lcd_Print46:
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      3
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr8_incubadora_iot+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;incubadora_iot.c,164 :: 		Lcd_Out(2,1,"<>");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr9_incubadora_iot+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;incubadora_iot.c,165 :: 		Lcd_Out(2,16,"C");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      16
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr10_incubadora_iot+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;incubadora_iot.c,166 :: 		ByteToStr(stpointT,txtInt);
	MOVF       _stpointT+0, 0
	MOVWF      FARG_ByteToStr_input+0
	MOVLW      lcd_Print_txtInt_L0+0
	MOVWF      FARG_ByteToStr_output+0
	CALL       _ByteToStr+0
;incubadora_iot.c,167 :: 		Lcd_Out(2,13,txtInt);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      13
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      lcd_Print_txtInt_L0+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;incubadora_iot.c,168 :: 		break;
	GOTO       L_lcd_Print42
;incubadora_iot.c,170 :: 		case 'H': Lcd_Out(1,4,"-HUMEDAD-");
L_lcd_Print47:
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      4
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr11_incubadora_iot+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;incubadora_iot.c,171 :: 		Lcd_Out(2,1,"<>");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr12_incubadora_iot+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;incubadora_iot.c,172 :: 		Lcd_Out(2,16,"%");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      16
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr13_incubadora_iot+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;incubadora_iot.c,173 :: 		ByteToStr(stpointH,txtInt);
	MOVF       _stpointH+0, 0
	MOVWF      FARG_ByteToStr_input+0
	MOVLW      lcd_Print_txtInt_L0+0
	MOVWF      FARG_ByteToStr_output+0
	CALL       _ByteToStr+0
;incubadora_iot.c,174 :: 		Lcd_Out(2,13,txtInt);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      13
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      lcd_Print_txtInt_L0+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;incubadora_iot.c,175 :: 		break;
	GOTO       L_lcd_Print42
;incubadora_iot.c,177 :: 		case 'X': Lcd_Out(1,7,"");
L_lcd_Print48:
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      7
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr14_incubadora_iot+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;incubadora_iot.c,178 :: 		Lcd_Out(2,2,"ERROR EN DHT11");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr15_incubadora_iot+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;incubadora_iot.c,179 :: 		break;
	GOTO       L_lcd_Print42
;incubadora_iot.c,181 :: 		default:  Lcd_Out(1,7,"NULL");
L_lcd_Print49:
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      7
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr16_incubadora_iot+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;incubadora_iot.c,182 :: 		break;
	GOTO       L_lcd_Print42
;incubadora_iot.c,184 :: 		}//fin switch
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
;incubadora_iot.c,185 :: 		}//fin lcdPrint
L_end_lcd_Print:
	RETURN
; end of _lcd_Print

_menu_configuracion:

;incubadora_iot.c,187 :: 		void menu_configuracion(){                        //funcion para antender la configuraion de los set points haciendo uso de los 3 pulsadores
;incubadora_iot.c,188 :: 		unsigned int contador=0;
	CLRF       menu_configuracion_contador_L0+0
	CLRF       menu_configuracion_contador_L0+1
;incubadora_iot.c,190 :: 		if(PIN_PULSADOR_ENTER){      // menu de configuracion
	BTFSS      RD6_bit+0, BitPos(RD6_bit+0)
	GOTO       L_menu_configuracion50
;incubadora_iot.c,191 :: 		contador=0;
	CLRF       menu_configuracion_contador_L0+0
	CLRF       menu_configuracion_contador_L0+1
;incubadora_iot.c,192 :: 		while(PIN_PULSADOR_ENTER){
L_menu_configuracion51:
	BTFSS      RD6_bit+0, BitPos(RD6_bit+0)
	GOTO       L_menu_configuracion52
;incubadora_iot.c,193 :: 		Delay_ms(10);
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
;incubadora_iot.c,194 :: 		contador++;
	INCF       menu_configuracion_contador_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       menu_configuracion_contador_L0+1, 1
;incubadora_iot.c,195 :: 		if(contador>=100){
	MOVLW      0
	SUBWF      menu_configuracion_contador_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__menu_configuracion100
	MOVLW      100
	SUBWF      menu_configuracion_contador_L0+0, 0
L__menu_configuracion100:
	BTFSS      STATUS+0, 0
	GOTO       L_menu_configuracion54
;incubadora_iot.c,196 :: 		lcd_Print('C');
	MOVLW      67
	MOVWF      FARG_lcd_Print_screen+0
	CALL       _lcd_Print+0
;incubadora_iot.c,197 :: 		buzzer(500,1);
	MOVLW      244
	MOVWF      FARG_buzzer_millis+0
	MOVLW      1
	MOVWF      FARG_buzzer_millis+1
	MOVLW      1
	MOVWF      FARG_buzzer_repeticiones+0
	MOVLW      0
	MOVWF      FARG_buzzer_repeticiones+1
	CALL       _buzzer+0
;incubadora_iot.c,198 :: 		contador=0;
	CLRF       menu_configuracion_contador_L0+0
	CLRF       menu_configuracion_contador_L0+1
;incubadora_iot.c,199 :: 		while(PIN_PULSADOR_ENTER){}
L_menu_configuracion55:
	BTFSS      RD6_bit+0, BitPos(RD6_bit+0)
	GOTO       L_menu_configuracion56
	GOTO       L_menu_configuracion55
L_menu_configuracion56:
;incubadora_iot.c,201 :: 		while(contador<2){
L_menu_configuracion57:
	MOVLW      0
	SUBWF      menu_configuracion_contador_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__menu_configuracion101
	MOVLW      2
	SUBWF      menu_configuracion_contador_L0+0, 0
L__menu_configuracion101:
	BTFSC      STATUS+0, 0
	GOTO       L_menu_configuracion58
;incubadora_iot.c,203 :: 		if(contador==0){
	MOVLW      0
	XORWF      menu_configuracion_contador_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__menu_configuracion102
	MOVLW      0
	XORWF      menu_configuracion_contador_L0+0, 0
L__menu_configuracion102:
	BTFSS      STATUS+0, 2
	GOTO       L_menu_configuracion59
;incubadora_iot.c,204 :: 		lcd_Print('T');
	MOVLW      84
	MOVWF      FARG_lcd_Print_screen+0
	CALL       _lcd_Print+0
;incubadora_iot.c,205 :: 		}else if(contador==1){
	GOTO       L_menu_configuracion60
L_menu_configuracion59:
	MOVLW      0
	XORWF      menu_configuracion_contador_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__menu_configuracion103
	MOVLW      1
	XORWF      menu_configuracion_contador_L0+0, 0
L__menu_configuracion103:
	BTFSS      STATUS+0, 2
	GOTO       L_menu_configuracion61
;incubadora_iot.c,206 :: 		lcd_Print('H');
	MOVLW      72
	MOVWF      FARG_lcd_Print_screen+0
	CALL       _lcd_Print+0
;incubadora_iot.c,207 :: 		}
L_menu_configuracion61:
L_menu_configuracion60:
;incubadora_iot.c,209 :: 		while(1){
L_menu_configuracion62:
;incubadora_iot.c,211 :: 		if(PIN_PULSADOR_DER){      //pulsador derecha
	BTFSS      RD7_bit+0, BitPos(RD7_bit+0)
	GOTO       L_menu_configuracion64
;incubadora_iot.c,213 :: 		Delay_ms(200);
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
;incubadora_iot.c,214 :: 		if(contador==0){
	MOVLW      0
	XORWF      menu_configuracion_contador_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__menu_configuracion104
	MOVLW      0
	XORWF      menu_configuracion_contador_L0+0, 0
L__menu_configuracion104:
	BTFSS      STATUS+0, 2
	GOTO       L_menu_configuracion66
;incubadora_iot.c,215 :: 		if(stpointT<50){stpointT++;}
	MOVLW      50
	SUBWF      _stpointT+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_menu_configuracion67
	INCF       _stpointT+0, 1
L_menu_configuracion67:
;incubadora_iot.c,216 :: 		lcd_Print('T');
	MOVLW      84
	MOVWF      FARG_lcd_Print_screen+0
	CALL       _lcd_Print+0
;incubadora_iot.c,217 :: 		}else if(contador==1){
	GOTO       L_menu_configuracion68
L_menu_configuracion66:
	MOVLW      0
	XORWF      menu_configuracion_contador_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__menu_configuracion105
	MOVLW      1
	XORWF      menu_configuracion_contador_L0+0, 0
L__menu_configuracion105:
	BTFSS      STATUS+0, 2
	GOTO       L_menu_configuracion69
;incubadora_iot.c,218 :: 		if(stpointH<90){stpointH++;}
	MOVLW      90
	SUBWF      _stpointH+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_menu_configuracion70
	INCF       _stpointH+0, 1
L_menu_configuracion70:
;incubadora_iot.c,219 :: 		lcd_Print('H');
	MOVLW      72
	MOVWF      FARG_lcd_Print_screen+0
	CALL       _lcd_Print+0
;incubadora_iot.c,220 :: 		}
L_menu_configuracion69:
L_menu_configuracion68:
;incubadora_iot.c,222 :: 		}else if(PIN_PULSADOR_IZQ){   //pulsador izquierda
	GOTO       L_menu_configuracion71
L_menu_configuracion64:
	BTFSS      RD5_bit+0, BitPos(RD5_bit+0)
	GOTO       L_menu_configuracion72
;incubadora_iot.c,224 :: 		Delay_ms(200);
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
;incubadora_iot.c,225 :: 		if(contador==0){
	MOVLW      0
	XORWF      menu_configuracion_contador_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__menu_configuracion106
	MOVLW      0
	XORWF      menu_configuracion_contador_L0+0, 0
L__menu_configuracion106:
	BTFSS      STATUS+0, 2
	GOTO       L_menu_configuracion74
;incubadora_iot.c,226 :: 		if(stpointT>0){stpointT--;}
	MOVF       _stpointT+0, 0
	SUBLW      0
	BTFSC      STATUS+0, 0
	GOTO       L_menu_configuracion75
	DECF       _stpointT+0, 1
L_menu_configuracion75:
;incubadora_iot.c,227 :: 		lcd_Print('T');
	MOVLW      84
	MOVWF      FARG_lcd_Print_screen+0
	CALL       _lcd_Print+0
;incubadora_iot.c,228 :: 		}else if(contador==1){
	GOTO       L_menu_configuracion76
L_menu_configuracion74:
	MOVLW      0
	XORWF      menu_configuracion_contador_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__menu_configuracion107
	MOVLW      1
	XORWF      menu_configuracion_contador_L0+0, 0
L__menu_configuracion107:
	BTFSS      STATUS+0, 2
	GOTO       L_menu_configuracion77
;incubadora_iot.c,229 :: 		if(stpointH>20){stpointH--;}
	MOVF       _stpointH+0, 0
	SUBLW      20
	BTFSC      STATUS+0, 0
	GOTO       L_menu_configuracion78
	DECF       _stpointH+0, 1
L_menu_configuracion78:
;incubadora_iot.c,230 :: 		lcd_Print('H');
	MOVLW      72
	MOVWF      FARG_lcd_Print_screen+0
	CALL       _lcd_Print+0
;incubadora_iot.c,231 :: 		}
L_menu_configuracion77:
L_menu_configuracion76:
;incubadora_iot.c,233 :: 		}else if(PIN_PULSADOR_ENTER){   // pulsador central
	GOTO       L_menu_configuracion79
L_menu_configuracion72:
	BTFSS      RD6_bit+0, BitPos(RD6_bit+0)
	GOTO       L_menu_configuracion80
;incubadora_iot.c,234 :: 		while(PIN_PULSADOR_ENTER){}
L_menu_configuracion81:
	BTFSS      RD6_bit+0, BitPos(RD6_bit+0)
	GOTO       L_menu_configuracion82
	GOTO       L_menu_configuracion81
L_menu_configuracion82:
;incubadora_iot.c,235 :: 		buzzer(100,1);
	MOVLW      100
	MOVWF      FARG_buzzer_millis+0
	MOVLW      0
	MOVWF      FARG_buzzer_millis+1
	MOVLW      1
	MOVWF      FARG_buzzer_repeticiones+0
	MOVLW      0
	MOVWF      FARG_buzzer_repeticiones+1
	CALL       _buzzer+0
;incubadora_iot.c,236 :: 		break;
	GOTO       L_menu_configuracion63
;incubadora_iot.c,237 :: 		}
L_menu_configuracion80:
L_menu_configuracion79:
L_menu_configuracion71:
;incubadora_iot.c,239 :: 		}
	GOTO       L_menu_configuracion62
L_menu_configuracion63:
;incubadora_iot.c,240 :: 		contador++;
	INCF       menu_configuracion_contador_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       menu_configuracion_contador_L0+1, 1
;incubadora_iot.c,241 :: 		}
	GOTO       L_menu_configuracion57
L_menu_configuracion58:
;incubadora_iot.c,242 :: 		EEPROM_Write(0x02,stpointT);
	MOVLW      2
	MOVWF      FARG_EEPROM_Write_Address+0
	MOVF       _stpointT+0, 0
	MOVWF      FARG_EEPROM_Write_data_+0
	CALL       _EEPROM_Write+0
;incubadora_iot.c,243 :: 		EEPROM_Write(0x03,stpointH);
	MOVLW      3
	MOVWF      FARG_EEPROM_Write_Address+0
	MOVF       _stpointH+0, 0
	MOVWF      FARG_EEPROM_Write_data_+0
	CALL       _EEPROM_Write+0
;incubadora_iot.c,246 :: 		}
L_menu_configuracion54:
;incubadora_iot.c,247 :: 		}
	GOTO       L_menu_configuracion51
L_menu_configuracion52:
;incubadora_iot.c,248 :: 		}
L_menu_configuracion50:
;incubadora_iot.c,249 :: 		}// fin menu  de configuracion
L_end_menu_configuracion:
	RETURN
; end of _menu_configuracion

_main:

;incubadora_iot.c,252 :: 		void main() {
;incubadora_iot.c,253 :: 		ANSEL =0X00;
	CLRF       ANSEL+0
;incubadora_iot.c,254 :: 		ANSELH = 0X00;
	CLRF       ANSELH+0
;incubadora_iot.c,255 :: 		TRISD=0XE0;
	MOVLW      224
	MOVWF      TRISD+0
;incubadora_iot.c,256 :: 		TRISA=0X00;
	CLRF       TRISA+0
;incubadora_iot.c,257 :: 		PORTA=0X00;
	CLRF       PORTA+0
;incubadora_iot.c,258 :: 		PORTD=0x01;
	MOVLW      1
	MOVWF      PORTD+0
;incubadora_iot.c,259 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;incubadora_iot.c,260 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;incubadora_iot.c,261 :: 		stpointT=EEPROM_Read(0x02);
	MOVLW      2
	MOVWF      FARG_EEPROM_Read_Address+0
	CALL       _EEPROM_Read+0
	MOVF       R0+0, 0
	MOVWF      _stpointT+0
;incubadora_iot.c,262 :: 		stpointH=EEPROM_Read(0x03);
	MOVLW      3
	MOVWF      FARG_EEPROM_Read_Address+0
	CALL       _EEPROM_Read+0
	MOVF       R0+0, 0
	MOVWF      _stpointH+0
;incubadora_iot.c,263 :: 		buzzer(600,1);
	MOVLW      88
	MOVWF      FARG_buzzer_millis+0
	MOVLW      2
	MOVWF      FARG_buzzer_millis+1
	MOVLW      1
	MOVWF      FARG_buzzer_repeticiones+0
	MOVLW      0
	MOVWF      FARG_buzzer_repeticiones+1
	CALL       _buzzer+0
;incubadora_iot.c,268 :: 		while(1){
L_main83:
;incubadora_iot.c,270 :: 		if(read_dth11(1)==1){
	MOVLW      1
	MOVWF      FARG_read_dth11_sensor+0
	CALL       _read_dth11+0
	MOVF       R0+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_main85
;incubadora_iot.c,271 :: 		lcd_Print('I');
	MOVLW      73
	MOVWF      FARG_lcd_Print_screen+0
	CALL       _lcd_Print+0
;incubadora_iot.c,272 :: 		}else {
	GOTO       L_main86
L_main85:
;incubadora_iot.c,273 :: 		lcd_Print('E');
	MOVLW      69
	MOVWF      FARG_lcd_Print_screen+0
	CALL       _lcd_Print+0
;incubadora_iot.c,274 :: 		buzzer(200,3);
	MOVLW      200
	MOVWF      FARG_buzzer_millis+0
	CLRF       FARG_buzzer_millis+1
	MOVLW      3
	MOVWF      FARG_buzzer_repeticiones+0
	MOVLW      0
	MOVWF      FARG_buzzer_repeticiones+1
	CALL       _buzzer+0
;incubadora_iot.c,275 :: 		delay_ms(500);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_main87:
	DECFSZ     R13+0, 1
	GOTO       L_main87
	DECFSZ     R12+0, 1
	GOTO       L_main87
	DECFSZ     R11+0, 1
	GOTO       L_main87
	NOP
	NOP
;incubadora_iot.c,276 :: 		}
L_main86:
;incubadora_iot.c,278 :: 		for(i=0;i<MILISEG_ACTUALIZACION_LECTURA;i++){
	CLRF       _i+0
	CLRF       _i+1
L_main88:
	MOVLW      3
	SUBWF      _i+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main109
	MOVLW      232
	SUBWF      _i+0, 0
L__main109:
	BTFSC      STATUS+0, 0
	GOTO       L_main89
;incubadora_iot.c,279 :: 		delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_main91:
	DECFSZ     R13+0, 1
	GOTO       L_main91
	DECFSZ     R12+0, 1
	GOTO       L_main91
;incubadora_iot.c,280 :: 		menu_configuracion();
	CALL       _menu_configuracion+0
;incubadora_iot.c,278 :: 		for(i=0;i<MILISEG_ACTUALIZACION_LECTURA;i++){
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;incubadora_iot.c,281 :: 		}
	GOTO       L_main88
L_main89:
;incubadora_iot.c,287 :: 		} //fin while
	GOTO       L_main83
;incubadora_iot.c,288 :: 		}//fin main
L_end_main:
	GOTO       $+0
; end of _main
