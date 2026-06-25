#include <stdio.h>
#include <locale.h>
#include <math.h>

float hipotenusa(float cat, float cat2){

    return sqrt((pow(cat, 2) + pow(cat2, 2)));
}

int main(){

    setlocale(LC_ALL, "Portuguese");

    printf("A hipotenusa é %g", hipotenusa(3, 4));

    return 0;
}






