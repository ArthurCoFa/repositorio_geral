#include <stdio.h>
#include <locale.h>

void hoje(int x[3]){

    printf("%d/%d/%d\n", x[0], x[1], x[2]);
}

int main(){

    int x[3] = {8, 6, 2025};

    setlocale(LC_ALL, "Portuguese");

    hoje(x);

    return 0;
}





