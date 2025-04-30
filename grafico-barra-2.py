#biblioteca grafica
import matplotlib.pyplot as plt
#biblioteca numérica
import numpy as np
#grafico_barras():
categorias = ['A', 'B', 'C', 'D']
valores = [3, 7, 5, 2]
plt.bar(categorias, valores)
plt.title('grafico de barras')
plt.xlabel('categorias')
plt.ylabel('valores')
plt.show()
