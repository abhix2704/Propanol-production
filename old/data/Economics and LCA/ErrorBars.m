clc
clear
close all

CEPCI2008 = 575.4;
CEPCI2018 = 603.1;
CEPCI2019 = 607.5;
CEPCI2021 = 776.3;
CEPCI2022 = 803.6;

%% BAU low and high values
NG = [217.9245 695.2830]*CEPCI2022/CEPCI2021;
CO2 = [0 0];
biogas = [0 0];
O2 = [0 0];
H2 = [1220 2810]*CEPCI2022/CEPCI2019;
ethylene = [0 0];
coolingWater = [0 0];
electricity = [50.2 112.4]*CEPCI2022/CEPCI2019;
firedHeat = [217.9245 695.2830]*CEPCI2022/CEPCI2021;
carbonStorage = [0 0];
wasteWater = [0 0];
flueGas = [0 0];
steam = [0 0];
catalyst = [0 0];
fixedCosts = [0 0];
CAPEX = [0 0];

lowHighValues = [NG;CO2;biogas;O2;H2;ethylene;coolingWater;electricity;firedHeat;carbonStorage;wasteWater;...
    flueGas;steam;catalyst;fixedCosts;CAPEX];
fileName = "Methane to 1-propanol v5\Economics - steam sold (2022).xlsx";
sheetName = "Summary";
totalPropanol = xlsread(fileName, sheetName, "C23")/1000;
totalExpCategory = xlsread(fileName, sheetName, "F41:F56");
reqCategory = xlsread(fileName, sheetName, "G41:G56");
totalExp = sum(totalExpCategory);
low = zeros(16,1); high = zeros(16,1);
for i = 1:length(totalExpCategory)
    if lowHighValues(i,1) ~= 0 && totalExpCategory(i) ~= 0
        low(i) = reqCategory(i)*lowHighValues(i,1)/totalPropanol;
    else 
        low(i) = totalExpCategory(i);
    end
    if lowHighValues(i,2) ~= 0 && totalExpCategory(i) ~= 0
        high(i) = reqCategory(i)*lowHighValues(i,2)/totalPropanol;
    else 
        high(i) = totalExpCategory(i);
    end
end
lowBAU = sum(low);
highBAU = sum(high);
xlswrite("Economics plot data.xlsx", [totalExp - lowBAU highBAU - totalExp], "Total and error bars", "D2:E2");

%% NG BAU ethylene
NG = [217.9245 695.2830]*CEPCI2022/CEPCI2021;
CO2 = [54.6 126.4]*CEPCI2022/CEPCI2019;
biogas = [0 0];
O2 = [0 0];
H2 = [3560 10820]*CEPCI2022/CEPCI2019;
ethylene = [0 0];
coolingWater = [0 0];
electricity = [50.2 112.4]*CEPCI2022/CEPCI2019;
firedHeat = [217.9245 695.2830]*CEPCI2022/CEPCI2021;
carbonStorage = [0 0];
wasteWater = [0 0];
flueGas = [0 0];
steam = [0 0];
catalyst = [0 0];
fixedCosts = [0 0];
CAPEX = [0 0];

lowHighValues = [NG;CO2;biogas;O2;H2;ethylene;coolingWater;electricity;firedHeat;carbonStorage;wasteWater;...
    flueGas;steam;catalyst;fixedCosts;CAPEX];
fileName = "Economics; NG, wind, BAU ethylene (2022).xlsx";
sheetName = "Summary";
totalPropanol = xlsread(fileName, sheetName, "C23")/1000;
totalExpCategory = xlsread(fileName, sheetName, "F40:F55");
reqCategory = xlsread(fileName, sheetName, "G40:G55");
totalExp = sum(totalExpCategory);
low = zeros(16,1); high = zeros(16,1);
for i = 1:length(totalExpCategory)
    if lowHighValues(i,1) ~= 0 && totalExpCategory(i) ~= 0
        low(i) = reqCategory(i)*lowHighValues(i,1)/totalPropanol;
    else 
        low(i) = totalExpCategory(i);
    end
    if lowHighValues(i,2) ~= 0 && totalExpCategory(i) ~= 0
        high(i) = reqCategory(i)*lowHighValues(i,2)/totalPropanol;
    else 
        high(i) = totalExpCategory(i);
    end
