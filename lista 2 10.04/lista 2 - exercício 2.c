#include <stdio.h>
#include <locale.h>

int main(){

    int num, cont_p = 0, cont_n = 0;

    setlocale(LC_ALL, "Portuguese");

    do{
        printf("Digite um número: ");
        scanf("%d", &num);

        if(num > 0){

            cont_p++;

        } else if(num < 0){

            cont_n++;
        }
    } while(num != 0);

    printf("\nForam contados %d números positivos e %d números negativos.\n", cont_p, cont_n);

    return 0;
}
