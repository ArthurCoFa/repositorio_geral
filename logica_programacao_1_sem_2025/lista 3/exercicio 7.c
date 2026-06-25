#include <stdio.h>
#include <locale.h>

int main(){

    int x[20];
    int i;

    setlocale(LC_ALL, "Portuguese");

    for(i = 0; i < 6; i++){

        printf("Digite 6 números inteiros: ");
        scanf("%d", &x[i]);

    }

    for(i = 0; i < 6; i++){

        printf("%d ", x[5 - i]);
    }

    return 0;
}



