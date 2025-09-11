#include <stdio.h>
#include <locale.h>
#include <stdlib.h>
#include <time.h>

void cria_matriz(int x[20][20], int m, int n){

    int i, j;

    srand(time(NULL));

    for(i = 0; i < m; i++){

        for(j = 0; j < n; j++){

            x[i][j] = rand() % 10 - 5;
        }
    }
}

void mostra_matriz(){

    int i, j, m, n;
    int x[20][20];

    printf("Digite o número de linhas: ");
    scanf("%d", &m);

    printf("Digite o número de colunas: ");
    scanf("%d", &n);

    cria_matriz(x, m, n);

    printf("Matriz X:\n");

    for(i = 0; i < m; i++){

        for(j = 0; j < n; j++){

            printf("%3d ", x[i][j]);
        }
        printf("\n");
    }
}

int main(){

    setlocale(LC_ALL, "Portuguese");

    mostra_matriz();

    return 0;
}
