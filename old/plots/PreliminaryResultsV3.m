clear
clc
close all

%% LCA results
sheetName = "LCA contri - cradle to gate";

fileName1 = "Propanol - stoichiometric calculations.xlsx"; %stoichiometric calculations
fileName2 = "Propanol - equilibrium calculations.xlsx"; %equilibrium calculations
fileName3 = "Propanol - intermediate calculations.xlsx"; %intermediate calculations
fileName4 = "Propanol - intermediate calculations with utilities.xlsx"; %intermediate calculations with utilities

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

% Adding zero lines to array for grouping scenarios
% GWP(:,end+1) = GWP(1,1) - GWP(:,1);
% for i = 1:length(GWP(:,1))
%     for j = 2:length(GWP(1,:))
%         if GWP(i,j) < 0
%             GWP(i,end) = GWP(i,end) + GWP(i,j);
%         end
%     end
% end
z = zeros(1,length(GWP(1,:)));
xGWP = [GWP(1,:); z; GWP(2:5,:); z; GWP(6:9,:); z; GWP(10:13,:); z; GWP(14:17,:)];
xhumanHealth = [humanHealth(1,:); z; humanHealth(2:5,:); z;...
    humanHealth(6:9,:); z; humanHealth(10:13,:); z; humanHealth(14:17,:)];
xecosystems = [ecosystems(1,:); z; ecosystems(2:5,:); z;...
    ecosystems(6:9,:); z; ecosystems(10:13,:); z; ecosystems(14:17,:)];
xresources = [resources(1,:); z; resources(2:5,:); z; resources(6:9,:);...
    z; resources(10:13,:); z; resources(14:17,:)];
xGWPGrid = [GWPGrid(1,:); z; GWPGrid(2:5,:); z; GWPGrid(6:9,:);...
    z; GWPGrid(10:13,:); z; GWPGrid(14:17,:)];
xhumanHealthGrid = [humanHealthGrid(1,:); z; humanHealthGrid(2:5,:); z;...
    humanHealthGrid(6:9,:); z; humanHealthGrid(10:13,:); z; humanHealthGrid(14:17,:)];
xecosystemsGrid = [ecosystemsGrid(1,:); z; ecosystemsGrid(2:5,:); z;...
    ecosystemsGrid(6:9,:); z; ecosystemsGrid(10:13,:); z; ecosystemsGrid(14:17,:)];
xresourcesGrid = [resourcesGrid(1,:); z; resourcesGrid(2:5,:); z; resourcesGrid(6:9,:);...
    z; resourcesGrid(10:13,:); z; resourcesGrid(14:17,:)];
a = [2;7;12;17];

%% GWP
figure('units','normalized','outerposition',[0 0 1 1])
subplot(1,2,1)
bh = barh(xGWP(:,2:end),'stacked','BarWidth',1);
title('Wind electricity (onshore)')
% for i = 1:length(bh)
%     bh(i).EdgeColor = 'none';
% end
bh(1).FaceColor = 'flat';
bh(1).CData(1,:) = [0 0 0];
ylabels = {'BAU','','(DAC)_{stoi}','(DAC)_{equi}','(DAC)_{recy}','(DAC)_{recy + uti}',...
    '','(DAC)_{stoi} + gE','(DAC)_{equi} + gE','(DAC)_{recy} + gE','(DAC)_{recy + uti} + gE',...
    '','(NG)_{stoi}','(NG)_{equi}','(NG)_{recy}','(NG)_{recy + uti}',...
    '','(NG)_{stoi} + gE','(NG)_{equi} + gE','(NG)_{recy} + gE','(NG)_{recy + uti} + gE'};
xlabel('GWP [kg CO_{2eq} kg^{-1} propanol]')
hold on
for i = 1:length(xGWP(:,1))
    if ~ismember(i,a)
        plot(xGWP(i,1),i,'--h','MarkerSize',15,'MarkerFaceColor',[1 0 0],'MarkerEdgeColor',[1 1 0])
    end
end
set(gca, 'YTick', 1:length(xGWP))
set(gca,'YTicklabels',ylabels)
set(gca,'FontSize',15)
set(gca,'TickLength',[0 0])

