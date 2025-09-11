#include <stdio.h>
#include <locale.h>

int main(){

    int num;

    setlocale(LC_ALL, "Portuguese");

    printf("Digite uma nota entre 0 e 10: ");
    scanf("%d", &num);

    while(num < 0 || num > 10){

        printf("Você não digitou uma nota entre 0 e 10.\nTente novamente\n");
        scanf("%d", &num);
    }

    return 0;
}
