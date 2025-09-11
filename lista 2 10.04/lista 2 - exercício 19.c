#include <stdio.h>
#include <locale.h>

int main(){

    int num, bin = 1, res = 0;

    setlocale(LC_ALL, "Portuguese");

    printf("Digite um número inteiro positivo: ");
    scanf("%d", &num);

    while(num >= 1){

        res = res + num % 2 * bin;
        bin = bin * 10;
        num = num / 2;
    }

    printf("%d", res);

    return 0;
}
