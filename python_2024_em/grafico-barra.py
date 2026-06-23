#graicos básicos (Barra)
#biblioteca grafica
import matplotlib.pyplot as plt
#biblioteca numérica
import numpy as np
#criando dados
np.random.seed(2)
x = np.arange(10)
y = np.random.uniform(2, 7, len(x))
# plotagem
fig, ax = plt.subplots()
plt.xlabel('eixo X')
plt.ylabel('eixo Y')
plt.grid(True)
plt.title('Título do gráfico')
plt.legend('legenda')
ax.bar(x, y, width=1, edgecolor="red", linewidth=1)
ax.set(xlim=(0, 8), xticks=np.arange(1, 8),
       ylim=(0, 8), yticks=np.arange(1, 8))

plt.show()