subplot(1,2,2)
bh = barh(xGWPGrid(:,2:end),'stacked','BarWidth',1);
title('Grid electricity (market group GLO)')
% for i = 1:length(bh)
%     bh(i).EdgeColor = 'none';
% end
bh(1).FaceColor = 'flat';
bh(1).CData(1,:) = [0 0 0];
ylabels = {'BAU','','(DAC)_{stoi}','(DAC)_{equi}','(DAC)_{recy}','(DAC)_{recy + uti}',...
    '','(DAC)_{stoi} + gE','(DAC)_{equi} + gE','(DAC)_{recy} + gE','(DAC)_{recy + uti} + gE',...
    '','(NG)_{stoi}','(NG)_{equi}','(NG)_{recy}','(NG)_{recy + uti}',...
    '','(NG)_{stoi} + gE','(NG)_{equi} + gE','(NG)_{recy} + gE','(NG)_{recy + uti} + gE'};
xlabel('GWP [kg CO_{2eq} kg^{-1} propanol]')
hold on
for i = 1:length(xGWPGrid(:,1))
    if ~ismember(i,a)
        plot(xGWPGrid(i,1),i,'--h','MarkerSize',15,'MarkerFaceColor',[1 0 0],'MarkerEdgeColor',[1 1 0])
    end
end
set(gca, 'YTick', 1:length(xGWPGrid))
set(gca,'YTicklabels',ylabels)
set(gca,'FontSize',15)
set(gca,'TickLength',[0 0])

lg = legend({'BAU','Carbon dioxide','Hydrogen','Ethylene','Electricity','Cooling','Emissions'});
legend('Orientation','horizontal')
lg.Position = [0.3000 0.9600 0.4081 0.0256];

%% Human health
figure('units','normalized','outerposition',[0 0 1 1])
subplot(1,2,1)
bh = barh(xhumanHealth(:,2:end),'stacked','BarWidth',1);
title('Wind electricity (onshore)')
% for i = 1:length(bh)
%     bh(i).EdgeColor = 'none';
% end
bh(1).FaceColor = 'flat';
bh(1).CData(1,:) = [0 0 0];
ylabels = {'BAU','','(DAC)_{stoi}','(DAC)_{equi}','(DAC)_{recy}','(DAC)_{recy + uti}',...
    '','(DAC)_{stoi} + gE','(DAC)_{equi} + gE','(DAC)_{recy} + gE','(DAC)_{recy + uti} + gE',...
    '','(NG)_{stoi}','(NG)_{equi}','(NG)_{recy}','(NG)_{recy + uti}',...
    '','(NG)_{stoi} + gE','(NG)_{equi} + gE','(NG)_{recy} + gE','(NG)_{recy + uti} + gE'};
xlabel('Human Health [DALY kg^{-1} propanol]')
hold on
for i = 1:length(xhumanHealth(:,1))
    if ~ismember(i,a)
        plot(xhumanHealth(i,1),i,'--h','MarkerSize',15,'MarkerFaceColor',[1 0 0],'MarkerEdgeColor',[1 1 0])
    end
end
set(gca, 'YTick', 1:length(xGWP))
set(gca,'YTicklabels',ylabels)
set(gca,'FontSize',15)
set(gca,'TickLength',[0 0])

subplot(1,2,2)
bh = barh(xhumanHealthGrid(:,2:end),'stacked','BarWidth',1);
title('Grid electricity (market group GLO)')
% for i = 1:length(bh)
%     bh(i).EdgeColor = 'none';
% end
bh(1).FaceColor = 'flat';
bh(1).CData(1,:) = [0 0 0];
ylabels = {'BAU','','(DAC)_{stoi}','(DAC)_{equi}','(DAC)_{recy}','(DAC)_{recy + uti}',...
    '','(DAC)_{stoi} + gE','(DAC)_{equi} + gE','(DAC)_{recy} + gE','(DAC)_{recy + uti} + gE',...
    '','(NG)_{stoi}','(NG)_{equi}','(NG)_{recy}','(NG)_{recy + uti}',...
    '','(NG)_{stoi} + gE','(NG)_{equi} + gE','(NG)_{recy} + gE','(NG)_{recy + uti} + gE'};
xlabel('Human Health [DALY kg^{-1} propanol]')
hold on
for i = 1:length(xhumanHealthGrid(:,1))
    if ~ismember(i,a)
        plot(xhumanHealthGrid(i,1),i,'--h','MarkerSize',15,'MarkerFaceColor',[1 0 0],'MarkerEdgeColor',[1 1 0])
    end
end
set(gca, 'YTick', 1:length(xGWP))
set(gca,'YTicklabels',ylabels)
set(gca,'FontSize',15)
set(gca,'TickLength',[0 0])

