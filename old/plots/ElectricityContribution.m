close all
clear
clc

fileName = 'Electricity consumption - breakdown.xlsx';
sheetName = ["DAC + wind";"DAC + wind + gE";"NG + wind";"NG + wind + gE"];

figure('units','normalized','outerposition',[0 0 1 1])

for i = 1:length(sheetName)
   elec = xlsread(fileName,sheetName(i),'D3:D8'); 
   totalElec(:,i) = elec';
end
totalElec = totalElec';
bh = bar(totalElec,'stacked','FaceColor','flat');
bh(1).CData = [0.2081 0.1663 0.5292];
bh(2).CData = [0.0244 0.4350 0.8755];
bh(3).CData = [0.0265 0.6137 0.8135];
bh(4).CData = [0.1986 0.7214 0.6310];
bh(5).CData = [0.6473 0.7456 0.4188];
bh(6).CData = [0.9856 0.7372 0.2537];
ylabel('Electricity consumption [kWh kg^{-1} propanol]')
xlabels = {'DAC','DAC + gE','NG','NG + gE'};
set(gca, 'XTick', 1:length(sheetName))
set(gca,'XTicklabels',xlabels)
set(gca,'FontSize',15)
set(gca,'TickLength',[0 0])

lg = legend({'Carbon dioxide - propanol','Carbon dioxide - ethylene',...
    'Hydrogen - propanol','Hydrogen - ethylene','Compressors - propanol',...
    'Compressors - ethylene'});
legend('Orientation','horizontal')
lg.Position = [0.3000 0.9600 0.4081 0.0256];