end
lowBAU = sum(low);
highBAU = sum(high);
xlswrite("Economics plot data.xlsx", [totalExp - lowBAU highBAU - totalExp], "Total and error bars", "D3:E3");

%% DAC BAU ethylene
NG = [217.9245 695.2830]*CEPCI2022/CEPCI2021;
CO2 = [94.7 233.7]*CEPCI2022/CEPCI2019;
biogas = [0 0];
O2 = [0 0];
H2 = [3560 10820]*CEPCI2022/CEPCI2019;
ethylene = [0 0];
coolingWater = [0 0];
electricity = [50.2 112.4]*CEPCI2022/CEPCI2019;
firedHeat = [217.9245 695.2830]*CEPCI2022/CEPCI2021;
carbonStorage = [0 0];
wasteWater = [0 0];
flueGas = [0 0];
steam = [0 0];
catalyst = [0 0];
fixedCosts = [0 0];
CAPEX = [0 0];

lowHighValues = [NG;CO2;biogas;O2;H2;ethylene;coolingWater;electricity;firedHeat;carbonStorage;wasteWater;...
    flueGas;steam;catalyst;fixedCosts;CAPEX];
fileName = "Economics; DAC, wind, BAU ethylene (2022).xlsx";
sheetName = "Summary";
totalPropanol = xlsread(fileName, sheetName, "C23")/1000;
totalExpCategory = xlsread(fileName, sheetName, "F40:F55");
reqCategory = xlsread(fileName, sheetName, "G40:G55");
totalExp = sum(totalExpCategory);
low = zeros(16,1); high = zeros(16,1);
for i = 1:length(totalExpCategory)
    if lowHighValues(i,1) ~= 0 && totalExpCategory(i) ~= 0
        low(i) = reqCategory(i)*lowHighValues(i,1)/totalPropanol;
    else 
        low(i) = totalExpCategory(i);
    end
    if lowHighValues(i,2) ~= 0 && totalExpCategory(i) ~= 0
        high(i) = reqCategory(i)*lowHighValues(i,2)/totalPropanol;
    else 
        high(i) = totalExpCategory(i);
    end
end
lowBAU = sum(low);
highBAU = sum(high);
xlswrite("Economics plot data.xlsx", [totalExp - lowBAU highBAU - totalExp], "Total and error bars", "D4:E4");

%% NG green ethylene
NG = [217.9245 695.2830]*CEPCI2022/CEPCI2021;
CO2 = [54.6 126.4]*CEPCI2022/CEPCI2019;
biogas = [0 0];
O2 = [0 0];
H2 = [3560 10820]*CEPCI2022/CEPCI2019;
ethylene = [1900 3500]*CEPCI2022/CEPCI2019;
coolingWater = [0 0];
electricity = [50.2 112.4]*CEPCI2022/CEPCI2019;
firedHeat = [217.9245 695.2830]*CEPCI2022/CEPCI2021;
carbonStorage = [0 0];
wasteWater = [0 0];
flueGas = [0 0];
steam = [0 0];
catalyst = [0 0];
fixedCosts = [0 0];
CAPEX = [0 0];

lowHighValues = [NG;CO2;biogas;O2;H2;ethylene;coolingWater;electricity;firedHeat;carbonStorage;wasteWater;...
    flueGas;steam;catalyst;fixedCosts;CAPEX];
fileName = "Economics; NG, wind, gEthylene (2022).xlsx";
sheetName = "Summary";
totalPropanol = xlsread(fileName, sheetName, "C23")/1000;
totalExpCategory = xlsread(fileName, sheetName, "F40:F54");
reqCategory = xlsread(fileName, sheetName, "G40:G54");
totalExp = sum(totalExpCategory);
low = zeros(15,1); high = zeros(15,1);
for i = 1:length(totalExpCategory)
    if lowHighValues(i,1) ~= 0 && totalExpCategory(i) ~= 0
        low(i) = reqCategory(i)*lowHighValues(i,1)/totalPropanol;
    else 
        low(i) = totalExpCategory(i);
    end
    if lowHighValues(i,2) ~= 0 && totalExpCategory(i) ~= 0
        high(i) = reqCategory(i)*lowHighValues(i,2)/totalPropanol;
    else 
        high(i) = totalExpCategory(i);
    end
