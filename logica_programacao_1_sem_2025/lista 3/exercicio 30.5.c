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

int vencedor(char x[3][3], int lin, int col, char b){

    if(x[lin][col] != ' '){

        if(x[lin - 1][0] == x[lin - 1][1] && x[lin - 1][1] == x[lin - 1][2]){

            if(b == 'X'){

                return 1;
            }
            if(b == 'O'){

                return 2;
            }
        }
        else{

            if(x[0][col - 1] == x[1][col - 1] && x[1][col - 1] == x[2][col - 1]){

                if(b == 'X'){

                    return 1;
                }
                if(b == 'O'){

                    return 2;
                }
            }
            else{

                if(lin == col && x[0][0] == x[1][1] && x[1][1] == x[2][2]){

                    if(b == 'X'){

                        return 1;
                    }
                    if(b == 'O'){

                        return 2;
                    }
                }
                else{

                    if(lin + col == 4 && x[0][2] == x[1][1] && x[1][1] == x[2][0]){

                        if(b == 'X'){

                            return 1;
                        }
                        if(b == 'O'){

                            return 2;
                        }
                    }
                }
            }
        }
    }
}

void jogo_da_velha(){

    int lin, col, k = 0;
    char b, x[3][3];

    for(lin = 0; lin < 3; lin++){

        for(col = 0; col < 3; col++){

            x[lin][col] = ' ';
        }
    }

    mostrar_tabuleiro(x);

    for(k = 1; k <= 9; k++){

        if(k % 2 == 1){

            b = 'X';
        }
        else{

            b = 'O';
        }

        do{

            printf("Digite a linha para o '%c': ", b);
            scanf("%d %d", &lin, &col);

        } while(x[lin - 1][col - 1] != ' ' || lin > 4 || lin < 1 || col > 4 || lin < 1);

        x[lin - 1][col - 1] = b;

        mostrar_tabuleiro(x);

        if(vencedor(x, lin, col, b) == 1){

            printf("O vencedor foi '%c'!", b);

            return;
        }
        if(vencedor(x, lin, col, b) == 2){

            printf("O vencedor foi '%c'!", b);

            return;
        }
    }
    printf("Não teve vencedor, deu velha.");
}

int main(){

    char x[3][3];

    setlocale(LC_ALL, "Portuguese");

    jogo_da_velha(x);

    return 0;
}
