#definindo uma função(def) e atribuindo um nome(soma_numero(n))
#e sua variavel de entrada(n):
def soma_numero(n):
  #Identação - São os 4 espaços que indicam que um bloco de codigo esta ]
  #dentro de outro codigo(função/condição ou repetição)
  total = 0 #criação de variavel para receber o valor da soma
  #criando um Loop(For) para somar de 1 a N (Comando de Repetição)
  for i in range(1, n+1): # Para cada elemento i de 1 a n+1(nao incluso)
    total += i # total = total + i
  return total # retornar o valor de total pra fora da função

#Pede para o usuario informar um valor para N e o declara como variavel inteira
n =int(input("Insira o valor de N: "))
#imprime a mensagem na tela mostrando a variavel 'n' e a função 'soma_numero(n)'
print ("A soma dos numeros de 1 a", n , "é", soma_numero(n))
