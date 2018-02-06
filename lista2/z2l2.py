import matplotlib.pyplot as plt
import numpy as np

x = np.linspace(0, 100)

fun = pow(np.e, x) * (np.log(1 + pow(np.e, -x)))

plt.plot(x, fun, label='python e^x * ln(1 + e^−x )');

plt.xlabel('x')
plt.ylabel('y')

# plt.title("Simple Plot")

plt.legend()

plt.show()

# w wolfram alpha użyto (e^x)*Log[E, (1 + e^(- x) )] (x from 0 to 100)

