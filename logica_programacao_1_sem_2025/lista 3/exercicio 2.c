#include <stdio.h>
#include <locale.h>

int main(){

    float x[10] = {1, 6.3, 9.5, 9, 4.99};
    int i;

    setlocale(LC_ALL, "Portuguese");

    for(i = 0; i < 5; i++){

        printf("%g \n", x[i]);

    }

    return 0;
}

