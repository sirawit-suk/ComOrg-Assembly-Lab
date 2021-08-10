#include <stdio.h>
#include <stdlib.h>
#include <wiringPi.h>

int main()
{
    int pin = 7;
    printf("LED blinking by wiringPi\n");

    if (wiringPiSetup() == -1) {
        printf("Setting up probelm ... Abort!");
        exit(1);
    }

    pinMode(pin, OUTPUT); /* set pin = 7 to Output mode*/

    int i;
    for (i=0; i<10; i++){

        digitalWrite(pin, 1);   /* LED On */
        delay(500);
        digitalWrite(pin, 0);   /* LED Off */
        delay(500);
    }

    return 0;

}
