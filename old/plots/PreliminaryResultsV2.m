clear
clc
close all

%% LCA results
sheetName = "LCA contri - cradle to gate";

fileName1 = "Propanol - stoichiometric calculations.xlsx"; %stoichiometric calculations
fileName2 = "Propanol - equilibrium calculations.xlsx"; %equilibrium calculations
fileName3 = "Propanol - intermediate calculations.xlsx"; %intermediate calculations
fileName4 = "Propanol - intermediate calculations with electricity.xlsx"; %intermediate calculations with electricity

%% Stoichiometric values
% Wind electricity
GWP1 = xlsread(fileName1,sheetName,'C5:J9');
humanHealth1 = xlsread(fileName1,sheetName,'C13:J17');
ecosystems1 = xlsread(fileName1,sheetName,'C21:J25');
resources1 = xlsread(fileName1,sheetName,'C29:J33');

% Grid electricity
GWP1Grid = xlsread(fileName1,sheetName,'C40:J44');
humanHealth1Grid = xlsread(fileName1,sheetName,'C48:J52');
ecosystems1Grid = xlsread(fileName1,sheetName,'C56:J60');
resources1Grid = xlsread(fileName1,sheetName,'C64:J68');

%% Equilibrium values
% Wind electricity
GWP2 = xlsread(fileName2,sheetName,'C5:J9');
humanHealth2 = xlsread(fileName2,sheetName,'C13:J17');
ecosystems2 = xlsread(fileName2,sheetName,'C21:J25');
resources2 = xlsread(fileName2,sheetName,'C29:J33');

% Grid electricity
GWP2Grid = xlsread(fileName2,sheetName,'C40:J44');
humanHealth2Grid = xlsread(fileName2,sheetName,'C48:J52');
ecosystems2Grid = xlsread(fileName2,sheetName,'C56:J60');
resources2Grid = xlsread(fileName2,sheetName,'C64:J68');

%% Intermediate values
% Wind electricity
GWP3 = xlsread(fileName3,sheetName,'C5:J9');
humanHealth3 = xlsread(fileName3,sheetName,'C13:J17');
ecosystems3 = xlsread(fileName3,sheetName,'C21:J25');
resources3 = xlsread(fileName3,sheetName,'C29:J33');

% Grid electricity
GWP3Grid = xlsread(fileName3,sheetName,'C40:J44');
humanHealth3Grid = xlsread(fileName3,sheetName,'C48:J52');
ecosystems3Grid = xlsread(fileName3,sheetName,'C56:J60');
resources3Grid = xlsread(fileName3,sheetName,'C64:J68');

%% Intermediate values with utilities
% Wind electricity
GWP4 = xlsread(fileName4,sheetName,'C5:J9');
humanHealth4 = xlsread(fileName4,sheetName,'C13:J17');
ecosystems4 = xlsread(fileName4,sheetName,'C21:J25');
resources4 = xlsread(fileName4,sheetName,'C29:J33');

% Grid electricity
GWP4Grid = xlsread(fileName4,sheetName,'C40:J44');
humanHealth4Grid = xlsread(fileName4,sheetName,'C48:J52');
ecosystems4Grid = xlsread(fileName4,sheetName,'C56:J60');
resources4Grid = xlsread(fileName4,sheetName,'C64:J68');


