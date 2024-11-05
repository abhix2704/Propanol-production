clear 
close all
clc

CEPCI2008 = 575.4;
CEPCI2018 = 603.1;
CEPCI2019 = 607.5;
CEPCI2021 = 776.3;
CEPCI2022 = 803.6;


% Green ethylene file and data collection
fileName = "Economics; NG, wind, gEthylene (2022).xlsx";
sheetName = "Summary";
totalPropanol = xlsread(fileName, sheetName, "C23")/1000;
totalExpCategory = xlsread(fileName, sheetName, "F40:F55");
reqCategory = xlsread(fileName, sheetName, "G40:G55");
totalExp = sum(totalExpCategory);
totalExpWithoutFeed = totalExp - totalExpCategory(2) - totalExpCategory(5) - ...
    totalExpCategory(6);
reqCO2 = reqCategory(2);
reqH2 = reqCategory(5);
reqEthylene = reqCategory(6);

currentCO2Price = 80.3*CEPCI2022/CEPCI2019;
currentH2Price = 3560*CEPCI2022/CEPCI2019;
ethyleneCurrentPrice = 2300*CEPCI2022/CEPCI2019;
CO2ReqEthylene = 3.653; %ton per ton ethylene
H2ReqEthylene = 0.47; %ton per ton ethylene
ethylenePriceWithoutFeed = ethyleneCurrentPrice - CO2ReqEthylene*currentCO2Price - ...
    H2ReqEthylene*currentH2Price; %refer Iasonas 2020 green ethylene paper

currentEthylenePrice = CO2ReqEthylene*currentCO2Price + H2ReqEthylene*currentH2Price + ethylenePriceWithoutFeed;
currentPropPrice = totalExpWithoutFeed + (reqCO2*currentCO2Price + reqH2*currentH2Price +...
    reqEthylene*currentEthylenePrice)/totalPropanol;

CO2 = -500:50:750;
H2 = 0:50:7000;
prices = [];
for i = 1:length(CO2)
    for j = 1:length(H2)
        prices(end+1,:) = [CO2(i),H2(j)];
    end
end

prices(:,3) = ethylenePriceWithoutFeed + CO2ReqEthylene.*prices(:,1) + H2ReqEthylene.*prices(:,2);
prices(:,4) = totalExpWithoutFeed + (reqCO2.*prices(:,1) + reqH2.*prices(:,2) +...
    reqEthylene.*prices(:,3))./totalPropanol;

xlswrite("Economics plot data.xlsx", prices, "Green ethylene sensitivity", "A2");

% BAU ethylene sensitvity
fileName = "Economics; NG, wind, BAU ethylene (2022).xlsx";
sheetName = "Summary";
totalPropanol = xlsread(fileName, sheetName, "C23")/1000;
totalExpCategory = xlsread(fileName, sheetName, "F40:F55");
reqCategory = xlsread(fileName, sheetName, "G40:G55");
totalExp = sum(totalExpCategory);
reqCO2 = reqCategory(2);
reqH2 = reqCategory(5);

totalExpWithoutCAndH = totalExp - totalExpCategory(2) - totalExpCategory(5);

currentPropPrice = totalExpWithoutCAndH + (reqCO2*currentCO2Price + reqH2*currentH2Price)/totalPropanol;

prices = [];
for i = 1:length(CO2)
    for j = 1:length(H2)
        prices(end+1,:) = [CO2(i),H2(j)];
    end
end

prices(:,3) = totalExpWithoutCAndH + (reqCO2.*prices(:,1) + reqH2.*prices(:,2))./totalPropanol;

xlswrite("Economics plot data.xlsx", prices, "Green sensitivity", "A2");


