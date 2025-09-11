#include <stdio.h>
#include <locale.h>

int main(){

    int valor;

    setlocale(LC_ALL, "Portuguese");
    printf("Digite o valor do produto: ");
    scanf("%d", &valor);

    printf("\nValor do produto || Valor do desconto || Produto com desconto");
    printf("\n       %d       ||        %d         ||        %d        \n", valor, valor * 20/100, valor - (valor * 20/100));

    return 0;
}