for i = 1:length(GWP1(:,1))
    if i == 1
        GWP = [GWP1(i,:)];
        GWPGrid = [GWP1Grid(i,:)];
        humanHealth = [humanHealth1(1,:)];
        humanHealthGrid = [humanHealth1Grid(1,:)];
        ecosystems = [ecosystems1(1,:)];
        ecosystemsGrid = [ecosystems1Grid(1,:)];
        resources = [resources1(1,:)];
        resourcesGrid = [resources1Grid(1,:)];
    else
        GWP = [GWP;GWP1(i,:);GWP2(i,:);GWP3(i,:);GWP4(i,:)];
        GWPGrid = [GWPGrid;GWP1Grid(i,:);GWP2Grid(i,:);GWP3Grid(i,:);GWP4Grid(i,:)];
        humanHealth = [humanHealth;humanHealth1(i,:);humanHealth2(i,:);...
            humanHealth3(i,:);humanHealth4(i,:)];
        humanHealthGrid = [humanHealthGrid;humanHealth1Grid(i,:);humanHealth2Grid(i,:);...
            humanHealth3Grid(i,:);humanHealth4Grid(i,:)];
        ecosystems = [ecosystems;ecosystems1(i,:);ecosystems2(i,:);...
            ecosystems3(i,:);ecosystems4(i,:)];
        ecosystemsGrid = [ecosystemsGrid;ecosystems1Grid(i,:);ecosystems2Grid(i,:);...
            ecosystems3Grid(i,:);ecosystems4Grid(i,:)];
        resources = [resources;resources1(i,:);resources2(i,:);...
            resources3(i,:);resources4(i,:)];
        resourcesGrid = [resourcesGrid;resources1Grid(i,:);resources2Grid(i,:);...
            resources3Grid(i,:);resources4Grid(i,:)];
    end
end

%% GWP
figure('units','normalized','outerposition',[0 0 1 1])
subplot(1,2,1)
bh = barh(GWP(:,2:end),'stacked');
title('Wind electricity (onshore)')
for i = 1:length(bh)
    bh(i).EdgeColor = 'none';
end
bh(1).FaceColor = 'flat';
bh(1).CData(1,:) = [0 0 0];
ylabels = {'BAU','(DAC)_{stoi}','(DAC)_{equi}','(DAC)_{recy}','(DAC)_{recy + el}',...
    '(DAC)_{stoi} + gE','(DAC)_{equi} + gE','(DAC)_{recy} + gE','(DAC)_{recy + el} + gE',...
    '(NG)_{stoi}','(NG)_{equi}','(NG)_{recy}','(NG)_{recy + el}',...
    '(NG)_{stoi + gE}','(NG)_{equi} + gE','(NG)_{recy} + gE','(NG)_{recy + el} + gE'};
xlabel('GWP [kg CO_{2eq}]')
hold on
for i = 1:length(GWP(:,1))
    plot(GWP(i,1),i,'--h','MarkerSize',15,'MarkerFaceColor',[1 0 0],'MarkerEdgeColor',[1 1 0])
end
set(gca, 'YTick', 1:length(GWP))
set(gca,'YTicklabels',ylabels)
set(gca,'FontSize',15)
set(gca,'TickLength',[0 0])

subplot(1,2,2)
bh = barh(GWPGrid(:,2:end),'stacked');
title('Grid electricity (market group GLO)')
for i = 1:length(bh)
    bh(i).EdgeColor = 'none';
end
bh(1).FaceColor = 'flat';
bh(1).CData(1,:) = [0 0 0];
ylabels = {'BAU','(DAC)_{stoi}','(DAC)_{equi}','(DAC)_{recy}','(DAC)_{recy + el}',...
    '(DAC)_{stoi} + gE','(DAC)_{equi} + gE','(DAC)_{recy} + gE','(DAC)_{recy + el} + gE',...
    '(NG)_{stoi}','(NG)_{equi}','(NG)_{recy}','(NG)_{recy + el}',...
    '(NG)_{stoi + gE}','(NG)_{equi} + gE','(NG)_{recy} + gE','(NG)_{recy + el} + gE'};
xlabel('GWP [kg CO_{2eq}]')
hold on
for i = 1:length(GWPGrid(:,1))
    plot(GWPGrid(i,1),i,'--h','MarkerSize',15,'MarkerFaceColor',[1 0 0],'MarkerEdgeColor',[1 1 0])
end
set(gca, 'YTick', 1:length(GWPGrid))
set(gca,'YTicklabels',ylabels)
set(gca,'FontSize',15)
set(gca,'TickLength',[0 0])

lg = legend({'BAU','Carbon dioxide','Hydrogen','Ethylene','Electricity','Cooling','Emissions'});
legend('Orientation','horizontal')
lg.Position = [0.3000 0.9600 0.4081 0.0256];

