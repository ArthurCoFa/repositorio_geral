#include <stdio.h>

int main() {
    int n;
    int contador = 0;
    int a = 0, b = 1, proximo;

    printf("Digite a quantidade de termos da sequência de Fibonacci: ");
    scanf("%d", &n);

    // Verifica se o número é positivo
    if (n <= 0) {
        printf("Por favor, digite um número inteiro positivo.\n");
        return 1;
    }

    printf("Sequência de Fibonacci com %d termos:\n", n);

    while (contador < n) {
        printf("%d ", a);
        proximo = a + b;
        a = b;
        b = proximo;
        contador++;
    }

    printf("\n");
    return 0;
}
