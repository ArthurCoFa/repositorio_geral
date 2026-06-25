#include <stdio.h>
#include <locale.h>

int main(){

    int i, c = 7, j, b = 0;

    setlocale(LC_ALL, "Portuguese");

    j = c;

    for(i = 0; i < c; c--){

        if(j == c || i == c - 1){

            printf("o");

            while(i < c + 1){

                printf(" ");
                i++;
            }
            i = 0;
            printf("o\n");
        }
        else{

            while(i < b + 1){

                printf(" ");
                i++;
            }
            i = 0;
            b++;

            printf("o");

            while(i < c - 2){

                printf(" ");
                i++;
            }

            i = 0;

            printf("o\n");
        }
    }

    return 0;
}
