#include <stdio.h>
#include <locale.h>

int main(){

    int x[10] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
    int i, ultimo;

    setlocale(LC_ALL, "Portuguese");

    ultimo = x[9];

    for(i = 0; i < 10 ;i++){

        printf("%2d ", x[i]);
    }

    for(i = 9; i > 0; i--){

       x[i] = x[i - 1];
    }

    x[0] = ultimo;

    printf("\nRotacionado\n");

    for(i = 0; i < 10 ;i++){

        printf("%2d ", x[i]);
    }

    return 0;
}
