#include <stdio.h>
#include <locale.h>

int main(){

    int a[10] = {2, 5 ,6, 3, 9, 8};
    int i;

    setlocale(LC_ALL, "Portuguese");

    for(i = 0; i < 6; i++){

        printf("%d ", a[i]);
    }

    return 0;
}

