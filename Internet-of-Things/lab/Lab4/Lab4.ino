#include <ESP8266WiFi.h>
#include <ESP8266HTTPClient.h>
#include <WiFiClient.h>
#include "DHT.h"

// ---------------- WiFi ----------------
const char* ssid = "@CMRU-SCI";
const char* password = "";

// ---------------- Server ----------------
const char* ServerURL = "http://10.80.223.57/Learning_iot/insert_sensor.php";

WiFiClient client;

// ---------------- DHT11 ----------------
#define DHTPIN D4
#define DHTTYPE DHT11
DHT dht(DHTPIN, DHTTYPE);

// ---------------- LDR ----------------
#define LDR_PIN A0

// ---------------- RAIN ----------------
#define RAIN_PIN D5

// ---------------- RELAY ----------------
#define RELAY_PIN D6

void setup() {
  Serial.begin(9600);

  pinMode(RAIN_PIN, INPUT);
  pinMode(RELAY_PIN, OUTPUT);

  WiFi.begin(ssid, password);
  Serial.print("Connecting to WiFi");
  while (WiFi.status() != WL_CONNECTED) {
    delay(250);
    Serial.print(".");
  }
  Serial.println("\nWiFi Connected");
  Serial.print("IP : ");
  Serial.println(WiFi.localIP());

  dht.begin();
}

void loop() {
  if (WiFi.status() != WL_CONNECTED) {
    Serial.println("WiFi Disconnected!");
    delay(5000);
    return;
  }

  // ===== DHT11 =====
  float h = dht.readHumidity();
  float t = dht.readTemperature();
  if (isnan(h) || isnan(t)) {
    Serial.println("DHT11 Error !");
    return;
  }
  float heatIndex = dht.computeHeatIndex(t, h, false);

  // ===== LDR ===== (analog)
  int ldrValue = analogRead(LDR_PIN);
  bool isNight = (ldrValue > 800);  // ปรับ threshold ตามสภาพแสงจริง

  // ===== RAIN SENSOR ===== (digital)
  int rainState = digitalRead(RAIN_PIN);
  bool isRaining = (rainState == LOW);  // active low

  // ===== RELAY =====
  digitalWrite(RELAY_PIN, isNight ? LOW : HIGH);

  // ===== Server: DHT =====
  // HTTPClient http;
  // String url1 = String(ServerURL) + "?temp=" + String(t) + "&hum=" + String(h) + "&heat=" + String(heatIndex);
  // http.begin(client, url1);
  // int code = http.GET();
  // Serial.print("DHT11 HTTP: ");
  // Serial.println(code);
  // http.end();

  // // ===== Server: LDR =====
  // String url2 = String(ServerURL) + "?ldr=" + String(ldrValue) + "&heat=" + String(heatIndex);
  // http.begin(client, url2);
  // code = http.GET();
  // Serial.print("LDR HTTP: ");
  // Serial.println(code);
  // http.end();

  // // ===== Server: Rain =====
  // String url3 = String(ServerURL) + "?rain=" + String(rainState) + "&status=" + String(isRaining ? "raining" : "not_raining") + "&heat=" + String(heatIndex);
  // http.begin(client, url3);
  // code = http.GET();
  // Serial.print("RAIN HTTP: ");
  // Serial.println(code);
  // http.end();

  HTTPClient http;
  String url = String(ServerURL)
               + "?temp=" + String(t)
               + "&hum=" + String(h)
               + "&heat=" + String(heatIndex)
               + "&ldr=" + String(ldrValue)
               + "&rain_state=" + String(isRaining ? 1 : 0)
               + "&rain_status=" + String(isRaining ? "raining" : "not_raining");

  http.begin(client, url);
  int code = http.GET();
  Serial.print("HTTP Response: ");
  Serial.println(code);
  http.end();


  // ===== Serial Monitor =====
  Serial.println("================================");
  Serial.print("Temperature : ");
  Serial.print(t);
  Serial.println(" C");
  Serial.print("Humidity    : ");
  Serial.print(h);
  Serial.println(" %");
  Serial.print("Heat Index  : ");
  Serial.print(heatIndex);
  Serial.println(" C");
  Serial.print("Rain State  : ");
  Serial.print(rainState);
  Serial.print("  -> ");
  Serial.println(isRaining ? "Raining" : "Not Raining");
  Serial.print("LDR Value   : ");
  Serial.print(ldrValue);
  Serial.print("  -> ");
  Serial.println(isNight ? "Night, Relay ON" : "Day, Relay OFF");
  Serial.println("================================");

  delay(10000);  // เก็บทุก 10 วินาที
}