%% Human health
figure('units','normalized','outerposition',[0 0 1 1])
subplot(1,2,1)
bh = barh(humanHealth(:,2:end),'stacked');
title('Wind electricity (onshore)')
for i = 1:length(bh)
    bh(i).EdgeColor = 'none';
end
bh(1).FaceColor = 'flat';
bh(1).CData(1,:) = [0 0 0];
ylabels = {'BAU','(DAC)_{stoi}','(DAC)_{equi}','(DAC)_{recy}','(DAC)_{recy + el}',...
    '(DAC)_{stoi} + gE','(DAC)_{equi} + gE','(DAC)_{recy} + gE','(DAC)_{recy + el} + gE',...
    '(NG)_{stoi}','(NG)_{equi}','(NG)_{recy}','(NG)_{recy + el}',...
    '(NG)_{stoi + gE}','(NG)_{equi} + gE','(NG)_{recy} + gE','(NG)_{recy + el} + gE'};
xlabel('Human Health [DALY]')
hold on
for i = 1:length(humanHealth(:,1))
    plot(humanHealth(i,1),i,'--h','MarkerSize',15,'MarkerFaceColor',[1 0 0],'MarkerEdgeColor',[1 1 0])
end
set(gca, 'YTick', 1:length(GWP))
set(gca,'YTicklabels',ylabels)
set(gca,'FontSize',15)
set(gca,'TickLength',[0 0])

subplot(1,2,2)
bh = barh(humanHealthGrid(:,2:end),'stacked');
title('Grid electricity (market group GLO)')
for i = 1:length(bh)
    bh(i).EdgeColor = 'none';
end
bh(1).FaceColor = 'flat';
bh(1).CData(1,:) = [0 0 0];
ylabels = {'BAU','(DAC)_{stoi}','(DAC)_{equi}','(DAC)_{recy}','(DAC)_{recy + el}',...
    '(DAC)_{stoi} + gE','(DAC)_{equi} + gE','(DAC)_{recy} + gE','(DAC)_{recy + el} + gE',...
    '(NG)_{stoi}','(NG)_{equi}','(NG)_{recy}','(NG)_{recy + el}',...
    '(NG)_{stoi + gE}','(NG)_{equi} + gE','(NG)_{recy} + gE','(NG)_{recy + el} + gE'};
xlabel('Human Health [DALY]')
hold on
for i = 1:length(humanHealthGrid(:,1))
    plot(humanHealthGrid(i,1),i,'--h','MarkerSize',15,'MarkerFaceColor',[1 0 0],'MarkerEdgeColor',[1 1 0])
end
set(gca, 'YTick', 1:length(GWP))
set(gca,'YTicklabels',ylabels)
set(gca,'FontSize',15)
set(gca,'TickLength',[0 0])

lg = legend({'BAU','Carbon dioxide','Hydrogen','Ethylene','Electricity','Cooling','Emissions'});
legend('Orientation','horizontal')
lg.Position = [0.3000 0.9600 0.4081 0.0256];

%% Ecosystems
figure('units','normalized','outerposition',[0 0 1 1])
subplot(1,2,1)
bh = barh(ecosystems(:,2:end),'stacked');
title('Wind electricity (onshore)')
for i = 1:length(bh)
    bh(i).EdgeColor = 'none';
end
bh(1).FaceColor = 'flat';
bh(1).CData(1,:) = [0 0 0];
ylabels = {'BAU','(DAC)_{stoi}','(DAC)_{equi}','(DAC)_{recy}','(DAC)_{recy + el}',...
    '(DAC)_{stoi} + gE','(DAC)_{equi} + gE','(DAC)_{recy} + gE','(DAC)_{recy + el} + gE',...
    '(NG)_{stoi}','(NG)_{equi}','(NG)_{recy}','(NG)_{recy + el}',...
    '(NG)_{stoi + gE}','(NG)_{equi} + gE','(NG)_{recy} + gE','(NG)_{recy + el} + gE'};
