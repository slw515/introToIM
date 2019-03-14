const int pwma = 11 ; 
const int in_1 = 13 ;
const int in_2 = 12 ;
//first wheel ^
const int pwmb = 10 ; 
const int in_3= 8 ;
const int in_4 = 9 ;
//first wheel ^

const int photo1 = A4;
const int photo2 = A5;

int direct = 0;
int direct2 = 0;
void setup() {
  // put your setup code here, to run once:
   pinMode(pwma,OUTPUT) ; //we have to set PWM pin as output
   pinMode(pwmb,OUTPUT) ; //we have to set PWM pin as output
   pinMode(in_1,OUTPUT) ; //Logic pins are also set as output
   pinMode(in_2,OUTPUT) ;
   pinMode(in_3,OUTPUT) ; //Logic pins are also set as output
   pinMode(in_4,OUTPUT) ;
   Serial.begin(9600);
}

void loop() {
  // put your main code here, to run repeatedly:
   direct = random(0, 1);
   direct2 = (direct + 1) % 2;
   int photoOneValue = map(analogRead(A4), 0, 1023, 0, 255);
   int photoTwoValue = map(analogRead(A5), 0, 1023, 0, 255);
   if (photoTwoValue > 105) {
     digitalWrite(in_1, direct2) ;
     digitalWrite(in_2, direct) ;
     digitalWrite(in_3, direct2) ;
     digitalWrite(in_4, direct) ;
     analogWrite(pwma, 70);
     analogWrite(pwmb, 250);
     Serial.println("1");
} // speed in opposite direction to light
   //previous value was 85 ^

   else if (photoOneValue > 160) {
     digitalWrite(in_1, direct2) ;
     digitalWrite(in_2, direct) ;
     digitalWrite(in_3, direct2) ;
     digitalWrite(in_4, direct) ;
     analogWrite(pwma, 250);
     analogWrite(pwmb, 70);
     Serial.println("2");
   } 
   //previous value was 160 ^
   else if (photoTwoValue < 20 && photoOneValue < 80) {
     digitalWrite(in_1, direct2) ;
     digitalWrite(in_2, direct) ;
     digitalWrite(in_3, direct2) ;
     digitalWrite(in_4, direct) ;
     analogWrite(pwma, 110);
     analogWrite(pwmb, 110);
     Serial.println("3");
//constant slow speed when room is dim
 }
  else if (photoTwoValue > 20 && photoOneValue > 80 && photoOneValue < 160 && photoTwoValue < 105) {
     digitalWrite(in_1, direct2) ;
     digitalWrite(in_2, direct) ;
     digitalWrite(in_3, direct2) ;
     digitalWrite(in_4, direct) ;
     analogWrite(pwma, photoOneValue + 20);
     analogWrite(pwmb, photoTwoValue + 60);
     Serial.println("4");
//environment not dim, but light not sensitive enough to activate the two if statements on top, allows vehicle to move faster towards light/
  }
}