end
lowBAU = sum(low);
highBAU = sum(high);
xlswrite("Economics plot data.xlsx", [totalExp - lowBAU highBAU - totalExp], "Total and error bars", "D5:E5");

%% DAC green ethylene
NG = [217.9245 695.2830]*CEPCI2022/CEPCI2021;
CO2 = [94.7 233.7]*CEPCI2022/CEPCI2019;
biogas = [0,0];
O2 = [0 0];
H2 = [3560 10820]*CEPCI2022/CEPCI2019;
ethylene = [1900 3500]*CEPCI2022/CEPCI2019;
coolingWater = [0 0];
electricity = [50.2 112.4]*CEPCI2022/CEPCI2019;
firedHeat = [217.9245 695.2830]*CEPCI2022/CEPCI2021;
carbonStorage = [0 0];
wasteWater = [0 0];
flueGas = [0 0];
steam = [0 0];
catalyst = [0 0];
fixedCosts = [0 0];
CAPEX = [0 0];

lowHighValues = [NG;CO2;biogas;O2;H2;ethylene;coolingWater;electricity;firedHeat;carbonStorage;wasteWater;...
    flueGas;steam;catalyst;fixedCosts;CAPEX];
fileName = "Economics; DAC, wind, gEthylene (2022).xlsx";
sheetName = "Summary";
totalPropanol = xlsread(fileName, sheetName, "C23")/1000;
totalExpCategory = xlsread(fileName, sheetName, "F40:F55");
reqCategory = xlsread(fileName, sheetName, "G40:G55");
totalExp = sum(totalExpCategory);
low = zeros(16,1); high = zeros(16,1);
for i = 1:length(totalExpCategory)
    if lowHighValues(i,1) ~= 0 && totalExpCategory(i) ~= 0
        low(i) = reqCategory(i)*lowHighValues(i,1)/totalPropanol;
    else 
        low(i) = totalExpCategory(i);
    end
    if lowHighValues(i,2) ~= 0 && totalExpCategory(i) ~= 0
        high(i) = reqCategory(i)*lowHighValues(i,2)/totalPropanol;
    else 
        high(i) = totalExpCategory(i);
    end
end
lowBAU = sum(low);
highBAU = sum(high);
xlswrite("Economics plot data.xlsx", [totalExp - lowBAU highBAU - totalExp], "Total and error bars", "D6:E6");

%% Biogas
NG = [217.9245 695.2830]*CEPCI2022/CEPCI2021;
CO2 = [0 0];
biogas = [150.8618 284.9610]*CEPCI2022/CEPCI2018;
O2 = [0 0];
H2 = [1220 2810]*CEPCI2022/CEPCI2019;
ethylene = [0 0];
coolingWater = [0 0];
electricity = [50.2 112.4]*CEPCI2022/CEPCI2019;
firedHeat = [217.9245 695.2830]*CEPCI2022/CEPCI2021;
carbonStorage = [0 0];
wasteWater = [0 0];
flueGas = [0 0];
steam = [0 0];
catalyst = [0 0];
fixedCosts = [0 0];
CAPEX = [0 0];

lowHighValues = [NG;CO2;biogas;O2;H2;ethylene;coolingWater;electricity;firedHeat;carbonStorage;wasteWater;...
    flueGas;steam;catalyst;fixedCosts;CAPEX];
fileName = "Economics; biogas (2022).xlsx";
sheetName = "Summary";
totalPropanol = xlsread(fileName, sheetName, "C23")/1000;
totalExpCategory = xlsread(fileName, sheetName, "F42:F57");
reqCategory = xlsread(fileName, sheetName, "G42:G57");
totalExp = sum(totalExpCategory);
low = zeros(16,1); high = zeros(16,1);
for i = 1:length(totalExpCategory)
    if lowHighValues(i,1) ~= 0 && totalExpCategory(i) ~= 0
        low(i) = reqCategory(i)*lowHighValues(i,1)/totalPropanol;
    else 
        low(i) = totalExpCategory(i);
    end
    if lowHighValues(i,2) ~= 0 && totalExpCategory(i) ~= 0
        high(i) = reqCategory(i)*lowHighValues(i,2)/totalPropanol;
    else 
        high(i) = totalExpCategory(i);
    end
