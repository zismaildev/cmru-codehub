#include <DHT.h>

#define DHTPIN 2        // ขา Data ต่อที่ขา 2
#define DHTTYPE DHT11   // หรือเปลี่ยนเป็น DHT22 ถ้าใช้รุ่นนั้น

DHT dht(DHTPIN, DHTTYPE);

void setup() {
  Serial.begin(9600);
  Serial.println();
  Serial.println("เริ่มอ่านค่าจาก DHT Sensor...");
  dht.begin();
}

void loop() {
  delay(2000); // เว้นระยะอ่านข้อมูล

  float humidity = dht.readHumidity();
  float temperatureC = dht.readTemperature();
  float temperatureF = dht.readTemperature(true); // true = Fahrenheit

  // ตรวจว่าค่าอ่านได้จริงหรือไม่
  if (isnan(humidity) || isnan(temperatureC)) {
    Serial.println("❌ อ่านค่าจาก DHT ไม่สำเร็จ!");
    return;
  }

  Serial.println("==== ข้อมูลเซนเซอร์ ====");
  Serial.print("💧 ความชื้น: ");
  Serial.print(humidity, 1);
  Serial.println(" %");

  Serial.print("🌡 อุณหภูมิ (C): ");
  Serial.print(temperatureC, 1);
  Serial.println(" °C");

  Serial.print("🌡 อุณหภูมิ (F): ");
  Serial.print(temperatureF, 1);
  Serial.println(" °F");
  Serial.println("========================");
}
