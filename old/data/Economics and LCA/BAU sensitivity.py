# -*- coding: utf-8 -*-
"""
Created on Sat Jul 30 22:13:56 2022

@author: anabera
"""

from matplotlib import pyplot as plt
import pandas as pd
import numpy as np

plt.rcParams.update({'font.size': 16})

fileName = "Economics plot data.xlsx"

sheetName = "BAU sensitivity"
df = pd.read_excel(fileName, sheetName)

NG = df["NG"]
ethylene = df['Ethylene']
propanol = df["Propanol"]
x1 = np.array([542.4274, 542.4274]) #get value from R plot
y1 = np.array([0, 1]) #get value from R plot
x2 = np.array([1513.5, 1513.5]) #get value from R plot
y2 = np.array([0, 1]) #get value from R plot

plt.subplot(1,2,2)
extent = [NG[0]-(NG[1]-NG[0])/2., NG[len(NG)-1]+(NG[1]-NG[0])/2.,0,1]
plt.imshow(propanol[np.newaxis,:], cmap = "Spectral", aspect = "auto", extent = extent)
cb = plt.colorbar()
plt.plot(x1,y1, color = 'black', linewidth = 2)
plt.plot(x2,y2, color = 'black', linewidth = 2)
plt.scatter(1513.5, 0.5, s = 200, marker = 'x', color = 'black')
plt.scatter(1742.0, 0.5, s = 200, marker = 'x', color = 'black')
plt.xlabel("Natural gas price [$/t]")
plt.ylabel("Propanol price [$/t]")
plt.yticks([])

x1 = np.array([542.4274, 542.4274]) #get value from R plot
y1 = np.array([0, 1710.3783]) #get value from R plot
x2 = np.array([0, 542.4274]) #get value from R plot
y2 = np.array([1710.3783, 1710.3783]) #get value from R plot

ax = plt.subplot(1,2,1)
plt.plot(NG,ethylene, color = 'black', linewidth = 2)
plt.plot(x1,y1, color = 'red', linewidth = 2)
plt.plot(x2,y2, color = 'red', linewidth = 2)
ax.set_ylim(ymin = 0)
ax.set_xlim(xmin = 0)
plt.xlabel("Natural gas price [$/t]")
plt.ylabel("Ethylene price [$/t]")

plt.show()
