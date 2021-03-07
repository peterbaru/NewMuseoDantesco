#define BUTTON1_PIN 2
#define BUTTON2_PIN 3
#define BUTTON3_PIN 4
#define BUTTON4_PIN 5
#define BUTTON5_PIN 6
#define BUTTON6_PIN 7
#define BUTTON7_PIN 8
#define BUTTON8_PIN 9
#define BUTTON9_PIN 10

void setup() {
  Serial.begin(9600);
  
  pinMode(BUTTON1_PIN, INPUT); // bottone 1
  pinMode(BUTTON2_PIN, INPUT); // bottone 2
  pinMode(BUTTON3_PIN, INPUT); // bottone 3
   pinMode(BUTTON4_PIN, INPUT); // bottone 4
  pinMode(BUTTON5_PIN, INPUT); // bottone 5
  pinMode(BUTTON6_PIN, INPUT); // bottone 6
   pinMode(BUTTON7_PIN, INPUT); // bottone 7
  pinMode(BUTTON8_PIN, INPUT); // bottone 8
  pinMode(BUTTON9_PIN, INPUT); // bottone 9

}

void loop() {

  int buttonState = digitalRead (BUTTON1_PIN);
  int buttonState2 = digitalRead (BUTTON2_PIN);
  int buttonState3 = digitalRead (BUTTON3_PIN);
  int buttonState4 = digitalRead (BUTTON4_PIN);
  int buttonState5 = digitalRead (BUTTON5_PIN);
  int buttonState6 = digitalRead (BUTTON6_PIN);
  int buttonState7 = digitalRead (BUTTON7_PIN);
  int buttonState8 = digitalRead (BUTTON8_PIN);
  int buttonState9 = digitalRead (BUTTON9_PIN);

if (buttonState == HIGH) {
    Serial.println("1;");
  } else if (buttonState2 == HIGH) {
    Serial.println("2;");
  } else if (buttonState3 == HIGH) {
    Serial.println("3;");
}else if (buttonState4 == HIGH) {
    Serial.println("4;");
}else if (buttonState5 == HIGH) {
    Serial.println("5;");
}else if (buttonState6 == HIGH) {
    Serial.println("6;");
}else if (buttonState7 == HIGH) {
    Serial.println("7;");
}else if (buttonState8 == HIGH) {
    Serial.println("8;");
}else if (buttonState9 == HIGH) {
    Serial.println("9;");
}

}
