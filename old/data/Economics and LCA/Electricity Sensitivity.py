# -*- coding: utf-8 -*-
"""
Created on Fri Aug  5 10:02:05 2022

@author: anabera
"""


from matplotlib import pyplot as plt
import pandas as pd
import numpy as np

plt.rcParams.update({'font.size': 16})

fileName = "Economics plot data.xlsx"

sheetName = "Elec sensitivity"
df = pd.read_excel(fileName, sheetName)
elec = df["Electricity"]
propanolNGBAU = df["NG,BAU"]
propanolNGgE = df["NG,gE"]
propanolDACBAU = df["DAC,BAU"]
propanolDACgE = df["DAC,gE"]
BAUElec = df["BAU"]
myLabels = ["NG + bauE", "NG + gE", "DAC + bauE", "DAC + gE"]

xmin = 0
xmax = 250
ymin = 0
ymax = 7000

BAUPropanol = 1250.2768
CEPCI2019 = 607.5
CEPCI2022 = 803.6
pRatio = CEPCI2022/CEPCI2019
windOnShore = 56.4*pRatio
windOnShore2030 = 40
solar = 85.6*pRatio
solar2030 = 50
nuclear = 87.5*pRatio
elecMix = 69.6*pRatio
bioenergy = 62
bioenergy2030 = 60
hydro = 46
hydro2030 = 40
geothermal = 71
geothermal2030 = 65
elecCat = np.array([windOnShore, windOnShore2030, solar, solar2030, nuclear, elecMix,
                    bioenergy, bioenergy2030, hydro, hydro2030, geothermal, geothermal2030])
elecLabels = ["Wind", "Wind$_\mathrm{2030}$", "Solar", "Solar$_\mathrm{2030}$", "Nuclear",
              "Electricity mix$_\mathrm{current}$", "Bioenergy", "Bioenergy$_\mathrm{2030}$", "Hydropower", 
              "Hydropower$_\mathrm{2030}$", "Geothermal", "Geothermal$_\mathrm{2030}$"]

plt.plot(elec, propanolNGBAU)
plt.plot(elec, propanolNGgE)
plt.plot(elec, propanolDACBAU)
plt.plot(elec, propanolDACgE)
plt.plot(elec, BAUElec, color = "grey", linestyle = "--")
plt.xlabel("Electricity price [$/MWh]")
plt.ylabel("Propanol price [$/t]")
plt.legend(myLabels)
plt.xlim(0,250)
plt.ylim(0,7000)

plt.hlines(BAUPropanol,xmin,xmax,color = "black", linewidth = 2)
plt.text(240, BAUPropanol + 100, "BAU", fontsize = 20)

plt.vlines(elecCat, ymin, ymax, colors = "grey", linestyles = "--", linewidth = 1.5)
for i in range(0,len(elecLabels)):
    plt.text(elecCat[i] + 1, 4500, elecLabels[i], fontsize = 14, rotation = 90, color = "grey")

plt.show()