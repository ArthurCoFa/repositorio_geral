#include <stdio.h>
#include <locale.h>

int main(){

    int i = 2, num;

    setlocale(LC_ALL, "Portuguese");

    printf("Digite um número: ");
    scanf("%d", &num);

    if(num == 1 || num == 0){

        printf("Não é primo");
        return 0;
    }

    while(i < num){

        if(num % i == 0){

            printf("Não é primo");
            return 0;
        }
        i++;
    }
    printf("É primo");

    return 0;
}
