#include <stdio.h>
#include <locale.h>

int main(){

    int x[10][10] = {{7, 1, 6}, {1, 1, 7}, {3, 5, 6}};
    int i, j;

    setlocale(LC_ALL, "Portuguese");

    for(i = 0; i < 3; i++){
        for(j = 0; j < 3; j++){

            printf("%3d ", x[i][j]);
        }
        printf("\n");

    }

    return 0;
}


