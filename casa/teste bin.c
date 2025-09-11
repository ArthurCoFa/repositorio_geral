#include <stdio.h>

int main() {
    int num, resto, binario = 0, base = 1;

    printf("Digite um numero inteiro positivo: ");
    scanf("%d", &num);

    while (num > 0) {
        resto = num % 2;
        binario = binario + resto * base;
        base = base * 10;
        num = num / 2;
    }

    printf("Binario: %d\n", binario);

    return 0;
}
