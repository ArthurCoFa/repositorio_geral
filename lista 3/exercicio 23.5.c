#include <stdio.h>
#include <locale.h>

void mostra_matriz(){

    int i, j, m, n;
    int x[20][20] = {{1, 2, 3}, {4, 5, 6}, {7, 8, 9}};

    printf("Digite o número de linhas: ");
    scanf("%d", &m);

    printf("Digite o número de colunas: ");
    scanf("%d", &n);

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