xlabel('Ecosystems [species.yr]')
hold on
for i = 1:length(ecosystems(:,1))
    plot(ecosystems(i,1),i,'--h','MarkerSize',15,'MarkerFaceColor',[1 0 0],'MarkerEdgeColor',[1 1 0])
end
set(gca, 'YTick', 1:length(GWP))
set(gca,'YTicklabels',ylabels)
set(gca,'FontSize',15)
set(gca,'TickLength',[0 0])

subplot(1,2,2)
bh = barh(ecosystemsGrid(:,2:end),'stacked');
title('Grid electricity (market group GLO)')
for i = 1:length(bh)
    bh(i).EdgeColor = 'none';
end
bh(1).FaceColor = 'flat';
bh(1).CData(1,:) = [0 0 0];
ylabels = {'BAU','(DAC)_{stoi}','(DAC)_{equi}','(DAC)_{recy}','(DAC)_{recy + el}',...
    '(DAC)_{stoi} + gE','(DAC)_{equi} + gE','(DAC)_{recy} + gE','(DAC)_{recy + el} + gE',...
    '(NG)_{stoi}','(NG)_{equi}','(NG)_{recy}','(NG)_{recy + el}',...
    '(NG)_{stoi + gE}','(NG)_{equi} + gE','(NG)_{recy} + gE','(NG)_{recy + el} + gE'};
xlabel('Ecosystems [species.yr]')
hold on
for i = 1:length(ecosystemsGrid(:,1))
    plot(ecosystemsGrid(i,1),i,'--h','MarkerSize',15,'MarkerFaceColor',[1 0 0],'MarkerEdgeColor',[1 1 0])
end
set(gca, 'YTick', 1:length(GWP))
set(gca,'YTicklabels',ylabels)
set(gca,'FontSize',15)
set(gca,'TickLength',[0 0])

lg = legend({'BAU','Carbon dioxide','Hydrogen','Ethylene','Electricity','Cooling','Emissions'});
legend('Orientation','horizontal')
lg.Position = [0.3000 0.9600 0.4081 0.0256];

%% Resources
figure('units','normalized','outerposition',[0 0 1 1])
subplot(1,2,1)
bh = barh(resources(:,2:end),'stacked');
title('Wind electricity (onshore)')
for i = 1:length(bh)
    bh(i).EdgeColor = 'none';
end
bh(1).FaceColor = 'flat';
bh(1).CData(1,:) = [0 0 0];
ylabels = {'BAU','(DAC)_{stoi}','(DAC)_{equi}','(DAC)_{recy}','(DAC)_{recy + el}',...
    '(DAC)_{stoi} + gE','(DAC)_{equi} + gE','(DAC)_{recy} + gE','(DAC)_{recy + el} + gE',...
    '(NG)_{stoi}','(NG)_{equi}','(NG)_{recy}','(NG)_{recy + el}',...
    '(NG)_{stoi + gE}','(NG)_{equi} + gE','(NG)_{recy} + gE','(NG)_{recy + el} + gE'};
xlabel('Resources [USD2013]')
hold on
for i = 1:length(resources(:,1))
    plot(resources(i,1),i,'--h','MarkerSize',15,'MarkerFaceColor',[1 0 0],'MarkerEdgeColor',[1 1 0])
end
set(gca, 'YTick', 1:length(GWP))
set(gca,'YTicklabels',ylabels)
set(gca,'FontSize',15)
set(gca,'TickLength',[0 0])

subplot(1,2,2)
bh = barh(resourcesGrid(:,2:end),'stacked');
title('Grid electricity (market group GLO)')
for i = 1:length(bh)
    bh(i).EdgeColor = 'none';
end
bh(1).FaceColor = 'flat';
bh(1).CData(1,:) = [0 0 0];
ylabels = {'BAU','(DAC)_{stoi}','(DAC)_{equi}','(DAC)_{recy}','(DAC)_{recy + el}',...
    '(DAC)_{stoi} + gE','(DAC)_{equi} + gE','(DAC)_{recy} + gE','(DAC)_{recy + el} + gE',...
    '(NG)_{stoi}','(NG)_{equi}','(NG)_{recy}','(NG)_{recy + el}',...
    '(NG)_{stoi + gE}','(NG)_{equi} + gE','(NG)_{recy} + gE','(NG)_{recy + el} + gE'};
