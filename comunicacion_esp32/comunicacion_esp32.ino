//********************************************************INCLUDES
#include <Arduino.h>
#include <WiFi.h>
#include <PubSubClient.h>
//********************************************************DEFINICIONES
#define PIN_LED 2
#define RXD2 16
#define TXD2 17
#define DEBUG_SERIAL 1
#define BUFFER_TAMANO 22
#define TIEMPO_ACUALIZACION 1000
#define TIEMPO_REINTENTAR_CONEXION_SERVIDOR 5000

//********************************************************VARIABLES LOCALES

//----------MQTT----------
const char *mqtt_server = "20.124.24.39";
const int mqtt_port = 1883;
const char *mqtt_user = "incu";
const char *mqtt_pass = "incubadora2023";
const char *root_topic_subscribe = "incubadora-iot";
const char *root_topic_publish = "incubadora-iot";
//----------WIFI----------
const char* ssid = "GONZALEZ";
const char* password = "1019030208GP";
//------------------------
char uart_buffer[BUFFER_TAMANO];
unsigned char buffer_pos=0;
unsigned int i=0;
WiFiClient espClient;
PubSubClient client(espClient);
char msg[40];
long count=0;
//********************************************************FUNCIONES

//--------------------WIFI------------------------
void setup_wifi(){      
	delay(10);
	// Nos conectamos a nuestra red Wifi
  if(DEBUG_SERIAL){Serial.print(" CONECTANDO A LA RED WIFI: ");Serial.print(ssid);}
	WiFi.begin(ssid, password);

	while (WiFi.status() != WL_CONNECTED) { // parpadea el led hasta que la conexion a la red sea exitosa
    digitalWrite(PIN_LED, HIGH);
    if(DEBUG_SERIAL){Serial.print(".");}
    Serial2.print("C");
		delay(500);
		digitalWrite(PIN_LED, LOW);
    Serial2.print("D");
    delay(500);
    
  }
	if(DEBUG_SERIAL){Serial.print("\n\rWIFI CONECTADO -- IP:");Serial.println(WiFi.localIP());}
  Serial2.print("C");
}// fin setup wifi

//--------------------RECONNECT------------------------

 void reconnect() {    //CONECTAR

    while (!client.connected()) { // si el cliente no esta conectado intentamos conectarlo

      digitalWrite(PIN_LED, LOW);
      // Creamos un cliente ID
      String clientId = "ESP32_INCU_";
      clientId += String(random(0xffff), HEX);
      // se realiza la conexion 
      if (client.connect(clientId.c_str(),mqtt_user,mqtt_pass)) { // conexion exitosa
      	if(DEBUG_SERIAL){Serial.println("CONEXION AL SERVIDOR EXITOSA");}
        // se realiza la suscribimos        
        if(client.subscribe(root_topic_subscribe)){ 
          if(DEBUG_SERIAL){Serial.println("SUBSCRIPCION EXITOSA");}
          Serial2.print("S");
          digitalWrite(PIN_LED, HIGH);
          
        }else{   //fallo la subscricpion
          if(DEBUG_SERIAL){Serial.println("SUBSCRIPCION FALLIDA");}        
          digitalWrite(PIN_LED, LOW);
          Serial2.print("U");
        }
      } else { //fallo la conexion -intentamos dentro de 5seg-
        if(DEBUG_SERIAL){Serial.println("CONEXION AL SERVIDOR FALLIDA [REINTENTO EN 5 SEG]");}
        digitalWrite(PIN_LED, LOW);
        Serial2.print("U");
        //if(DEBUG_SERIAL){Serial.print(client.state());}
        delay(TIEMPO_REINTENTAR_CONEXION_SERVIDOR);
      } 
    }
 }// fin reconnect

//--------------------CALLBACK------------------------
  void callback(char* topic, byte* payload, unsigned int length){ //CALLBACK
    String incoming = "";
    Serial.print("Mensaje recibido desde -> ");
    Serial.print(topic);
    Serial.println("");
    for (int i = 0; i < length; i++) {
      incoming += (char)payload[i];
    }
    incoming.trim();
    Serial.println("Mensaje -> " + incoming);

  }// fin call back


  
void callback(char* topic, byte* payload, unsigned int length);
void reconnect();
void setup_wifi();


//********************************************************SETUP
void setup() {
  
  Serial.begin(115200); // El TXD Y RXD del modulo son los de la programacion (debug)
  Serial2.begin(9600, SERIAL_8N1, RXD2, TXD2);// serial2 pines 16 y 17
  pinMode(PIN_LED,OUTPUT);
  digitalWrite(PIN_LED, HIGH);
  setup_wifi();
  client.setServer(mqtt_server, mqtt_port);
  //client.setCallback(callback); 
  
} //fin void setup


//********************************************************BUCLE
void loop() {

    if (!client.connected()) {
	    reconnect();
    }
  
   
 
  client.loop();
  delay(TIEMPO_ACUALIZACION);
 
}// fin voif loop
//******************************************************** FIN