end
lowBAU = sum(low);
highBAU = sum(high);
xlswrite("Economics plot data.xlsx", [totalExp - lowBAU highBAU - totalExp], "Total and error bars", "D7:E7");

%% Biogas, green ethylene - NG
NG = [217.9245 695.2830]*CEPCI2022/CEPCI2021;
CO2 = [54.6 126.4]*CEPCI2022/CEPCI2019;
biogas = [150.8618 284.9610]*CEPCI2022/CEPCI2018;
O2 = [0 0];
H2 = [3560 10820]*CEPCI2022/CEPCI2019;
ethylene = [1900 3500]*CEPCI2022/CEPCI2019;
coolingWater = [0 0];
electricity = [50.2 112.4]*CEPCI2022/CEPCI2019;
firedHeat = [217.9245 695.2830]*CEPCI2022/CEPCI2021;
carbonStorage = [0 0];
wasteWater = [0 0];
flueGas = [0 0];
steam = [0 0];
catalyst = [0 0];
fixedCosts = [0 0];
CAPEX = [0 0];

lowHighValues = [NG;CO2;biogas;O2;H2;ethylene;coolingWater;electricity;firedHeat;carbonStorage;wasteWater;...
    flueGas;steam;catalyst;fixedCosts;CAPEX];
fileName = "Economics; biogas, gEthylene - NG (2022).xlsx";
sheetName = "Summary";
totalPropanol = xlsread(fileName, sheetName, "C23")/1000;
totalExpCategory = xlsread(fileName, sheetName, "F42:F57");
reqCategory = xlsread(fileName, sheetName, "G42:G57");
totalExp = sum(totalExpCategory);
low = zeros(16,1); high = zeros(16,1);
for i = 1:length(totalExpCategory)
    if lowHighValues(i,1) ~= 0 && totalExpCategory(i) ~= 0
        low(i) = reqCategory(i)*lowHighValues(i,1)/totalPropanol;
    else 
        low(i) = totalExpCategory(i);
    end
    if lowHighValues(i,2) ~= 0 && totalExpCategory(i) ~= 0
        high(i) = reqCategory(i)*lowHighValues(i,2)/totalPropanol;
    else 
        high(i) = totalExpCategory(i);
    end
end
lowBAU = sum(low);
highBAU = sum(high);
xlswrite("Economics plot data.xlsx", [totalExp - lowBAU highBAU - totalExp], "Total and error bars", "D8:E8");

%% Biogas, green ethylene - DAC
NG = [217.9245 695.2830]*CEPCI2022/CEPCI2021;
CO2 = [94.7 233.7]*CEPCI2022/CEPCI2019;
biogas = [150.8618 284.9610]*CEPCI2022/CEPCI2018;
O2 = [0 0];
H2 = [3560 10820]*CEPCI2022/CEPCI2019;
ethylene = [1900 3500]*CEPCI2022/CEPCI2019;
coolingWater = [0 0];
electricity = [50.2 112.4]*CEPCI2022/CEPCI2019;
firedHeat = [217.9245 695.2830]*CEPCI2022/CEPCI2021;
carbonStorage = [0 0];
wasteWater = [0 0];
flueGas = [0 0];
steam = [0 0];
catalyst = [0 0];
fixedCosts = [0 0];
CAPEX = [0 0];

lowHighValues = [NG;CO2;biogas;O2;H2;ethylene;coolingWater;electricity;firedHeat;carbonStorage;wasteWater;...
    flueGas;steam;catalyst;fixedCosts;CAPEX];
fileName = "Economics; biogas, gEthylene - DAC (2022).xlsx";
sheetName = "Summary";
totalPropanol = xlsread(fileName, sheetName, "C23")/1000;
totalExpCategory = xlsread(fileName, sheetName, "F42:F57");
reqCategory = xlsread(fileName, sheetName, "G42:G57");
totalExp = sum(totalExpCategory);
low = zeros(16,1); high = zeros(16,1);
for i = 1:length(totalExpCategory)
    if lowHighValues(i,1) ~= 0 && totalExpCategory(i) ~= 0
        low(i) = reqCategory(i)*lowHighValues(i,1)/totalPropanol;
    else 
        low(i) = totalExpCategory(i);
    end
    if lowHighValues(i,2) ~= 0 && totalExpCategory(i) ~= 0
        high(i) = reqCategory(i)*lowHighValues(i,2)/totalPropanol;
    else 
        high(i) = totalExpCategory(i);
    end
