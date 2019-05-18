/***************************************************************************
Made by : Quinten Tom en Stijn
 ***************************************************************************/

#include <WiFi.h>                   //Lib voor wifi
#include "HX711.h"                  //Lib voor gewichtssensor
#include <PubSubClient.h>           //Lib voor MQTT
#include <Wire.h>                   //Lib voor I2C
#include <SPI.h>                    //Lib voor spi
#include <Adafruit_Sensor.h>        //Lib voor BME680
#include "Adafruit_BME680.h"        //Lib voor BME680

/*
 * Instellingen BME680 (pins) I2C
 */
#define BME_SCK 22
#define BME_MISO 12
#define BME_MOSI 11
#define BME_CS 23
#define SEALEVELPRESSURE_HPA (1013.25)
Adafruit_BME680 bme; // I2C

/*
 * Instellingen HX711 DOUTp = data CLKp = clock
 */
#define DOUTp  4
#define CLKp  5

/*
 * Kalibraties HX711
 */
float calibration_factor = -860;
float zero_factor;

/*
 * Deep sleep 
 */
#define uS_TO_S_FACTOR 1000000  /* Conversion factor for micro seconds to seconds */
#define TIME_TO_SLEEP  1200        /* Time ESP32 will go to sleep (in seconds) */
RTC_DATA_ATTR int bootCount = 0;

// Replace the next variables with your SSID/Password combination
const char* ssid = "derbaix";
const char* password = "epxw5djavcxNQjMucYPmuvXZJExQ4n";

// Add your MQTT Broker IP address, example:
const char* mqtt_server = "141.134.105.242";

//Tijdelijke string voor opslaan data MQTT
char tempString[8];

//HX711 initiatie
HX711 scale(DOUTp, CLKp);

//Initiatie WiFi+MQTT
WiFiClient espClient;
PubSubClient client(espClient);
long lastMsg = 0;
char msg[50];
int value = 0;
float tempvalweight = 0;



void setup() {
  /*
   * Initiatie serieel protocol
   */
  Serial.begin(9600);
  while (!Serial);
  Serial.println(F("BzZzZz array"));

/*
 * Initiatie BME680
 */
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

/*
 * WiFi+MQTT
 */
  setup_wifi();
  client.setServer(mqtt_server, 1883);

  // setup weegschaal
 scale.set_scale(); 
 
//  for (int i = 0; i <= 3; i++) {
//    scale.tare(); //Reset the scale to 0
//    delay(300);  
// }

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
  scale.set_scale(calibration_factor); //Adjust to this calibration factor

  
  if (! bme.performReading()) {
    Serial.println("Failed to perform reading :(");
    return;
  }

  /*
   * Publikatie MQTT data
   */
  dtostrf(bme.temperature, 1, 2, tempString);
  client.publish("bhive/1/temp", tempString);

  dtostrf(bme.pressure, 1, 2, tempString);
  client.publish("bhive/1/airp", tempString);

  
  dtostrf(bme.humidity, 1, 2, tempString);
  client.publish("bhive/1/hum", tempString);

  dtostrf(bme.readGas(), 1, 2, tempString);
  client.publish("bhive/1/airq", tempString);


  /*
  Serial.print(scale.get_units(), 3);
  tempvalweight = 0; 
  int vw;
    for (int i = 0; i <= 20; i++) {
      if (scale.get_units() < 200){
         tempvalweight = tempvalweight +scale.get_units();
        vw=vw+1;
        }
      
      delay(5);
    }
  
  tempvalweight = tempvalweight / vw;
  vw=0;
  */

  delay(1200);

tempvalweight = scale.get_units(16);
 if (tempvalweight > 200 || tempvalweight < -2){
     tempvalweight = scale.get_units(16);
     }
  

dtostrf(tempvalweight, 1, 2, tempString);
client.publish("bhive/1/weight", tempString);


  Serial.println();
  delay(100);

  /*
   * Start deep sleep
   */
 esp_sleep_enable_timer_wakeup(TIME_TO_SLEEP * uS_TO_S_FACTOR);
 esp_deep_sleep_start();

}
