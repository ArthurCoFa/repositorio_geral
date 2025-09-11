#include <stdio.h>
#include <string.h>
#include <math.h>

int fatorial(int n){
    if(n<=0){
        return 1;
    } else{
        return (n * fatorial(n - 1));
    }
}

int main(){

    float num1, num2, resultado, x1, x2;
    char operacao[20], continuar;
    double radianos;
    int a, b, c, delta;

    do{

        printf("Digite a operacao que deseja: \n");
        scanf("%s", operacao);

        if(strcmp(operacao, "segundo") == 0){

            printf("Digite um numero para a: ");
            scanf("%d", &a);

            printf("Digite um numero para b: ");
            scanf("%d", &b);

            printf("Digite um numero para c: ");
            scanf("%d", &c);

            delta = b*b-4*a*c;
            x1 = (-b-(int)sqrt(delta))/(2*a);
            x2 = (-b+sqrt(delta))/(2*a);

            if(a==0){

                printf("\nIncorresponde ao segundo grau \n");

                return 0;

            } else if(a==1){

                printf("\nx^2");

                } else if(a==-1){

                    printf("\n-x^2");

                    } else {

                        printf("\n%dx^2", a);

                    }

            if(b==0){

            } else if(b==1){

                printf("+x");

                } else if(b==-1){


                    printf("-x");

                    } else if(b>0){

                        printf("+%dx", b);

                        } else {

                            printf("%dx", b);

                            }

            if(c==0){

                printf("=0\n\ndelta = %d\n", delta);

                } else if(c>0){

                    printf("+%d=0\n\ndelta = %d\n", c, delta);

                    } else{

                        printf("%d=0\n\ndelta = %d\n", c, delta);

                        }

            if(delta>0 && fmod(sqrt(delta), 1) == 0){

                printf("x1 = %g\nx2 = %g\n", x1, x2);

                } else if(delta>0 && fmod(sqrt(delta), 1) !=0){

                    printf("x1 = %d/%d - Raiz(%d)/%d", -b, 2*a, delta, 2*a);
                    printf("\nx2 = %d/%d + Raiz(%d)/%d\n", -b, 2*a, delta, 2*a);

                    } else if (delta == 0){

                        printf("x1 = x2 = %g\n", x1);

                        } else if (b == 0){

                            if(delta==4 || delta==-4){

                                printf("x1 = - i");
                                printf("\nx2 = i\n");

                                } else if (delta<0 && fmod(sqrt(-delta), 1) != 0){

                                    printf("x1 = -(Raiz %d . i)/%d", -delta, 2*a);
                                    printf("\nx2 = (Raiz %d . i)/%d\n", -delta, 2*a);

                                    } else if(delta<0 && fmod(sqrt(-delta), 1) == 0){

                                        printf("x1 = - %g.i", sqrt(-delta)/(2*a));
                                        printf("\nx2 = %g.i\n", sqrt(-delta)/(2*a));
                                        }

                            } else if(b!=0){

                                if(delta == 4 || delta == -4){

                                    if(a == 1){

                                        printf("x1 = %d/%d - i", -b, 2*a);
                                        printf("\nx2 = %d/%d + i\n", -b, 2*a);

                                        } else{

                                            printf("x1 = %d/%d - %g.i", -b, 2*a, sqrt(abs(delta))/(2*a));
                                            printf("\nx2 = %d/%d + %g.i\n", -b, 2*a, sqrt(abs(delta))/(2*a));

                                            }

                                } else{

                                    if (delta<0 && fmod(sqrt(-delta), 1) != 0){

                                        printf("x1 = %d/%d - (Raiz %d . i)/%d", -b, 2*a, -delta, 2*a);
                                        printf("\nx2 = %d/%d + (Raiz %d . i)/%d\n", -b, 2*a, -delta, 2*a);

                                    } else if(delta<0 && fmod(sqrt(-delta), 1) == 0){

                                        printf("x1 = %d/%d - %g.i", -b, 2*a, sqrt(-delta)/(2*a));
                                        printf("\nx2 = %d/%d + %g.i\n", -b, 2*a, sqrt(-delta)/(2*a));

                                        }
                                    }
                                }

                                return 0;

                            } else{

        printf("Digite um valor: ");
        scanf("%f", num1);

        radianos = num1 * M_PI / 180.0;

        if(strcmp(operacao, ("soma") == 0) || strcmp(operacao, ("sub") == 0) || strcmp(operacao, ("div") == 0) || strcmp(operacao, ("x") == 0) || strcmp(operacao, ("pot") == 0) || strcmp(operacao, ("resto") == 0) || strcmp(operacao, ("logab") == 0)){

            printf("digite o segundo valor: ");
            scanf("%f", num2);

            if(strcmp(operacao, "soma") == 0){

                resultado = a + b;

                } else if(strcmp(operacao, "potencia") == 0){

                    resultado = pow(a, b);

                    } else if(strcmp(operacao, "subtracao") == 0){

                        resultado = a - b;

                        } else if(strcmp(operacao, "divisao") == 0){

                            if(b == 0){

                                printf("O segundo numero eh igual a 0!\n");

                                return 0;

                                } else{

                                    resultado = a / b;

                                    }

                            } else if(strcmp(operacao, "multiplicacao") == 0){

                                resultado = a * b;

                                }

                }

            }


    } while(continuar == 's');

    return 0;

}
