#include <stdio.h>
#include <locale.h>

int main(){

    int a, b, c;

    setlocale(LC_ALL, "Portuguese");
    printf("Digite 3 números: ");
    scanf("%d %d %d", &a, &b, &c);

    if(a > b && a > c){
            if(b > c){

                printf("%d %d %d", c, b, a);
            } else{

                printf("%d %d %d", b, c, a);
            }
    } else if(b > c && b > a){
        if(c > a){

            printf("%d %d %d", a, c, b);

        } else{

            printf("%d %d %d", c, a, b);
        }
    } else{
        if(a > b){

            printf("%d %d %d", b, a, c);

        } else{

            printf("%d %d %d", a, b, c);
        }
    }

    return 0;
}

