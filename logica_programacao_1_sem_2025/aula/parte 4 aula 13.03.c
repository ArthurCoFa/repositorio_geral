#include <stdio.h>

int main(){

    float peso, altura, imc;

    printf("Digite seu peso em kg: ");
    scanf("%f", &peso);

    printf("Digite sua altura em m (ex:1.80): ");
    scanf("%f", &altura);

    imc = peso/(altura*altura);

    printf("Seu IMC: %f \n", imc);



    return 0;
}
