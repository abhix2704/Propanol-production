# -*- coding: utf-8 -*-
"""
Created on Sat Jul 30 23:14:42 2022

@author: anabera
"""

import matplotlib.pyplot as plt
import pandas as pd

plt.rcParams.update({'font.size': 16})
colors = ["#FBB4AE", "#B3CDE3", "#CCEBC5", "#DECBE4", "#FED9A6", "#FFFFCC"]

fileName = "Economics plot data.xlsx"

sheetName = "BAU CAPEX"

df = pd.read_excel(fileName, sheetName)

labels = df["Category"]
CAPEX = df["CAPEX"]

plt.subplot(1, 3, 1)
patches, texts, autotexts = plt.pie(CAPEX, autopct='%1.1f%%', startangle = 90, colors = colors, wedgeprops={"edgecolor":"k"}, textprops={'fontsize': 16})
autotexts[1]._x =+ 0.4
autotexts[5]._y =+ 0.75
plt.title("BAU")
plt.show()


sheetName = "Green CAPEX"

df = pd.read_excel(fileName, sheetName)

labels = df["Category"]
CAPEX = df["CAPEX"]

plt.subplot(1, 3, 2)
patches, texts, autotexts = plt.pie(CAPEX, autopct='%1.1f%%', startangle = 90, colors = colors, wedgeprops={"edgecolor":"k"}, textprops={'fontsize': 16})
autotexts[1]._x =+ 0.2
autotexts[5]._y =+ 0.75
plt.title("Green route")
plt.show()

sheetName = "Biogas CAPEX"

df = pd.read_excel(fileName, sheetName)

labels = df["Category"]
CAPEX = df["CAPEX"]

plt.subplot(1, 3, 3)
patches, texts, autotexts = plt.pie(CAPEX, autopct='%1.1f%%', startangle = 90, colors = colors, wedgeprops={"edgecolor":"k"}, textprops={'fontsize': 16})
autotexts[1]._x =+ 0.2
autotexts[5]._y =+ 0.75
plt.title("Biogas route")
plt.legend(labels, loc = "upper right", ncol = len(labels))

plt.show()