lg = legend({'BAU','Carbon dioxide','Hydrogen','Ethylene','Electricity','Cooling','Emissions'});
legend('Orientation','horizontal')
lg.Position = [0.3000 0.9600 0.4081 0.0256];

%% Ecosystems
figure('units','normalized','outerposition',[0 0 1 1])
subplot(1,2,1)
bh = barh(xecosystems(:,2:end),'stacked','BarWidth',1);
title('Wind electricity (onshore)')
% for i = 1:length(bh)
%     bh(i).EdgeColor = 'none';
% end
bh(1).FaceColor = 'flat';
bh(1).CData(1,:) = [0 0 0];
ylabels = {'BAU','','(DAC)_{stoi}','(DAC)_{equi}','(DAC)_{recy}','(DAC)_{recy + uti}',...
    '','(DAC)_{stoi} + gE','(DAC)_{equi} + gE','(DAC)_{recy} + gE','(DAC)_{recy + uti} + gE',...
    '','(NG)_{stoi}','(NG)_{equi}','(NG)_{recy}','(NG)_{recy + uti}',...
    '','(NG)_{stoi} + gE','(NG)_{equi} + gE','(NG)_{recy} + gE','(NG)_{recy + uti} + gE'};
xlabel('Ecosystems [species.yr kg^{-1} propanol]')
hold on
for i = 1:length(xecosystems(:,1))
    if ~ismember(i,a)
        plot(xecosystems(i,1),i,'--h','MarkerSize',15,'MarkerFaceColor',[1 0 0],'MarkerEdgeColor',[1 1 0])
    end
end
set(gca, 'YTick', 1:length(xGWP))
set(gca,'YTicklabels',ylabels)
set(gca,'FontSize',15)
set(gca,'TickLength',[0 0])

subplot(1,2,2)
bh = barh(xecosystemsGrid(:,2:end),'stacked','BarWidth',1);
title('Grid electricity (market group GLO)')
% for i = 1:length(bh)
%     bh(i).EdgeColor = 'none';
% end
bh(1).FaceColor = 'flat';
bh(1).CData(1,:) = [0 0 0];
ylabels = {'BAU','','(DAC)_{stoi}','(DAC)_{equi}','(DAC)_{recy}','(DAC)_{recy + uti}',...
    '','(DAC)_{stoi} + gE','(DAC)_{equi} + gE','(DAC)_{recy} + gE','(DAC)_{recy + uti} + gE',...
    '','(NG)_{stoi}','(NG)_{equi}','(NG)_{recy}','(NG)_{recy + uti}',...
    '','(NG)_{stoi} + gE','(NG)_{equi} + gE','(NG)_{recy} + gE','(NG)_{recy + uti} + gE'};
xlabel('Ecosystems [species.yr kg^{-1} propanol]')
hold on
for i = 1:length(xecosystemsGrid(:,1))
    if ~ismember(i,a)
        plot(xecosystemsGrid(i,1),i,'--h','MarkerSize',15,'MarkerFaceColor',[1 0 0],'MarkerEdgeColor',[1 1 0])
    end
end
set(gca, 'YTick', 1:length(xGWP))
set(gca,'YTicklabels',ylabels)
set(gca,'FontSize',15)
set(gca,'TickLength',[0 0])

lg = legend({'BAU','Carbon dioxide','Hydrogen','Ethylene','Electricity','Cooling','Emissions'});
legend('Orientation','horizontal')
lg.Position = [0.3000 0.9600 0.4081 0.0256];

%% Resources
figure('units','normalized','outerposition',[0 0 1 1])
subplot(1,2,1)
bh = barh(xresources(:,2:end),'stacked','BarWidth',1);
title('Wind electricity (onshore)')
% for i = 1:length(bh)
%     bh(i).EdgeColor = 'none';
% end
bh(1).FaceColor = 'flat';
bh(1).CData(1,:) = [0 0 0];
ylabels = {'BAU','','(DAC)_{stoi}','(DAC)_{equi}','(DAC)_{recy}','(DAC)_{recy + uti}',...
    '','(DAC)_{stoi} + gE','(DAC)_{equi} + gE','(DAC)_{recy} + gE','(DAC)_{recy + uti} + gE',...
    '','(NG)_{stoi}','(NG)_{equi}','(NG)_{recy}','(NG)_{recy + uti}',...
    '','(NG)_{stoi} + gE','(NG)_{equi} + gE','(NG)_{recy} + gE','(NG)_{recy + uti} + gE'};
