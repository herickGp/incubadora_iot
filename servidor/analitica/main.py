import pika
import os
import math
from influxdb_client import InfluxDBClient, Point
from influxdb_client.client.write_api import SYNCHRONOUS

class Analytics():

 #--------------------VARIABLES-------------------
    max_value = -math.inf
    min_value = math.inf
    dias_value = 0
    prom_value = 0
    sumatoria_value = 0
    
    influx_bucket = 'rabbit'
    influx_token = 'token-secreto'
    influx_url = 'http://influx:8086'
    influx_org = 'org'

    #--------------------DEFINICIONES------------------- 
    
    def write_db(self, tag, key, value):
        client= InfluxDBClient(url=self.influx_url, token=self.influx_token, org=self.influx_org)
        write_api = client.write_api(write_options=SYNCHRONOUS)
        point = Point('Analytics').tag("Descriptive", tag).field(key, value)
        write_api.write(bucket=self.influx_bucket, record=point)

    #### codigo para configurar la lectura 

    # valor maximo 
    def add_max_value(self, _medida):
        if _medida > self.max_value:
            self.max_value = _medida     
        print("Max :{}".format(self.max_value), flush=True)  
        self.write_db( "pasos", "pasos_maximos", self.max_value)
        
    # valor minimo        

    def add_min_value(self, _medida):
        if _medida < self.min_value:
            self.min_value = _medida
        print("Min :{}".format(self.min_value), flush=True)
        self.write_db( "pasos", "pasos_minimos", self.min_value)

    # promedio
    def add_prom_value(self, _medida):
        self.dias_value+=1
        self.sumatoria_value+=_medida
        self.prom_value=self.sumatoria_value/self.dias_value
        print("Prom : {}".format(self.prom_value), flush=True)
        self.write_db( "pasos", "promedio", self.prom_value)
        
  
        
    def take_measurement(self, _mensaje):
        mensaje = _mensaje.split("=")
        medida = float(mensaje[-1])
        print("medida {}".format(medida))
        self.add_max_value(medida)
        self.add_min_value(medida)
        self.add_prom_value(medida)
  

#--------------------MAIN-------------------        

if __name__ == '__main__':
    #variable global 
    analitica = Analytics()

    def callback(ch, method, properties, body):
        global analitica
        mensaje = body.decode("utf-8")
        #print("mensaje del servidor {}".format(mensaje), flush=True)
        analitica.take_measurement(mensaje)

   
    url = os.environ.get('AMQP_URL','amqp://incu:incubadora2023@rabbit:5672/%2f')
    params = pika.URLParameters(url)
    connection = pika.BlockingConnection(params)
    channel = connection.channel()

    channel.queue_declare(queue='iot_incubadora')
    channel.queue_bind(exchange = 'amq.topic',queue='iot_incubadora',routing_key="#")
    channel.basic_consume(queue='iot_incubadora', on_message_callback=callback, auto_ack=True)
    channel.start_consuming()