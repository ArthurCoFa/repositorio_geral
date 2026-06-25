#include <stdio.h>
#include <locale.h>

void mostrar_tabuleiro(int x[20][20]){

    int i, j;

    for(i = 0; i < 3; i++){

        for(j = 0; j < 3; j++){

            printf("%2d", x[i][j]);

            if(j != 2){

                printf(" |");
            }
        }
        printf("\n---+---+---\n");
    }
}

int main(){

    int x[20][20] = {{1, 2, 3}, {4, 5, 6}, {7, 8, 9}};

    setlocale(LC_ALL, "Portuguese");

    mostrar_tabuleiro(x);

    return 0;
}
