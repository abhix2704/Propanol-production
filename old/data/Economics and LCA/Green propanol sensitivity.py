# -*- coding: utf-8 -*-
"""
Created on Sat Jul 30 18:38:23 2022

@author: anabera
"""

from matplotlib import pyplot as plt
import pandas as pd
import numpy as np

plt.rcParams.update({'font.size': 16})

fileName = "Economics plot data.xlsx"

sheetName = "Green sensitivity"
df = pd.read_excel(fileName, sheetName)

CO2 = df["CO2"]
H2 = df["Hydrogen"]
propanol = df["Propanol"]
x1 = np.array([-500, 61.7087]) #get value from R plot
y1 = np.array([4048.6111, 0]) #get value from R plot

plt.subplot(1,2,1)
plt.tricontourf(CO2, H2, propanol, 100)
plt.set_cmap('Spectral_r')
plt.colorbar()
#plt.clim(-618.1741,4711.6066)
plt.plot(x1,y1, color = 'black', linewidth = 2)
plt.scatter(106.2207, 4709.1621, s = 200, marker = 'x', color = 'black')
plt.scatter(217.2035, 4709.1621, s = 200, marker = 'x', color = 'black')
plt.vlines(0, 0, 7000, color = 'black', linewidth = 1.5, linestyles = '--')

plt.xlabel("Carbon dioxide price [$/t]")
plt.ylabel("Hydrogen price [$/t]")
plt.title("Propanol from BAU ethylene [$/t]")
plt.show()

sheetName = "Green ethylene sensitivity"
df = pd.read_excel(fileName, sheetName)

CO2 = df["CO2"]
H2 = df["Hydrogen"]
propanol = df["Propanol"]
x1 = np.array([-500, 262.5786]) #get value from R plot
y1 = np.array([5805.5556, 0]) #get value from R plot
x2 = np.array([-500, -250]) #get value from R plot
y2 = np.array([1875, 0]) #get value from R plot

plt.subplot(1,2,2)
plt.tricontourf(CO2, H2, propanol, 100)
plt.set_cmap('Spectral_r')
plt.colorbar()
plt.plot(x1,y1, color = 'black', linewidth = 2)
plt.plot(x2,y2, 'k--')
plt.scatter(106.2207, 4709.1621, s = 200, marker = 'x', color = 'black')
plt.scatter(217.2035, 4709.1621, s = 200, marker = 'x', color = 'black')
plt.vlines(0, 0, 7000, color = 'black', linewidth = 1.5, linestyles = '--')
plt.xlabel("Carbon dioxide price [$/t]")
plt.ylabel("Hydrogen price [$/t]")
plt.title("Propanol from green ethylene [$/t]")
plt.show()
