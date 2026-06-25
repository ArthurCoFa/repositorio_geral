#include <stdio.h>
#include <locale.h>

int main(){

    int i = 2, num, num2, valor = 1, mdc = 1;

    setlocale(LC_ALL, "Portuguese");

    printf("Digite dois números: ");
    scanf("%d %d", &num, &num2);

    while(num <= 0 || num2 <= 0){

        printf("Um número é menor que zero!\nDigite outros dois: ");
        scanf("%d %d", &num, &num2);
    }

    printf("\nDecomposição: ");

    while(i <= num || i <= num2){

        if(num % i == 0 && num2 % i == 0){

                mdc = mdc * i;
        }
        if(num % i == 0 || num2 % i == 0){

            if(num % i == 0){

                num = num/i;
            }
            if(num2 % i == 0){

                num2 = num2/i;
            }

            printf("%d ", i);
            valor = valor * i;

        } else{

            i++;
        }
    }

    printf("\n\nValor do MMC: %d\n", valor);

    printf("\nValor do MDC: %d\n", mdc);

    return 0;
}
