#include <stdio.h>
#include <locale.h>

int main(){

    int num, i, c = 1, j;

    setlocale(LC_ALL, "Portuguese");

    printf("Digite um número maior que 5 : ");
    scanf("%d", &num);

    while(num < 6){

        printf("O número digitado não é maior que 5!\nTente novamente: ");
        scanf("%d", &num);

    }

    j = num;

    for(i = 0; i < num; num--){

            printf("%3dc %3d", c, num);

        while(i < num){

            printf(" ");
            i++;
        }

        i = 0;

        if(num == j){

            printf("x\n");

        } else{

            printf("x");

            while(i < c){

                if(j/2 == num){

                    printf("x");

                } else{

                    printf(" ");

                }

                i++;
            }

            i = 0;
            c += 2;

            printf("x\n");
        }
    }

    return 0;
}

