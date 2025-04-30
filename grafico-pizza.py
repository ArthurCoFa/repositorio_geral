#biblioteca grafica
import matplotlib.pyplot as plt
#biblioteca numérica
import numpy as np
#grafico de pizza
labels = ['Python', 'javaScript', 'C++', 'C','HTML e CSS']
sizes = [25, 10, 20, 25, 20]
plt.pie(sizes, labels=labels, autopct='%1.1f%%')
plt.title('grafico de pizza')
plt.show()
