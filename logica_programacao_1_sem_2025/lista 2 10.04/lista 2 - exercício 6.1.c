#include <stdio.h>
#include <locale.h>

int main(){

    int num, tab;

    setlocale(LC_ALL, "Portuguese");

    printf("Digite um número: ");
    scanf("%d", &num);

    while(tab <= 10){

        tab++;
        printf("%d x %2d = %3d\n", num, tab, tab * num);
    }

    return 0;
}

//Sim, é possível fazer usando o while.
