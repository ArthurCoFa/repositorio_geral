#include <stdio.h>
#include <locale.h>
#include <string.h>

int main(){

    char sexo;
    float peso, altura, idade, tmb;

    setlocale(LC_ALL, "Portuguese");
    printf("Digite m para masculino ou f para feminino: ");
    scanf("%c", &sexo);

    printf("\nDigite seu peso: ");
    scanf("%f", &peso);

    printf("\nDigite sua altura em cm: ");
    scanf("%f", &altura);

    printf("\nDigite sua idade: ");
    scanf("%f", &idade);

    if(sexo == 'm' || sexo == 'M'){

        tmb = 66.47 + (13.75 * peso) + (5.003 * altura) - (6.755 * idade);

        printf("\nSua Taxa Metabólica Basal é: %g\n", tmb);

    } else{

        tmb = 655.09 + (9.563 * peso) + (1.85 * altura) - (4.676 * idade);

        printf("\nSua Taxa Metabólica Basal é: %g\n", tmb);
    }

    return 0;
}

