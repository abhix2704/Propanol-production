clear 
close all
clc

type = 1; %1 - gE; 2 - BAU ethylene
fileName = 'Electricity characterisation factor - sensitivity.xlsx';
BAUImpact = 4.6039; %ethylene, average market for

%% Wind electricity factors
avgWCF = 0.015576812; %Electricity, high voltage {RoW}| electricity production, wind, <1MW turbine, onshore | Cut-off, S
minWCF = 0.007832169; %Indonesia
maxWCF = 0.093986035; %Russia
UKWCF = 0.0121; %UK
USWCF = 0.0117; %US
GermanyWCF = 0.0173; %Germany
SpainWCF = 0.0129; %Spain
SwissWCF = 0.0165; %Switzerland

%% Grid electricity factors
avgGCF = 0.73691214; %Electricity, high voltage {GLO}| market group for | Cut-off, S
minGCF = 0.023615736; %Canada
maxGCF = 1.247913576; %Malta
UKGCF = 0.529; %UK
USGCF = 0.5; %US
GermanyGCF = 0.652; %Germany
SpainGCF = 0.339; %Spain
SwissGCF = 0.0949; %Switzerland
IcelandGCF = 0.0615; %Iceland

minCF = min([minWCF;minGCF]);
maxCF = max([maxWCF;maxGCF]);

%% Wind electricity plots
sheetName = ["DAC + wind + gE";"DAC + wind"; "NG + wind + gE"; "NG + wind"];
for i = 1:length(sheetName)
    totalElecW(i) = xlsread(fileName,sheetName(i),'C14');
    totalElecImpactW(i) = xlsread(fileName,sheetName(i),'D14');
    totalProImpactW(i) = xlsread(fileName,sheetName(i),'D15');
end

WCF = linspace(0.75*minWCF,1.5*maxWCF,1000);
for i = 1:length(WCF)
    for j = 1:length(sheetName)
        senImpactW(i,j) = (totalProImpactW(j) - totalElecImpactW(j)) + totalElecW(j) * WCF(i);
    end
end

% figure('units','normalized','outerposition',[0 0 1 1])
% subplot(1,2,1)
% for i = 1:length(sheetName)
%     plot(WCF,senImpactW(:,i),'LineWidth',1)
%     hold on
% end
% title('Wind electricity')
% xline(minWCF,'--g','Indonesia','FontSize',13,'LineWidth',1)
% hold on
% xline(avgWCF,'--b','RoW','FontSize',13,'LineWidth',1)
% hold on
% xline(maxWCF,'--r','Russia','FontSize',13,'LineWidth',1)
% hold on
% yline(BAUImpact,'--','BAU','FontSize',13,'LineWidth',1)
% hold on
% for i = 1:length(sheetName)
%     plot(avgWCF,totalProImpactW(i),'--h','MarkerSize',13,'MarkerFaceColor',[1 0 0],'MarkerEdgeColor',[1 1 0])
%     hold on
% end
% lg = legend(sheetName,'Location','southeast');
% ylabel('GWP [kg CO_{2eq} kg^{-1} propanol]')
% xlabel('Characterization factor of electricity [kg CO_{2eq} kWh^{-1}]')
% set(gca,'FontSize',13)
% set(gca,'TickLength',[0 0])

%% Grid electricity plots
sheetName = ["DAC + grid + gE";"DAC + grid"; "NG + grid + gE"; "NG + grid"];
for i = 1:length(sheetName)
    totalElecG(i) = xlsread(fileName,sheetName(i),'C14');
    totalElecImpactG(i) = xlsread(fileName,sheetName(i),'D14');
    totalProImpactG(i) = xlsread(fileName,sheetName(i),'D15');
end

GCF = linspace(0.5*minGCF,1.25*maxGCF,1000);
for i = 1:length(GCF)
    for j = 1:length(sheetName)
        senImpactG(i,j) = (totalProImpactG(j) - totalElecImpactG(j)) + totalElecG(j) * GCF(i);
    end
end

figure('units','normalized','outerposition',[0 0 1 1])
% subplot(1,2,2)
for i = 1:length(sheetName)
    plot(GCF,senImpactG(:,i),'LineWidth',1)
    hold on
end
% title('Grid electricity')
xline(UKGCF,'--b','UK','FontSize',13,'LineWidth',1)
hold on
xline(USGCF,'--b','USA','FontSize',13,'LineWidth',1)
hold on
xline(SpainGCF,'--b','Spain','FontSize',13,'LineWidth',1)
hold on
xline(SwissGCF,'--g','Switzerland','FontSize',13,'LineWidth',1)
hold on
xline(GermanyGCF,'--r','Germany','FontSize',13,'LineWidth',1)
hold on
yline(BAUImpact,'-.','BAU','FontSize',15,'LineWidth',2,'LabelVerticalAlignment','bottom',...
    'LabelHorizontalAlignment','center')
% hold on
% for i = 1:length(sheetName)
%     plot(avgGCF,totalProImpactG(i),'--h','MarkerSize',13,'MarkerFaceColor',[1 0 0],'MarkerEdgeColor',[1 1 0])
%     hold on
% end
lg = legend({'DAC + gE','DAC','NG + gE','NG'},'Location','southeast');
ylabel('GWP [kg CO_{2eq} kg^{-1} propanol]')
xlabel('GWP of electricity [kg CO_{2eq} kWh^{-1}]')
set(gca,'FontSize',13)
set(gca,'TickLength',[0 0])

%% Wind electricity values
axes('position',[.165 .5 .25 .25])
box on
for i = 1:length(sheetName)
    plot(WCF,senImpactW(:,i),'LineWidth',1)
    hold on
end
% xline(UKWCF,'--','UK','FontSize',9,'LineWidth',1)
% hold on
% xline(USWCF,'--g','USA','FontSize',9,'LineWidth',1)
% hold on
% xline(SpainWCF,'--','Spain','FontSize',9,'LineWidth',1)
% hold on
% xline(SwissWCF,'--','Switzerland','FontSize',13,'LineWidth',1)
% hold on
xline(avgWCF,'--b','Wind - Germany','FontSize',9,'LineWidth',1)
hold on
yline(BAUImpact,'-.','BAU','FontSize',11,'LineWidth',2,'LabelVerticalAlignment','bottom',...
    'LabelHorizontalAlignment','center')
% hold on
% for i = 1:length(sheetName)
%     plot(avgWCF,totalProImpactW(i),'--h','MarkerSize',9,'MarkerFaceColor',[1 0 0],'MarkerEdgeColor',[1 1 0])
%     hold on
% end
axis tight
% h = annotation('line',[.13 .165],[0.11 .5]);
% h.LineStyle = '-.';

% Create textbox
annotation('textbox',...
    [0.337947479625521 0.536585366082492 0.0477941163792079 0.0243902434447701],...
    'VerticalAlignment','middle',...
    'String','Wind range',...
    'HorizontalAlignment','center',...
    'FitBoxToText','off');

% Create textbox
annotation('textbox',...
    [0.647033614353219 0.160794941511578 0.0840588226215704 0.0379403791749622],...
    'VerticalAlignment','middle',...
    'String','Grid (GLO) range',...
    'HorizontalAlignment','center',...
    'FontSize',13,...
    'FitBoxToText','off');
