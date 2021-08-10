#include <stdio.h>
int main(){
    int i = 0;
    while(i >= 0){
        i++;
        if(i<0){
            printf("i was %10d before\n",i-1);
            printf("i was %10d now\n",i);
        }
    }
    return 0;
}
