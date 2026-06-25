int LED_vermPED = 7;
int LED_verdPED = 4;
int LED_verm = 13;
int LED_ama = 12;
int LED_verd = 8;
int botao = 2;
int resp_botao;
int resp;
int buzzer = 3;

void setup()
{
  pinMode(LED_vermPED, OUTPUT);
  pinMode(LED_verdPED, OUTPUT);
  pinMode(LED_verm, OUTPUT);
  pinMode(LED_ama, OUTPUT);
  pinMode(LED_verd, OUTPUT);
  pinMode(botao, INPUT);
  resp = 1;
}

void loop()
{
  resp_botao = digitalRead(botao);
  if(resp_botao == HIGH){
  	   resp++; //traffic light control variable
       if(resp == 4){
       	   resp = 1;
       
       }
  
  }
  
  if(resp == 1){
  	   digitalWrite(LED_verd, HIGH);
       digitalWrite(LED_ama, LOW);
       digitalWrite(LED_verm, LOW);
    	
       digitalWrite(LED_verdPED, LOW);
       digitalWrite(LED_vermPED, HIGH);
	   delay(500);
  }
  
  if(resp == 2){
  	   digitalWrite(LED_verd, LOW);
       digitalWrite(LED_ama, HIGH);
       digitalWrite(LED_verm, LOW);
    
       digitalWrite(LED_verdPED, LOW);
       digitalWrite(LED_vermPED, HIGH);
	   delay(500);
  }
  
  if(resp == 3){
  	   digitalWrite(LED_verd, LOW);
       digitalWrite(LED_ama, LOW);
       digitalWrite(LED_verm, HIGH);
    
       digitalWrite(LED_verdPED, HIGH);
       digitalWrite(LED_vermPED, LOW);
       delay(500);
    
     tone(buzzer, 1000, 1000);  // Send 1 KHz sound signal
  delay(1000);
  }
  delay(100);
  
}