xlabel('Resources [$_{2013} kg^{-1} propanol]')
hold on
for i = 1:length(xresources(:,1))
    if ~ismember(i,a)
        plot(xresources(i,1),i,'--h','MarkerSize',15,'MarkerFaceColor',[1 0 0],'MarkerEdgeColor',[1 1 0])
    end
end
set(gca, 'YTick', 1:length(xGWP))
set(gca,'YTicklabels',ylabels)
set(gca,'FontSize',15)
set(gca,'TickLength',[0 0])

subplot(1,2,2)
bh = barh(xresourcesGrid(:,2:end),'stacked','BarWidth',1);
title('Grid electricity (market group GLO)')
% for i = 1:length(bh)
%     bh(i).EdgeColor = 'none';
% end
bh(1).FaceColor = 'flat';
bh(1).CData(1,:) = [0 0 0];
ylabels = {'BAU','','(DAC)_{stoi}','(DAC)_{equi}','(DAC)_{recy}','(DAC)_{recy + uti}',...
    '','(DAC)_{stoi} + gE','(DAC)_{equi} + gE','(DAC)_{recy} + gE','(DAC)_{recy + uti} + gE',...
    '','(NG)_{stoi}','(NG)_{equi}','(NG)_{recy}','(NG)_{recy + uti}',...
    '','(NG)_{stoi} + gE','(NG)_{equi} + gE','(NG)_{recy} + gE','(NG)_{recy + uti} + gE'};
xlabel('Resources [$_{2013} kg^{-1} propanol]')
hold on
for i = 1:length(xresourcesGrid(:,1))
    if ~ismember(i,a)
        plot(xresourcesGrid(i,1),i,'--h','MarkerSize',15,'MarkerFaceColor',[1 0 0],'MarkerEdgeColor',[1 1 0])
    end
end
set(gca, 'YTick', 1:length(xGWP))
set(gca,'YTicklabels',ylabels)
set(gca,'FontSize',15)
set(gca,'TickLength',[0 0])

lg = legend({'BAU','Carbon dioxide','Hydrogen','Ethylene','Electricity','Cooling','Emissions'});
legend('Orientation','horizontal')
lg.Position = [0.3000 0.9600 0.4081 0.0256];

%% Net impact GWP
figure('units','normalized','outerposition',[0 0 1 1])
subplot(1,2,1)
for i = 1:length(xGWP(:,1))
   if ~ismember(i,a) 
       netImpactGWP(i) = xGWP(i,1)-xGWP(1,1);
   else
       netImpactGWP(i) = 0;
   end
end
bh = barh(netImpactGWP);
title('Wind electricity (onshore)')
% for i = 1:length(bh)
%     bh(i).EdgeColor = 'none';
% end
bh(1).FaceColor = 'flat';
bh(1).CData(1,:) = [0 0 0];
ylabels = {'BAU','','(DAC)_{stoi}','(DAC)_{equi}','(DAC)_{recy}','(DAC)_{recy + uti}',...
    '','(DAC)_{stoi} + gE','(DAC)_{equi} + gE','(DAC)_{recy} + gE','(DAC)_{recy + uti} + gE',...
    '','(NG)_{stoi}','(NG)_{equi}','(NG)_{recy}','(NG)_{recy + uti}',...
    '','(NG)_{stoi} + gE','(NG)_{equi} + gE','(NG)_{recy} + gE','(NG)_{recy + uti} + gE'};
xlabel('Net GWP [kg CO_{2eq} kg^{-1} propanol]')
title('Net impact [(GWP)_{process} - (GWP)_{BAU}]')
hold on
set(gca, 'YTick', 1:length(xhumanHealth))
set(gca,'YTicklabels',ylabels)
set(gca,'FontSize',15)
set(gca,'TickLength',[0 0])

subplot(1,2,2)
for i = 1:length(xGWPGrid(:,1))
   if ~ismember(i,a) 
       netImpactGWPGrid(i) = xGWPGrid(i,1)-xGWPGrid(1,1);
   else
       netImpactGWPGrid(i) = 0;
   end
