#include<stdio.h>
int GCD(int, int);

int main(){

int num1, num2;
printf("Enter 2 number: ");
scanf("%d %d", &num1, &num2);
int i = GCD(num1,num2);
printf("GCD is %d\n",i);

return 0;
}
