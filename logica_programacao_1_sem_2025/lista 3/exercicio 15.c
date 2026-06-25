#include <stdio.h>
#include <locale.h>
#include <stdlib.h>
#include <time.h>

int main(){

    int linhas, colunas, i, j;

    setlocale(LC_ALL, "Portuguese");

    printf("Digite o número de linhas: ");
    scanf("%d", &linhas);

    printf("Digite o número de colunas: ");
    scanf("%d", &colunas);

    srand(time(NULL));

    for(i = 0; i < linhas; i++){
        for(j = 0; j < colunas; j++){

            printf("%3d ", rand() % 10);
        }
        printf("\n");
    }

    return 0;
}


