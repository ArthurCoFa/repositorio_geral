#include <stdio.h>
#include <locale.h>

int main(){

    int razao, termo3, i, qtermo;

    setlocale(LC_ALL, "Portuguese");

    printf("Digite o terceiro termo: ");
    scanf("%d", &termo3);

    printf("Digite a razão: ");
    scanf("%d", &razao);

    printf("Digite um número positivo maior que 3: ");
    scanf("%d", &qtermo);

    while(qtermo <= 3){

        printf("Este número não é maior que 3!\nTente novamente: ");
        scanf("%d", &qtermo);
    }

    printf("%d  %d  ", termo3 - 2*razao, termo3 - razao);

    for(i = 2; i < qtermo; i++){

        printf("%d  ", termo3);
        termo3 += razao;
    }

    return 0;
}
