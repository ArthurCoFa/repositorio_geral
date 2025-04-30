#include <stdio.h>
#include <locale.h>

int main(){

    int i, num;

    setlocale(LC_ALL, "Portuguese");

    printf("Digite um número: ");
    scanf("%d", &num);

    if(num == 1 || num == 0){

        printf("Não é primo");
        return 0;
    }

    for(i = 2; i < num; i++){

        if(num % i == 0){

            printf("Não é primo");
            return 0;
        }
    }
    printf("É primo");

    return 0;
}

