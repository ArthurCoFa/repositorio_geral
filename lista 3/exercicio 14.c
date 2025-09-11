#include <stdio.h>
#include <locale.h>

int main(){

    int x[10][10] = {{7, 1, 6}, {1, 1, 7}, {3, 5, 6}};
    int i, j, soma_lin, soma_col = 0, soma_lin_total, soma_col_total = 0;

    setlocale(LC_ALL, "Portuguese");

    for(i = 0; i < 3; i++){
        for(j = 0; j < 3; j++){

            printf("%3d ", x[i][j]);
            soma_lin += x[i][j];
            soma_col += x[j][i];
        }
        soma_lin_total += soma_lin;
        soma_col_total += soma_col;

        printf("\t\t soma linha %d: %d", i + 1, soma_lin);

        printf("\t\t soma coluna %d: %d\n", i + 1, soma_col);

        soma_lin = soma_col = 0;
    }

    printf("\nSoma de todas as linhas: %d\nSoma de todas as colunas: %d", soma_lin_total, soma_col_total);


    return 0;
}

