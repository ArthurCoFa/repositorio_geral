#include <stdio.h>
#include <locale.h>

int main(){

    int num, i = 0, a = 1, b = 1, total;

    setlocale(LC_ALL, "Portuguese");

    printf("Digite um número: ");
    scanf("%d", &num);

    while(i < num){
        printf("%d ", a);
        total = a + b;
        a = b;
        b = total;
        i++;
    }

    return 0;
}

