# -*- coding: utf-8 -*-
"""
Created on Sat Jul 30 23:43:08 2022

@author: anabera
"""

import matplotlib.pyplot as plt
import pandas as pd
import numpy as np

plt.rcParams.update({'font.size': 16})
plt.rcParams["figure.autolayout"] = True
fig = plt.figure(figsize=(13.33,7.5), dpi=96)
fileName = "Economics plot data.xlsx"

sheetName = "Carbon dioxide avoidance"

df = pd.read_excel(fileName, sheetName)
myLabels = ["NG + wind + bauE", "DAC + wind + bauE", "NG + wind + gE", "DAC + wind + gE", "Biogas + bauE", "Biogas + gE$_\mathrm{NG}$", 
            "Biogas + gE$_\mathrm{DAC}$", "Biogas + bioE"]
avoidanceCosts = np.array(df["Avoidance costs"])

fig, ax = plt.subplots()
y_pos = np.arange(len(myLabels))
ax.barh(y_pos, avoidanceCosts)
ax.set_yticks(y_pos, labels = myLabels)
ax.set_xlabel("CO$_\mathrm{2}$ avoidance costs [\$ t$_\mathrm{CO_\mathrm{2eq}}$$^\mathrm{-1}$]")

