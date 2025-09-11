#include <stdio.h>
#include <locale.h>
#include <math.h>

int main(){

    int x[10] = {9, 5, 3, 4, 13, 2, 7, 11};
    int y[10], z[10], i;

    setlocale(LC_ALL, "Portuguese");

    for(i = 0; i < 8; i++){

        y[i] = floor(sqrt(x[i]));
        z[i] = ceil(sqrt(x[i]));
        printf("Floor = y[%d]: %d\t\tCeil = z[%d]: %d\n", i, y[i], i, z[i]);
    }

    return 0;
}
