clear 
close all
clc

CEPCI2008 = 575.4;
CEPCI2018 = 603.1;
CEPCI2019 = 607.5;
CEPCI2021 = 776.3;
CEPCI2022 = 803.6;

CO2Future2030 = 100; %$/t
H2FutureWind2030 = 2718; %$/t
biogasFuture2030 = 93.16; %$/t

% NG, BAU ethylene
fileName = "Economics; NG, wind, BAU ethylene (2022).xlsx";
sheetName = "Summary";
totalPropanol = xlsread(fileName, sheetName, "C23")/1000;
totalExpCategory = xlsread(fileName, sheetName, "F40:F55");
reqCategory = xlsread(fileName, sheetName, "G40:G55");
totalExpCategory(5) = reqCategory(5)*H2FutureWind2030/totalPropanol;
pricesCons = [totalExpCategory(1:6);sum(totalExpCategory(7:end-1));totalExpCategory(end)];
xlswrite("Economics plot data (future).xlsx", pricesCons, "All", "C18:C25");

% DAC, BAU ethylene
fileName = "Economics; DAC, wind, BAU ethylene (2022).xlsx";
sheetName = "Summary";
totalPropanol = xlsread(fileName, sheetName, "C23")/1000;
totalExpCategory = xlsread(fileName, sheetName, "F40:F55");
reqCategory = xlsread(fileName, sheetName, "G40:G55");
totalExpCategory(2) = reqCategory(2)*CO2Future2030/totalPropanol;
totalExpCategory(5) = reqCategory(5)*H2FutureWind2030/totalPropanol;
pricesCons = [totalExpCategory(1:6);sum(totalExpCategory(7:end-1));totalExpCategory(end)];
xlswrite("Economics plot data (future).xlsx", pricesCons, "All", "C34:C41");

% NG, green ethylene 
fileName = "Economics; NG, wind, gEthylene (2022).xlsx";
sheetName = "Summary";
totalPropanol = xlsread(fileName, sheetName, "C23")/1000;
totalExpCategory = xlsread(fileName, sheetName, "F40:F55");
reqCategory = xlsread(fileName, sheetName, "G40:G55");
totalExpCategory(5) = reqCategory(5)*H2FutureWind2030/totalPropanol;

currentH2Price = 3560*CEPCI2022/CEPCI2019;
ethyleneCurrentPrice = 2300*CEPCI2022/CEPCI2019;
H2ReqEthylene = 0.47; %ton per ton ethylene
ethylenePriceWithoutFeed = ethyleneCurrentPrice - ...
    H2ReqEthylene*currentH2Price; %refer Iasonas 2020 green ethylene paper

ethyleneFuture2030 = ethylenePriceWithoutFeed +...
    H2ReqEthylene*H2FutureWind2030;
totalExpCategory(6) = reqCategory(6)*ethyleneFuture2030/totalPropanol;
pricesCons = [totalExpCategory(1:6);sum(totalExpCategory(7:end-1));totalExpCategory(end)];
xlswrite("Economics plot data (future).xlsx", pricesCons, "All", "C50:C57");

% DAC, green ethylene 
fileName = "Economics; DAC, wind, gEthylene (2022).xlsx";
sheetName = "Summary";
totalPropanol = xlsread(fileName, sheetName, "C23")/1000;
totalExpCategory = xlsread(fileName, sheetName, "F40:F55");
reqCategory = xlsread(fileName, sheetName, "G40:G55");
totalExpCategory(2) = reqCategory(2)*CO2Future2030/totalPropanol;
totalExpCategory(5) = reqCategory(5)*H2FutureWind2030/totalPropanol;

currentCO2Price = 164.2*CEPCI2022/CEPCI2019;
currentH2Price = 3560*CEPCI2022/CEPCI2019;
ethyleneCurrentPrice = 2600*CEPCI2022/CEPCI2019;
CO2ReqEthylene = 3.653; %ton per ton ethylene
H2ReqEthylene = 0.47; %ton per ton ethylene
ethylenePriceWithoutFeed = ethyleneCurrentPrice - CO2ReqEthylene*currentCO2Price - ...
    H2ReqEthylene*currentH2Price; %refer Iasonas 2020 green ethylene paper

ethyleneFuture2030 = ethylenePriceWithoutFeed + CO2ReqEthylene*CO2Future2030 +...
    H2ReqEthylene*H2FutureWind2030;
totalExpCategory(6) = reqCategory(6)*ethyleneFuture2030/totalPropanol;
pricesCons = [totalExpCategory(1:6);sum(totalExpCategory(7:end-1));totalExpCategory(end)];
xlswrite("Economics plot data (future).xlsx", pricesCons, "All", "C66:C73");

