#include <stdio.h>
#include <locale.h>

void mostrar_tabuleiro(char x[3][3]){

    int i, j;

    for(i = 0; i < 3; i++){

        for(j = 0; j < 3; j++){

            printf("%2c", x[i][j]);

            if(j != 2){

                printf(" |");
            }
        }
        printf("\n---+---+---\n");
    }
}

int main(){

    char x[3][3] = {{'X', 'O', 'X'}, {' ', 'O', ' '}, {'X', ' ', 'O'}};

    setlocale(LC_ALL, "Portuguese");

    mostrar_tabuleiro(x);

    return 0;
}

