#include <stdio.h>
#include <locale.h>
#include <math.h>

int main(){

    int razao, termo3, i, qtermo, soma;

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

    printf("%d %d ", termo3/(2*razao), termo3/razao);

    soma = termo3/(2*razao) + termo3/razao;

    for(i = 2; i < qtermo; i++){

        printf("%d ", termo3);
        soma += termo3;
        termo3 = termo3 * razao;
    }

    printf("\n\nSoma dos termos = %d", soma);

    return 0;
}

