#include <stdio.h>
#include <locale.h>
#include <stdlib.h>

void mostra_matriz(){

    int i, j, m, n;
    int x[20][20];

    printf("Digite o número de linhas: ");
    scanf("%d", &m);

    printf("Digite o número de colunas: ");
    scanf("%d", &n);

    /*for(i = 0; i < m; i++){
        for(j = 0; j < n; j++){

            printf("Digite um número na linha %d e coluna %d: ", i + 1, j + 1);
            scanf("%d", &x[i][j]);
        }

    }*/
    for(i = 0; i < m; i++){

        for(j = 0; j < n; j++){

            printf("%2d ", x[i][j]);
        }
        printf("\n");
    }
}

void cria_matriz(){

    int i, j, m, n;
    int x[20][20];

    /*printf("Digite o número de linhas: ");
    scanf("%d", &m);

    printf("Digite o número de colunas: ");
    scanf("%d", &n);*/

    srand(time(NULL));

    for(i = 0; i < m; i++){
        for(j = 0; j < n; j++){
            x[i][j] = (rand() % 10) - 5;
            printf("%3d ", (rand() % 10) - 5);
        }
        printf("\n");
    }

}

int main(){

    setlocale(LC_ALL, "Portuguese");

    mostra_matriz();

    return 0;
}




