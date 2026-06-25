#include <stdio.h>
#include <locale.h>

int main(){

    char *string[7] = {"arthur", "pao", "carros", "comprar", "brasil", "video", "jogos"};
    int i;

    setlocale(LC_ALL, "Portuguese");

    for(i = 0; i < 7; i++){

        printf("%s\n", string[i]);
    }

    return 0;
}


