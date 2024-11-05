clear
close all
clc

fileName = "Economics - steam sold.xlsx"; %stoichiometric calculations
sheetName = 'Summary';
CAPEXLabels = {'Compressors','Pumps','Heat exchangers','Reactors','Flash separators','Columns'};
CAPEX = xlsread(fileName,sheetName,'K5:K10');
p = pie(CAPEX);
for i = 1:length(p)
    if mod(i,2) == 0
        p(i).FontSize = 15;
    end
end
lgd = legend(CAPEXLabels);
lgd.Orientation = 'Horizontal';
lgd.Location = 'south';
set(gca,'FontSize',15)

%% Economics
literature = zeros(1,15);
literature(1) = 1.475;
CAPEX = xlsread(fileName,sheetName,'K11');
fixedCosts = xlsread(fileName,sheetName,'K19');
OPEX = xlsread(fileName,sheetName,'F26:F36');
OPEX = [OPEX(1);0;OPEX(2:end)];
propanolProduced = xlsread(fileName,sheetName,'C23');
BAUEco = [0 OPEX' CAPEX fixedCosts]./propanolProduced.*10^6./8000;

fileName = "Propanol - intermediate calculations with utilities.xlsx"; %intermediate calculations with utilities
sheetName = 'Economic results';
prices = xlsread(fileName,sheetName,'D4:D11');
DACWind = [0 0 prices(2) 0 prices(4) prices(3) prices(8) prices(7) 0 0 0 0 0 231 45.026]./1000;
DACWindGE = [0 0 prices(2) 0 prices(6) prices(3) prices(8) prices(7) 0 0 0 0 0 231 45.026]./1000;
NGWind = [0 0 prices(1) 0 prices(4) prices(3) prices(8) prices(7) 0 0 0 0 0 231 45.026]./1000;
NGWindGE = [0 0 prices(1) 0 prices(6) prices(3) prices(8) prices(7) 0 0 0 0 0 231 45.026]./1000;

eco = [literature; BAUEco; DACWind; DACWindGE; NGWind; NGWindGE];
figure('units','normalized','outerposition',[0 0 1 1])
bh = barh(eco,'stacked');
% for i = 1:length(bh)
%     bh(i).EdgeColor = 'none';
% end
for i = 1:length(bh)
    bh(i).FaceColor = 'flat';
end
bh(1).CData(1,:) = [0 0 0];
bh(10).CData(1:6,:) = repmat([0.153 0.341 0.42],6,1);
bh(11).CData(1:6,:) = repmat([1 0 0],6,1);
bh(12).CData(1:6,:) = repmat([0.667 0.333 0.522],6,1);
bh(13).CData(1:6,:) = repmat([0.11 0.286 0.875],6,1);
bh(14).CData(1:6,:) = repmat([0.6350 0.6280 0.3840],6,1);
bh(15).CData(1:6,:) = repmat([0.804 0.533 0.686],6,1);

ylabels = {'Literature','Flowsheet','(DAC)_{stoi}','(DAC)_{stoi} + gE',...
    '(NG)_{stoi}','(NG)_{stoi} + gE'};
xlabel('$ kg^{-1} propanol')
hold on
% legend('boxoff')
for i = 1:length(eco(:,1))
    plot(sum(eco(i,:)),i,'--h','MarkerSize',15,'MarkerFaceColor',[1 0 0],'MarkerEdgeColor',[1 1 0])
end
errPos = 1.690 - 1.475;
errNeg = 1.475 - 1.065;
errorbar(sum(eco(1,:)),1,errNeg,errPos,'horizontal','LineWidth',1.5);
set(gca, 'YTick', 1:length(eco(:,1)))
set(gca,'YTicklabels',ylabels)
set(gca,'FontSize',15)
set(gca,'TickLength',[0 0])
legend({'Literature','Natural gas','Carbon dioxide','Oxygen','Ethylene','Hydrogen','Cooling water',...
    'Electricity','Carbon dioxide storage','Wastewater treatment','Flue gas','Steam',...
    'Catalysts','CAPEX','Fixed costs'})
legend('Location','bestoutside')
