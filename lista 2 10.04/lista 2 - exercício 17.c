#include <stdio.h>
#include <locale.h>

int main(){

    float d, mont, i, t, q;

    setlocale(LC_ALL, "Portuguese");

    printf("Digite o valor depositado: ");
    scanf("%f", &d);

    printf("Digite a quantidade de meses: ");
    scanf("%f", &t);

    printf("Digite a taxa de juros: ");
    scanf("%f", &i);

    mont = d + (d * i)/100;

    printf("montante no mes 1 = %.2f\n", mont);

    for(q = 2; q <= t; q++){

        mont = mont + d + (mont + d) * (i / 100);
        printf("montante no mes %g = %.2f \n", q, mont);
    }

    return 0;
}
