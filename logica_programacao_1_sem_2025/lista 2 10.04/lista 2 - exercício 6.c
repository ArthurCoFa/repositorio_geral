#include <stdio.h>
#include <locale.h>

int main(){

    int num, tab;

    setlocale(LC_ALL, "Portuguese");

    printf("Digite um número: ");
    scanf("%d", &num);

    for(tab = 1; tab <=10; tab++){

        printf("%d x %2d = %3d\n", num, tab, num * tab);
    }

    /*

    while(tab <= 10){

        tab++;
        printf("%d x %2d = %3d\n", num, tab, tab * num);
    }

    Sim é possível fazer com while.

    */

    return 0;
}
