
_Custom_Chulo:

;incubadora_iot.c,54 :: 		void Custom_Chulo(char pos_row2, char pos_char2) {
;incubadora_iot.c,57 :: 		Lcd_Cmd(64);
	MOVLW      64
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;incubadora_iot.c,58 :: 		for (i = 0; i<=7; i++) Lcd_Chr_CP(chulo[i]);
	CLRF       Custom_Chulo_i_L0+0
L_Custom_Chulo0:
	MOVF       Custom_Chulo_i_L0+0, 0
	SUBLW      7
	BTFSS      STATUS+0, 0
	GOTO       L_Custom_Chulo1
	MOVF       Custom_Chulo_i_L0+0, 0
	ADDLW      Custom_Chulo_chulo_L0+0
	MOVWF      R0+0
	MOVLW      hi_addr(Custom_Chulo_chulo_L0+0)
	BTFSC      STATUS+0, 0
	ADDLW      1
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      ___DoICPAddr+0
	MOVF       R0+1, 0
	MOVWF      ___DoICPAddr+1
	CALL       _____DoICP+0
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
	INCF       Custom_Chulo_i_L0+0, 1
	GOTO       L_Custom_Chulo0
L_Custom_Chulo1:
;incubadora_iot.c,59 :: 		Lcd_Cmd(_LCD_RETURN_HOME);
	MOVLW      2
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;incubadora_iot.c,60 :: 		Lcd_Chr(pos_row2, pos_char2, 0);
	MOVF       FARG_Custom_Chulo_pos_row2+0, 0
	MOVWF      FARG_Lcd_Chr_row+0
	MOVF       FARG_Custom_Chulo_pos_char2+0, 0
	MOVWF      FARG_Lcd_Chr_column+0
	CLRF       FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;incubadora_iot.c,61 :: 		}
L_end_Custom_Chulo:
	RETURN
; end of _Custom_Chulo

_buzzer:

;incubadora_iot.c,64 :: 		void buzzer(unsigned int millis,unsigned int repeticiones){
;incubadora_iot.c,65 :: 		unsigned int i=0;
	CLRF       buzzer_i_L0+0
	CLRF       buzzer_i_L0+1
	CLRF       buzzer_u_L0+0
	CLRF       buzzer_u_L0+1
;incubadora_iot.c,67 :: 		for(u=0;u<repeticiones;u++){
	CLRF       buzzer_u_L0+0
	CLRF       buzzer_u_L0+1
L_buzzer3:
	MOVF       FARG_buzzer_repeticiones+1, 0
	SUBWF      buzzer_u_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__buzzer123
	MOVF       FARG_buzzer_repeticiones+0, 0
	SUBWF      buzzer_u_L0+0, 0
L__buzzer123:
	BTFSC      STATUS+0, 0
	GOTO       L_buzzer4
;incubadora_iot.c,68 :: 		PIN_BUZZER=1;
	BSF        RA0_bit+0, BitPos(RA0_bit+0)
;incubadora_iot.c,69 :: 		for(i=0;i<millis;i++){
	CLRF       buzzer_i_L0+0
	CLRF       buzzer_i_L0+1
L_buzzer6:
	MOVF       FARG_buzzer_millis+1, 0
	SUBWF      buzzer_i_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__buzzer124
	MOVF       FARG_buzzer_millis+0, 0
	SUBWF      buzzer_i_L0+0, 0
L__buzzer124:
	BTFSC      STATUS+0, 0
	GOTO       L_buzzer7
;incubadora_iot.c,70 :: 		Delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_buzzer9:
	DECFSZ     R13+0, 1
	GOTO       L_buzzer9
	DECFSZ     R12+0, 1
	GOTO       L_buzzer9
;incubadora_iot.c,69 :: 		for(i=0;i<millis;i++){
	INCF       buzzer_i_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       buzzer_i_L0+1, 1
;incubadora_iot.c,71 :: 		}
	GOTO       L_buzzer6
L_buzzer7:
;incubadora_iot.c,72 :: 		PIN_BUZZER=0;
	BCF        RA0_bit+0, BitPos(RA0_bit+0)
;incubadora_iot.c,73 :: 		for(i=0;i<millis;i++){
	CLRF       buzzer_i_L0+0
	CLRF       buzzer_i_L0+1
L_buzzer10:
	MOVF       FARG_buzzer_millis+1, 0
	SUBWF      buzzer_i_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__buzzer125
	MOVF       FARG_buzzer_millis+0, 0
	SUBWF      buzzer_i_L0+0, 0
L__buzzer125:
	BTFSC      STATUS+0, 0
	GOTO       L_buzzer11
	INCF       buzzer_i_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       buzzer_i_L0+1, 1
;incubadora_iot.c,74 :: 		}
	GOTO       L_buzzer10
L_buzzer11:
;incubadora_iot.c,67 :: 		for(u=0;u<repeticiones;u++){
	INCF       buzzer_u_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       buzzer_u_L0+1, 1
;incubadora_iot.c,75 :: 		}
	GOTO       L_buzzer3
L_buzzer4:
;incubadora_iot.c,77 :: 		}//fin buzzer
L_end_buzzer:
	RETURN
; end of _buzzer

_read_dth11:

;incubadora_iot.c,79 :: 		char read_dth11(){            //funcion para realizar la lectura del sensor dht11
;incubadora_iot.c,81 :: 		unsigned char i=0;
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
;incubadora_iot.c,88 :: 		temperatura=0;
	CLRF       _temperatura+0
;incubadora_iot.c,89 :: 		humedad=0;
	CLRF       _humedad+0
;incubadora_iot.c,93 :: 		PIN_SENSOR_Direction=0;  //rb0 de salida
	BCF        TRISD0_bit+0, BitPos(TRISD0_bit+0)
;incubadora_iot.c,94 :: 		PIN_SENSOR=1;  //rb0 en alto
	BSF        RD0_bit+0, BitPos(RD0_bit+0)
;incubadora_iot.c,95 :: 		delay_us(20);
	MOVLW      6
	MOVWF      R13+0
L_read_dth1115:
	DECFSZ     R13+0, 1
	GOTO       L_read_dth1115
	NOP
;incubadora_iot.c,96 :: 		PIN_SENSOR=0;     //rbo en bajo
	BCF        RD0_bit+0, BitPos(RD0_bit+0)
;incubadora_iot.c,97 :: 		delay_ms(18);
	MOVLW      24
	MOVWF      R12+0
	MOVLW      95
	MOVWF      R13+0
L_read_dth1116:
	DECFSZ     R13+0, 1
	GOTO       L_read_dth1116
	DECFSZ     R12+0, 1
	GOTO       L_read_dth1116
;incubadora_iot.c,98 :: 		PIN_SENSOR=1;     //rbo en alto
	BSF        RD0_bit+0, BitPos(RD0_bit+0)
;incubadora_iot.c,99 :: 		delay_us(22);
	MOVLW      7
	MOVWF      R13+0
L_read_dth1117:
	DECFSZ     R13+0, 1
	GOTO       L_read_dth1117
;incubadora_iot.c,100 :: 		PIN_SENSOR_Direction=1; //rbo como entrada para leer la respuesta del sensor
	BSF        TRISD0_bit+0, BitPos(TRISD0_bit+0)
;incubadora_iot.c,101 :: 		delay_us(10);
	MOVLW      3
	MOVWF      R13+0
L_read_dth1118:
	DECFSZ     R13+0, 1
	GOTO       L_read_dth1118
;incubadora_iot.c,102 :: 		if(PIN_SENSOR){return -1;}    //comprueba si el sensor envio un estado bajo
	BTFSS      RD0_bit+0, BitPos(RD0_bit+0)
	GOTO       L_read_dth1119
	MOVLW      255
	MOVWF      R0+0
	GOTO       L_end_read_dth11
L_read_dth1119:
;incubadora_iot.c,103 :: 		delay_us(80);
	MOVLW      26
	MOVWF      R13+0
L_read_dth1120:
	DECFSZ     R13+0, 1
	GOTO       L_read_dth1120
	NOP
;incubadora_iot.c,104 :: 		if(PIN_SENSOR==0){return -1;}      //comprueba si el sensor envio un estado alto despues de 80ms
	BTFSC      RD0_bit+0, BitPos(RD0_bit+0)
	GOTO       L_read_dth1121
	MOVLW      255
	MOVWF      R0+0
	GOTO       L_end_read_dth11
L_read_dth1121:
;incubadora_iot.c,105 :: 		delay_us(80);
	MOVLW      26
	MOVWF      R13+0
L_read_dth1122:
	DECFSZ     R13+0, 1
	GOTO       L_read_dth1122
	NOP
;incubadora_iot.c,107 :: 		for(i=0;i<5;i++){
	CLRF       read_dth11_i_L0+0
L_read_dth1123:
	MOVLW      5
	SUBWF      read_dth11_i_L0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_read_dth1124
;incubadora_iot.c,108 :: 		for(j=0;j<8;j++){
	CLRF       read_dth11_j_L0+0
L_read_dth1126:
	MOVLW      8
	SUBWF      read_dth11_j_L0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_read_dth1127
;incubadora_iot.c,109 :: 		while(PIN_SENSOR==0);   //espera a que la entrada sea distinta de 0
L_read_dth1129:
	BTFSC      RD0_bit+0, BitPos(RD0_bit+0)
	GOTO       L_read_dth1130
	GOTO       L_read_dth1129
L_read_dth1130:
;incubadora_iot.c,110 :: 		delay_us(30);     //espera 30 us
	MOVLW      9
	MOVWF      R13+0
L_read_dth1131:
	DECFSZ     R13+0, 1
	GOTO       L_read_dth1131
	NOP
	NOP
;incubadora_iot.c,111 :: 		if(PIN_SENSOR){    // si el pulso despues de 30us esta en alto es porque es un 1
	BTFSS      RD0_bit+0, BitPos(RD0_bit+0)
	GOTO       L_read_dth1132
;incubadora_iot.c,112 :: 		dato[i]=(dato[i]<<1) | 0x01;   // se le agrega un 1 al bit
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
;incubadora_iot.c,113 :: 		}
L_read_dth1132:
;incubadora_iot.c,114 :: 		if(PIN_SENSOR==0){       // si el pulso despues de 30us esta en bajo es porque es un 0
	BTFSC      RD0_bit+0, BitPos(RD0_bit+0)
	GOTO       L_read_dth1133
;incubadora_iot.c,115 :: 		dato[i]=(dato[i]<<1);}  // se le agrega un 0 corriendo a la izquierda            }
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
L_read_dth1133:
;incubadora_iot.c,116 :: 		while(PIN_SENSOR==1);
L_read_dth1134:
	BTFSS      RD0_bit+0, BitPos(RD0_bit+0)
	GOTO       L_read_dth1135
	GOTO       L_read_dth1134
L_read_dth1135:
;incubadora_iot.c,108 :: 		for(j=0;j<8;j++){
	INCF       read_dth11_j_L0+0, 1
;incubadora_iot.c,117 :: 		}//fin for de 8
	GOTO       L_read_dth1126
L_read_dth1127:
;incubadora_iot.c,107 :: 		for(i=0;i<5;i++){
	INCF       read_dth11_i_L0+0, 1
;incubadora_iot.c,118 :: 		}// fin for de 5
	GOTO       L_read_dth1123
L_read_dth1124:
;incubadora_iot.c,119 :: 		PIN_SENSOR_Direction=0;    //rb0 de salida
	BCF        TRISD0_bit+0, BitPos(TRISD0_bit+0)
;incubadora_iot.c,120 :: 		PIN_SENSOR=1;     //rb0  en alto
	BSF        RD0_bit+0, BitPos(RD0_bit+0)
;incubadora_iot.c,122 :: 		if((dato[0]+dato[1]+dato[2]+dato[3])==dato[4]){
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
	GOTO       L__read_dth11127
	MOVF       read_dth11_dato_L0+4, 0
	XORWF      R2+0, 0
L__read_dth11127:
	BTFSS      STATUS+0, 2
	GOTO       L_read_dth1136
;incubadora_iot.c,123 :: 		hum=dato[0];
	MOVF       read_dth11_dato_L0+0, 0
	MOVWF      read_dth11_hum_L0+0
	CLRF       read_dth11_hum_L0+1
;incubadora_iot.c,124 :: 		temp=dato[2];
	MOVF       read_dth11_dato_L0+2, 0
	MOVWF      read_dth11_temp_L0+0
	CLRF       read_dth11_temp_L0+1
;incubadora_iot.c,126 :: 		base=10;
	MOVLW      10
	MOVWF      read_dth11_base_L0+0
	MOVLW      0
	MOVWF      read_dth11_base_L0+1
;incubadora_iot.c,127 :: 		for(i=0;i<2;i++){
	CLRF       read_dth11_i_L0+0
L_read_dth1137:
	MOVLW      2
	SUBWF      read_dth11_i_L0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_read_dth1138
;incubadora_iot.c,128 :: 		valor[i]=(hum/base);
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
;incubadora_iot.c,129 :: 		hum=hum-(valor[i]*base);
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
;incubadora_iot.c,130 :: 		base=base/10;
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
;incubadora_iot.c,127 :: 		for(i=0;i<2;i++){
	INCF       read_dth11_i_L0+0, 1
;incubadora_iot.c,131 :: 		}
	GOTO       L_read_dth1137
L_read_dth1138:
;incubadora_iot.c,132 :: 		base=10;
	MOVLW      10
	MOVWF      read_dth11_base_L0+0
	MOVLW      0
	MOVWF      read_dth11_base_L0+1
;incubadora_iot.c,133 :: 		for(i=2;i<4;i++){
	MOVLW      2
	MOVWF      read_dth11_i_L0+0
L_read_dth1140:
	MOVLW      4
	SUBWF      read_dth11_i_L0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_read_dth1141
;incubadora_iot.c,134 :: 		valor[i]=(temp/base);
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
;incubadora_iot.c,135 :: 		temp=temp-(valor[i]*base);
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
;incubadora_iot.c,136 :: 		base=base/10;
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
;incubadora_iot.c,133 :: 		for(i=2;i<4;i++){
	INCF       read_dth11_i_L0+0, 1
;incubadora_iot.c,137 :: 		}
	GOTO       L_read_dth1140
L_read_dth1141:
;incubadora_iot.c,139 :: 		temperatura=(valor[2]*10)+valor[3];
	MOVF       read_dth11_valor_L0+2, 0
	MOVWF      R0+0
	MOVLW      10
	MOVWF      R4+0
	CALL       _Mul_8X8_U+0
	MOVF       read_dth11_valor_L0+3, 0
	ADDWF      R0+0, 0
	MOVWF      _temperatura+0
;incubadora_iot.c,140 :: 		humedad=(valor[0]*10)+valor[1];
	MOVF       read_dth11_valor_L0+0, 0
	MOVWF      R0+0
	MOVLW      10
	MOVWF      R4+0
	CALL       _Mul_8X8_U+0
	MOVF       read_dth11_valor_L0+1, 0
	ADDWF      R0+0, 0
	MOVWF      _humedad+0
;incubadora_iot.c,141 :: 		return 1;
	MOVLW      1
	MOVWF      R0+0
	GOTO       L_end_read_dth11
;incubadora_iot.c,143 :: 		}else{return -1;}
L_read_dth1136:
	MOVLW      255
	MOVWF      R0+0
;incubadora_iot.c,145 :: 		}//fin read_dht
L_end_read_dth11:
	RETURN
; end of _read_dth11

_lcd_Print:

;incubadora_iot.c,147 :: 		void lcd_Print(unsigned char screen){             //funcion para imprimir las diferentes pantallas en la lcd16x2
;incubadora_iot.c,149 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;incubadora_iot.c,150 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;incubadora_iot.c,152 :: 		switch(screen){
	GOTO       L_lcd_Print44
;incubadora_iot.c,154 :: 		case 'I':
L_lcd_Print46:
;incubadora_iot.c,155 :: 		ByteToStr(temperatura,txtInt);
	MOVF       _temperatura+0, 0
	MOVWF      FARG_ByteToStr_input+0
	MOVLW      lcd_Print_txtInt_L0+0
	MOVWF      FARG_ByteToStr_output+0
	CALL       _ByteToStr+0
;incubadora_iot.c,156 :: 		Lcd_Out(1,2,txtInt);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      lcd_Print_txtInt_L0+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;incubadora_iot.c,157 :: 		ByteToStr(humedad,txtInt);
	MOVF       _humedad+0, 0
	MOVWF      FARG_ByteToStr_input+0
	MOVLW      lcd_Print_txtInt_L0+0
	MOVWF      FARG_ByteToStr_output+0
	CALL       _ByteToStr+0
;incubadora_iot.c,158 :: 		Lcd_Out(2,2,txtInt);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      lcd_Print_txtInt_L0+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;incubadora_iot.c,159 :: 		Lcd_Out(1,1,"T=");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_incubadora_iot+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;incubadora_iot.c,160 :: 		Lcd_Out(2,1,"H=");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_incubadora_iot+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;incubadora_iot.c,161 :: 		Lcd_Out(1,5,"C|");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      5
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr3_incubadora_iot+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;incubadora_iot.c,162 :: 		Lcd_Out(2,5,"%|");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      5
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr4_incubadora_iot+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;incubadora_iot.c,164 :: 		ByteToStr(stpointT,txtInt);
	MOVF       _stpointT+0, 0
	MOVWF      FARG_ByteToStr_input+0
	MOVLW      lcd_Print_txtInt_L0+0
	MOVWF      FARG_ByteToStr_output+0
	CALL       _ByteToStr+0
;incubadora_iot.c,165 :: 		Lcd_Out(1,9,txtInt);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      9
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      lcd_Print_txtInt_L0+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;incubadora_iot.c,166 :: 		ByteToStr(stpointH,txtInt);
	MOVF       _stpointH+0, 0
	MOVWF      FARG_ByteToStr_input+0
	MOVLW      lcd_Print_txtInt_L0+0
	MOVWF      FARG_ByteToStr_output+0
	CALL       _ByteToStr+0
;incubadora_iot.c,167 :: 		Lcd_Out(2,9,txtInt);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      9
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      lcd_Print_txtInt_L0+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;incubadora_iot.c,168 :: 		Lcd_Out(1,7,"SP=");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      7
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr5_incubadora_iot+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;incubadora_iot.c,169 :: 		Lcd_Out(2,7,"SP=");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      7
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr6_incubadora_iot+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;incubadora_iot.c,170 :: 		Lcd_Out(1,12,"|");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      12
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr7_incubadora_iot+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;incubadora_iot.c,171 :: 		Lcd_Out(2,12,"|");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      12
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr8_incubadora_iot+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;incubadora_iot.c,173 :: 		Lcd_Out(1,13,"RED");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      13
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr9_incubadora_iot+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;incubadora_iot.c,174 :: 		Lcd_Out(2,13,"SUB");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      13
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr10_incubadora_iot+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;incubadora_iot.c,175 :: 		if(estadoWifi){
	MOVF       _estadoWifi+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_lcd_Print47
;incubadora_iot.c,176 :: 		Custom_Chulo(1, 16);
	MOVLW      1
	MOVWF      FARG_Custom_Chulo_pos_row2+0
	MOVLW      16
	MOVWF      FARG_Custom_Chulo_pos_char2+0
	CALL       _Custom_Chulo+0
;incubadora_iot.c,177 :: 		}else{
	GOTO       L_lcd_Print48
L_lcd_Print47:
;incubadora_iot.c,178 :: 		Lcd_Out(1,16,"");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      16
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr11_incubadora_iot+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;incubadora_iot.c,179 :: 		}
L_lcd_Print48:
;incubadora_iot.c,180 :: 		if(estadoSubscripcion){
	MOVF       _estadoSubscripcion+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_lcd_Print49
;incubadora_iot.c,181 :: 		Custom_Chulo(2, 16);
	MOVLW      2
	MOVWF      FARG_Custom_Chulo_pos_row2+0
	MOVLW      16
	MOVWF      FARG_Custom_Chulo_pos_char2+0
	CALL       _Custom_Chulo+0
;incubadora_iot.c,182 :: 		}else{
	GOTO       L_lcd_Print50
L_lcd_Print49:
;incubadora_iot.c,183 :: 		Lcd_Out(2,16,"x");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      16
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr12_incubadora_iot+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;incubadora_iot.c,184 :: 		}
L_lcd_Print50:
;incubadora_iot.c,187 :: 		break;
	GOTO       L_lcd_Print45
;incubadora_iot.c,190 :: 		case 'E': Lcd_Out(1,8,"[X]");
L_lcd_Print51:
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      8
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr13_incubadora_iot+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;incubadora_iot.c,191 :: 		Lcd_Out(2,4,"ERROR DHT11");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      4
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr14_incubadora_iot+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;incubadora_iot.c,192 :: 		break;
	GOTO       L_lcd_Print45
;incubadora_iot.c,194 :: 		case 'C': Lcd_Out(1,3,"CONFIGURACION");
L_lcd_Print52:
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      3
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr15_incubadora_iot+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;incubadora_iot.c,195 :: 		break;
	GOTO       L_lcd_Print45
;incubadora_iot.c,197 :: 		case 'T': Lcd_Out(1,3,"-TEMPERATURA-");
L_lcd_Print53:
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      3
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr16_incubadora_iot+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;incubadora_iot.c,198 :: 		Lcd_Out(2,1,"<>");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr17_incubadora_iot+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;incubadora_iot.c,199 :: 		Lcd_Out(2,16,"C");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      16
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr18_incubadora_iot+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;incubadora_iot.c,200 :: 		ByteToStr(stpointT,txtInt);
	MOVF       _stpointT+0, 0
	MOVWF      FARG_ByteToStr_input+0
	MOVLW      lcd_Print_txtInt_L0+0
	MOVWF      FARG_ByteToStr_output+0
	CALL       _ByteToStr+0
;incubadora_iot.c,201 :: 		Lcd_Out(2,13,txtInt);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      13
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      lcd_Print_txtInt_L0+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;incubadora_iot.c,202 :: 		break;
	GOTO       L_lcd_Print45
;incubadora_iot.c,204 :: 		case 'H': Lcd_Out(1,4,"-HUMEDAD-");
L_lcd_Print54:
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      4
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr19_incubadora_iot+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;incubadora_iot.c,205 :: 		Lcd_Out(2,1,"<>");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr20_incubadora_iot+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;incubadora_iot.c,206 :: 		Lcd_Out(2,16,"%");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      16
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr21_incubadora_iot+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;incubadora_iot.c,207 :: 		ByteToStr(stpointH,txtInt);
	MOVF       _stpointH+0, 0
	MOVWF      FARG_ByteToStr_input+0
	MOVLW      lcd_Print_txtInt_L0+0
	MOVWF      FARG_ByteToStr_output+0
	CALL       _ByteToStr+0
;incubadora_iot.c,208 :: 		Lcd_Out(2,13,txtInt);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      13
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      lcd_Print_txtInt_L0+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;incubadora_iot.c,209 :: 		break;
	GOTO       L_lcd_Print45
;incubadora_iot.c,211 :: 		default:
L_lcd_Print55:
;incubadora_iot.c,212 :: 		break;
	GOTO       L_lcd_Print45
;incubadora_iot.c,214 :: 		}//fin switch
L_lcd_Print44:
	MOVF       FARG_lcd_Print_screen+0, 0
	XORLW      73
	BTFSC      STATUS+0, 2
	GOTO       L_lcd_Print46
	MOVF       FARG_lcd_Print_screen+0, 0
	XORLW      69
	BTFSC      STATUS+0, 2
	GOTO       L_lcd_Print51
	MOVF       FARG_lcd_Print_screen+0, 0
	XORLW      67
	BTFSC      STATUS+0, 2
	GOTO       L_lcd_Print52
	MOVF       FARG_lcd_Print_screen+0, 0
	XORLW      84
	BTFSC      STATUS+0, 2
	GOTO       L_lcd_Print53
	MOVF       FARG_lcd_Print_screen+0, 0
	XORLW      72
	BTFSC      STATUS+0, 2
	GOTO       L_lcd_Print54
	GOTO       L_lcd_Print55
L_lcd_Print45:
;incubadora_iot.c,215 :: 		}//fin lcdPrint
L_end_lcd_Print:
	RETURN
; end of _lcd_Print

_menu_configuracion:

;incubadora_iot.c,217 :: 		void menu_configuracion(){                        //funcion para antender la configuraion de los set points haciendo uso de los 3 pulsadores
;incubadora_iot.c,218 :: 		unsigned int contador=0;
	CLRF       menu_configuracion_contador_L0+0
	CLRF       menu_configuracion_contador_L0+1
;incubadora_iot.c,220 :: 		if(PIN_PULSADOR_ENTER){      // menu de configuracion
	BTFSS      RD6_bit+0, BitPos(RD6_bit+0)
	GOTO       L_menu_configuracion56
;incubadora_iot.c,221 :: 		contador=0;
	CLRF       menu_configuracion_contador_L0+0
	CLRF       menu_configuracion_contador_L0+1
;incubadora_iot.c,222 :: 		while(PIN_PULSADOR_ENTER){
L_menu_configuracion57:
	BTFSS      RD6_bit+0, BitPos(RD6_bit+0)
	GOTO       L_menu_configuracion58
;incubadora_iot.c,223 :: 		Delay_ms(10);
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_menu_configuracion59:
	DECFSZ     R13+0, 1
	GOTO       L_menu_configuracion59
	DECFSZ     R12+0, 1
	GOTO       L_menu_configuracion59
	NOP
	NOP
;incubadora_iot.c,224 :: 		contador++;
	INCF       menu_configuracion_contador_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       menu_configuracion_contador_L0+1, 1
;incubadora_iot.c,225 :: 		if(contador>=100){
	MOVLW      0
	SUBWF      menu_configuracion_contador_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__menu_configuracion130
	MOVLW      100
	SUBWF      menu_configuracion_contador_L0+0, 0
L__menu_configuracion130:
	BTFSS      STATUS+0, 0
	GOTO       L_menu_configuracion60
;incubadora_iot.c,226 :: 		lcd_Print('C');
	MOVLW      67
	MOVWF      FARG_lcd_Print_screen+0
	CALL       _lcd_Print+0
;incubadora_iot.c,227 :: 		buzzer(500,1);
	MOVLW      244
	MOVWF      FARG_buzzer_millis+0
	MOVLW      1
	MOVWF      FARG_buzzer_millis+1
	MOVLW      1
	MOVWF      FARG_buzzer_repeticiones+0
	MOVLW      0
	MOVWF      FARG_buzzer_repeticiones+1
	CALL       _buzzer+0
;incubadora_iot.c,228 :: 		contador=0;
	CLRF       menu_configuracion_contador_L0+0
	CLRF       menu_configuracion_contador_L0+1
;incubadora_iot.c,229 :: 		while(PIN_PULSADOR_ENTER){}
L_menu_configuracion61:
	BTFSS      RD6_bit+0, BitPos(RD6_bit+0)
	GOTO       L_menu_configuracion62
	GOTO       L_menu_configuracion61
L_menu_configuracion62:
;incubadora_iot.c,231 :: 		while(contador<2){
L_menu_configuracion63:
	MOVLW      0
	SUBWF      menu_configuracion_contador_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__menu_configuracion131
	MOVLW      2
	SUBWF      menu_configuracion_contador_L0+0, 0
L__menu_configuracion131:
	BTFSC      STATUS+0, 0
	GOTO       L_menu_configuracion64
;incubadora_iot.c,233 :: 		if(contador==0){
	MOVLW      0
	XORWF      menu_configuracion_contador_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__menu_configuracion132
	MOVLW      0
	XORWF      menu_configuracion_contador_L0+0, 0
L__menu_configuracion132:
	BTFSS      STATUS+0, 2
	GOTO       L_menu_configuracion65
;incubadora_iot.c,234 :: 		lcd_Print('T');
	MOVLW      84
	MOVWF      FARG_lcd_Print_screen+0
	CALL       _lcd_Print+0
;incubadora_iot.c,235 :: 		}else if(contador==1){
	GOTO       L_menu_configuracion66
L_menu_configuracion65:
	MOVLW      0
	XORWF      menu_configuracion_contador_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__menu_configuracion133
	MOVLW      1
	XORWF      menu_configuracion_contador_L0+0, 0
L__menu_configuracion133:
	BTFSS      STATUS+0, 2
	GOTO       L_menu_configuracion67
;incubadora_iot.c,236 :: 		lcd_Print('H');
	MOVLW      72
	MOVWF      FARG_lcd_Print_screen+0
	CALL       _lcd_Print+0
;incubadora_iot.c,237 :: 		}
L_menu_configuracion67:
L_menu_configuracion66:
;incubadora_iot.c,239 :: 		while(1){
L_menu_configuracion68:
;incubadora_iot.c,241 :: 		if(PIN_PULSADOR_DER){      //pulsador derecha
	BTFSS      RD7_bit+0, BitPos(RD7_bit+0)
	GOTO       L_menu_configuracion70
;incubadora_iot.c,243 :: 		Delay_ms(200);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_menu_configuracion71:
	DECFSZ     R13+0, 1
	GOTO       L_menu_configuracion71
	DECFSZ     R12+0, 1
	GOTO       L_menu_configuracion71
	DECFSZ     R11+0, 1
	GOTO       L_menu_configuracion71
	NOP
;incubadora_iot.c,244 :: 		if(contador==0){
	MOVLW      0
	XORWF      menu_configuracion_contador_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__menu_configuracion134
	MOVLW      0
	XORWF      menu_configuracion_contador_L0+0, 0
L__menu_configuracion134:
	BTFSS      STATUS+0, 2
	GOTO       L_menu_configuracion72
;incubadora_iot.c,245 :: 		if(stpointT<50){stpointT++;}
	MOVLW      50
	SUBWF      _stpointT+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_menu_configuracion73
	INCF       _stpointT+0, 1
L_menu_configuracion73:
;incubadora_iot.c,246 :: 		lcd_Print('T');
	MOVLW      84
	MOVWF      FARG_lcd_Print_screen+0
	CALL       _lcd_Print+0
;incubadora_iot.c,247 :: 		}else if(contador==1){
	GOTO       L_menu_configuracion74
L_menu_configuracion72:
	MOVLW      0
	XORWF      menu_configuracion_contador_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__menu_configuracion135
	MOVLW      1
	XORWF      menu_configuracion_contador_L0+0, 0
L__menu_configuracion135:
	BTFSS      STATUS+0, 2
	GOTO       L_menu_configuracion75
;incubadora_iot.c,248 :: 		if(stpointH<90){stpointH++;}
	MOVLW      90
	SUBWF      _stpointH+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_menu_configuracion76
	INCF       _stpointH+0, 1
L_menu_configuracion76:
;incubadora_iot.c,249 :: 		lcd_Print('H');
	MOVLW      72
	MOVWF      FARG_lcd_Print_screen+0
	CALL       _lcd_Print+0
;incubadora_iot.c,250 :: 		}
L_menu_configuracion75:
L_menu_configuracion74:
;incubadora_iot.c,252 :: 		}else if(PIN_PULSADOR_IZQ){   //pulsador izquierda
	GOTO       L_menu_configuracion77
L_menu_configuracion70:
	BTFSS      RD5_bit+0, BitPos(RD5_bit+0)
	GOTO       L_menu_configuracion78
;incubadora_iot.c,254 :: 		Delay_ms(200);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_menu_configuracion79:
	DECFSZ     R13+0, 1
	GOTO       L_menu_configuracion79
	DECFSZ     R12+0, 1
	GOTO       L_menu_configuracion79
	DECFSZ     R11+0, 1
	GOTO       L_menu_configuracion79
	NOP
;incubadora_iot.c,255 :: 		if(contador==0){
	MOVLW      0
	XORWF      menu_configuracion_contador_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__menu_configuracion136
	MOVLW      0
	XORWF      menu_configuracion_contador_L0+0, 0
L__menu_configuracion136:
	BTFSS      STATUS+0, 2
	GOTO       L_menu_configuracion80
;incubadora_iot.c,256 :: 		if(stpointT>0){stpointT--;}
	MOVF       _stpointT+0, 0
	SUBLW      0
	BTFSC      STATUS+0, 0
	GOTO       L_menu_configuracion81
	DECF       _stpointT+0, 1
L_menu_configuracion81:
;incubadora_iot.c,257 :: 		lcd_Print('T');
	MOVLW      84
	MOVWF      FARG_lcd_Print_screen+0
	CALL       _lcd_Print+0
;incubadora_iot.c,258 :: 		}else if(contador==1){
	GOTO       L_menu_configuracion82
L_menu_configuracion80:
	MOVLW      0
	XORWF      menu_configuracion_contador_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__menu_configuracion137
	MOVLW      1
	XORWF      menu_configuracion_contador_L0+0, 0
L__menu_configuracion137:
	BTFSS      STATUS+0, 2
	GOTO       L_menu_configuracion83
;incubadora_iot.c,259 :: 		if(stpointH>20){stpointH--;}
	MOVF       _stpointH+0, 0
	SUBLW      20
	BTFSC      STATUS+0, 0
	GOTO       L_menu_configuracion84
	DECF       _stpointH+0, 1
L_menu_configuracion84:
;incubadora_iot.c,260 :: 		lcd_Print('H');
	MOVLW      72
	MOVWF      FARG_lcd_Print_screen+0
	CALL       _lcd_Print+0
;incubadora_iot.c,261 :: 		}
L_menu_configuracion83:
L_menu_configuracion82:
;incubadora_iot.c,263 :: 		}else if(PIN_PULSADOR_ENTER){   // pulsador central
	GOTO       L_menu_configuracion85
L_menu_configuracion78:
	BTFSS      RD6_bit+0, BitPos(RD6_bit+0)
	GOTO       L_menu_configuracion86
;incubadora_iot.c,264 :: 		while(PIN_PULSADOR_ENTER){}
L_menu_configuracion87:
	BTFSS      RD6_bit+0, BitPos(RD6_bit+0)
	GOTO       L_menu_configuracion88
	GOTO       L_menu_configuracion87
L_menu_configuracion88:
;incubadora_iot.c,265 :: 		buzzer(100,1);
	MOVLW      100
	MOVWF      FARG_buzzer_millis+0
	MOVLW      0
	MOVWF      FARG_buzzer_millis+1
	MOVLW      1
	MOVWF      FARG_buzzer_repeticiones+0
	MOVLW      0
	MOVWF      FARG_buzzer_repeticiones+1
	CALL       _buzzer+0
;incubadora_iot.c,266 :: 		break;
	GOTO       L_menu_configuracion69
;incubadora_iot.c,267 :: 		}
L_menu_configuracion86:
L_menu_configuracion85:
L_menu_configuracion77:
;incubadora_iot.c,269 :: 		}
	GOTO       L_menu_configuracion68
L_menu_configuracion69:
;incubadora_iot.c,270 :: 		contador++;
	INCF       menu_configuracion_contador_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       menu_configuracion_contador_L0+1, 1
;incubadora_iot.c,271 :: 		}
	GOTO       L_menu_configuracion63
L_menu_configuracion64:
;incubadora_iot.c,272 :: 		EEPROM_Write(0x02,stpointT);
	MOVLW      2
	MOVWF      FARG_EEPROM_Write_Address+0
	MOVF       _stpointT+0, 0
	MOVWF      FARG_EEPROM_Write_data_+0
	CALL       _EEPROM_Write+0
;incubadora_iot.c,273 :: 		EEPROM_Write(0x03,stpointH);
	MOVLW      3
	MOVWF      FARG_EEPROM_Write_Address+0
	MOVF       _stpointH+0, 0
	MOVWF      FARG_EEPROM_Write_data_+0
	CALL       _EEPROM_Write+0
;incubadora_iot.c,276 :: 		}
L_menu_configuracion60:
;incubadora_iot.c,277 :: 		}
	GOTO       L_menu_configuracion57
L_menu_configuracion58:
;incubadora_iot.c,278 :: 		}
L_menu_configuracion56:
;incubadora_iot.c,279 :: 		}// fin menu  de configuracion
L_end_menu_configuracion:
	RETURN
; end of _menu_configuracion

_proceso_control:

;incubadora_iot.c,281 :: 		void proceso_control(){                           // funcion para gestionar el control automatico de los perifericos para mantener las variables estables
;incubadora_iot.c,283 :: 		if(ENABLE_CONTROL_AUTOMATICO && error==0){
	MOVF       _error+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_proceso_control91
L__proceso_control120:
;incubadora_iot.c,285 :: 		if(temperatura==stpointT){
	MOVF       _temperatura+0, 0
	XORWF      _stpointT+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_proceso_control92
;incubadora_iot.c,286 :: 		PIN_CALENTADOR=0;
	BCF        RD2_bit+0, BitPos(RD2_bit+0)
;incubadora_iot.c,287 :: 		PIN_VENTILADOR=0;
	BCF        RD1_bit+0, BitPos(RD1_bit+0)
;incubadora_iot.c,288 :: 		}else if(temperatura<stpointT){
	GOTO       L_proceso_control93
L_proceso_control92:
	MOVF       _stpointT+0, 0
	SUBWF      _temperatura+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_proceso_control94
;incubadora_iot.c,289 :: 		PIN_CALENTADOR=1;
	BSF        RD2_bit+0, BitPos(RD2_bit+0)
;incubadora_iot.c,290 :: 		PIN_VENTILADOR=0;
	BCF        RD1_bit+0, BitPos(RD1_bit+0)
;incubadora_iot.c,291 :: 		}else if(temperatura>stpointT){
	GOTO       L_proceso_control95
L_proceso_control94:
	MOVF       _temperatura+0, 0
	SUBWF      _stpointT+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_proceso_control96
;incubadora_iot.c,292 :: 		PIN_CALENTADOR=0;
	BCF        RD2_bit+0, BitPos(RD2_bit+0)
;incubadora_iot.c,293 :: 		PIN_VENTILADOR=1;
	BSF        RD1_bit+0, BitPos(RD1_bit+0)
;incubadora_iot.c,294 :: 		}
L_proceso_control96:
L_proceso_control95:
L_proceso_control93:
;incubadora_iot.c,296 :: 		if(humedad==stpointH){
	MOVF       _humedad+0, 0
	XORWF      _stpointH+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_proceso_control97
;incubadora_iot.c,297 :: 		PIN_HUMIFICADOR=0;
	BCF        RD3_bit+0, BitPos(RD3_bit+0)
;incubadora_iot.c,298 :: 		}else if(humedad<stpointH){
	GOTO       L_proceso_control98
L_proceso_control97:
	MOVF       _stpointH+0, 0
	SUBWF      _humedad+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_proceso_control99
;incubadora_iot.c,299 :: 		PIN_HUMIFICADOR=1;
	BSF        RD3_bit+0, BitPos(RD3_bit+0)
;incubadora_iot.c,300 :: 		}else if(humedad>stpointH){
	GOTO       L_proceso_control100
L_proceso_control99:
	MOVF       _humedad+0, 0
	SUBWF      _stpointH+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_proceso_control101
;incubadora_iot.c,301 :: 		PIN_HUMIFICADOR=0;
	BCF        RD3_bit+0, BitPos(RD3_bit+0)
;incubadora_iot.c,302 :: 		}
L_proceso_control101:
L_proceso_control100:
L_proceso_control98:
;incubadora_iot.c,304 :: 		}else{
	GOTO       L_proceso_control102
L_proceso_control91:
;incubadora_iot.c,305 :: 		PIN_HUMIFICADOR=0;
	BCF        RD3_bit+0, BitPos(RD3_bit+0)
;incubadora_iot.c,306 :: 		PIN_CALENTADOR=0;
	BCF        RD2_bit+0, BitPos(RD2_bit+0)
;incubadora_iot.c,307 :: 		PIN_VENTILADOR=0;
	BCF        RD1_bit+0, BitPos(RD1_bit+0)
;incubadora_iot.c,308 :: 		}
L_proceso_control102:
;incubadora_iot.c,309 :: 		}//fin proceso control
L_end_proceso_control:
	RETURN
; end of _proceso_control

_uart_transmitir_datos:

;incubadora_iot.c,311 :: 		void uart_transmitir_datos(){
;incubadora_iot.c,313 :: 		unsigned char msg[]="T00A00H00B00S000E0F\n\r";
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
	MOVLW      70
	MOVWF      uart_transmitir_datos_msg_L0+18
	MOVLW      10
	MOVWF      uart_transmitir_datos_msg_L0+19
	MOVLW      13
	MOVWF      uart_transmitir_datos_msg_L0+20
	CLRF       uart_transmitir_datos_msg_L0+21
;incubadora_iot.c,319 :: 		decimal=temperatura/10;
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
;incubadora_iot.c,320 :: 		unidad=temperatura-(decimal*10);
	MOVF       R0+0, 0
	SUBWF      _temperatura+0, 0
	MOVWF      R0+0
;incubadora_iot.c,321 :: 		msg[1]=decimal+48;
	MOVLW      48
	ADDWF      FLOC__uart_transmitir_datos+0, 0
	MOVWF      uart_transmitir_datos_msg_L0+1
;incubadora_iot.c,322 :: 		msg[2]=unidad+48;
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      uart_transmitir_datos_msg_L0+2
;incubadora_iot.c,324 :: 		decimal=stpointT/10;
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
;incubadora_iot.c,325 :: 		unidad=stpointT-(decimal*10);
	MOVF       R0+0, 0
	SUBWF      _stpointT+0, 0
	MOVWF      R0+0
;incubadora_iot.c,326 :: 		msg[4]=decimal+48;
	MOVLW      48
	ADDWF      FLOC__uart_transmitir_datos+0, 0
	MOVWF      uart_transmitir_datos_msg_L0+4
;incubadora_iot.c,327 :: 		msg[5]=unidad+48;
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      uart_transmitir_datos_msg_L0+5
;incubadora_iot.c,329 :: 		decimal=humedad/10;
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
;incubadora_iot.c,330 :: 		unidad=humedad-(decimal*10);
	MOVF       R0+0, 0
	SUBWF      _humedad+0, 0
	MOVWF      R0+0
;incubadora_iot.c,331 :: 		msg[7]=decimal+48;
	MOVLW      48
	ADDWF      FLOC__uart_transmitir_datos+0, 0
	MOVWF      uart_transmitir_datos_msg_L0+7
;incubadora_iot.c,332 :: 		msg[8]=unidad+48;
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      uart_transmitir_datos_msg_L0+8
;incubadora_iot.c,334 :: 		decimal=stpointH/10;
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
;incubadora_iot.c,335 :: 		unidad=stpointH-(decimal*10);
	MOVF       R0+0, 0
	SUBWF      _stpointH+0, 0
	MOVWF      R0+0
;incubadora_iot.c,336 :: 		msg[10]=decimal+48;
	MOVLW      48
	ADDWF      FLOC__uart_transmitir_datos+0, 0
	MOVWF      uart_transmitir_datos_msg_L0+10
;incubadora_iot.c,337 :: 		msg[11]=unidad+48;
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      uart_transmitir_datos_msg_L0+11
;incubadora_iot.c,339 :: 		msg[13]=PIN_VENTILADOR+48;
	MOVLW      0
	BTFSC      RD1_bit+0, BitPos(RD1_bit+0)
	MOVLW      1
	MOVWF      uart_transmitir_datos_msg_L0+13
	MOVLW      48
	ADDWF      uart_transmitir_datos_msg_L0+13, 1
;incubadora_iot.c,340 :: 		msg[14]=PIN_CALENTADOR+48;
	MOVLW      0
	BTFSC      RD2_bit+0, BitPos(RD2_bit+0)
	MOVLW      1
	MOVWF      uart_transmitir_datos_msg_L0+14
	MOVLW      48
	ADDWF      uart_transmitir_datos_msg_L0+14, 1
;incubadora_iot.c,341 :: 		msg[15]=PIN_HUMIFICADOR+48;
	MOVLW      0
	BTFSC      RD3_bit+0, BitPos(RD3_bit+0)
	MOVLW      1
	MOVWF      uart_transmitir_datos_msg_L0+15
	MOVLW      48
	ADDWF      uart_transmitir_datos_msg_L0+15, 1
;incubadora_iot.c,343 :: 		msg[17]=error+48;
	MOVLW      48
	ADDWF      _error+0, 0
	MOVWF      uart_transmitir_datos_msg_L0+17
;incubadora_iot.c,346 :: 		UART1_Write_Text(msg);
	MOVLW      uart_transmitir_datos_msg_L0+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;incubadora_iot.c,348 :: 		}//fin transmitir datos
L_end_uart_transmitir_datos:
	RETURN
; end of _uart_transmitir_datos

_uart_recibir_datos:

;incubadora_iot.c,350 :: 		void uart_recibir_datos(){
;incubadora_iot.c,352 :: 		unsigned char dato=0;
	CLRF       uart_recibir_datos_dato_L0+0
;incubadora_iot.c,354 :: 		if (UART1_Data_Ready() == 1) {
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_uart_recibir_datos103
;incubadora_iot.c,355 :: 		dato=UART1_Read();
	CALL       _UART1_Read+0
	MOVF       R0+0, 0
	MOVWF      uart_recibir_datos_dato_L0+0
;incubadora_iot.c,356 :: 		switch(dato){
	GOTO       L_uart_recibir_datos104
;incubadora_iot.c,357 :: 		case 'C':
L_uart_recibir_datos106:
;incubadora_iot.c,358 :: 		estadoWifi=1;
	MOVLW      1
	MOVWF      _estadoWifi+0
;incubadora_iot.c,359 :: 		break;
	GOTO       L_uart_recibir_datos105
;incubadora_iot.c,360 :: 		case 'D':
L_uart_recibir_datos107:
;incubadora_iot.c,361 :: 		estadoWifi=0;
	CLRF       _estadoWifi+0
;incubadora_iot.c,362 :: 		break;
	GOTO       L_uart_recibir_datos105
;incubadora_iot.c,363 :: 		case 'S':
L_uart_recibir_datos108:
;incubadora_iot.c,364 :: 		estadoSubscripcion=1;
	MOVLW      1
	MOVWF      _estadoSubscripcion+0
;incubadora_iot.c,365 :: 		break;
	GOTO       L_uart_recibir_datos105
;incubadora_iot.c,366 :: 		case 'U':
L_uart_recibir_datos109:
;incubadora_iot.c,367 :: 		estadoSubscripcion=0;
	CLRF       _estadoSubscripcion+0
;incubadora_iot.c,368 :: 		break;
	GOTO       L_uart_recibir_datos105
;incubadora_iot.c,370 :: 		default: break;
L_uart_recibir_datos110:
	GOTO       L_uart_recibir_datos105
;incubadora_iot.c,371 :: 		}
L_uart_recibir_datos104:
	MOVF       uart_recibir_datos_dato_L0+0, 0
	XORLW      67
	BTFSC      STATUS+0, 2
	GOTO       L_uart_recibir_datos106
	MOVF       uart_recibir_datos_dato_L0+0, 0
	XORLW      68
	BTFSC      STATUS+0, 2
	GOTO       L_uart_recibir_datos107
	MOVF       uart_recibir_datos_dato_L0+0, 0
	XORLW      83
	BTFSC      STATUS+0, 2
	GOTO       L_uart_recibir_datos108
	MOVF       uart_recibir_datos_dato_L0+0, 0
	XORLW      85
	BTFSC      STATUS+0, 2
	GOTO       L_uart_recibir_datos109
	GOTO       L_uart_recibir_datos110
L_uart_recibir_datos105:
;incubadora_iot.c,373 :: 		}
L_uart_recibir_datos103:
;incubadora_iot.c,375 :: 		}//fin uart recibir datos
L_end_uart_recibir_datos:
	RETURN
; end of _uart_recibir_datos

_main:

;incubadora_iot.c,377 :: 		void main() {
;incubadora_iot.c,378 :: 		ANSEL=0X00;
	CLRF       ANSEL+0
;incubadora_iot.c,379 :: 		ANSELH=0X00;
	CLRF       ANSELH+0
;incubadora_iot.c,380 :: 		TRISD=0XE0;
	MOVLW      224
	MOVWF      TRISD+0
;incubadora_iot.c,381 :: 		TRISA=0X00;
	CLRF       TRISA+0
;incubadora_iot.c,382 :: 		PORTA=0X00;
	CLRF       PORTA+0
;incubadora_iot.c,383 :: 		PORTD=0x01;
	MOVLW      1
	MOVWF      PORTD+0
;incubadora_iot.c,384 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;incubadora_iot.c,385 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;incubadora_iot.c,386 :: 		stpointT=EEPROM_Read(0x02);
	MOVLW      2
	MOVWF      FARG_EEPROM_Read_Address+0
	CALL       _EEPROM_Read+0
	MOVF       R0+0, 0
	MOVWF      _stpointT+0
;incubadora_iot.c,387 :: 		stpointH=EEPROM_Read(0x03);
	MOVLW      3
	MOVWF      FARG_EEPROM_Read_Address+0
	CALL       _EEPROM_Read+0
	MOVF       R0+0, 0
	MOVWF      _stpointH+0
;incubadora_iot.c,388 :: 		UART1_Init(9600);
	MOVLW      25
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;incubadora_iot.c,389 :: 		buzzer(600,1);
	MOVLW      88
	MOVWF      FARG_buzzer_millis+0
	MOVLW      2
	MOVWF      FARG_buzzer_millis+1
	MOVLW      1
	MOVWF      FARG_buzzer_repeticiones+0
	MOVLW      0
	MOVWF      FARG_buzzer_repeticiones+1
	CALL       _buzzer+0
;incubadora_iot.c,392 :: 		while(1){
L_main111:
;incubadora_iot.c,396 :: 		if(read_dth11()==1){
	CALL       _read_dth11+0
	MOVF       R0+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_main113
;incubadora_iot.c,397 :: 		lcd_Print('I');
	MOVLW      73
	MOVWF      FARG_lcd_Print_screen+0
	CALL       _lcd_Print+0
;incubadora_iot.c,398 :: 		error=0;
	CLRF       _error+0
;incubadora_iot.c,399 :: 		}else {
	GOTO       L_main114
L_main113:
;incubadora_iot.c,400 :: 		lcd_Print('E');
	MOVLW      69
	MOVWF      FARG_lcd_Print_screen+0
	CALL       _lcd_Print+0
;incubadora_iot.c,401 :: 		error=1;
	MOVLW      1
	MOVWF      _error+0
;incubadora_iot.c,402 :: 		buzzer(200,3);
	MOVLW      200
	MOVWF      FARG_buzzer_millis+0
	CLRF       FARG_buzzer_millis+1
	MOVLW      3
	MOVWF      FARG_buzzer_repeticiones+0
	MOVLW      0
	MOVWF      FARG_buzzer_repeticiones+1
	CALL       _buzzer+0
;incubadora_iot.c,403 :: 		delay_ms(400);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_main115:
	DECFSZ     R13+0, 1
	GOTO       L_main115
	DECFSZ     R12+0, 1
	GOTO       L_main115
	DECFSZ     R11+0, 1
	GOTO       L_main115
;incubadora_iot.c,404 :: 		}
L_main114:
;incubadora_iot.c,406 :: 		uart_transmitir_datos();
	CALL       _uart_transmitir_datos+0
;incubadora_iot.c,409 :: 		for(i=0;i<MILISEG_ACTUALIZACION_LECTURA;i++){
	CLRF       _i+0
	CLRF       _i+1
L_main116:
	MOVLW      3
	SUBWF      _i+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main142
	MOVLW      232
	SUBWF      _i+0, 0
L__main142:
	BTFSC      STATUS+0, 0
	GOTO       L_main117
;incubadora_iot.c,410 :: 		delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_main119:
	DECFSZ     R13+0, 1
	GOTO       L_main119
	DECFSZ     R12+0, 1
	GOTO       L_main119
;incubadora_iot.c,411 :: 		uart_recibir_datos();
	CALL       _uart_recibir_datos+0
;incubadora_iot.c,412 :: 		menu_configuracion();
	CALL       _menu_configuracion+0
;incubadora_iot.c,413 :: 		proceso_control();
	CALL       _proceso_control+0
;incubadora_iot.c,409 :: 		for(i=0;i<MILISEG_ACTUALIZACION_LECTURA;i++){
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;incubadora_iot.c,414 :: 		}
	GOTO       L_main116
L_main117:
;incubadora_iot.c,417 :: 		} //fin while
	GOTO       L_main111
;incubadora_iot.c,418 :: 		}//fin main
L_end_main:
	GOTO       $+0
; end of _main
