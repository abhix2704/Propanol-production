close all
clear
clc

CEPCI2008 = 575.4;
CEPCI2018 = 603.1;
CEPCI2019 = 607.5;
CEPCI2021 = 776.3;
CEPCI2022 = 803.6;


% BAU file and data collection
fileName = "Methane to 1-propanol v5\Economics - steam sold (2022).xlsx";
sheetName = "Summary";
totalPropanol = xlsread(fileName, sheetName, "C23")/1000;
totalExpCategory = xlsread(fileName, sheetName, "F41:F56");
reqCategory = xlsread(fileName, sheetName, "G41:G56");
totalExp = sum(totalExpCategory);
totalExpWithoutNGAndEthylene = totalExp - totalExpCategory(1) - totalExpCategory(6) - ...
    totalExpCategory(9);
reqNG = reqCategory(1);
reqEthylene = reqCategory(6);

NG = 0:1:2000; %NG prices $/t
NGReqEthylene = 1.85; %NG required per tonne of ethylene

NGCurrentPrice = 524*CEPCI2022/CEPCI2021; %per tonne
ethyleneCurrentPrice = 1293*CEPCI2022/CEPCI2019; %per tonne
ethylenePriceWithoutNG = ethyleneCurrentPrice - 1.85*NGCurrentPrice;
ethylene = ethylenePriceWithoutNG + 1.85*NG;

currentProPrice = totalExpWithoutNGAndEthylene + ...
    (reqNG * NGCurrentPrice + reqEthylene * ethyleneCurrentPrice)/totalPropanol;

propPricesBAU = totalExpWithoutNGAndEthylene + ...
    (reqNG .* NG + reqEthylene .* ethylene)./totalPropanol;
prices = [NG', ethylene', propPricesBAU'];

xlswrite("Economics plot data.xlsx", prices, "BAU sensitivity", "A2");
