#include <stdio.h>
#include <locale.h>

void mostra_array(int x[20], int n){

    int i;

    for(i = 0; i < n; i++){

        printf("Digite o número %d: ", i + 1);
        scanf("%d", &x[i]);
    }

    printf("\nSeu array\n");

    for(i = 0; i < n; i++){

        printf("%2d ", x[i]);
    }
}


int main(){

    int n, x[20];

    setlocale(LC_ALL, "Portuguese");

    printf("Digite o número de elementos: ");
    scanf("%d", &n);

    mostra_array(x, n);

    return 0;
}
