#include <stdio.h>
#include <locale.h>

int main(){

    float num1, num2, num3, media;

    setlocale(LC_ALL, "Portuguese");
    printf("Digite 3 números separdos por vírgula: ");
    scanf("%f %f %f", &num1, &num2, &num3);

    media = (num1 + num2 + num3)/3;

    printf("\nSua média é: %g\n", media);

    return 0;
}
