#include <stdio.h>
#include <locale.h>

int eh_triangulo_retangulo(float num, float num2, float num3){

    num = pow(num, 2);
    num2 = pow(num2, 2);
    num3 = pow(num3, 2);

    if(num == num2 + num3 || num2 == num + num3 || num3 == num + num2){

        return 1;
    }
    else{

        return 0;
    }
}

int main(){

    float num, num2, num3;

    setlocale(LC_ALL, "Portuguese");

    printf("Digite 3 valores: ");
    scanf("%f%f%f", &num, &num2, &num3);

    if(eh_triangulo_retangulo(num, num2, num3)){

        printf("É triângulo retângulo!");
    }
    else{

        printf("Não é triângulo retângulo!");
    }

    return 0;
}
