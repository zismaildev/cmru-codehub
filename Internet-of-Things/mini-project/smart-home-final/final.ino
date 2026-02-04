#include <ESP8266WiFi.h>
#include <ESP8266HTTPClient.h>
#include <WiFiClient.h>

// ---------- Ultrasonic Pins ----------
#define TRIG1 D5
#define ECHO1 D6
#define TRIG2 D7
#define ECHO2 D8

// ---------- LED Pins ----------
#define LED1_GREEN D1
#define LED1_RED   D2
#define LED2_GREEN D3
#define LED2_RED   D4

// ---------- Config WiFi ----------
// ---------- Config WiFi ----------
// SECURITY WARNING: Never commit real passwords to Git!
// Use a separate header file (secrets.h) or environment vars in production.
const char* ssid = "YOUR_WIFI_SSID";      
const char* password = "YOUR_WIFI_PASSWORD";           

// ---------- Config Server ----------
/**
 * Backend Endpoint
 * @note Ensure the server IP is static or reachable from the IoT device network.
 */
String serverName = "http://10.80.217.27/Final/update.php"; 

void setup() {
  Serial.begin(115200);

  pinMode(TRIG1, OUTPUT);
  pinMode(ECHO1, INPUT);
  pinMode(TRIG2, OUTPUT);
  pinMode(ECHO2, INPUT);

  pinMode(LED1_GREEN, OUTPUT);
  pinMode(LED1_RED, OUTPUT);
  pinMode(LED2_GREEN, OUTPUT);
  pinMode(LED2_RED, OUTPUT);

  // เริ่มต้นไฟเขียวเปิด (ที่จอดว่าง)
  digitalWrite(LED1_GREEN, HIGH);
  digitalWrite(LED2_GREEN, HIGH);

  // เชื่อมต่อ WiFi
  WiFi.begin(ssid, password);
  Serial.print("Connecting to WiFi");
  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
  }
  Serial.println("\nWiFi connected!");
  Serial.print("IP Address: ");
  Serial.println(WiFi.localIP());
}

int readDistance(int trigPin, int echoPin) {
  digitalWrite(trigPin, LOW);
  delayMicroseconds(2);

  digitalWrite(trigPin, HIGH);
  delayMicroseconds(10);
  digitalWrite(trigPin, LOW);

  long duration = pulseIn(echoPin, HIGH, 20000); // timeout 20ms
  int distance = duration * 0.034 / 2; // แปลงเป็น cm
  return distance;
}

void loop() {
  int dist1 = readDistance(TRIG1, ECHO1);
  int dist2 = readDistance(TRIG2, ECHO2);

  int slot1 = (dist1 > 0 && dist1 < 20) ? 1 : 0; // 1 = มีรถ, 0 = ว่าง
  int slot2 = (dist2 > 0 && dist2 < 20) ? 1 : 0;

  Serial.print("ช่องจอด 1: ");
  Serial.print(dist1);
  Serial.print(" cm (");
  Serial.print(slot1 == 1 ? "มีรถ" : "ว่าง");
  Serial.print(") | ");

  Serial.print("ช่องจอด 2: ");
  Serial.print(dist2);
  Serial.print(" cm (");
  Serial.print(slot2 == 1 ? "มีรถ" : "ว่าง");
  Serial.println(")");

  // ---------- Update LED ----------
  // ช่องจอด 1
  digitalWrite(LED1_GREEN, slot1 == 0 ? HIGH : LOW);
  digitalWrite(LED1_RED,   slot1 == 1 ? HIGH : LOW);

  // ช่องจอด 2
  digitalWrite(LED2_GREEN, slot2 == 0 ? HIGH : LOW);
  digitalWrite(LED2_RED,   slot2 == 1 ? HIGH : LOW);

  // ---------- ส่งข้อมูลไป Server ----------
  if (WiFi.status() == WL_CONNECTED) {
    WiFiClient client;
    HTTPClient http;
    String url = serverName + "?slot1=" + slot1 + "&slot2=" + slot2;

    if (http.begin(client, url)) {
      int httpCode = http.GET();
      if (httpCode > 0) {
        String payload = http.getString();
        Serial.println("Server Response: " + payload);
      } else {
        Serial.printf("Error sending data, code: %d\n", httpCode);
      }
      http.end();
    } else {
      Serial.println("Unable to connect to server");
    }
  }

  delay(5000); // ส่งข้อมูลทุก 5 วิ
}