xlabel('Resources [USD2013]')
hold on
for i = 1:length(resourcesGrid(:,1))
    plot(resourcesGrid(i,1),i,'--h','MarkerSize',15,'MarkerFaceColor',[1 0 0],'MarkerEdgeColor',[1 1 0])
end
set(gca, 'YTick', 1:length(GWP))
set(gca,'YTicklabels',ylabels)
set(gca,'FontSize',15)
set(gca,'TickLength',[0 0])

lg = legend({'BAU','Carbon dioxide','Hydrogen','Ethylene','Electricity','Cooling','Emissions'});
legend('Orientation','horizontal')
lg.Position = [0.3000 0.9600 0.4081 0.0256];

%% Net impact GWP
figure('units','normalized','outerposition',[0 0 1 1])
subplot(1,2,1)
bh = barh(GWP(:,1)-GWP(1,1));
title('Wind electricity (onshore)')
for i = 1:length(bh)
    bh(i).EdgeColor = 'none';
end
bh(1).FaceColor = 'flat';
bh(1).CData(1,:) = [0 0 0];
ylabels = {'BAU','(DAC)_{stoi}','(DAC)_{equi}','(DAC)_{recy}','(DAC)_{recy + el}',...
    '(DAC)_{stoi} + gE','(DAC)_{equi} + gE','(DAC)_{recy} + gE','(DAC)_{recy + el} + gE',...
    '(NG)_{stoi}','(NG)_{equi}','(NG)_{recy}','(NG)_{recy + el}',...
    '(NG)_{stoi + gE}','(NG)_{equi} + gE','(NG)_{recy} + gE','(NG)_{recy + el} + gE'};
xlabel('Net GWP [kg CO_{2eq}]')
title('Net impact [(GWP)_{process} - (GWP)_{BAU}]')
hold on
set(gca, 'YTick', 1:length(humanHealth))
set(gca,'YTicklabels',ylabels)
set(gca,'FontSize',15)
set(gca,'TickLength',[0 0])

subplot(1,2,2)
bh = barh(GWPGrid(:,1)-GWPGrid(1,1));
title('Grid electricity (market group GLO)')
for i = 1:length(bh)
    bh(i).EdgeColor = 'none';
end
bh(1).FaceColor = 'flat';
bh(1).CData(1,:) = [0 0 0];
ylabels = {'BAU','(DAC)_{stoi}','(DAC)_{equi}','(DAC)_{recy}','(DAC)_{recy + el}',...
    '(DAC)_{stoi} + gE','(DAC)_{equi} + gE','(DAC)_{recy} + gE','(DAC)_{recy + el} + gE',...
    '(NG)_{stoi}','(NG)_{equi}','(NG)_{recy}','(NG)_{recy + el}',...
    '(NG)_{stoi + gE}','(NG)_{equi} + gE','(NG)_{recy} + gE','(NG)_{recy + el} + gE'};
xlabel('Net GWP [kg CO_{2eq}]')
title('Net impact [(GWP)_{process} - (GWP)_{BAU}]')
hold on
set(gca, 'YTick', 1:length(humanHealth))
set(gca,'YTicklabels',ylabels)
set(gca,'FontSize',15)
set(gca,'TickLength',[0 0])

