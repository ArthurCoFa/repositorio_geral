#include <stdio.h>
#include <locale.h>
#include <math.h>

int main(){

    float provas, nota, soma = 0, vari, dp, media, i, soma_quadrados;

    setlocale(LC_ALL, "Portuguese");

    printf("Digite a quantidade de provas: ");
    scanf("%f", &provas);

    for(i = 1; i <= provas; i++){

        printf("Digite a nota da prova %g: ", i);
        scanf("%f", &nota);
        soma += nota;
        soma_quadrados += nota * nota;
    }

    media = soma / provas;
    printf("\nSua média é: %g", media);

    vari = (soma_quadrados / provas) - (media * media);
    printf("\n\nDesvio padrão = %g\n", sqrt(vari));


    return 0;
}
