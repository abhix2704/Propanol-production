# -*- coding: utf-8 -*-
"""
Created on Sat Jul 30 19:44:23 2022

@author: anabera
"""
from matplotlib import pyplot as plt
import pandas as pd
import numpy as np

plt.rcParams.update({'font.size': 16})

fileName = "Economics plot data.xlsx"
sheetName = "Green ethylene sensitivity"
df = pd.read_excel(fileName, sheetName)

CO2 = df["CO2"]
H2 = df["Hydrogen"]
ethylene = df["Ethylene"]
x1 = np.array([-500, 344.2623]) #get value from R plot
y1 = np.array([6622.3776, 0]) #get value from R plot
x2 = np.array([-500, -121.9178]) #get value from R plot
y2 = np.array([2965.0349, 0]) #get value from R plot

plt.tricontourf(CO2, H2, ethylene,100)
plt.set_cmap('Spectral_r')
plt.colorbar()
plt.plot(x1,y1, color = 'black', linewidth = 2)
plt.plot(x2,y2, 'k--')
plt.scatter(106.2207, 4709.1621, s = 200, marker = 'x', color = 'black')
plt.scatter(217.2035, 4709.1621, s = 200, marker = 'x', color = 'black')
plt.vlines(0, 0, 7000, color = 'black', linewidth = 1.5, linestyles = '--')
plt.xlabel("Carbon dioxide price [$/t]")
plt.ylabel("Hydrogen price [$/t]")
plt.title("Green ethylene [$/t]")
plt.show()