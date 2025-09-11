#include <stdio.h>
#include <locale.h>

int main(){

    setlocale(LC_ALL, "Portuguese");

    int x[20] = {0, 0, 0, 0, 0, 0, 0, 0, 0}, i;

    printf("Digite 10 números: ");

    for(i = 0; i < 10; i++){

        scanf("%d", &x[i]);

        while(x[i] == x[0] || x[i] == x[1] ||x[i] == x[2] ||x[i] == x[3] ||x[i] == x[4] ||x[i] == x[5] ||x[i] == x[6] ||x[i] == x[7] ||x[i] == x[8] || x[i] == x[9]){

            printf("Você repetiu um número!\nTente novamente: ");
            scanf("%d", &x[i]);
        }
    }


    return 0;
}
