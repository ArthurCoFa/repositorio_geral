#include <stdio.h> // Biblioteca
// Comentário de linha

/* Comentário
    de
    Bloco */

int main(){
    // Função principal
    // Variáveis, onde guarda as informações

    /* Tipos de variáveis
        int(inteiros);
        float(reais);
        char(caracteres); */
    int inteiro;
    float real;
    char caracter;

    // Declarando e inicializando a variável
    char texto[20] = "c eh facil!";//[] diz quantos caracteres pode possuir

    // Inicialização das variáveis
    inteiro =12;
    real = 3.14;
    caracter = 'c';

    // Pulando linha: \n
    printf("Hello, World! \n");  // Mostra o texto Hello, World!

    // Mostrar variáveis printf("Texto %???", nome da variável")
    printf("Inteiro: %d \n", inteiro);
    printf("Real: %f \n", real);
    printf("Caracter: %c \n", caracter);
    printf("String (texto): %s \n", texto);

    return 0; // Retorna 0, possui indentação que geralmente é obrigatória
}
