#include <stdio.h>
#include <locale.h>

int main(){

    setlocale(LC_ALL, "Portuguese");
    printf("Seu primeiro nome é: Arthur.\n");

    return 0;
}
