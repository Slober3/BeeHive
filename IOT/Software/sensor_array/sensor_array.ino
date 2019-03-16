/***************************************************************************
  This is a library for the BME680 gas, humidity, temperature & pressure sensor

  Designed specifically to work with the Adafruit BME680 Breakout
  ----> http://www.adafruit.com/products/3660

  These sensors use I2C or SPI to communicate, 2 or 4 pins are required
  to interface.

  Adafruit invests time and resources providing this open source code,
  please support Adafruit and open-source hardware by purchasing products
  from Adafruit!

  Written by Limor Fried & Kevin Townsend for Adafruit Industries.
  BSD license, all text above must be included in any redistribution
 ***************************************************************************/

#include <WiFi.h>
#include <PubSubClient.h>
#include <Wire.h>
#include <Q2HX711.h>
#include <SPI.h>
#include <Adafruit_Sensor.h>
#include "Adafruit_BME680.h"

#define BME_SCK 22
#define BME_MISO 12
#define BME_MOSI 11
#define BME_CS 23
const byte hx711_data_pin = 34;
const byte hx711_clock_pin = 5;
Q2HX711 hx711(hx711_data_pin, hx711_clock_pin);

#define SEALEVELPRESSURE_HPA (1013.25)

Adafruit_BME680 bme; // I2C
//Adafruit_BME680 bme(BME_CS); // hardware SPI
//Adafruit_BME680 bme(BME_CS, BME_MOSI, BME_MISO,  BME_SCK);

#define uS_TO_S_FACTOR 1000000  /* Conversion factor for micro seconds to seconds */
#define TIME_TO_SLEEP  1200        /* Time ESP32 will go to sleep (in seconds) */
RTC_DATA_ATTR int bootCount = 0;

// Replace the next variables with your SSID/Password combination
const char* ssid = "derbaix";
const char* password = "epxw5djavcxNQjMucYPmuvXZJExQ4n";

// Add your MQTT Broker IP address, example:
const char* mqtt_server = "141.134.105.242";

 char tempString[8];

WiFiClient espClient;
PubSubClient client(espClient);
long lastMsg = 0;
char msg[50];
int value = 0;

void setup() {
  Serial.begin(9600);
  while (!Serial);
  Serial.println(F("BzZzZz array"));

  if (!bme.begin(0x76)) {
    Serial.println("Could not find a valid BME680 sensor, check wiring!");
    while (1);
  }

  // Set up oversampling and filter initialization
  bme.setTemperatureOversampling(BME680_OS_8X);
  bme.setHumidityOversampling(BME680_OS_2X);
  bme.setPressureOversampling(BME680_OS_4X);
  bme.setIIRFilterSize(BME680_FILTER_SIZE_3);
  bme.setGasHeater(320, 150); // 320*C for 150 ms

  setup_wifi();
  client.setServer(mqtt_server, 1883);
}

void setup_wifi() {
  delay(100);
  // We start by connecting to a WiFi network
  Serial.println();
  Serial.print("Connecting to ");
  Serial.println(ssid);

  WiFi.begin(ssid, password);

  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
  }

  Serial.println("");
  Serial.println("WiFi connected");
  Serial.println("IP address: ");
  Serial.println(WiFi.localIP());
}


void reconnect() {
  // Loop until we're reconnected
  while (!client.connected()) {
    Serial.print("Attempting MQTT connection...");
    // Attempt to connect
    if (client.connect("ESP32Client")) {
      Serial.println("connected");
      // Subscribe
      client.subscribe("esp32/output");
    } else {
      Serial.print("failed, rc=");
      Serial.print(client.state());
      Serial.println(" try again in 5 seconds");
      // Wait 5 seconds before retrying
      delay(5000);
    }
  }
}

void loop() {

  if (!client.connected()) {
    reconnect();
  }
  client.loop();

  
  if (! bme.performReading()) {
    Serial.println("Failed to perform reading :(");
    return;
  }
  
  dtostrf(bme.temperature, 1, 2, tempString);
  client.publish("bhive/temp", tempString);

  dtostrf(bme.pressure, 1, 2, tempString);
  client.publish("bhive/airp", tempString);

  
  dtostrf(bme.humidity, 1, 2, tempString);
  client.publish("bhive/hum", tempString);

  dtostrf(bme.readGas(), 1, 2, tempString);
  client.publish("bhive/airq", tempString);

 // dtostrf(hx711.read(), 1, 2, tempString);
 // Serial.println(hx711.read()/100.0);
 // client.publish("bhive/weight", tempString);


  Serial.println();
  delay(500);
 esp_sleep_enable_timer_wakeup(TIME_TO_SLEEP * uS_TO_S_FACTOR);
 esp_deep_sleep_start();

}
