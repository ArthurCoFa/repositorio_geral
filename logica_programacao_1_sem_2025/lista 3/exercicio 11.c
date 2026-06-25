#include <stdio.h>
#include <locale.h>

int main(){

    int x[30] = {2, 9, 7, 5, 6, 3, 1, 5, 2, 6, 4, 5, 2, 8, 8, 3, 2, 1, 6, 4};/* 2 = 4; 9 = 1; 7 = 1; 5 = 3; 6 = 3; 3 = 2; 1 = 2; 4 = 2; 8 = 2 */
    int i, j, qtd = 0, c = 0, b = 0, z = 0;

    setlocale(LC_ALL, "Portuguese");

    for(i = 0; i < 20; i++){

        for(j = 0; j < 20; j++){

            if(x[i] == x[j]){

                qtd++;
            }
        }

        b++;

        for(c = b; c > 0; c--){

            if(x[i] == x[i - c]){

                z++;
            }
        }

        if(z >= 1){

        }
        else{

            printf("Número: %d e quantidade de vezes que aparece: %d\n", x[i], qtd);
        }
        qtd = 0;
        z = 0;
    }

    return 0;
}
