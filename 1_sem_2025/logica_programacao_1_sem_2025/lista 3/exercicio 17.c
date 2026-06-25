#include <stdio.h>
#include <locale.h>

void bom_dia(char nome[20]){

    printf("Bom dia %s\n", nome);
}

int main(){

    setlocale(LC_ALL, "Portuguese");

    bom_dia("Arthur");

    return 0;
}




