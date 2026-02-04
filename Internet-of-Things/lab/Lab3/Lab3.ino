#include <DHT.h>

#define DHTPIN D4
#define DHTTYPE DHT11
DHT dht(DHTPIN, DHTTYPE);

#define RAIN_SENSOR_PIN A0  // อ่านแบบ analog
#define LDR_PIN D5          // LDR อ่านแบบ digital
#define RELAY_PIN D6

void setup() {
  Serial.begin(9600);
  dht.begin();

  pinMode(LDR_PIN, INPUT);
  pinMode(RELAY_PIN, OUTPUT);
  
  Serial.println("=== Weather Station Started ===");
  delay(2000);
}

void loop() {
  // ===== อ่านค่า DHT11 =====
  float h = dht.readHumidity();
  float t = dht.readTemperature();
  if (isnan(h) || isnan(t)) {
    Serial.println("DHT11 Error!");
    return;
  }

  float heatIndex = dht.computeHeatIndex(t, h, false);

  // ===== อ่านค่า Rain Sensor (Analog) =====
  int rainValue = analogRead(RAIN_SENSOR_PIN);
  bool isRaining = (rainValue < 800); // ปรับ threshold ให้เหมาะกับเซ็นเซอร์จริง

  // ===== อ่านค่า LDR (Digital) =====
  int ldrState = digitalRead(LDR_PIN);
  bool isNight = (ldrState == LOW); // ถ้า LDR LOW = มืด (กลางคืน)

  // ===== ควบคุมรีเลย์ตาม LDR =====
  if (isNight) {
    digitalWrite(RELAY_PIN, LOW);  // ปิดไฟ
  } else {
    digitalWrite(RELAY_PIN, HIGH);   // เปิดไฟ
  }

  // ===== แสดงผลทาง Serial Monitor =====
  Serial.println("================================");
  Serial.print("Temp: "); Serial.print(t); Serial.println(" C");
  Serial.print("Humidity: "); Serial.print(h); Serial.println(" %");
  Serial.print("Feels Like: "); Serial.print(heatIndex); Serial.println(" C");

  Serial.print("Rain Value: "); Serial.print(rainValue);
  Serial.print("  -> "); Serial.println(isRaining ? "กำลังตก 🌧️" : "ไม่ตก ☀️");

  Serial.print("LDR State: "); Serial.print(ldrState);
  Serial.print("  -> "); Serial.println(isNight ? "กลางคืน 🌙 เปิดไฟ" : "กลางวัน ☀️ ปิดไฟ");

  Serial.println("================================\n");

  delay(5000); // อัปเดตทุก 5 วินาที
}
