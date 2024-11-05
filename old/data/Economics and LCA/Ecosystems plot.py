# -*- coding: utf-8 -*-
"""
Created on Thu Aug 25 18:19:06 2022

@author: anabera
"""

import matplotlib.pyplot as plt
import pandas as pd
import numpy as np


plt.rcParams.update({'font.size': 16})
plt.rcParams["figure.autolayout"] = True
fig = plt.figure(figsize=(13.33,7.5), dpi=96)
colors = ["#da5552","#f99a5f","#f5cb5c","#7371fc","#60d394","#ee839f","#9bf6ff",
            "#fec89a", "#000000"]

fileName = "Environmental plot data.xlsx"

sheetName = "All"

df = pd.read_excel(fileName, sheetName)
myLabels = ["BAU", "NG + wind + bauE", "DAC + wind + bauE", "NG + wind + gE", "DAC + wind + gE", "Biogas + bauE", "Biogas + gE$_\mathrm{NG}$", 
            "Biogas + gE$_\mathrm{DAC}$", "Biogas + bioE"]
categories = ["Natural gas", "Carbon dioxide", "Biogas", "Oxygen", "Hydrogen", "Ethylene", "Utilities + fixed costs", "CAPEX", ""]
allCategories = np.array(df["Category"])
ecosystems = np.array(df["Ecosystems"])

naturalGas = []
carbonDioxide = []
biogas = []
oxygen = []
hydrogen = []
ethylene = []
utilities = []
capex = []
bau = []
for i in range(0,len(ecosystems)):
    if allCategories[i] == 'Natural gas':
        naturalGas.append(ecosystems[i])
    elif allCategories[i] == 'Carbon dioxide':
        carbonDioxide.append(ecosystems[i])
    elif allCategories[i] == 'Biogas':
        biogas.append(ecosystems[i])
    elif allCategories[i] == 'Oxygen':
        oxygen.append(ecosystems[i])
    elif allCategories[i] == 'Hydrogen':
        hydrogen.append(ecosystems[i])
    elif allCategories[i] == 'Ethylene':
        ethylene.append(ecosystems[i])
    elif allCategories[i] == 'Utilities + fixed costs':
        utilities.append(ecosystems[i])
    elif allCategories[i] == 'CAPEX':
        capex.append(ecosystems[i])
    elif allCategories[i] == 'BAU':
        bau.append(ecosystems[i])
        
width = 0.3 # the width of the bars: can also be len(x) sequence

df = pd.DataFrame({"Natural gas" : naturalGas, "Carbon dioxide" : carbonDioxide, "Biogas" : biogas, "Oxygen" : oxygen, 
                   "Hydrogen" : hydrogen, "Ethylene" : ethylene, "Utilties + fixed costs" : utilities, "CAPEX" : capex, 
                   "BAU" : bau})

posData = np.array(list(df.values))
posData[posData < 0] = 0
data_cum_pos = posData.cumsum(axis = 1)
fig, ax = plt.subplots()

for i, (colname, color) in enumerate(zip(categories, colors)):
        widths = posData[:, i]
        starts = data_cum_pos[:, i] - widths
        rects = ax.barh(myLabels, widths, left=starts, height = 0.5,
                        label=colname, color=color, edgecolor = 'k')

negData = np.array(list(df.values))
negData[negData > 0] = 0
data_cum_neg = negData.cumsum(axis = 1)

for i, (colname, color) in enumerate(zip(categories, colors)):
        widths = negData[:, i]
        starts = data_cum_neg[:, i] - widths
        rects = ax.barh(myLabels, widths, left=starts, height = 0.5,
                        color=color, edgecolor = 'k')

cumData = pd.read_excel(fileName, "Cummulative")
x1 = cumData["Ecosystems"]
y1 = cumData['yCoordinate']
plt.scatter(x1, y1, s = 25, marker = 'D', color = 'black')
plt.legend(loc = "right")
plt.xlabel("Ecosystems [species.yr kg$^\mathrm{-1}$ propanol]")

plt.axvline(x = 0, color = "#000000", lw = 1.5)
negDataCum = np.sum(negData, axis = 1)
posDataCum = np.sum(posData, axis = 1)
minx = np.amin(negDataCum)
maxx = np.amax(posDataCum)
plt.xlim(minx*1.1, maxx*1.1)