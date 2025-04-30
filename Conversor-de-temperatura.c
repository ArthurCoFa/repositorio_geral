#include <stdio.h>
#include <string.h>
#include <locale.h>

int main(){

    int temperatura;
    char tipo[20];

    setlocale(LC_ALL, "Portuguese");

    printf("Digite qual o tipo de temperatura que você vai usar C, F ou K: ");
    scanf("%s", &tipo);

    printf("\nDigite o valor: ");
    scanf("%d", &temperatura);

    if(strcmp(tipo, "C") == 0 || strcmp(tipo, "c") == 0){

        printf("\nSua temperatura em Fahrenheit e Kelvin é: %d graus F e %d K\n", (temperatura*9/5) + 32, temperatura + 273);

    } else if(strcmp(tipo, "F") == 0 || strcmp(tipo, "f") == 0){

        printf("\nSua temperatura em Celsius e Kelvin é: %d graus C e %d K\n", (temperatura - 32) * 5/9, (temperatura - 32) * 5/9 + 273);

    } else {

        printf("Sua temperatura em Celsius e Fahrenheit é: %d graus C e %d graus F\n", temperatura - 273, (temperatura - 273) * 9/5 + 32);

    }

    return 0;
}

