#include <stdio.h>
#include <locale.h>

int main(){

    setlocale(LC_ALL, "Portuguese");

    int x[20], i, y;

    for(i = 1; i < 11; i++){

        printf("Digite 10 valores: ");
        scanf("%d", &x[i]);

    }

    for(i = 1; i < 11; i++){

        if(x[i] > x[i - 1]){

            x[i] = y;

        }
    }

    printf("%d", y);

    return 0;
}
