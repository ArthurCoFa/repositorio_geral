#include <stdio.h>
#include <locale.h>
#include <math.h>

int main(){

    /*2,2,2     2,6,5   3,7,2*/

    int a, b, c, delta;

    float x1, x2;

    setlocale(LC_ALL, "Portuguese");

    printf("Digite o valor de a: ");
    scanf("%d", &a);

    if(a == 0){

        printf("\nNão é uma equação do segundo grau!\n");
        return 0;
    }

    printf("Digite o valor de b: ");
    scanf("%d", &b);

    printf("Digite o valor de c: ");
    scanf("%d", &c);

    if(b == 0 && c == 0){

        printf("\nx = 0\n");
        return 0;
    }

    delta = b*b-4*a*c;
    x1 = (-b + sqrt(delta))/(2*a);
    x2 = (-b - sqrt(delta))/(2*a);

    if(a == 1){

        printf("\nx^2");

    } else if(a == -1){

        printf("\n-x^2");

    } else{

        printf("\n%dx^2", a);

    }
    if(b == 1){

        printf("+x");

    } else if(b == -1){

        printf("-x");

    } else{

        printf("%+dx", b);

    }
    if(c == 0){

        printf("=0\n");

    } else{

        printf("%+d=0\n", c);

    }

    printf("\ndelta = %d\n", delta);

    if(delta > 0 && fmod(sqrt(delta), 1) == 0){

            if(x1 != (int)x1 && x2 != (int)x2){

                printf("x1 = %g / %d\nx2 = %g / %d", x1*2*a, 2*a, x2*2*a, 2*a);

            } else if(x1 != (int)x1){

                if(2*a / (-b + sqrt(delta)) == (int)2*a / (-b + sqrt(delta))){

                    printf("x1 = %d / %d\n", b/b, 2*a / (-b + sqrt(delta)));

                } else{

                    printf("x1 = %g / %d\nx2 = %g\n", x1*2*a, 2*a, x2);

                }

            } else if(x2 != (int)x2){

                printf("x1 = %g\nx2 = %g / %d\n", x1, x2*2*a, 2*a);

            }

    } else if(delta > 0 && fmod(sqrt(delta), 1) != 0){

        printf("x1 = %d / %d + Raiz(%d) / %d\n", -b, 2*a, delta, 2*a);
        printf("x2 = %d / %d - Raiz(%d) / %d\n", -b, 2*a, delta, 2*a);
    }

    if(delta == 0){

        printf("x1 = x2 = %d\n", x1);

    }

    if(delta < 0){

        printf("x1 = %d / %d + (Raiz %d . i) / %d\n", -b, 2*a, delta, 2*a);
        printf("x2 = %d / %d + (Raiz %d . i) / %d\n", -b, 2*a, delta, 2*a);
    }


    return 0;
}
