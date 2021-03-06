// -
// Installazione "Conversazioni su Dante" della nuova area per il Museo Dantesco dal nome Sui passi di Dante  by peterbaru [Museo Dantesco, Dante Alighieri,  Patrimonio culturale, Ravenna, Interaction Design]
// 2021 © Pietro Baruzzi, Università degli Studi della Repubblica di San Marino
// Educational purposes, MIT License, 2021, San Marino

#include "SR04.h"
#define TRIG_PIN 4
#define ECHO_PIN 8
#define LED_PIN 2

SR04 sr04 = SR04(ECHO_PIN,TRIG_PIN);
long a;

void setup() {

  pinMode(LED_PIN, OUTPUT);
   Serial.begin(9600);
   delay(1000);
}

void loop() {
   a=sr04.Distance();
   delay(1000);

if (a < 150) {
  digitalWrite (LED_PIN, HIGH);
  Serial.println("2;");
  } else if (a >= 150) {
      digitalWrite (LED_PIN, LOW);
        Serial.println("1;");
    }
}
