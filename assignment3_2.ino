const int blueLed = 2;
const int forceLed = 3;
const int lightLed = 4;
const int piezoPin = 5;
int forceVal = 0;
int lightVal = 0;
int forceLight = 0;
int lightLight = 0;

void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  pinMode(blueLed, OUTPUT);
  pinMode(forceLed, OUTPUT);
  pinMode(lightLed, OUTPUT)
}

void loop() {
  // put your main code here, to run repeatedly:
  forceVal = analogRead(A1);   // read the input pin
  lightVal = analogRead(A0);   // read the input pin
  if (lightVal < 440) {
    analogWrite(lightLed, lightVal);
    digitalWrite(blueLed, false);
    Serial.println(lightVal);
    tone(piezoPin, 1000, 500);

  }
  if (forceVal > 60) {
    digitalWrite(forceLed, true);
    digitalWrite(lightLed, false);
    digitalWrite(blueLed, false);
    if (forceVal > 500) {
      tone(piezoPin, 100);
      Serial.println("hello");
      digitalWrite(forceLed, true); 
      }
    else {
      noTone(piezoPin);
      digitalWrite(forceLed, true); 
      Serial.println("hello2");
      Serial.println(forceVal);
      
    }
  }

  if (forceVal > 500  && lightVal < 440) {
    analogWrite(lightLed, lightVal);
    digitalWrite(forceLed, true);
    tone(piezoPin, 5000, 500);
    delay(150);
    digitalWrite(lightLed, false);
    digitalWrite(forceLed, false);
    tone(piezoPin, 100, 500);
    delay(150);
    analogWrite(lightLed, lightVal);
    digitalWrite(forceLed, true);
    tone(piezoPin, 5000, 500);  
    Serial.println("hell03");
    Serial.println(forceVal);
    
  }
  if (forceVal < 10 && lightVal > 440) {
    digitalWrite(blueLed, true);
    digitalWrite(lightLed, false);
    digitalWrite(forceLed, false);
  }
}
