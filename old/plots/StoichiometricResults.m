clear
clc
close all

fileName1 = "Propanol - stoichiometric calculations.xlsx"; %stoichiometric calculations


%% Economics
sheetName = 'Economic result s';
prices1 = xlsread(fileName1,sheetName,'D4:D11');

BAU = [179.87 0 0 603.4 32.93];
DACWind = [0 prices1(2) prices1(3) prices1(4) 0];
DACWindGE = [0 prices1(2) prices1(3) prices1(6) 0];
NGWind = [0 prices1(1) prices1(3) prices1(4) 0];
NGWindGE = [0 prices1(1) prices1(3) prices1(5) 0];
eco = [BAU;DACWind;DACWindGE;NGWind;NGWindGE]./1000;
% z = zeros(1,length(eco(1,:)));
% xeco = [eco(1,:); z; eco(2:5,:); z; eco(6:9,:); z; eco(10:13,:); z; eco(14:17,:)];

figure('units','normalized','outerposition',[0 0 1 1])
bh = barh(eco,'stacked');
% for i = 1:length(bh)
%     bh(i).EdgeColor = 'none';
% end
bh(1).FaceColor = 'flat';
bh(1).CData(1,:) = [0 0 0];
ylabels = {'BAU','(DAC)_{stoi}','(DAC)_{stoi} + gE','(NG)_{stoi}','(NG)_{stoi} + gE'};
xlabel('$ kg^{-1} propanol')
legend({'Natural gas','Carbon dioxide','Hydrogen','Ethylene','Oxygen'})
legend('boxoff')
set(gca, 'YTick', 1:length(eco))
set(gca,'YTicklabels',ylabels)
set(gca,'FontSize',15)
set(gca,'TickLength',[0 0])
