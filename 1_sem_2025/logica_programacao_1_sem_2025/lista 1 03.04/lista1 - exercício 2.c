#include <stdio.h>
#include <locale.h>

int main(){

    char nome[20], sobrenome[20];

    setlocale(LC_ALL, "Portuguese");

    printf("Digite seu primeiro nome: ");
    scanf("%s", nome);

    printf("Digite seu sobrenome: ");
    scanf("%s", sobrenome);

    printf("\nSeu nome é %s %s.\n", nome, sobrenome);

    return 0;
}

