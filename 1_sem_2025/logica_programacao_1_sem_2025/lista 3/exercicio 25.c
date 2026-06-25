#include <stdio.h>
#include <locale.h>
#include <stdlib.h>
#include <time.h>

void cria_matriz(int x[20][20], int a[20][20], int m, int n){

    int i, j;

    srand(time(NULL));

    for(i = 0; i < m; i++){

        for(j = 0; j < n; j++){

            x[i][j] = rand() % 11 - 5;
            a[i][j] = rand() % 11;
        }
    }
}

void mult_por_escalar(int a[20][20], int resultado[20][20], int m, int n, float escalar){

    int i, j;

    for(i = 0; i < m; i++){

        for(j = 0; j < n; j++){

            resultado[i][j] = a[i][j] * escalar;
        }
    }
}

void mostra_matriz(){

    int i, j, m, n;
    int x[20][20], resultado[20][20], a[20][20];
    float escalar;

    printf("Digite o número de linhas: ");
    scanf("%d", &m);

    printf("Digite o número de colunas: ");
    scanf("%d", &n);

    printf("Digite o escalar: ");
    scanf("%f", &escalar);

    cria_matriz(x, a, m, n);

    mult_por_escalar(a, resultado, m, n, escalar);

    /*printf("Matriz X:\n");

    for(i = 0; i < m; i++){

        for(j = 0; j < n; j++){

            printf("%3d ", x[i][j]);
        }
        printf("\n");
    }*/

    printf("\nMatriz A:\n");

    for(i = 0; i < m; i++){

        for(j = 0; j < n; j++){

            printf("%3d ", a[i][j]);
        }
        printf("\n");
    }

    printf("\nMatriz A multiplicada por escalar:\n");

    for(i = 0; i < m; i++){

        for(j = 0; j < n; j++){

            printf("%3d ", resultado[i][j]);
        }
        printf("\n");
    }
}

int main(){

    setlocale(LC_ALL, "Portuguese");

    mostra_matriz();

    return 0;
}
