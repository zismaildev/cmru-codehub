// ===== Blynk IoT Template =====
#define BLYNK_TEMPLATE_ID "TMPL6Li0d2U2t"
#define BLYNK_TEMPLATE_NAME "LAB5"
#define BLYNK_AUTH_TOKEN "GbYPbpca3MKS4MRGq1RC9z0qJf3qTFPF"

#include <BlynkSimpleEsp8266.h>
#include <DHT.h>

// ===== WiFi =====
char ssid[] = "@CMRU-SCI";
char pass[] = "";  // ใส่รหัส WiFi ถ้ามี

// ===== DHT =====
#define DHTPIN D4
#define DHTTYPE DHT11
DHT dht(DHTPIN, DHTTYPE);

// ===== Sensors & Relay =====
#define RAIN_SENSOR_PIN D5
#define LDR_PIN A0
#define RELAY_PIN D6

// ===== Virtual Pins =====
#define VPIN_TEMP V0
#define VPIN_HUMIDITY V1
#define VPIN_HEATINDEX V2
#define VPIN_RAIN V3
#define VPIN_LDR V4
#define VPIN_RELAY V5

void setup() {
  Serial.begin(9600);
  dht.begin();

  pinMode(LDR_PIN, INPUT);
  pinMode(RELAY_PIN, OUTPUT);

  Blynk.begin(BLYNK_AUTH_TOKEN, ssid, pass);

  Serial.println("=== Weather Station Started with Blynk IoT ===");
  delay(2000);
}

void loop() {
  Blynk.run();

  // ===== อ่าน DHT =====
  float h = dht.readHumidity();
  float t = dht.readTemperature();
  if (isnan(h) || isnan(t)) {
    Serial.println("DHT11 Error!");
    return;
  }
  float heatIndex = dht.computeHeatIndex(t, h, false);

  // ===== อ่าน Rain Sensor =====
  int rainValue = digitalRead(RAIN_SENSOR_PIN);
  bool isRaining = (rainValue == LOW);  // ปรับ threshold ตามเซ็นเซอร์จริง

  // ===== อ่าน LDR =====
  int ldrState = analogRead(LDR_PIN);
  bool isNight = (ldrState > 800);  // LOW = มืด

  // ===== ควบคุมรีเลย์ =====
  if (isNight) digitalWrite(RELAY_PIN, HIGH);
  else digitalWrite(RELAY_PIN, LOW);

  // ===== ส่งข้อมูลไป Blynk IoT =====
  Blynk.virtualWrite(VPIN_TEMP, t);                              // Temperature °C
  Blynk.virtualWrite(VPIN_HUMIDITY, h);                          // Humidity %
  Blynk.virtualWrite(VPIN_HEATINDEX, heatIndex);                 // Humidity %
  Blynk.virtualWrite(VPIN_RAIN, isRaining ? "กำลังตก" : "ไม่ตก");  // Rain String
  Blynk.virtualWrite(VPIN_LDR, isNight ? "กลางคืน" : "กลางวัน");
  Blynk.virtualWrite(VPIN_RELAY, digitalRead(RELAY_PIN));        // Relay Integer 0/1


  // ===== แสดงผลทาง Serial =====
  Serial.println("================================");
  Serial.print("Temp: ");
  Serial.print(t);
  Serial.println(" C");
  Serial.print("Humidity: ");
  Serial.print(h);
  Serial.println(" %");
  Serial.print("HeatIndex: ");
  Serial.println(heatIndex);
  Serial.print("Rain Value: ");
  Serial.print(rainValue);
  Serial.println(isRaining ? " -> กำลังตก 🌧️" : " -> ไม่ตก ☀️");
  Serial.print("LDR State: ");
  Serial.print(ldrState);
  Serial.println(isNight ? " -> กลางคืน 🌙" : " -> กลางวัน ☀️");
  Serial.print("Relay State: ");
  Serial.println(digitalRead(RELAY_PIN) ? "ON" : "OFF");
  Serial.println("================================\n");

  delay(5000);  // อัปเดตทุก 5 วินาที
}
