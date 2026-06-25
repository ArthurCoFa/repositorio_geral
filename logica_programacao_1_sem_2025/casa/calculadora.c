#include <stdio.h>
#include <string.h> //comparar strings
#include <math.h>
#include <stdlib.h> //clear no terminal

int fatorial(int n){
    if(n<=0){
        return 1;
    } else{
        return (n * fatorial(n - 1));
    }
}

int main(){

    float a, b, resultado;
    char operacao[20], continuar;
    double radianos;

    do{

    printf("Digite um numero : ");
    scanf("%f", &a);

    printf("Digite a operacao(soma, subtracao, divisao, multiplicacao, potencia, raiz, modulo(resto), logab, ln, log10, sen, cos, tan ou fatorial): \nNo caso do logab o valor eh o resultado e o segundo a base\n");
    scanf("%s", operacao);

    radianos = a*M_PI/180.0;

    if(strcmp(operacao, "raiz") == 0 || strcmp(operacao, "ln") == 0 || strcmp(operacao, "log10") == 0 || strcmp(operacao, "sen") == 0 || strcmp(operacao, "cos") == 0 || strcmp(operacao, "tan") == 0 || strcmp(operacao, "fat") == 0){

    } else{

        printf("Digite o segundo numero: ");
        scanf("%f", &b);
    }

    if(strcmp(operacao, "soma") == 0 || strcmp(operacao, "+") == 0){

        resultado = a + b;

    } else if(strcmp(operacao, "potencia") == 0 || strcmp(operacao, "^") == 0){

        resultado = pow(a, b);

    } else if(strcmp(operacao, "subtracao") == 0 || strcmp(operacao, "-") == 0){

        resultado = a - b;

    } else if(strcmp(operacao, "divisao") == 0 || strcmp(operacao, "/") == 0){

        if(b == 0){

            printf("O segundo numero eh igual a 0!\n");
            return 0;

        } else{

            resultado = a / b;
        }

    } else if(strcmp(operacao, "multiplicacao") == 0 || strcmp(operacao, "*") == 0){

        resultado = a * b;

    } else if(strcmp(operacao, "raiz") == 0){

        if(a >= 0){

        resultado = sqrt(a);

        } else {

            if(fmod(sqrt(-a), 1) == 0){

                printf("\n%g . i\n", sqrt(-a));
                return 0;

            } else {

            printf("\nRaiz %g . i\n", -a);
            return 0;
            }
        }

    } else if(strcmp(operacao, "modulo") == 0 || strcmp(operacao, "resto") == 0){

        resultado = (int)a % (int)b;

    } else if(strcmp(operacao, "ln") == 0){

        resultado = log(a);

    } else if(strcmp(operacao, "log10") == 0){

        resultado = log10(a);

    } else if(strcmp(operacao, "logab") == 0){

        resultado = (log(a))/(log(b));

    } else if(strcmp(operacao, "sen") == 0){

        resultado = sin(radianos);

    } else if(strcmp(operacao, "cos") == 0){

        resultado = cos(radianos);

    } else if(strcmp(operacao, "tan") == 0){

        resultado = tan(radianos);

    } else if(strcmp(operacao, "fat") == 0){

        if(a<0){

            printf("Nao existe fatorial de numero negativo!\n");

            return 0;

        } else{

            printf("%d", fatorial(a));
            return 0;
        }
    }

    printf("\nresultado = %g\n", resultado);

    printf("Deseja fazer outra conta(s ou n)?\n");
    scanf(" %c", &continuar);

    system("cls");

} while(continuar == 's');

    return 0;
}

