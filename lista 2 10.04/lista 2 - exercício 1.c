#include <stdio.h>
#include <locale.h>

int main(){

    float num, soma = 0, cont = 0;

    setlocale(LC_ALL, "Portuguese");

    while(num >= 0){

        printf("Digite um número inteiro: ");
        scanf("%f", &num);

        soma += num;
        cont++;
    }
    printf("\nVocê digitou um número menor do que 0, não utilizamos esse número.\nSua média é: %g\n", (soma - num)/(cont - 1));

    return 0;
}
