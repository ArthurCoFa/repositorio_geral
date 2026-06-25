#include <stdio.h>
#include <locale.h>
#include <stdlib.h>

void cria_matriz(){

    int i, j, m, n;
    int x[20][20];

    printf("Digite o número de linhas: ");
    scanf("%d", &m);

    printf("Digite o número de colunas: ");
    scanf("%d", &n);

    srand(time(NULL));

    for(i = 0; i < m; i++){
        for(j = 0; j < n; j++){

            x[i][j] = rand() % 10 - 5;
        }
    }
}

void mostra_matriz(){

    int i, m, n, j, x[20][20], res[20][20], soma[20][20];

    printf("\nOriginal: \n");

    for(i = 0; i < m; i++){

        for(j = 0; j < n; j++){

            printf("%3d ", x[i][j]);
        }
        printf("\n");
    }

    printf("\nMultiplicada por escalar: \n");

    for(i = 0; i < m; i++){

        for(j = 0; j < n; j++){

            printf("%3d ", res[i][j]);
        }
        printf("\n");
    }

    printf("\nSoma da matriz X com Y:\n");

    for(i = 0; i < m; i++){

        for(j = 0; j < n; j++){

            printf("%3d ", soma[i][j]);
        }
        printf("\n");
    }
}

void mult_por_escalar(){

    int i, m, n, j, x[20][20], res[20][20], escalar;

    printf("Digite um escalar: ");
    scanf("%d", &escalar);

    for(i = 0; i < m; i++){

        for(j = 0; j < n; j++){

            res[i][j] = x[i][j] * escalar;
        }
    }
}

void soma_matriz(){

    int i, j, m, n;
    int x[20][20], soma[20][20];
    int y[20][20] = {{1, 2, 3}, {4, 5, 6}, {7, 8, 9}};

    for(i = 0; i < m; i++){

        for(j = 0; j < n; j++){

            soma[i][j] = x[i][j] + y[i][j];
        }
    }
}

int main(){

    setlocale(LC_ALL, "Portuguese");

    cria_matriz();

    soma_matriz();

    mult_por_escalar();

    mostra_matriz();

    return 0;
}
