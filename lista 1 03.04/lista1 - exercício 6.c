#include <stdio.h>
#include <locale.h>

int main(){

    int porcentagem, valor;

    setlocale(LC_ALL, "Portuguese");
    printf("Digite o valor do produto: ");
    scanf("%d", &valor);

    printf("Digite o desconto: ");
    scanf("%d", &porcentagem);

    printf("\nValor do produto || Valor do desconto || Produto com desconto");
    printf("\n       %d       ||        %d         ||        %d        \n", valor, valor * porcentagem/100, valor - (valor * porcentagem/100));


    return 0;

}

