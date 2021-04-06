#include <stdio.h>
#include <stdlib.h>
#include <errno.h>

#include <wiringPi.h>

#define BUTTON_PIN 0
// Use GPIO Pin 17 = Pin 0 of wiringPi library

volatile int count = 500;
volatile int round = 0;

void myInterrupt(void) { // called every time and event occurs
    count/=2; // the event counter
    round++;
    if (round == 3){
        round = 0;
        count = 500;
    }

    printf("count = %d\n", count);
    printf("round = %d\n", round);

}


int main()
{
    int pin1 = 7;
    int pin2 = 2;
    int pin3 = 3;

    wiringPiSetup();

    pinMode(pin1, OUTPUT);
    pinMode(pin2, OUTPUT);
    pinMode(pin3, OUTPUT);

    if (wiringPiISR (BUTTON_PIN, INT_EDGE_FALLING, &myInterrupt ) < 0) {

        printf("Cannot setup ISR: %s\n", strerror(errno));
        return 2; // error code =2

    }



    for(int i=0; i< 100; i++){

        int x1 = digitalRead(pin1);
        int x2 = digitalRead(pin2);
        int x3 = digitalRead(pin3);

        delay(count);

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
