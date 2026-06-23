#inicialmente, vamos criar uma lista com os números sorteados
sorteio = [59, 34, 4, 58, 10, 5]

# em seguida, vamos criar uma lista com os jogos a serem verificados
jogos = [
    [1, 2, 4, 7, 32, 54], #jogo do lincoln
    [4, 9, 15, 25, 28, 55], #jogo do lincoln
    [1, 3, 9, 15, 18, 50], #jogo do jaci
    [2, 5, 20, 25, 28, 40], #jogo do jaci
    [2, 8, 27, 34, 45, 58], #jogo da thays
    [3, 18, 27, 33, 47, 48], #jogo da thays
    [22, 50, 18, 48, 51, 10], #jogo da amanda
    [33, 6, 18, 48, 50, 17], #jogo da amanda
]
#agora, vamos percorrer a lista de jogos e verificar quantos números foram sorteados em a cada jogo
for jogo in jogos:
  acertos = 0
  for numero in jogo:
    if numero in sorteio:
      acertos += 1
      print(f'jogo {jogo}: {acertos} acerto')
