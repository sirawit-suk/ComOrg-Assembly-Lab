#include <stdio.h>
#include <stdlib.h>

int main()
{
    int num1, num2, i;
    printf("Enter 2 number: ");
    scanf("%d %d", &num1, &num2);

    if (num1>=num2){
        i = loop_mod_plus(num1,num2);
    }
    else{
        num1--;
        i = loop_mod_minus(num1,num2);
        num1++;
    }

    printf("%d %% %d = %d",num1,num2,i );
    return 0;
}
