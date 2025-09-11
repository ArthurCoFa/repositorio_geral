#include <stdio.h>
#include <locale.h>

int main(){

    int x[10] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
    int i, y[10];/* Usando um segundo array*/

    setlocale(LC_ALL, "Portuguese");

    for(i = 0; i < 10 ;i++){

        y[i + 1] = x[i];
        printf("%2d ", x[i]);
    }

    y[0] = x[9];

    printf("\nRotacionado\n");

    for(i = 0; i < 10 ;i++){

        printf("%2d ", y[i]);
    }

    return 0;
}

