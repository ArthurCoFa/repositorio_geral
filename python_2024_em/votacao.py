# definição das variáveis
candidatos = ["João","Maria","Pedro"]
votos = [0,0,0]

#Função para adicionar um voto a um candidato
def adicionar_votos(candidato):
  if candidato in candidatos:
    votos[candidatos.index(candidato)] += 1
  else:
      print("candidato inválido")

# função para exibir o resultado da eleição
def exibir_resultado():
  for i in range(len(candidatos)):
    print(f"{candidatos[i]}: {votos[i]} votos")

#loop para permitir que os eleitores votem
while True:
  print("escolha o seu candidato preferido:")
  for i in range(len(candidatos)):
    print(f"{i + 1}. {candidatos[i]}")
  print("0. Sair")
  escolha = int(input())
  if escolha == 0:
    break
  elif escolha > 0 and escolha <= len(candidatos):
    adicionar_votos(candidatos[escolha - 1])
  else:
    print("opção inválida")

# exibição dos resultados da eleição
exibir_resultado()
