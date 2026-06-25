#include <stdio.h>
#include <locale.h>
#include <math.h>

int main(){

    /*2,2,2     2,6,5   3,7,2  231 = 1*/

    float a, b, c, delta, x1, x2;

    setlocale(LC_ALL, "Portuguese");

    printf("Digite o valor de a: ");
    scanf("%f", &a);

    if(a == 0){

        printf("\nNão é uma equação do segundo grau!\n");
        return 0;
    }

    printf("Digite o valor de b: ");
    scanf("%f", &b);

    printf("Digite o valor de c: ");
    scanf("%f", &c);

    if(b == 0 && c == 0){

        printf("\nx = 0\n");
        return 0;
    }

    delta = b*b-4*a*c;
    x1 = (-b + sqrt(delta))/(2*a);
    x2 = (-b - sqrt(delta))/(2*a);

    if(a == 1){

        printf("\nx^2");

    }
    else if(a == -1){

        printf("\n-x^2");

    }
    else{

        printf("\n%gx^2", a);

    }

    if(b == 1){

        printf("+x");

    }
    else if(b == -1){

        printf("-x");

    }
    else{

        printf("%+gx", b);

    }
    if(c == 0){

        printf("=0\n");

    }
    else{

        printf("%+g=0\n", c);

    }
    printf("\ndelta = %g\n", delta);

    if(delta > 0 && fmod(sqrt(delta), 1) == 0 && c != 0){

        if(fmod(x1, 1) != 0 && fmod(x2, 1) == 0){

            if(2 * a/ - b + sqrt(delta) == (int)2 * a/ - b + sqrt(delta)){

                printf("x1 = %g / %g\nx2 = %g", -(-b + sqrt(delta)) / (-b + sqrt(delta)), -(2 * a)/(-b + sqrt(delta)), x2);
            }
            else{

                printf("x1 = %g / %g\nx2 = %g", -b + sqrt(delta), 2 * a, x2);
            }
        }
        else if(fmod(x2, 1) != 0 && fmod(x1, 1) == 0 || x2 != (int)x2){

            if(2 * a/ - b - sqrt(delta) == (int)2 * a/ - b - sqrt(delta)){

                printf("x1 = %g / %g\nx2 = %g", x1,-(-b + sqrt(delta)) / (-b - sqrt(delta)), -(2 * a)/(-b - sqrt(delta)));
            }
            else{

                printf("x1 = %g\nx2 = %g / %g", x1, -b - sqrt(delta), 2 * a);
            }
        }
        else if(fmod(x2, 1) != 0 && fmod(x1, 1) != 0){

            printf("x1 = %g / %g\nx2 = %g / %g", -b + sqrt(delta), 2 * a, -b - sqrt(delta), 2 * a);
        }
        else{

            printf("x1 = %g\nx2 = %g", x1, x2);
        }
    }

    if(c == 0 && fmod(-b/a, 1) != 0){

        printf("x1 = 0\nx2 = %g/%g", -b, a);
    }
    if(c == 0 && fmod(-b/a, 1) == 0){

        printf("x1 = 0\nx2 = %g", -b/a);
    }

    return 0;
}

