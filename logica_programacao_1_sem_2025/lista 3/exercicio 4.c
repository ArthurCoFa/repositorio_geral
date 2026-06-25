#include <stdio.h>
#include <locale.h>

int main(){

    int x[10] = {1000, 9, 3, 121, 2, 4, -12};
    int i, c, b;

    setlocale(LC_ALL, "Portuguese");

    for(i = 0; i < 7; i++){

        if(x[i] < c){

            c = x[i];
        }
        if(x[i] > b){

            b = x[i];
        }
    }

    printf("maior: %d\nmenor: %d", b, c);

    return 0;
}



