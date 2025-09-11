#include <stdio.h>
#include <locale.h>
#include <math.h>

float hipotenusa(){

    float cat, cat2;

    printf("Digite o valor do cateto 1: ");
    scanf("%f", &cat);

    printf("Digite o valor do cateto 2: ");
    scanf("%f", &cat2);

    return sqrt((pow(cat, 2) + pow(cat2, 2)));

}

int main(){

    setlocale(LC_ALL, "Portuguese");

    printf("A hipotenusa é : %g", hipotenusa());

    return 0;
}
