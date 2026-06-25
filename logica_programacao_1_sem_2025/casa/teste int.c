#include <stdio.h>

int main() {
    int numero;
    char resto;

    printf("Digite um numero inteiro: ");

    // Tenta ler um número inteiro e vê se tem lixo depois (tipo vírgula ou ponto)
    if (scanf("%d%c", &numero, &resto) == 2) {
        printf("Entrada invalida! So aceitamos numeros inteiros sem virgula ou ponto.\n");
    } else {
        printf("Voce digitou: %d\n", numero);
    }

    return 0;
}
