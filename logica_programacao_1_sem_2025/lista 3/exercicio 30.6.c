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

int vencedor(char x[3][3]){

    int i, j;

    for(j = 0; j < 3; j++){

        if(x[0][j] == x[1][j] && x[1][j] == x[2][j]){

            if(x[0][j] == 'X'){

                return 1;
            }
            if(x[0][j] == 'O'){

                return 2;
            }
        }
    }

    for(i = 0; i < 3; i++){

        if(x[i][0] == x[i][1] && x[i][1] == x[i][2]){

            if(x[i][0] == 'X'){

                return 1;
            }
            if(x[i][0] == 'O'){

                return 2;
            }
        }
    }

    if(x[0][0] == x[1][1] && x[1][1] == x[2][2]){

        if(x[0][0] == 'X'){

                return 1;
            }
        if(x[0][0] == 'O'){

            return 2;
        }
    }

    if(x[2][0] == x[1][1] && x[1][1] == x[0][2]){

        if(x[2][0] == 'X'){

                return 1;
            }
        if(x[2][0] == 'O'){

            return 2;
        }
    }
}

void jogo_da_velha(){

    int i, j, jogo, p;
    char x[3][3];

    for(i = 0; i < 3; i++){

        for(j = 0; j < 3; j++){

            x[i][j] = ' ';
        }
    }

    mostrar_tabuleiro(x);

    for(jogo = 0; jogo < 9; jogo++){

        if(jogo % 2 == 1){

            p = 'O';
        }
        else{

            p = 'X';
        }

        do{

            printf("Digite a linha(1, 2 ou 3):");
            scanf("%d", &i);

            printf("Digite a coluna(1, 2 ou 3):");
            scanf("%d", &j);

        } while(i > 3 || j > 3 || i < 1 || j < 1 || x[i - 1][j - 1] != ' ');

        x[i - 1][j - 1] = p;

        if(vencedor(x) == 1){

            mostrar_tabuleiro(x);

            printf("\nO 'X' ganhou!");

            return;
        }
        if(vencedor(x) == 2){

            mostrar_tabuleiro(x);

            printf("\nO 'O' ganhou!");

            return;
        }

        mostrar_tabuleiro(x);
    }

    printf("Deu velha! Ninguém venceu.");

}

int main(){

    setlocale(LC_ALL, "Portuguese");

    jogo_da_velha();

    return 0;
}



