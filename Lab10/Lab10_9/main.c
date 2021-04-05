
#include <stdio.h>
#include <stdlib.h>

#include <wiringPi.h>

int main()
{
    int pin1 = 7;
    int pin2 = 0;
    int pin3 = 2;

    wiringPiSetup();

    pinMode(pin1, OUTPUT);
    pinMode(pin2, OUTPUT);
    pinMode(pin3, OUTPUT);

    for(int i=0; i< 100; i++){

        int x1 = digitalRead(pin1);
        int x2 = digitalRead(pin2);
        int x3 = digitalRead(pin3);

        delay(500);

        if (x1 == 0){
            digitalWrite(pin1, !x1);

        }else if (x2 == 0){
            digitalWrite(pin1, !x1);
            digitalWrite(pin2, !x2);
        }else {

            digitalWrite(pin1, !x1);
            digitalWrite(pin2, !x2);
            digitalWrite(pin3, !x3);
        }

    }
}

/*
#include <stdio.h>
#include <stdlib.h>
#include <wiringPi.h>
int Led[] = {2,0,7};

int main( void )
{
  printf("LED blinking by wiringPi\n");
  if(wiringPiSetup() == -1){
   printf("Settting up ploblem ... Abort!");
   exit(1);
  }
  int j;
  for( j = 0 ; j<3 ;j++){
   pinMode(Led[j], OUTPUT);
  }
  int i ;
  while(i<=8){
   delay(500);
   if(digitalRead(Led[2]) == 0){
    digitalWrite(Led[2],1);
   }
   else if(digitalRead(Led[1]) == 0){
    digitalWrite(Led[2],0);
    digitalWrite(Led[1],1);
   }
   else if(digitalRead(Led[0]) == 0){
    digitalWrite(Led[2],0);
    digitalWrite(Led[1],0);
    digitalWrite(Led[0],1);
   }
   else{
    digitalWrite(Led[2],0);
    digitalWrite(Led[1],0);
    digitalWrite(Led[0],0);
    i=0;
   }
   i++;
  }
  return 0;
}
*/
