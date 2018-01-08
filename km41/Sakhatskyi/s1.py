import math
import matplotlib.pyplot as plt
import numpy


def fx(x):
    return x[0]**2 + x[1]**2 - 6*x[0] - 8*x[1]


def fy(x):
    return x[0]*(2*x[1] - x[0] + 5)


def v_x(x):
    return fx(x)/math.hypot(fx(x), fy(x))


def v_y(x):
    return fy(x)/math.hypot(fx(x), fy(x))


def calc(var, f, l1):
    x = [f[0]]
    y = [f[1]]
    lx = [l1]
    ly = [l1]
    if var == 1:
        n = 100
        for i in range(1, n):
            endlen = math.hypot(x[i - 1], y[i - 1])
            l = endlen / ((n - i) * math.hypot(v_x([x[i - 1], y[i - 1]]), v_y([x[i - 1], y[i - 1]])))
            x.append(x[i - 1] + l * v_x([x[i - 1], y[i - 1]]))
            y.append(y[i - 1] + l * v_y([x[i - 1], y[i - 1]]))
        plt.plot(x, y)
    elif var == 2:
        n = 100
        for i in range(1, n):
            lx.append(0.9 * lx[i - 1] * v_x([x[i - 1], y[i - 1]]))
            ly.append(0.9 * ly[i - 1] * v_y([x[i - 1], y[i - 1]]))
            x.append(x[i - 1] + lx[i] * v_x([x[i - 1], y[i - 1]]))
            y.append(y[i - 1] + ly[i] * v_y([x[i - 1], y[i - 1]]))
        plt.plot(x, y)
    elif var == 3:
        n = 40
        for i in range(1, n):
            x.append(x[i - 1] + l1 * v_x([x[i - 1], y[i - 1]]))
            y.append(y[i - 1] + l1 * v_y([x[i - 1], y[i - 1]]))
        plt.plot(x, y)
    else:
        print('Wrong value entered')
        return False


print('CHOOSE AN OPTION:')
print('1)       2.1')
print('2)       2.2')
print('3)       Alpha = const')
print('=======================')


option = int(input('your pick : '))

f = []
for i in list(numpy.arange(-10.0, 10.0, 0.25)):
    if i != 0:
        f.append([4, i])
    for k in list(numpy.arange(-10.0, 10.0, 0.25)):
        if i != 0 and k != 0:
            f.append([i, k])
f.remove([3.0, -1.0])  
f.remove([7.0, 1.0])   
for i in f:
    calc(option, i, 0.01)


plt.axis('scaled')
plt.axis([2, 7, 5, 10])
plt.show()
