#include <stdio.h>
#include <locale.h>

int main(){

    int razao, termo1, i, qtermo;

    setlocale(LC_ALL, "Portuguese");

    printf("Digite o primeiro termo: ");
    scanf("%d", &termo1);

    printf("Digite a razão: ");
    scanf("%d", &razao);

    printf("Digite um número positivo: ");
    scanf("%d", &qtermo);

    while(qtermo < 0){

        printf("Esse número não é positivo!\nTente novamente: ");
        scanf("%d", &qtermo);
    }

    for(i = 0; i < qtermo; i++){

        printf("%d ", termo1);
        termo1 = termo1 * razao;
    }

    return 0;
}
