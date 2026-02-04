int Trig = D1;
int Echo = D2;
long duration, cm;

void setup() {
  Serial.begin(9600);
  pinMode(Trig, OUTPUT);
  pinMode(Echo, INPUT);
}

void loop() {
  // ส่งสัญญาณ Ultrasonic
  digitalWrite(Trig, LOW);
  delayMicroseconds(2);
  digitalWrite(Trig, HIGH);
  delayMicroseconds(5); // ปกติใช้ 10 us
  digitalWrite(Trig, LOW);

  // วัดเวลาที่ Echo HIGH
  duration = pulseIn(Echo, HIGH);

  // แปลงเป็นระยะ (cm)
  cm = duration / 29 / 2;

  // แสดงผล
  Serial.print("Distance (cm) = ");
  Serial.println(cm);

  delay(200); // หน่วงเล็กน้อย
}
