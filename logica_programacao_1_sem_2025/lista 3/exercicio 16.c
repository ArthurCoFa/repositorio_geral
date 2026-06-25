#include <stdio.h>
#include <locale.h>

void cumprimenta(){

    printf("Olá mundo!\n");
}

int main(){

    setlocale(LC_ALL, "Portuguese");

    cumprimenta();

    return 0;
}



