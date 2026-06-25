#include <stdio.h>
#include <locale.h>
#include <math.h>

int main(){

    float num1, num2, num3, num4, simples, multi ,geometrica, harmonica;

    setlocale(LC_ALL, "Portuguese");
    printf("Digite 4 números separdos por vírgula: ");
    scanf("%f %f %f %f", &num1, &num2, &num3, &num4);

    simples = (num1 + num2 + num3 + num4)/4;
    geometrica = pow(num1 * num2 * num3 * num4, 0.25);
    harmonica = 4/((1/num1)+(1/num2)+(1/num3)+(1/num4));

    printf("\nMédia aritmética simples: %g", simples);
    printf("\nMédia geometrica: %g", geometrica);
    printf("\nMédia harmonica: %g", harmonica);


    return 0;
}
