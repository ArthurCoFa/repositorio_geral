#include <stdio.h>
#include <locale.h>

int main(){

    int num;

    setlocale(LC_ALL, "Portuguese");
    printf("Digite um número: ");
    scanf("%d", &num);

    printf("%d * 1 = %d\n", num, num);
    printf("%d * 2 = %d\n", num, num * 2);
    printf("%d * 3 = %d\n", num, num * 3);
    printf("%d * 4 = %d\n", num, num * 4);
    printf("%d * 5 = %d\n", num, num * 5);
    printf("%d * 6 = %d\n", num, num * 6);
    printf("%d * 7 = %d\n", num, num * 7);
    printf("%d * 8 = %d\n", num, num * 8);
    printf("%d * 9 = %d\n", num, num * 9);
    printf("%d * 10 = %d\n", num, num* 10);

    return 0;
}
