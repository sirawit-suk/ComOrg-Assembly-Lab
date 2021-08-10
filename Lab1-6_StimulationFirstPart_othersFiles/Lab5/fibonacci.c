#include <stdio.h>
int main(){
    int n = 0;
    printf("Enter number : ");
    scanf("%d",&n);

    int f[n+1], i;

    f[0] = 0;
    f[1] = 1;

    for (int i = 2; i <= n; i++){
        f[i] = f[i - 1] + f[i - 2];
    }

    for (int j = 1; j <= n; j++){
        printf("%d ",f[j]);
    }

}