end
lowBAU = sum(low);
highBAU = sum(high);
xlswrite("Economics plot data.xlsx", [totalExp - lowBAU highBAU - totalExp], "Total and error bars", "D9:E9");

%% Biogas, bio ethylene
% for methanol
NG = [217.9245 695.2830]*CEPCI2022/CEPCI2021;
CO2 = [54.6 126.4]*CEPCI2022/CEPCI2019;
biogas = [150.8618 284.9610]*CEPCI2022/CEPCI2018;
O2 = [0 0];
H2 = [3560 10820]*CEPCI2022/CEPCI2019;
ethylene = [1900 3500]*CEPCI2022/CEPCI2019;
coolingWater = [0 0];
electricity = [50.2 112.4]*CEPCI2022/CEPCI2019;
firedHeat = [217.9245 695.2830]*CEPCI2022/CEPCI2021;
carbonStorage = [0 0];
wasteWater = [0 0];
flueGas = [0 0];
steam = [0 0];
catalyst = [0 0];
fixedCosts = [0 0];
CAPEX = [0 0];

lowHighValues = [NG;CO2;biogas;O2;H2;ethylene;coolingWater;electricity;firedHeat;carbonStorage;wasteWater;...
    flueGas;steam;catalyst;fixedCosts;CAPEX];
fileName = "Economics; biogas to methanol (2022).xlsx";
sheetName = "Summary";
totalPropanol = xlsread(fileName, sheetName, "C23")/1000;
totalExpCategory = xlsread(fileName, sheetName, "F42:F57");
reqCategory = xlsread(fileName, sheetName, "G42:G57");
totalExp = sum(totalExpCategory);
low = zeros(16,1); high = zeros(16,1);
for i = 1:length(totalExpCategory)
    if lowHighValues(i,1) ~= 0 && totalExpCategory(i) ~= 0
        low(i) = reqCategory(i)*lowHighValues(i,1)/totalPropanol;
    else 
        low(i) = totalExpCategory(i);
    end
    if lowHighValues(i,2) ~= 0 && totalExpCategory(i) ~= 0
        high(i) = reqCategory(i)*lowHighValues(i,2)/totalPropanol;
    else 
        high(i) = totalExpCategory(i);
    end
end
lowMeOH = sum(low);
highMeOH = sum(high);

%bio ethylene
ethyleneWithoutMeOH = 324.34;
MeOHReq = 2.52;
lowEthylene = ethyleneWithoutMeOH + MeOHReq*lowMeOH;
highEthylene = ethyleneWithoutMeOH + MeOHReq*highMeOH;
ethylene = [lowEthylene highEthylene];

lowHighValues = [NG;CO2;biogas;O2;H2;ethylene;coolingWater;electricity;firedHeat;carbonStorage;wasteWater;...
    flueGas;steam;catalyst;fixedCosts;CAPEX];
fileName = "Economics; biogas, bEthylene (2022).xlsx";
sheetName = "Summary";
totalPropanol = xlsread(fileName, sheetName, "C23")/1000;
totalExpCategory = xlsread(fileName, sheetName, "F42:F57");
reqCategory = xlsread(fileName, sheetName, "G42:G57");
totalExp = sum(totalExpCategory);
low = zeros(16,1); high = zeros(16,1);
for i = 1:length(totalExpCategory)
    if lowHighValues(i,1) ~= 0 && totalExpCategory(i) ~= 0
        low(i) = reqCategory(i)*lowHighValues(i,1)/totalPropanol;
    else 
        low(i) = totalExpCategory(i);
    end
    if lowHighValues(i,2) ~= 0 && totalExpCategory(i) ~= 0
        high(i) = reqCategory(i)*lowHighValues(i,2)/totalPropanol;
    else 
        high(i) = totalExpCategory(i);
    end
end
lowBAU = sum(low);
highBAU = sum(high);
xlswrite("Economics plot data.xlsx", [totalExp - lowBAU highBAU - totalExp], "Total and error bars", "D10:E10");