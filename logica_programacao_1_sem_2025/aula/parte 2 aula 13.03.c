#include <stdio.h>

int main(){
    float num;

    printf("Digite um numero: ");

    // Entrada manual de dados, dentro do () é com %??? e & nome da variável
    scanf("%f", &num);

    // Mostrando o número digitado, mesma maneira do scanf, mas sem o &
    printf("\n%f", num);


    return 0;
}
