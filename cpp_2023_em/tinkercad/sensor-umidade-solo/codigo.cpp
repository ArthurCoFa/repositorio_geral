// Inclusão da biblioteca para tela LCD 16x2
#include <LiquidCrystal.h>
// Declarar os pinos da tela LCD
const int RS = 12;
const int EN = 11;
const int D4 = 5;
const int D5 = 4;
const int D6 = 3;
const int D7 = 2;
// Criar um objeto "lcd" para a tela LCD
LiquidCrystal lcd(RS, EN, D4, D5, D6, D7);
// Declaração do pino conectado ao sensor
const int PINO_SENSOR = A0;
// Declaração da variável que armazena as leituras do sensor
int leitura_sensor = 0;
// Declaração das variáveis que armazenam os valores de calibração
const int VALOR_MAXIMO = 634; // Valor com solo seco
const int VALOR_MINIMO = 304; // Valor com solo úmido
// Declaração da variável que armazena a concentração mínima desejada
const int CONCENTRACAO_MINIMA = 30;
void setup() {
// Inicializar a tela LCD 16x2 com 16 colunas e 2 linhas
lcd.begin(16, 2);
// Define o pino conectado ao sensor como uma entrada do sistema
pinMode(PINO_SENSOR, INPUT);
}
void loop() {
// Realiza a leitura do sensor, mapeia entre 0 e 100 % e exibe o valor no LCD
leitura_sensor = analogRead(PINO_SENSOR);
leitura_sensor = map(leitura_sensor, VALOR_MINIMO, VALOR_MAXIMO, 0, 100); // Corrigido o mapeamento
// Limpa o conteúdo anterior na tela
lcd.clear();
// Exibe a umidade na primeira linha
lcd.setCursor(0, 0);
lcd.print("Umidade = ");
lcd.print(leitura_sensor);
lcd.print(" %");
  // Verifica se a leitura está abaixo da concentração mínima desejada
if (leitura_sensor < CONCENTRACAO_MINIMA) { // Corrigido para usar a variável CONCENTRACAO_MINIMA
// Se sim, informa na segunda linha que precisa irrigar
lcd.setCursor(0, 1);
lcd.print("Precisa Irrigar!");
delay(5000);
} else {
// Caso contrário, apenas espera 5 segundos para a próxima leitura
delay(5000);
}
}
