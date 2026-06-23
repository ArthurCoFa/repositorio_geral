def fatorial(n):
    #Operador condicional - Para o caso Base (0!)
    if n==0:
        return 1
    else:
        return n * fatorial(n-1)

#Entrada do valor de N
n = int(input(" Insira um valor pra N: \n"))

print("O fatorial de ", n , " é ", fatorial(n))
