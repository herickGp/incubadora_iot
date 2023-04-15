
##-------------------------------------------------------------
import pika
import os
import time
import math
from influxdb_client import InfluxDBClient, Point
from influxdb_client.client.write_api import SYNCHRONOUS


class Analytics():
#### variables de datos ######################
    step_sum = 0
    step_count =0
    max_value = -math.inf
    min_value = math.inf



################ variables de control #################
    bucket = 'rabbit'
    token = 'token-secret'
    url = 'http://20.124.24.39:8086'
    org = 'org'
#### escritura en influx  ######################
    def write_db(self, tag, key, value):
        client= InfluxDBClient(url=self.url, token=self.token, org=self.org)
        write_api = client.write_api(write_options=SYNCHRONOUS)
        point = Point('analitica').tag("Descriptive", tag).field(key, value)
        write_api.write(bucket=self.bucket, record=point)

#### promedio ######################
    def get_prom(self, _medida):
        self.step_count += 1
        self.step_sum += _medida
        promedio = self.step_sum/self.step_count
        self.write_db('analitica', "promedio", _medida)   
    

        # valor maximo 
    def add_max_value(self, _medida):
        if _medida > self.max_value:
            self.max_value = _medida     
        print("Max :{}".format(self.max_value), flush=True)  
        self.write_db( "analitica", "temperatura_maxima", self.max_value)
        
    # valor minimo        

    def add_min_value(self, _medida):
        if _medida < self.min_value:
            self.min_value = _medida
        print("Min :{}".format(self.min_value), flush=True)
        self.write_db( "analitica", "temperatura_minima", self.min_value)
    
    def take_measurement(self,_dato ):
         if '*' in _dato:
            dato = _dato.split("*")
            datos = float(dato[-1])
            print(" dato enviado", flush=True)
            print(datos)
            self.get_prom(datos)
            self.add_max_value(datos)
            self.add_min_value(datos)  
         
            

           



if __name__ == '__main__':

    analytics = Analytics()
    def callback(ch, method, properties, body):
        global analytics
        message = body.decode("utf-8")
        analytics.take_measurement(message)
        

    url = os.environ.get('AMQP_URL','amqp://incu:incubadora2023@20.124.24.39:5672/%2f')
    params = pika.URLParameters(url)
    connection = pika.BlockingConnection(params)
    channel = connection.channel()
    #channel.queue_declare(queue='incubadora-iot')
    channel.queue_bind(exchange='amq.topic', queue='incubadora-iot', routing_key='#')    
    channel.basic_consume(queue='incubadora-iot', on_message_callback=callback, auto_ack=True)
    channel.start_consuming()
