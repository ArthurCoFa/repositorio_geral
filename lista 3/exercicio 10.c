#include <stdio.h>
#include <locale.h>
#include <math.h>

int main(){

    int num[10], i;
    float media = 0;

    setlocale(LC_ALL, "Portuguese");

    for(i = 0; i < 8; i++){

        printf("Digite o número %d : ", i + 1);
        scanf("%d", &num[i]);
        media += num[i];
    }

    media = media / i;

    printf("Média é: %g\n", media);

    for(i = 0; i < 8; i++){

        if(num[i] > media){

            printf("%d é maior que a média\n", num[i]);
        }
    }

    return 0;
}




