#include <stdio.h>
#include <locale.h>

int main(){

    int dia, mes;

    setlocale(LC_ALL, "Portuguese");
    printf("Digite o dia do nascimento: ");
    scanf("%d", &dia);

    printf("Digite o mes de nascimento: ");
    scanf("%d", &mes);

    if(mes == 4){
        if((dia - 3) == 0){

            printf("Parabéns! Hoje é seu aniversário!");

        } else if((dia - 3) > 0){

            printf("Falta %d dias para o seu aniversário", dia - 3);

        } else{

            printf("Passou %d dias do seu aniversário", -(dia - 3));
        }
    } else if(mes == 5){

        printf("Falta %d dias para o seu aniversário", dia + 27);

    } else if(mes == 6){

        printf("Falta %d dias para o seu aniversário", dia + 58);

    } else if(mes == 7){

        printf("Falta %d dias para o seu aniversário", dia + 88);

    } else if(mes == 8){

        printf("Falta %d dias para o seu aniversário", dia + 119);

    } else if(mes == 9){

        printf("Falta %d dias para o seu aniversário", dia + 150);

    } else if(mes == 10){

        printf("Falta %d dias para o seu aniversário", dia + 180);

    } else if(mes == 11){

        printf("Falta %d dias para o seu aniversário", dia + 211);

    } else if(mes == 12){

        printf("Falta %d dias para o seu aniversário", dia + 241);

    } else if(mes == 1){

        printf("Passou %d dias do seu aniversário", 93 - dia);

    } else if(mes == 2){

        printf("Passou %d dias do seu aniversário", 65 - dia);

    } else if(mes == 3){

        printf("Passou %d dias do seu aniversário", 34 - dia);
    }

    return 0;
}
