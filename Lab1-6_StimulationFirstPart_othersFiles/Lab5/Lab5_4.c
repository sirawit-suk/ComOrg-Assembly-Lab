#include <stdio.h>
int main(){
    unsigned long long i = 1;
    while(i > 0){
        i++;
        if(i==0){
            printf("i was %10u before\n",i-1);
            printf("i was %10u now\n",i);
        }
    }
    return 0;
}
