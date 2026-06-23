#biblioteca grafica
import matplotlib.pyplot as plt
#biblioteca numérica
import numpy as np
#grafico_linha():
x = [1, 2, 3, 4, 5]
y = [2, 3, 5, 7, 11]
plt.plot(x, y)
plt.title('grafico de linha')
plt.xlabel('eixo x')
plt.ylabel('eixo y')
plt.grid()
plt.show()
