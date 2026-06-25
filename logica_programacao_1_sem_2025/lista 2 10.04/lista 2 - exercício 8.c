#include <stdio.h>
#include <locale.h>

int main(){

    int num, i, valor = 1;

    setlocale(LC_ALL, "Portuguese");

    printf("Digite um número positivo: ");
    scanf("%d", &num);

    while(num < 0){

        printf("Esse número é negativo, digite outro: ");
        scanf("%d", &num);
    }

    for(i = 1; i <= num; i++){

        valor = valor * i;
    }

    printf("%d! = %d\n", num, valor);

    return 0;
}
