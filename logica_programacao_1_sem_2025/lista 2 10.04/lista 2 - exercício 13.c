#include <stdio.h>
#include <locale.h>

int main(){

    int razao, termo4, i, qtermo;

    setlocale(LC_ALL, "Portuguese");

    printf("Digite o quarto termo: ");
    scanf("%d", &termo4);

    printf("Digite a razão: ");
    scanf("%d", &razao);

    printf("Digite um número positivo: ");
    scanf("%d", &qtermo);

    while(qtermo < 0){

        printf("Este número não é positivo!\nTente novamente: ");
        scanf("%d", &qtermo);
    }

    printf("%d  %d  %d  ", termo4 - 3*razao, termo4 - 2*razao, termo4 - razao);

    for(i = 3; i < qtermo; i++){

        printf("%d  ", termo4);
        termo4 += razao;
    }

    return 0;
}

