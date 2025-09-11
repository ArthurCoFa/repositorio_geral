#include <stdio.h>
#include <string.h>

int main(){

    int temperatura;
    char tipo[20];

    printf("digite qual dado que voce vai usar C, F ou K: ");
    scanf("%s", &tipo);

    printf("\ndigite o valor: ");
    scanf("%d", &temperatura);

    if(strcmp(tipo, "C") == 0 || strcmp(tipo, "c") == 0){

        printf("\nsua temperatura em fahrenheit e kelvin eh: %d graus F e %d K\n", (temperatura*9/5) + 32, temperatura + 273);

    } else if(strcmp(tipo, "F") == 0 || strcmp(tipo, "f") == 0){

        printf("\nsua temperatura em celsius e kelvin eh: %d graus C e %d K\n", (temperatura - 32) * 5/9, (temperatura - 32) * 5/9 + 273);

    } else {

        printf("sua temperatura em celsius e fahrenheit eh: %d graus C e %d graus F\n", temperatura - 273, (temperatura - 273) * 9/5 + 32);

    }


    return 0;
}
