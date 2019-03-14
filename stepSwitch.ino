int buttonPin = 3;
int yellowButtonPin = 2;

int redLedPin = 4;
int yellowLedPin = 5;
int greenLedPin = 6;

void setup() {
  // set pin modes
  pinMode(redLedPin, OUTPUT);
  pinMode(yellowLedPin, OUTPUT);
  pinMode(greenLedPin, OUTPUT);
  pinMode(buttonPin, INPUT);
  pinMode(yellowButtonPin, INPUT);

  Serial.begin(9600);
}
 
void loop() {
  while (digitalRead(buttonPin) == HIGH && digitalRead(yellowButtonPin) ==LOW) {
   digitalWrite(greenLedPin, LOW);
   digitalWrite(yellowLedPin, HIGH);
   digitalWrite(redLedPin, LOW);
   if (digitalRead(buttonPin) == LOW || digitalRead(yellowButtonPin) == HIGH) {
      break;
   }
   delay(3000);
   digitalWrite(greenLedPin, LOW);
   digitalWrite(yellowLedPin, LOW);
   digitalWrite(redLedPin, HIGH);
    if (digitalRead(buttonPin) == LOW || digitalRead(yellowButtonPin) == HIGH) {
      break;
   }
   delay(3000);
   digitalWrite(greenLedPin, HIGH);
   digitalWrite(yellowLedPin, LOW);
   digitalWrite(redLedPin, LOW);
   if (digitalRead(buttonPin) == LOW || digitalRead(yellowButtonPin) == HIGH) {
      break;
   }
   delay(3000);
  }
   while (digitalRead(buttonPin) == HIGH && digitalRead(yellowButtonPin) == HIGH) {
   digitalWrite(greenLedPin, LOW);
   digitalWrite(yellowLedPin, HIGH);
   digitalWrite(redLedPin, LOW);
   if (digitalRead(buttonPin) == LOW || digitalRead(yellowButtonPin) == LOW) {
     break;
   }
   delay(400);

   digitalWrite(greenLedPin, LOW);
   digitalWrite(yellowLedPin, LOW);
   digitalWrite(redLedPin, HIGH);
   if (digitalRead(buttonPin) == LOW || digitalRead(yellowButtonPin) == LOW) {
     break;
   }
   delay(400);
   digitalWrite(greenLedPin, HIGH);
   digitalWrite(yellowLedPin, LOW);
   digitalWrite(redLedPin, LOW);  
   if (digitalRead(buttonPin) == LOW || digitalRead(yellowButtonPin) == LOW) {
     break;
   }   
   delay(400);
   }
  while (digitalRead(buttonPin) == LOW && digitalRead(yellowButtonPin) == HIGH) {
   digitalWrite(greenLedPin, LOW);
   digitalWrite(yellowLedPin, HIGH);
   digitalWrite(redLedPin, LOW);
   if (digitalRead(buttonPin) == HIGH || digitalRead(yellowButtonPin) == LOW) {
     break;
   }   
   delay(6000);
   digitalWrite(greenLedPin, LOW);
   digitalWrite(yellowLedPin, LOW);
   digitalWrite(redLedPin, HIGH);
   if (digitalRead(buttonPin) == HIGH || digitalRead(yellowButtonPin) == LOW) {
     break;
   }   
   delay(6000);
   digitalWrite(greenLedPin, HIGH);
   digitalWrite(yellowLedPin, LOW);
   digitalWrite(redLedPin, LOW);  
   if (digitalRead(buttonPin) == HIGH || digitalRead(yellowButtonPin) == LOW) {
     break;
   }      
   delay(6000);  
   }
  while (digitalRead(buttonPin) == LOW && digitalRead(yellowButtonPin) == LOW) {
   digitalWrite(greenLedPin, LOW);
   digitalWrite(yellowLedPin, LOW);
   digitalWrite(redLedPin, LOW);    
  }
}
//function for moderate speed (only left foot down
//void medTrafficLights(int delayValue){ 
////change i value for different speeds (increment by 1 until i value to check if button being pressed then move on)
//
//   digitalWrite(greenLedPin, LOW);
//   digitalWrite(yellowLedPin, HIGH);
//   digitalWrite(redLedPin, LOW);
////   for(long int i = 0; i < 500000; i++){
////      if (digitalRead(buttonPin) == LOW) {
////        return;
////      }
//    }    
//   digitalWrite(greenLedPin, LOW);
//   digitalWrite(yellowLedPin, LOW);
//   digitalWrite(redLedPin, HIGH);
////  
////   for(long int i = 0; i < 500000; i++){
////      if (digitalRead(buttonPin) == LOW) {
////        return;
////      }
////    }    
//
//   digitalWrite(greenLedPin, HIGH);
//   digitalWrite(yellowLedPin, LOW);
//   digitalWrite(redLedPin, LOW);
//   
////   for(long int i = 0; i < 500000; i++){
////      if (digitalRead(buttonPin) == LOW) {
////        return;
////      }
////    }
//    
//   
//}
////function for slow speed (right foot down)
//
//void slowTrafficLights(int delayValue){
//   //change i value for different speeds (increment by 1 until i value to check if button being pressed then move on)
//
//   digitalWrite(greenLedPin, LOW);
//   digitalWrite(yellowLedPin, HIGH);
//   digitalWrite(redLedPin, LOW);
////   for(long int i = 0; i < 1100000; i++){
////      if (digitalRead(yellowButtonPin) == LOW) {
////        Serial.println(i);
////        return;
////      }
////    }
//    
//   digitalWrite(greenLedPin, LOW);
//   digitalWrite(yellowLedPin, LOW);
//   digitalWrite(redLedPin, HIGH);
//
////   for(long int i = 0; i < 1100000; i++){
////      if (digitalRead(yellowButtonPin) == LOW) {
////        return;
////      }
////    }
////    
//
//   digitalWrite(greenLedPin, HIGH);
//   digitalWrite(yellowLedPin, LOW);
//   digitalWrite(redLedPin, LOW);
//   
////   for(long int i = 0; i < 1100000; i++){
////      if (digitalRead(yellowButtonPin) == LOW) {
////        return;
////      }
////    }
//    
//}
////function for fast  speed (both feet down)
//
//void crazyTrafficLights(int delayValue){
//   //change i value for different speeds (increment by 1 until i value to check if button being pressed then move on)
//   digitalWrite(greenLedPin, LOW);
//   digitalWrite(yellowLedPin, HIGH);
//   digitalWrite(redLedPin, LOW);
////   for(long int i = 0; i < 100000; i++){
////      if ((digitalRead(buttonPin) == LOW && digitalRead(yellowButtonPin) == LOW)) {
////        return;
////      }
////    }
//
//   digitalWrite(greenLedPin, LOW);
//   digitalWrite(yellowLedPin, LOW);
//   digitalWrite(redLedPin, HIGH);
//   
////   for(long int i = 0; i < 100000; i++){
////      if ((digitalRead(buttonPin) == LOW && digitalRead(yellowButtonPin) == LOW))  {
////        return;
////      }
////    }
//    
//   digitalWrite(greenLedPin, HIGH);
//   digitalWrite(yellowLedPin, LOW);
//   digitalWrite(redLedPin, LOW);
////   
////   for(long int i = 0; i < 100000; i++){
////      if ((digitalRead(buttonPin) == LOW && digitalRead(yellowButtonPin) == LOW))  {
////        return;
////      }
////    }
////    
//   
//}
