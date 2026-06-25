#include <stdio.h>
#include <locale.h>

int main(){

    float temp, celsius, fahrenheit;
    char nome;

    setlocale(LC_ALL, "Portuguese");

    printf("Digite o valor da temperatura: ");
    scanf("%f", &temp);

    printf("Digite C para temperatura em Celsius e F para temperatura em Fahrenheit: ");
    scanf("%s", &nome);

    if(nome == 'c' || nome == 'C'){

        fahrenheit = temp * 1.8 + 32;
        printf("Sua temperatura em Fahrenheit é %g", fahrenheit);

    } else{

        celsius = (temp - 32) / 1.8;
        printf("Sua temperatura em Celsius é %g", celsius);
    }

    return 0;
}
