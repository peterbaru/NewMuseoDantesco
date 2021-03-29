// -
// Installazione "Pagine dantesche" della nuova area per il Museo Dantesco dal nome Sui passi di Dante  by peterbaru [Museo Dantesco, Dante Alighieri,  Patrimonio culturale, Ravenna, Interaction Design]
// 2021 © Pietro Baruzzi, Università degli Studi della Repubblica di San Marino
// Educational purposes, MIT License, 2021, San Marino

#include <MFRC522.h>

#define LED_VERDE 7
#define LED_BLU 8

#define BUTTON1_PIN 2
#define BUTTON2_PIN 3
#define BUTTON3_PIN 4
#define BUTTON4_PIN 5
#define BUTTON5_PIN 6

MFRC522 rfid(10, 9);

int val_luce = 0;
int lastButtonState = LOW;
int lastButtonState2 = LOW;
int lastButtonState3 = LOW;
int lastButtonState4 = LOW;
int lastButtonState5 = LOW;

String carta = " ";
String cont = " ";

void setup() {
  Serial.begin(9600);
  SPI.begin();
  rfid.PCD_Init();

  pinMode(LED_VERDE, OUTPUT); // led verde
  pinMode(LED_BLU, OUTPUT); // led blu

  pinMode(BUTTON1_PIN, INPUT); // bottone 1
  pinMode(BUTTON2_PIN, INPUT); // bottone 2

  pinMode(A0, INPUT); // fotoresistenza

  Serial.println("1;");
}


void loop() {

  val_luce = analogRead(0);

  if (rfid.PICC_IsNewCardPresent() && rfid.PICC_ReadCardSerial() && val_luce < 200) {
    String uid = getUID();
    Serial.println("RFID ID: " + uid);

    if (uid == "d515fe30") {
      digitalWrite (LED_VERDE, HIGH);
      carta = "A";
      Serial.println("2;");
    }

    if (uid == "5376d842") {
      digitalWrite (LED_VERDE, HIGH);
      carta = "B";
        Serial.println("3;");
    }

  } else if (val_luce >= 200) {
    digitalWrite (LED_VERDE, LOW);
    Serial.println("1;");
    carta = "nulla";
    
  }


  int buttonState = digitalRead (BUTTON1_PIN);
  int buttonState2 = digitalRead (BUTTON2_PIN);
  int buttonState3 = digitalRead (BUTTON3_PIN);
  int buttonState4 = digitalRead (BUTTON4_PIN);
  int buttonState5 = digitalRead (BUTTON5_PIN);


  if (buttonState != lastButtonState && buttonState == HIGH && carta == "A") {
    digitalWrite (LED_BLU, HIGH);
    Serial.println("6;");
    
  } else if (buttonState2 != lastButtonState2 && buttonState2 == HIGH && carta == "A") {
         digitalWrite (LED_BLU, HIGH);
    Serial.println("7;");

  } else if (buttonState3 != lastButtonState3 && buttonState3 == HIGH && carta == "A") {
         digitalWrite (LED_BLU, HIGH);
    Serial.println("8;");

  }else if (buttonState4 != lastButtonState4 && buttonState4 == HIGH && carta == "A") {
         digitalWrite (LED_BLU, HIGH);
    Serial.println("9;");

  }else if (buttonState5 != lastButtonState5 && buttonState5 == HIGH && carta == "A") {
         digitalWrite (LED_BLU, HIGH);
    Serial.println("10;");

  }else if (buttonState != lastButtonState && buttonState == HIGH && carta == "B") {
         digitalWrite (LED_BLU, HIGH);
    Serial.println("11;");

  }else if (buttonState2 != lastButtonState2 && buttonState2 == HIGH && carta == "B") {
    digitalWrite (LED_BLU, HIGH);
    Serial.println("12;");

  }else if (buttonState3 != lastButtonState3 && buttonState3 == HIGH && carta == "B") {
    digitalWrite (LED_BLU, HIGH);
    Serial.println("13;");

  }else if (buttonState4 != lastButtonState4 && buttonState4 == HIGH && carta == "B") {
    digitalWrite (LED_BLU, HIGH);
    Serial.println("14;");

  }else if (buttonState5 != lastButtonState5 && buttonState5 == HIGH && carta == "B") {
    digitalWrite (LED_BLU, HIGH);
    Serial.println("15;");

  }else if (buttonState != lastButtonState && buttonState == HIGH && carta == "C") {
         digitalWrite (LED_BLU, HIGH);
    Serial.println("16;");

  }else if (buttonState2 != lastButtonState2 && buttonState2 == HIGH && carta == "C") {
    digitalWrite (LED_BLU, HIGH);
    Serial.println("17;");

  }else if (buttonState3 != lastButtonState3 && buttonState3 == HIGH && carta == "C") {
    digitalWrite (LED_BLU, HIGH);
    Serial.println("18;");

  }else if (buttonState4 != lastButtonState4 && buttonState4 == HIGH && carta == "C") {
    digitalWrite (LED_BLU, HIGH);
    Serial.println("19;");

  }else if (buttonState5 != lastButtonState5 && buttonState5 == HIGH && carta == "C") {
    digitalWrite (LED_BLU, HIGH);
    Serial.println("20;");

  }else if (buttonState != lastButtonState && buttonState == HIGH && carta == "D") {
         digitalWrite (LED_BLU, HIGH);
    Serial.println("21;");

  }else if (buttonState2 != lastButtonState2 && buttonState2 == HIGH && carta == "D") {
    digitalWrite (LED_BLU, HIGH);
    Serial.println("22;");

  }else if (buttonState3 != lastButtonState3 && buttonState3 == HIGH && carta == "D") {
    digitalWrite (LED_BLU, HIGH);
    Serial.println("23;");

  }else if (buttonState4 != lastButtonState4 && buttonState4 == HIGH && carta == "D") {
    digitalWrite (LED_BLU, HIGH);
    Serial.println("24;");

  }else if (buttonState5 != lastButtonState5 && buttonState5 == HIGH && carta == "D") {
    digitalWrite (LED_BLU, HIGH);
    Serial.println("25;");

  } else {
    digitalWrite (LED_BLU, LOW);

  }

}

String getUID() {
  String uid = "";
  for (int i = 0; i < rfid.uid.size; i++) {
    uid += rfid.uid.uidByte[i] < 0x10 ? "0" : "";
    uid += String(rfid.uid.uidByte[i], HEX);
  }
  rfid.PICC_HaltA();
  return uid;
}
