# -*- coding: utf-8 -*-
"""
Created on Thu Aug  4 15:41:27 2022

@author: anabera
"""


from matplotlib import pyplot as plt
import pandas as pd
import numpy as np

plt.rcParams.update({'font.size': 16})

xmin = -500
xmax = 750
ymin = 0
ymax = 7000

CEPCI2019 = 607.5
CEPCI2022 = 803.6

# Parkinson's hydrogen data
pRatio = CEPCI2022/CEPCI2019
h2SMR = 1030 * pRatio
h2SMRCCS = 1220 * pRatio
h2Coal = 960 * pRatio
h2CoalCCS = 1400 * pRatio
h2CH4Pyrolysis = 1030 * pRatio
h2Biomass = 1480 * pRatio
h2BiomassCCS = 2270 * pRatio
h2Wind = 3560 * pRatio
h2Solar = 3340 * pRatio
h2Nuclear = 3290 * pRatio
h2Wind2030 = 2718
h2Solar2030 = 3226
h2 = np.array([h2SMRCCS,h2CoalCCS,h2CH4Pyrolysis,h2BiomassCCS,
               h2Wind,h2Solar,h2Nuclear,h2Wind2030,h2Solar2030])
myLabelsY = ['SMR', 'Coal', 'CH$_\mathrm{4}$ pyrolysis', 'Biomass', 'Electro - wind',
            'Electro - solar', 'Electro - nuclear', 'Electro - wind$_\mathrm{2030}$', 'Electro - solar$_\mathrm{2030}$']

# Carbon dioxide data
co2NG = 80.3 * pRatio
co2DAC = 164.2 * pRatio
co2DAC2030 = 100
co2 = np.array([co2NG, co2DAC, co2DAC2030])
myLabelsX = ['NG','DAC','DAC$_\mathrm{2030}$']

fileName = "Economics plot data.xlsx"

sheetName = "Green sensitivity"
df = pd.read_excel(fileName, sheetName)

CO2 = df["CO2"]
H2 = df["Hydrogen"]
propanol = df["Propanol"]
x1 = np.array([xmin, 61.7087]) #get value from R plot
y1 = np.array([4048.6111, ymin]) #get value from R plot

plt.subplot(1,2,1)
plt.tricontourf(CO2, H2, propanol, 100)
plt.set_cmap('Spectral_r')
plt.colorbar()
plt.clim(-618.1741,4711.6066)
plt.plot(x1,y1, color = 'black', linewidth = 2)
plt.hlines(h2, xmin, xmax, color = 'black', linewidth = 1.5, linestyles = '--')
plt.vlines(co2, ymin, ymax, color = 'black', linewidth = 1.5, linestyles = '--')
for i in range(0,len(myLabelsY)):
    plt.text(400, h2[i] + 75, myLabelsY[i], fontsize = 14)
for j in range(0,len(myLabelsX)):
    plt.text(co2[j] + 10, 6000, myLabelsX[j], fontsize = 14, rotation = 90)
#plt.vlines(0, ymin, ymax, color = 'black', linewidth = 1.5, linestyles = '--')
plt.xlabel("Carbon dioxide price [$/t]")
plt.ylabel("Hydrogen price [$/t]")
plt.title("Propanol from BAU ethylene [$/t]")
plt.show()

sheetName = "Green ethylene sensitivity"
df = pd.read_excel(fileName, sheetName)

CO2 = df["CO2"]
H2 = df["Hydrogen"]
propanol = df["Propanol"]
x1 = np.array([xmin, 262.5786]) #get value from R plot
y1 = np.array([5805.5556, ymin]) #get value from R plot
x2 = np.array([xmin, -250]) #get value from R plot
y2 = np.array([1875, ymin]) #get value from R plot

plt.subplot(1,2,2)
plt.tricontourf(CO2, H2, propanol, 100)
plt.set_cmap('Spectral_r')
plt.colorbar()
plt.plot(x1,y1, color = 'black', linewidth = 2)
plt.plot(x2,y2, 'k--')
plt.hlines(h2, xmin, xmax, color = 'black', linewidth = 1.5, linestyles = '--')
plt.vlines(co2, ymin, ymax, color = 'black', linewidth = 1.5, linestyles = '--')
for i in range(0,len(myLabelsY)):
    plt.text(400, h2[i] + 75, myLabelsY[i], fontsize = 14)
for j in range(0,len(myLabelsX)):
    plt.text(co2[j] + 10, 6000, myLabelsX[j], fontsize = 14, rotation = 90)
#plt.vlines(0, ymin, ymax, color = 'black', linewidth = 1.5, linestyles = '--')
plt.xlabel("Carbon dioxide price [$/t]")
plt.ylabel("Hydrogen price [$/t]")
plt.title("Propanol from green ethylene [$/t]")
plt.show()
