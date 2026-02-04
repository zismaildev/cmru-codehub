int RED_PIN = D1;
int YELLOW_PIN = D2;
int GREEN_PIN = D3;

int BUTTON_PIN = D0;
int BUTTON_STATE = 0;
int LAST_BUTTON_STATE = 1;
int state = 0;

unsigned long previousMillis = 0;
const long interval = 300;
bool ledState = false;

void setup() {
  pinMode(RED_PIN, OUTPUT);
  pinMode(YELLOW_PIN, OUTPUT);
  pinMode(GREEN_PIN, OUTPUT);
  
  pinMode(BUTTON_PIN, INPUT_PULLUP);
  Serial.begin(9600);
}

void loop() {
  BUTTON_STATE = digitalRead(BUTTON_PIN);
  if (BUTTON_STATE == 0 && LAST_BUTTON_STATE == 1) {
    state = (state + 1) % 3;
    Serial.print("เปลี่ยนเป็นไฟสี: ");
    if (state == 0) Serial.println("แดง");
    if (state == 1) Serial.println("เหลือง");
    if (state == 2) Serial.println("เขียว");
    delay(200);
  }
  LAST_BUTTON_STATE = BUTTON_STATE;

  unsigned long currentMillis = millis();
  if (currentMillis - previousMillis >= interval) {
    previousMillis = currentMillis;
    ledState = !ledState;

    digitalWrite(RED_PIN, (state == 0 && ledState) ? HIGH : LOW);
    digitalWrite(YELLOW_PIN, (state == 1 && ledState) ? HIGH : LOW);
    digitalWrite(GREEN_PIN, (state == 2 && ledState) ? HIGH : LOW);

    switch (state) {
      case 0: Serial.println("ไฟสีแดง"); break;
      case 1: Serial.println("ไฟสีเหลือง"); break;
      case 2: Serial.println("ไฟสีเขียว"); break;
    }
  }
}
