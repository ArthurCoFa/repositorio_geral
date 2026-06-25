#include <stdio.h>
#include <locale.h>

int main(){

    int x[20] = {1, 6, 0, 5, -9, 3, -5, 8, 2, -1};
    int y[20], z[20];
    int i, c = 0, j = 0;

    setlocale(LC_ALL, "Portuguese");

    for(i = 0; i < 10; i++){

        if(x[i] > 0){

            y[c] = x[i];
            c++;
        }
        if(x[i] < 0){

            z[j] = x[i];
            j++;
        }
    }

    printf("Original\n");

    for(i = 0; i < 10; i++){

        printf("%d ", x[i]);

    }

    printf("\nnúmeros positivos\n");

    for(i = 0; i < c; i++){

        printf("%d ", y[i]);

    }

    printf("\nnúmeros negativos\n");

    for(i = 0; i < j; i++){

        printf("%d ", z[i]);

    }

    return 0;
}



