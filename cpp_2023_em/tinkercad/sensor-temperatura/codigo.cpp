#include <LiquidCrystal.h>

LiquidCrystal LCD(12, 11, 5, 4, 3, 2);

int SensorTempPino=A0;

int AlertaTempBaixa=8;

int AlertaTempAlta=13;

int TempBaixa=0;

int TempAlta=40;

void setup(){
  pinMode(AlertaTempBaixa, OUTPUT);
  pinMode(AlertaTempAlta, OUTPUT);
  LCD.begin(16,2);
  LCD.print("Temperatura:");
  LCD.setCursor(0,1);
  LCD.print("      C        F");
}
void loop() {
  int SensorTempTensao=analogRead(SensorTempPino);
  float Tensao=SensorTempTensao*5;
  Tensao/=1024;
  float TemperaturaC=(Tensao-0.5)*100;
  float TemperaturaF=(TemperaturaC*9/5)+32;
  LCD.setCursor(0,1);
  LCD.print(TemperaturaC);
  LCD.setCursor(9,1);
  LCD.print(TemperaturaF);
if (TemperaturaC>=TempAlta) {
  		digitalWrite(AlertaTempBaixa, LOW);
  		digitalWrite(AlertaTempAlta, HIGH);
    }
  	else if (TemperaturaC<=TempBaixa){
  		digitalWrite(AlertaTempBaixa, HIGH);
  		digitalWrite(AlertaTempAlta, LOW);
  	}
  	else {
  		digitalWrite(AlertaTempBaixa, LOW);
  		digitalWrite(AlertaTempAlta, LOW);
    }
delay(1000);
}
