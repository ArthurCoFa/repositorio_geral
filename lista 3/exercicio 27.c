#include <stdio.h>
#include <locale.h>
#include <stdlib.h>
#include <time.h>

void cria_matriz(int x[20][20], int a[20][20], int ma, int na, int mb, int nb, int b[20][20]){

    int i, j;

    srand(time(NULL));

    for(i = 0; i < ma; i++){

        for(j = 0; j < na; j++){

            a[i][j] = rand() % 6;
        }
    }

    for(i = 0; i < mb; i++){

        for(j = 0; j < nb; j++){

            b[i][j] = rand() % 6;
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

void soma_matriz(int a[20][20], int b[20][20], int soma[20][20], int m, int n){

    int i, j;

    for(i = 0; i < m; i++){

        for(j = 0; j < n; j++){

            soma[i][j] = a[i][j] + b[i][j];
        }
    }
}

void mult_mat(int a[20][20], int b[20][20], int produto[20][20], int ma, int na, int mb, int nb){

    int i, j, k, aux = 0;

    for(i = 0; i < ma; i++){

        for(j = 0; j < nb; j++){

            for(k = 0; k < mb; k++){

                aux += a[i][k] * b[k][j];
            }

            produto[i][j] = aux;
            aux = 0;
        }
    }
}

void mostra_matriz(){

    int i, j, ma, na, mb, nb, z = 0;
    int x[20][20], resultado[20][20], a[20][20], b[20][20], soma[20][20], produto[20][20];
    float escalar;

    printf("Digite o número de linhas de A: ");
    scanf("%d", &ma);

    printf("Digite o número de colunas de A: ");
    scanf("%d", &na);

    printf("Digite o número de linhas de B: ");
    scanf("%d", &mb);

    printf("Digite o número de colunas de B: ");
    scanf("%d", &nb);

    /*printf("Digite o escalar: ");
    scanf("%f", &escalar);*/

    /*soma_matriz(a, b, soma, m, n);*/

    /*mult_por_escalar(a, resultado, m, n, escalar);

    printf("Matriz X:\n");

    for(i = 0; i < m; i++){

        for(j = 0; j < n; j++){

            printf("%3d ", x[i][j]);
        }
        printf("\n");
    }*/

    if(na != mb){

        printf("\nA matriz não pode ser feita, pois o número de colunas de A não é igual ao número de linhas de B!");

    }
    else{

        cria_matriz(x, a, ma, na, mb, nb ,b);

        mult_mat(a, b, produto, ma, na, mb, nb);

        printf("\nMatriz A:\n");

        for(i = 0; i < ma; i++){

            for(j = 0; j < na; j++){

                printf("%3d ", a[i][j]);
            }
            printf("\n");
        }

        printf("\nMatriz B:\n");

        for(i = 0; i < mb; i++){

            for(j = 0; j < nb; j++){

                printf("%3d ", b[i][j]);
            }
            printf("\n");
        }

        printf("\nMatriz PRODUTO de A e B:\n");

        for(i = 0; i < ma; i++){

            for(j = 0; j < nb; j++){

                printf("%3d ", produto[i][j]);
            }
            printf("\n");
        }
    }

    /*printf("\nMatriz SOMA de A e B:\n");

    for(i = 0; i < m; i++){

        for(j = 0; j < n; j++){

            printf("%3d ", soma[i][j]);
        }
        printf("\n");
    }*/

    /*printf("\nMatriz A multiplicada por escalar:\n");

    for(i = 0; i < m; i++){

        for(j = 0; j < n; j++){

            printf("%3d ", resultado[i][j]);
        }
        printf("\n");
    }*/
}

int main(){

    setlocale(LC_ALL, "Portuguese");

    mostra_matriz();

    return 0;
}