% %% Economics
% sheetName = 'Economic results';
% 
% if step == 0
%     fileName = 'Propanol - stoichiometric calculations.xlsx'; %stoichiometric calculations
%     prices = xlsread(fileName,sheetName,'D4:D9');
% elseif step == 1
%     fileName1 = 'Propanol - literature reaction efficiency calculations.xlsx'; %literature reactor efficiency calculations
%     fileName2 = 'Propanol - equilibrium calculations.xlsx'; %equilibrium calculations
%     prices1 = xlsread(fileName1,sheetName,'D4:D9');
%     prices2 = xlsread(fileName2,sheetName,'D4:D9');    
% elseif step == 2
%     fileName = 'Propanol - intermediate calculations.xlsx'; %stoichiometric calculations
%     prices = xlsread(fileName,sheetName,'D4:D9');
% elseif step == 3
%     fileName0 = 'Propanol - stoichiometric calculations.xlsx'; %stoichiometric calculations
%     fileName2 = 'Propanol - equilibrium calculations.xlsx'; %equilibrium calculations
%     fileName2 = 'Propanol - intermediate calculations.xlsx'; %stoichiometric calculations
%     prices0 = xlsread(fileName0,sheetName,'D4:D9');
%     prices1 = xlsread(fileName1,sheetName,'D4:D9');
%     prices2 = xlsread(fileName2,sheetName,'D4:D9');
% end
% if step == 0 || step == 2
%     BAU = [1690 0 0 0];
%     DACWind = [0 prices(2) prices(3) prices(4)];
%     DACWindGE = [0 prices(2) prices(3) prices(6)];
%     NGWind = [0 prices(1) prices(3) prices(4)];
%     NGWindGE = [0 prices(1) prices(3) prices(5)];
%     eco = [BAU;DACWind;DACWindGE;NGWind;NGWindGE];
% elseif step == 1
%     BAU = [1690 0 0 0];
%     DACWind = [0 prices1(2) prices1(3) prices1(4);0 prices2(2) prices2(3) prices2(4)];
%     DACWindGE = [0 prices1(2) prices1(3) prices1(6);0 prices2(2) prices2(3) prices2(6)];
%     NGWind = [0 prices1(1) prices1(3) prices1(4);0 prices2(1) prices2(3) prices2(4)];
%     NGWindGE = [0 prices1(1) prices1(3) prices1(5);0 prices2(1) prices2(3) prices2(5)];
%     eco = [BAU;DACWind;DACWindGE;NGWind;NGWindGE];
% elseif step == 3
%     BAU = [1690 0 0 0];
%     DACWind = [0 prices0(2) prices0(3) prices0(4);0 prices1(2) prices1(3) prices1(4);...
%         0 prices2(2) prices2(3) prices2(4)];
%     DACWindGE = [0 prices0(2) prices0(3) prices0(6);0 prices1(2) prices1(3) prices1(6);...
%         0 prices2(2) prices2(3) prices2(6)];
%     NGWind = [0 prices0(1) prices0(3) prices0(4);0 prices1(1) prices1(3) prices1(4);...
%         0 prices2(1) prices2(3) prices2(4)];
%     NGWindGE = [0 prices0(1) prices0(3) prices0(5);0 prices1(1) prices1(3) prices1(5);...
%         0 prices2(1) prices2(3) prices2(5)];
%     eco = [BAU;DACWind;DACWindGE;NGWind;NGWindGE];
% end
% figure
% bh = barh(eco,'stacked');
% % for i = 1:length(bh)
% %     bh(i).EdgeColor = 'none';
% % end
% bh(1).FaceColor = 'flat';
% bh(1).CData(1,:) = [0 0 0];
% ylabels = {'BAU','(DAC + wind)_{stoi}','(DAC + wind)_{equi}','(DAC + wind)_{recy}','(DAC + wind)_{recy + el}',...
%     '(DAC + wind)_{stoi} + gE','(DAC + wind)_{equi} + gE','(DAC + wind)_{recy} + gE','(DAC + wind)_{recy + el} + gE',...
%     '(NG + wind)_{stoi}','(NG + wind)_{equi}','(NG + wind)_{recy}','(NG + wind)_{recy + el}',...
%     '(NG + wind)_{stoi + gE}','(NG + wind)_{equi} + gE','(NG + wind)_{recy} + gE','(NG + wind)_{recy + el} + gE'};
% xlabel('$ t^{-1} propanol (only feed)')
% legend({'BAU','Carbon dioxide','Hydrogen','Ethylene'})
% legend('boxoff')
% set(gca,'FontSize',15)
% set(gca,'TickLength',[0 0])
