#include <stdio.h>
#include <locale.h>

void mostra_matriz(){

    int i, j, m = 3, n = 3;
    int x[20][20] = {{1, 2, 3}, {4, 5, 6}, {7, 8, 9}};

    for(i = 0; i < m; i++){

        for(j = 0; j < n; j++){

            printf("%2d ", x[i][j]);
        }
        printf("\n");
    }
}

int main(){

    setlocale(LC_ALL, "Portuguese");

    mostra_matriz();

    return 0;
}




