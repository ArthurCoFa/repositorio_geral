#include <stdio.h>
#include <locale.h>
#include <math.h>

int main(){

    float num1, num2, num3, num4, media, variancia, dp;

    setlocale(LC_ALL, "Portuguese");
    printf("Digite 4 números: ");
    scanf("%f %f %f %f", &num1, &num2, &num3, &num4);

    media = (num1 + num2 + num3 + num4)/4;
    variancia = (pow(media-num1, 2) + pow(media-num2, 2) + pow(media-num3, 2) + pow(media-num4, 2))/4;
    dp = sqrt(variancia);

    printf("\nA média é: %g", media);
    printf("\nA variância é: %g", variancia);
    printf("\nO Desvio Padrão é: %g", dp);

    return 0;
}

