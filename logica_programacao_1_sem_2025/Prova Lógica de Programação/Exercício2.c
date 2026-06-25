#include <stdio.h>
#include <locale.h>

int main(){

    int num, pos = 0, neg = 0;

    setlocale(LC_ALL, "Portuguese");

    do{

        printf("Digite um número: ");
        scanf("%d", &num);

        if(num > 0){

            pos++;

        }
        if(num < 0){

            neg++;
        }

    } while(num != 0);

    printf("A quantidade de números positivos é %d e a de negativos é %d\n\n", pos, neg);

    if(pos > neg){

        printf("Existem mais números positivos que negativos\n");

    } else if(neg > pos){

        printf("Existem mais números negativos que positivos\n");

    } else{

        printf("A quantidade de números positivos e negativos é igual\n");
    }

    return 0;
}