% Biogas, BAU ethylene
fileName = "Economics; biogas (2022).xlsx";
sheetName = "Summary";
totalPropanol = xlsread(fileName, sheetName, "C23")/1000;
totalExpCategory = xlsread(fileName, sheetName, "F42:F57");
reqCategory = xlsread(fileName, sheetName, "G42:G57");
totalExpCategory(3) = reqCategory(3)*biogasFuture2030/totalPropanol;
pricesCons = [totalExpCategory(1:6);sum(totalExpCategory(7:end-1));totalExpCategory(end)];
xlswrite("Economics plot data (future).xlsx", pricesCons, "All", "C82:C89");

% Biogas, green ethylene - NG
fileName = "Economics; biogas, gEthylene - NG (2022).xlsx";
sheetName = "Summary";
totalPropanol = xlsread(fileName, sheetName, "C23")/1000;
totalExpCategory = xlsread(fileName, sheetName, "F42:F57");
reqCategory = xlsread(fileName, sheetName, "G42:G57");
totalExpCategory(3) = reqCategory(3)*biogasFuture2030/totalPropanol;

currentH2Price = 3560*CEPCI2022/CEPCI2019;
ethyleneCurrentPrice = 2300*CEPCI2022/CEPCI2019;
H2ReqEthylene = 0.47; %ton per ton ethylene
ethylenePriceWithoutFeed = ethyleneCurrentPrice - ...
    H2ReqEthylene*currentH2Price; %refer Iasonas 2020 green ethylene paper

ethyleneFuture2030 = ethylenePriceWithoutFeed +...
    H2ReqEthylene*H2FutureWind2030;
totalExpCategory(6) = reqCategory(6)*ethyleneFuture2030/totalPropanol;
pricesCons = [totalExpCategory(1:6);sum(totalExpCategory(7:end-1));totalExpCategory(end)];

xlswrite("Economics plot data (future).xlsx", pricesCons, "All", "C98:C105");

% Biogas, green ethylene - DAC
fileName = "Economics; biogas, gEthylene - DAC (2022).xlsx";
sheetName = "Summary";
totalPropanol = xlsread(fileName, sheetName, "C23")/1000;
totalExpCategory = xlsread(fileName, sheetName, "F42:F57");
reqCategory = xlsread(fileName, sheetName, "G42:G57");
totalExpCategory(2) = reqCategory(2)*CO2Future2030/totalPropanol;
totalExpCategory(3) = reqCategory(3)*biogasFuture2030/totalPropanol;

currentCO2Price = 164.2*CEPCI2022/CEPCI2019;
currentH2Price = 3560*CEPCI2022/CEPCI2019;
ethyleneCurrentPrice = 2600*CEPCI2022/CEPCI2019;
CO2ReqEthylene = 3.653; %ton per ton ethylene
H2ReqEthylene = 0.47; %ton per ton ethylene
ethylenePriceWithoutFeed = ethyleneCurrentPrice - CO2ReqEthylene*currentCO2Price - ...
    H2ReqEthylene*currentH2Price; %refer Iasonas 2020 green ethylene paper

ethyleneFuture2030 = ethylenePriceWithoutFeed + CO2ReqEthylene*CO2Future2030 +...
    H2ReqEthylene*H2FutureWind2030;

totalExpCategory(6) = reqCategory(6)*ethyleneFuture2030/totalPropanol;
pricesCons = [totalExpCategory(1:6);sum(totalExpCategory(7:end-1));totalExpCategory(end)];

xlswrite("Economics plot data (future).xlsx", pricesCons, "All", "C114:C121");

% Biogas, bio ethlyene
% Bio methanol
fileName = "Economics; biogas to methanol (2022).xlsx";
sheetName = "Summary";
totalMethanol = xlsread(fileName, sheetName, "C23")/1000;
totalExpCategory = xlsread(fileName, sheetName, "F42:F57");
reqCategory = xlsread(fileName, sheetName, "G42:G57");
totalExpCategory(3) = reqCategory(3)*biogasFuture2030/totalMethanol;
MeOHFuture2030 = sum(totalExpCategory);

%Bio ethylene
ethyleneFuture2030 = 2.52*MeOHFuture2030 + 324.34;

fileName = "Economics; biogas, bEthylene (2022).xlsx";
sheetName = "Summary";
totalPropanol = xlsread(fileName, sheetName, "C23")/1000;
totalExpCategory = xlsread(fileName, sheetName, "F42:F57");
reqCategory = xlsread(fileName, sheetName, "G42:G57");
totalExpCategory(3) = reqCategory(3)*biogasFuture2030/totalPropanol;
totalExpCategory(6) = reqCategory(6)*ethyleneFuture2030/totalPropanol;
pricesCons = [totalExpCategory(1:6);sum(totalExpCategory(7:end-1));totalExpCategory(end)];

xlswrite("Economics plot data (future).xlsx", pricesCons, "All", "C130:C137");