end
bh = barh(netImpactGWPGrid);
title('Grid electricity (market group GLO)')
% for i = 1:length(bh)
%     bh(i).EdgeColor = 'none';
% end
bh(1).FaceColor = 'flat';
bh(1).CData(1,:) = [0 0 0];
ylabels = {'BAU','','(DAC)_{stoi}','(DAC)_{equi}','(DAC)_{recy}','(DAC)_{recy + uti}',...
    '','(DAC)_{stoi} + gE','(DAC)_{equi} + gE','(DAC)_{recy} + gE','(DAC)_{recy + uti} + gE',...
    '','(NG)_{stoi}','(NG)_{equi}','(NG)_{recy}','(NG)_{recy + uti}',...
    '','(NG)_{stoi} + gE','(NG)_{equi} + gE','(NG)_{recy} + gE','(NG)_{recy + uti} + gE'};
xlabel('Net GWP [kg CO_{2eq} kg^{-1} propanol]')
title('Net impact [(GWP)_{process} - (GWP)_{BAU}]')
hold on
set(gca, 'YTick', 1:length(xhumanHealth))
set(gca,'YTicklabels',ylabels)
set(gca,'FontSize',15)
set(gca,'TickLength',[0 0])

%% Economics
sheetName = 'Economic results';

prices1 = xlsread(fileName1,sheetName,'D4:D11');
prices2 = xlsread(fileName2,sheetName,'D4:D11');
prices3 = xlsread(fileName3,sheetName,'D4:D11');
prices4 = xlsread(fileName4,sheetName,'D4:D11');

BAU = [1690 0 0 0 0 0];
DACWind = [0 prices1(2) prices1(3) prices1(4);0 prices2(2) prices2(3) prices2(4);...
    0 prices3(2) prices3(3) prices3(4);0 prices4(2) prices4(3) prices4(4)];
DACWind(1:3,5:6) = zeros(length(DACWind(1:3,1)),2); 
DACWind(4,5:6) = prices4(7:8);
DACWindGE = [0 prices1(2) prices1(3) prices1(6);0 prices2(2) prices2(3) prices2(6);...
    0 prices3(2) prices3(3) prices3(6);0 prices4(2) prices4(3) prices4(6)];
DACWindGE(1:3,5:6) = zeros(length(DACWind(1:3,1)),2); 
DACWindGE(4,5:6) = prices4(7:8);
NGWind = [0 prices1(1) prices1(3) prices1(4);0 prices2(1) prices2(3) prices2(4);...
    0 prices3(1) prices3(3) prices3(4);0 prices4(1) prices4(3) prices4(4)];
NGWind(1:3,5:6) = zeros(length(DACWind(1:3,1)),2); 
NGWind(4,5:6) = prices4(7:8);
NGWindGE = [0 prices1(1) prices1(3) prices1(5);0 prices2(1) prices2(3) prices2(5);...
    0 prices3(1) prices3(3) prices3(5);0 prices4(1) prices4(3) prices4(5)];
NGWindGE(1:3,5:6) = zeros(length(DACWind(1:3,1)),2); 
NGWindGE(4,5:6) = prices4(7:8);
eco = [BAU;DACWind;DACWindGE;NGWind;NGWindGE]./1000;
z = zeros(1,length(eco(1,:)));
xeco = [eco(1,:); z; eco(2:5,:); z; eco(6:9,:); z; eco(10:13,:); z; eco(14:17,:)];

figure('units','normalized','outerposition',[0 0 1 1])
bh = barh(xeco,'stacked','BarWidth',1);
% for i = 1:length(bh)
%     bh(i).EdgeColor = 'none';
% end
bh(1).FaceColor = 'flat';
bh(1).CData(1,:) = [0 0 0];
ylabels = {'BAU','','(DAC)_{stoi}','(DAC)_{equi}','(DAC)_{recy}','(DAC)_{recy + uti}',...
    '','(DAC)_{stoi} + gE','(DAC)_{equi} + gE','(DAC)_{recy} + gE','(DAC)_{recy + uti} + gE',...
    '','(NG)_{stoi}','(NG)_{equi}','(NG)_{recy}','(NG)_{recy + uti}',...
    '','(NG)_{stoi} + gE','(NG)_{equi} + gE','(NG)_{recy} + gE','(NG)_{recy + uti} + gE'};
xlabel('$ kg^{-1} propanol')
legend({'BAU','Carbon dioxide','Hydrogen','Ethylene','Electricity','Cooling'})
legend('boxoff')
set(gca, 'YTick', 1:length(xhumanHealth))
set(gca,'YTicklabels',ylabels)
set(gca,'FontSize',15)
set(gca,'TickLength',[0 0])
