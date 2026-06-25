#include <stdio.h>
#include <locale.h>

int main(){

    int orc = 0, serv = 0, total = 0, cont = 0;

    setlocale(LC_ALL, "Portuguese");

    printf("Digite o valor do orçamento de no mínimo 100 reais: ");
    scanf("%d", &orc);

    while(orc < 100){

        printf("Seu orçamento é menor que 100 reais.\nTente novamente: ");
        scanf("%d", &orc);
    }
    while(total < orc){

        cont++;
        printf("\nDigite o valor do serviço %d(se não tiver mais serviços digite zero): ", cont);
        scanf("%d", &serv);
        total += serv;

        if(serv == 0){

            printf("\nO valor total dos serviços não superou o orçamento, valor total = %d.\n", total);
            return 0;
        }
    }

    printf("\nO valor dos serviços é maior que o orçamento!\nVocê não pode mais pedir serviços!!\n\nValor dos serviços = %d\n", total);

    return 0;
}

