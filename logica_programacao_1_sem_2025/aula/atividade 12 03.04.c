#include <stdio.h>
#include <locale.h>
#include <string.h>

int main(){

    char p1[20], p2[20], p3[20];

    setlocale(LC_ALL, "Portuguese");
    printf("Digite 3 palavras: ");
    scanf("%s %s %s", p1, p2, p3);

    if(strcmp(p1, p2) < 0 && strcmp(p1, p3) < 0){

            if(strcmp(p2, p3) < 0){

                printf("Ordem alfabética: %s, %s, %s\n", p1, p2, p3);

            } else{

                printf("Ordem alfabética: %s, %s, %s\n", p1, p3, p2);

            }
    } else if(strcmp(p2, p3) < 0 && strcmp(p2, p1) < 0){

        if(strcmp(p3, p1) < 0){

            printf("Ordem alfabética: %s, %s, %s\n", p2, p3, p1);

        } else {

            printf("Ordem alfabética: %s, %s, %s\n", p2, p1, p3);

        }
    } else{

        if(strcmp(p1, p2) < 0){

            printf("Ordem alfabética: %s, %s, %s\n", p3, p1, p2);

        } else{

            printf("Ordem alfabética: %s, %s, %s\n", p3, p2, p1);

        }
    }

    return 0;
}
