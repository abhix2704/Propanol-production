# -*- coding: utf-8 -*-
"""
Created on Sat Jul 30 23:43:08 2022

@author: anabera
"""

import matplotlib.pyplot as plt
import pandas as pd
import numpy as np

plt.rcParams.update({'font.size': 18})
plt.rcParams["figure.autolayout"] = True
fig = plt.figure(figsize=(13.33,7.5), dpi=96)



colors = ["#da5552","#f99a5f","#f5cb5c","#7371fc","#60d394","#ee839f","#9bf6ff",
            "#fec89a"]

fileName = "Economics plot data.xlsx"

sheetName = "All"

df = pd.read_excel(fileName, sheetName)
myLabels = ["BAU", "NG + wind + bauE", "DAC + wind + bauE", "NG + wind + gE", "DAC + wind + gE", "Biogas + bauE", "Biogas + gE$_\mathrm{NG}$", 
            "Biogas + gE$_\mathrm{DAC}$", "Biogas + bioE"]
categories = ["Natural gas", "Carbon dioxide", "Biogas", "Oxygen", "Hydrogen", "Ethylene", "Utilities + fixed costs", "CAPEX"]
allCategories = np.array(df["Category"])
values = np.array(df["Value"])

naturalGas = []
carbonDioxide = []
biogas = []
oxygen = []
hydrogen = []
ethylene = []
utilities = []
capex = []
for i in range(0,len(values)):
    if allCategories[i] == 'Natural gas':
        naturalGas.append(values[i])
    elif allCategories[i] == 'Carbon dioxide':
        carbonDioxide.append(values[i])
    elif allCategories[i] == 'Biogas':
        biogas.append(values[i])
    elif allCategories[i] == 'Oxygen':
        oxygen.append(values[i])
    elif allCategories[i] == 'Hydrogen':
        hydrogen.append(values[i])
    elif allCategories[i] == 'Ethylene':
        ethylene.append(values[i])
    elif allCategories[i] == 'Utilities + fixed costs':
        utilities.append(values[i])
    elif allCategories[i] == 'CAPEX':
        capex.append(values[i])
        
width = 0.3 # the width of the bars: can also be len(x) sequence

df = pd.DataFrame({"Natural gas" : naturalGas, "Carbon dioxide" : carbonDioxide, "Biogas" : biogas, "Oxygen" : oxygen, 
                   "Hydrogen" : hydrogen, "Ethylene" : ethylene, "Utilties + fixed costs" : utilities, "CAPEX" : capex})

data = np.array(list(df.values))
data_cum = data.cumsum(axis = 1)
fig, ax = plt.subplots()

errorData = pd.read_excel(fileName, "Total and error bars")
errors = np.array([errorData["Low"],errorData["High"]])

for i, (colname, color) in enumerate(zip(categories, colors)):
        widths = data[:, i]
        starts = data_cum[:, i] - widths
        if i != len(categories) - 1:
            rects = ax.barh(myLabels, widths, left=starts, height = 0.5,
                            label=colname, color=color, edgecolor = 'k')
        else:
            reacts = ax.barh(myLabels, widths, left=starts, height = 0.5,
                             label = colname, color=color, edgecolor = 'k',
                             xerr = errors, capsize = 5)
 
x1 = errorData["Total"]
y1 = errorData["yCoordinate"]
plt.scatter(x1, y1, s = 25, marker = 'D', color = 'black')

feedCumData = pd.read_excel(fileName, "Feedstock cummulative")
x2 = feedCumData["Value"]
y2 = feedCumData['yCoordinate']
ax = plt.scatter(x2,y2, marker = '^', color = '#4300ed', s = 50, edgecolors="black")
 
opexCumData = pd.read_excel(fileName, "OPEX cummulative")
x3 = opexCumData["Value"]
y3 = opexCumData['yCoordinate']
plt.scatter(x3,y3, marker = '^', color = '#00d37b', s = 50, edgecolors="black")

capexCumData = pd.read_excel(fileName, "CAPEX cummulative")
x2 = capexCumData["Value"]
y2 = capexCumData['yCoordinate']
plt.scatter(x2,y2, marker = '^', color = '#ed0062', s = 50, edgecolors="black")

plt.legend(loc = "lower right")
plt.xlabel("Cost of production [$/t propanol]")


