#include <stdio.h>
#include <locale.h>

int main(){

    int n1, n2, n3;

    setlocale(LC_ALL, "Portuguese");
    printf("Digite 3 números: ");
    scanf("%d %d %d", &n1, &n2, &n3);

    if(n1 > n2 && n1 > n3){

        printf("%d é o maior", n1);

    } else if(n2 > n3 && n2 > n1){

        printf("%d é o maior", n2);

    } else{

        printf("%d é o maior", n3);

    }

    return 0;
}
