#include <stdio.h>
#include <locale.h>
#include <math.h>

int main(){

    int x[20] = {25, 5, 144, 8, 3, 100, 4, 9};
    int i;
    float b[20];

    setlocale(LC_ALL, "Portuguese");

    for(i = 0; i < 8; i++){

        b[i] = sqrt(x[i]);

        printf("%g\n", b[i]);
    }

    return 0;
}


