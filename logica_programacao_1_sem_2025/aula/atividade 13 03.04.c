#include <stdio.h>
#include <locale.h>
#include <string.h>

int main(){

    char sexo[20];
    float peso, h, idade, tmb;

    setlocale(LC_ALL, "Portuguese");
    printf("Digite masculino ou feminino: ");
    scanf("%s", sexo);

    printf("\nDigite seu peso: ");
    scanf("%f", &peso);

    printf("\nDigite sua altura em cm: ");
    scanf("%f", &h);

    printf("\nDigite sua idade: ");
    scanf("%f", &idade);

    if(strcmp(sexo, "masculino") == 0){

        tmb = 66.47 + (13.75 * peso) + (5.003 * h) - (6.755 * idade);

        printf("\nSua Taxa Metabólica Basal é: %g", tmb);

    } else{

        tmb = 655.09 + (9.563 * peso) + (1.85 * h) - (4.676 * idade);

        printf("\nSua Taxa Metabólica Basal é: %g", tmb);
    }

    return 0;
}
