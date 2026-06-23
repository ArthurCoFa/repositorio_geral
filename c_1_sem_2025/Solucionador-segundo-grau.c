#include <stdio.h>
#include <math.h>
#include <stdlib.h>

int main(){

    int a, b, c, delta, i = 2, mdc = 1, x, y;
    float x1, x2;
    char continuar;

    do{

    printf("Digite um numero para a: ");
    scanf("%d", &a);

    if(a == 0){

        printf("\nIncorresponde ao segundo grau \n");
        return 0;
    }

    printf("Digite um numero para b: ");
    scanf("%d", &b);

    printf("Digite um numero para c: ");
    scanf("%d", &c);

    delta = b*b-4*a*c;
    x1 = (-b-(int)sqrt(delta))/(2*a);
    x2 = (-b+sqrt(delta))/(2*a);

    x = a;
    y = b;

    while(i <= a || i <= b){
        if(x % i == 0 && y % i == 0){

                mdc = mdc * i;
        }
        if(x % i == 0 || y % i == 0){
            if(x % i == 0){

                x = x/i;
            }
            if(y % i == 0){

                y = y/i;
            }
        } else{

            i++;
        }
    }
    if(a==1){

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

    } else{

        printf("%+dx", b);
    }
    if(c==0){

        printf("=0\n\ndelta = %d\n", delta);

    } else{

        printf("%+d=0\n\ndelta = %d\n", c, delta);

    }
    if(delta>0 && fmod(sqrt(delta), 1) == 0){

        //printf("x1 = %g\nx2 = %g\n", x1, x2);

        if(x1 == (int)x1 && x2 != (int)x2){

            printf("x1 = %g\nx2 = %g/%d\n", x1, x2*2*a, 2*a);

        } else if(x1 != (int)x1 && x2 == (int)x2){

            printf("x1 = %g/%d\nx2 = %g\n", x1*2*a, 2*a, x2);

        } else{
            if(c == 0){

                printf("x1 = %d/%d\nx2 = 0", -b, a);

            } else

                printf("x1 = %g/%d\nx2 = %g/%d\n", -b-sqrt(delta), 2*a, x2*2*a, (2*a));
        }
    } else if(delta>0 && fmod(sqrt(delta), 1) != 0){

        if(b == 0){

            printf("x1 = - Raiz(%d)/%d", delta, 2*a);
            printf("\nx2 = Raiz(%d)/%d\n", delta, 2*a);

        } else{

            if(a < 0){
                    if(mdc > 1){
                        if((b/mdc) >= ((2*-a)/mdc)){

                            printf("x1 = %d + Raiz(%d)/%d", (b/mdc)/(-2*a/mdc), delta, -2*a);
                            printf("\nx2 = %d - Raiz(%d)/%d\n", (b/mdc)/(-2*a/mdc), delta, -2*a);

                        } else{

                            printf("x1 = %d/%d + Raiz(%d)/%d", b/mdc, (-2*a)/mdc, delta, -2*a);
                            printf("\nx2 = %d/%d - Raiz(%d)/%d\n", b/mdc, (-2*a)/mdc, delta, -2*a);
                        }
                    } else{

                        printf("x1 = %d/%d + Raiz(%d)/%d", b, -2*a, delta, -2*a);
                        printf("\nx2 = %d/%d - Raiz(%d)/%d\n", b, -2*a, delta, -2*a);
                    }
            } else{

                printf("x1 = %d/%d - Raiz(%d)/%d", -b, 2*a, delta, 2*a);
                printf("\nx2 = %d/%d + Raiz(%d)/%d\n", -b, 2*a, delta, 2*a);
            }
        }
    } else if (delta==0){

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
                    if(sqrt(abs(delta))/(2*a) != (int)sqrt(abs(delta))/(2*a)){

                        printf("x1 = %d/%d - %g.i/%d", -b, 2*a, sqrt(abs(delta)), (2*a));
                        printf("\nx2 = %d/%d + %g.i/%d\n", -b, 2*a, sqrt(abs(delta)), (2*a));

                    } else{

                        printf("x1 = %d/%d - %g.i", -b, 2*a, sqrt(abs(delta))/(2*a));
                        printf("\nx2 = %d/%d + %g.i\n", -b, 2*a, sqrt(abs(delta))/(2*a));
                    }
                }

            } else {
                if(delta<0 && fmod(sqrt(-delta), 1) != 0){
                        if(a < 0){
                                if(-2*a/b == (int)-2*a/b){

                                        if(2*a/b == 1 || 2*a/b == -1){

                                            printf("x1 = %d - (Raiz %d . i)/%d", -2*a/b, -delta, -2*a);
                                            printf("\nx2 = %d + (Raiz %d . i)/%d\n", -2*a/b, -delta, -2*a);

                                        } else{

                                            printf("x1 = %d/%d - (Raiz %d . i)/%d", b, -2*a, -delta, -2*a);
                                            printf("\nx2 = %d/%d + (Raiz %d . i)/%d\n", b, -2*a, -delta, -2*a);
                                        }
                                }
                        } else{
                            if(mdc > 1){
                                            if((b/mdc) >= (2*a/mdc)){

                                                printf("x1 = %d ccccccc- (Raiz %d . i)/%d", (-b/mdc)/(2*a), -delta, 2*a);
                                                printf("\nx2 = %d + (Raiz %d . i)/%d\n", 2*a/b, -delta, 2*a);
                                            } else{

                                                printf("x1 = %d/%d - (Raiz %d . i)/%d", -b/mdc, 2*a/mdc, -delta, 2*a);
                                                printf("\nx2 = %d/%d + (Raiz %d . i)/%d\n", -b, 2*a, -delta, 2*a);
                                            }
                                        } else{

                                            printf("x1 = %d/%d - (Raiz %d . i)/%d", -b, 2*a, -delta, 2*a);
                                            printf("\nx2 = %d/%d + (Raiz %d . i)/%d\n", -b, 2*a, -delta, 2*a);
                                        }
                        }
        } else if(delta<0 && fmod(sqrt(-delta), 1) == 0){

                printf("x1 = %d/%d - %g.i/%d", -b, 2*a, sqrt(-delta), (2*a));
                printf("\nx2 = %d/%d + %g.i/%d\n", -b, 2*a, sqrt(-delta), (2*a));
            }
        }
    }

    //printf("\n\nMDC: %d\n\n", mdc);

    printf("\nDeseja continuar(s ou n)?\n");
    scanf(" %c", &continuar);
    system("cls");

    } while(continuar == 's');

    return 0;
}

