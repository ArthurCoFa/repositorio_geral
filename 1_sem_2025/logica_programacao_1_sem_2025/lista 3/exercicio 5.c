#include <stdio.h>
#include <locale.h>
#include <math.h>

int main(){

    int x[20] = {10, 5, 12, 8, 3, 6, 7, 2, 1, 9};
    int i;
    float b[20];

    setlocale(LC_ALL, "Portuguese");

    for(i = 0; i < 10; i++){

        b[i] = pow(x[i], 2);

        printf("%g\n", b[i]);
    }

    return 0;
}



