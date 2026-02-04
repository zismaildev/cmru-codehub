const int RED_PIN = D1;
const int YELLOW_PIN = D2;
const int GREEN_PIN = D3; // เปลี่ยนชื่อจาก BLUE_PIN ให้ตรงกับการใช้งานจริง

const int BLINK_DELAY = 300;

void setup() {
  pinMode(RED_PIN, OUTPUT);
  pinMode(YELLOW_PIN, OUTPUT);
  pinMode(GREEN_PIN, OUTPUT);

  Serial.begin(9600); // เพิ่มบรรทัดนี้ เพื่อให้ใช้ Serial.print ได้
}

void loop() {
  for (int i = 0; i < 3; i++) {
    digitalWrite(RED_PIN, HIGH);
    delay(BLINK_DELAY);
    digitalWrite(RED_PIN, LOW);
    delay(BLINK_DELAY);
    Serial.println("ไฟสีแดง");
  }

  for (int i = 0; i < 3; i++) {
    digitalWrite(YELLOW_PIN, HIGH);
    delay(BLINK_DELAY);
    digitalWrite(YELLOW_PIN, LOW);
    delay(BLINK_DELAY);
    Serial.println("ไฟสีเหลือง");
  }

  for (int i = 0; i < 3; i++) {
    digitalWrite(GREEN_PIN, HIGH);
    delay(BLINK_DELAY);
    digitalWrite(GREEN_PIN, LOW);
    delay(BLINK_DELAY);
    Serial.println("ไฟสีเขียว");
  }
}
