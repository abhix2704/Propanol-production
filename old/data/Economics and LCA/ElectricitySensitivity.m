clear 
close all
clc

CEPCI2008 = 575.4;
CEPCI2018 = 603.1;
CEPCI2019 = 607.5;
CEPCI2021 = 776.3;
CEPCI2022 = 803.6;

reqElecCO2PerTon = 0.282; %in MWh
reqElecH2PerTon = 63.372; %in MWh
currentWindElecPrice = 56.4*CEPCI2022/CEPCI2019; %$/MWh
currentBAUElecPrice = 69.6*CEPCI2022/CEPCI2019; %$/MWh
elecPrice = 0:1:250; %$/MWh
reqCO2Ethylene = 3.62; %t CO2/t ethylene
reqH2Ethylene = 0.47; %t H2/t ethylene
prices = zeros(length(elecPrice),2);
prices(:,1) = elecPrice';

% CO2: NG, H2: Wind, BAU ethylene sensitvity
fileName = "Economics; NG, wind, BAU ethylene (2022).xlsx";
sheetName = "Summary";
totalPropanol = xlsread(fileName, sheetName, "C23")/1000;
totalExpCategory = xlsread(fileName, sheetName, "F40:F55");
reqCategory = xlsread(fileName, sheetName, "G40:G55");
totalExp = sum(totalExpCategory);
reqH2 = reqCategory(5);
reqBAUElec = reqCategory(8);
H2Elec = reqH2*reqElecH2PerTon; %MWh/hr
BAUElec = reqBAUElec;
totalExpWithoutElec = totalExp - (H2Elec)*currentWindElecPrice/totalPropanol - ...
    BAUElec*currentBAUElecPrice/totalPropanol;
currentPropPrice = totalExpWithoutElec + (H2Elec)*currentWindElecPrice/totalPropanol +...
    BAUElec*currentBAUElecPrice/totalPropanol;
prices(:,2) = (totalExpWithoutElec + (H2Elec).*elecPrice./totalPropanol)' + ...
    (BAUElec.*elecPrice./totalPropanol)';

% CO2: DAC, H2: Wind, green ethylene sensitvity
fileName = "Economics; NG, wind, gEthylene (2022).xlsx";
sheetName = "Summary";
totalPropanol = xlsread(fileName, sheetName, "C23")/1000;
totalExpCategory = xlsread(fileName, sheetName, "F40:F55");
reqCategory = xlsread(fileName, sheetName, "G40:G55");
totalExp = sum(totalExpCategory);
reqH2 = reqCategory(5);
reqBAUElec = reqCategory(8);
H2Elec = reqH2*reqElecH2PerTon; %MWh/hr
BAUElec = reqBAUElec;
reqEthylene = reqCategory(6);
H2EthyleneElec = reqH2Ethylene*reqElecH2PerTon;
reqElecEthylenePerTon = H2EthyleneElec;
ethyleneElec = reqEthylene*reqElecEthylenePerTon;
totalExpWithoutElec = totalExp - (H2Elec + ethyleneElec)*currentWindElecPrice/totalPropanol - ...
    BAUElec*currentBAUElecPrice/totalPropanol;
currentPropPrice = totalExpWithoutElec + (H2Elec + ethyleneElec)*currentWindElecPrice/totalPropanol + ...
    BAUElec*currentBAUElecPrice/totalPropanol;
prices(:,3) = (totalExpWithoutElec + (H2Elec + ethyleneElec).*elecPrice./totalPropanol)' + ...
    (BAUElec.*elecPrice./totalPropanol)';

% CO2: DAC, H2: Wind, BAU ethylene sensitvity
fileName = "Economics; DAC, wind, BAU ethylene (2022).xlsx";
sheetName = "Summary";
totalPropanol = xlsread(fileName, sheetName, "C23")/1000;
totalExpCategory = xlsread(fileName, sheetName, "F40:F55");
reqCategory = xlsread(fileName, sheetName, "G40:G55");
totalExp = sum(totalExpCategory);
reqBAUElec = reqCategory(8);
reqCO2 = reqCategory(2);
reqH2 = reqCategory(5);
CO2Elec = reqCO2*reqElecCO2PerTon; %MWh/hr
H2Elec = reqH2*reqElecH2PerTon; %MWh/hr
BAUElec = reqBAUElec;
totalExpWithoutElec = totalExp - (CO2Elec + H2Elec)*currentWindElecPrice/totalPropanol -...
    BAUElec*currentBAUElecPrice/totalPropanol;
currentPropPrice = totalExpWithoutElec + (CO2Elec + H2Elec)*currentWindElecPrice/totalPropanol +...
    BAUElec*currentBAUElecPrice/totalPropanol;
prices(:,4) = (totalExpWithoutElec + (CO2Elec + H2Elec).*elecPrice./totalPropanol)' + ...
    (BAUElec.*elecPrice./totalPropanol)';

% CO2: DAC, H2: Wind, green ethylene sensitvity
fileName = "Economics; DAC, wind, gEthylene (2022).xlsx";
sheetName = "Summary";
totalPropanol = xlsread(fileName, sheetName, "C23")/1000;
totalExpCategory = xlsread(fileName, sheetName, "F40:F55");
reqCategory = xlsread(fileName, sheetName, "G40:G55");
totalExp = sum(totalExpCategory);
reqBAUElec = reqCategory(8);
reqCO2 = reqCategory(2);
reqH2 = reqCategory(5);
CO2Elec = reqCO2*reqElecCO2PerTon; %MWh/hr
H2Elec = reqH2*reqElecH2PerTon; %MWh/hr
BAUElec = reqBAUElec;
reqEthylene = reqCategory(6);
CO2EthyleneElec = reqCO2Ethylene*reqElecCO2PerTon;
H2EthyleneElec = reqH2Ethylene*reqElecH2PerTon;
reqElecEthylenePerTon = CO2EthyleneElec + H2EthyleneElec;
ethyleneElec = reqEthylene*reqElecEthylenePerTon;
totalExpWithoutElec = totalExp - (CO2Elec + H2Elec + ethyleneElec)*currentWindElecPrice/totalPropanol -...
    BAUElec*currentBAUElecPrice/totalPropanol;
currentPropPrice = totalExpWithoutElec + (CO2Elec + H2Elec + ethyleneElec)*currentWindElecPrice/totalPropanol +...
    BAUElec*currentBAUElecPrice/totalPropanol;
prices(:,5) = (totalExpWithoutElec + (CO2Elec + H2Elec + ethyleneElec).*elecPrice./totalPropanol)' + ...
    (BAUElec.*elecPrice./totalPropanol)';

% BAU sensitivity
fileName = "Methane to 1-propanol v5\Economics - steam sold (2022).xlsx";
sheetName = "Summary";
totalPropanol = xlsread(fileName, sheetName, "C23")/1000;
totalExpCategory = xlsread(fileName, sheetName, "F41:F56");
reqCategory = xlsread(fileName, sheetName, "G41:G56");
totalExp = sum(totalExpCategory);
reqBAUElec = reqCategory(8);
BAUElec = reqBAUElec;
totalExpWithoutElec = totalExp - BAUElec*currentBAUElecPrice/totalPropanol;
currentPropPrice = totalExpWithoutElec + BAUElec*currentBAUElecPrice/totalPropanol;
prices(:,6) = (totalExpWithoutElec)' + (BAUElec.*elecPrice./totalPropanol)';

xlswrite("Economics plot data.xlsx", prices, "Elec sensitivity", "A2");
