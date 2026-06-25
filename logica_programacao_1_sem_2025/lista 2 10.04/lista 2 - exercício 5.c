#include <stdio.h>
#include <locale.h>

int main(){

    int num1, num2, resultado = 1, cont = 0;

    setlocale(LC_ALL, "Portuguese");

    printf("Digite dois números inteiros: ");
    scanf("%d %d", &num1, &num2);

    while(cont < num2){

        resultado = resultado * num1;
        cont ++;
    }

    printf("%d elevado a %d é igual a %d\n", num1, num2, resultado);

    return 0;
}
