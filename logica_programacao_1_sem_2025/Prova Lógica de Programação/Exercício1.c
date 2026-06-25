#include <stdio.h>
#include <locale.h>

int main(){

    int ano, idade, idade50 = 2025;

    setlocale(LC_ALL, "Portuguese");

    printf("Digite o ano de nascimento: ");
    scanf("%d", &ano);

    idade = 2025 - ano;

    printf("Sua idade é %d", idade);

    if(idade < 50){

        while(idade < 50){

            idade++;
            idade50++;
        }

        printf("\nVocê fará 50 anos em %d\n", idade50);

    } else{

        while(idade > 50){

            idade--;
            idade50--;
        }

        printf("\nVocê fez 50 anos em %d\n", idade50);
    }

    return 0;
}
