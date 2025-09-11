#include <stdio.h>
#include <locale.h>

int main(){

    setlocale(LC_ALL, "Portuguese");

    int a[10] = {1, 0, 5, -2, -5, 7}, soma, i;

    soma = a[0] + a[1] + a[5];

    printf("Soma das posiçõs 0, 1 e 5 : %d\n", soma);

    a[4] = 100;

    printf("\nPosição 4: %d\n\n", a[4]);

    for(i = 0; i < 6; i++){

        printf("Posição %d: %d\n", i, a[i]);

    }


    return 0;
}
