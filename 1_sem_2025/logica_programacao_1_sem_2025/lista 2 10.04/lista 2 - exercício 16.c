#include <stdio.h>
#include <locale.h>

int main(){

    int c, i, t, m, q;

    setlocale(LC_ALL, "Portuguese");

    printf("Digite o valor do capital inicial: ");
    scanf("%d", &c);

    printf("Digite o valor da taxa de juros mensal: ");
    scanf("%d", &i);

    printf("Digite a quantidade de meses: ");
    scanf("%d", &t);

    for(q = 1; q <= t; q++){

        m = c + c*i/100*q;
        printf("mês %d --> %d reais\n", q, m);
    }

    return 0;
}
