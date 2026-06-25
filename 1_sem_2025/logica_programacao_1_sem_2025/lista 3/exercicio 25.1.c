#include <stdio.h>
#include <locale.h>
#include <stdlib.h>

void cria_matriz(){

    int i, j, m = 3, n = 3;
    int x[20][20];

    /*printf("Digite o número de linhas: ");
    scanf("%d", &m);

    printf("Digite o número de colunas: ");
    scanf("%d", &n);*/

    srand(time(NULL));

    for(i = 0; i < m; i++){

        for(j = 0; j < n; j++){

            x[i][j] = rand() % 10 - 5;
        }
    }
}

void mult_por_escalar(){

    int i, j, m = 3, n = 3;
    int a[20][20] = {{1, 2, 3}, {4, 5, 6}, {7, 8, 9}};
    int resultado[20][20], escalar = 2;

    /*printf("Digite o número de linhas: ");
    scanf("%d", &m);

    printf("Digite o número de colunas: ");
    scanf("%d", &n);

    printf("Digite o escalar: ");
    scanf("%d", &escalar);*/

    for(i = 0; i < m; i++){

        for(j = 0; j < n; j++){

            resultado[i][j] = a[i][j] * escalar;
        }
    }
}

void mostra_matriz(){

    int i, j, m = 3, n = 3;
    int x[20][20], resultado[20][20], a[20][20];

    printf("Matriz da função cria_matriz\n");

    for(i = 0; i < m; i++){

        for(j = 0; j < n; j++){

            printf("%2d ", x[i][j]);
        }
        printf("\n");
    }

    printf("Matriz A da função mult_por_escalar\n");

    for(i = 0; i < m; i++){

        for(j = 0; j < n; j++){

            printf("%2d ", a[i][j]);
        }
        printf("\n");
    }

    printf("Matriz resultado da função mult_por_escalar\n");

    for(i = 0; i < m; i++){

        for(j = 0; j < n; j++){

            printf("%2d ", resultado[i][j]);
        }
        printf("\n");
    }
}

int main(){

    setlocale(LC_ALL, "Portuguese");

    cria_matriz();

    mult_por_escalar();

    mostra_matriz();

    return 0;
}






