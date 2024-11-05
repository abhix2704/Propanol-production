clear
clc
close all

%% LCA results
step = 3; % 0 - stoichiometric calculations; 1 - equilibrium calculations; 2 - intermediate calculations with recycle; 3 - all
sheetName = 'LCA contributions';

if step == 0
    fileName = 'Propanol - stoichiometric calculations.xlsx'; %stoichiometric calculations
    GWP = xlsread(fileName,sheetName,'C5:G9');
    humanHealth = xlsread(fileName,sheetName,'C13:G17');
    ecosystems = xlsread(fileName,sheetName,'C21:G25');
    resources = xlsread(fileName,sheetName,'C29:G33');
elseif step == 1
    fileName1 = 'Propanol - literature reaction efficiency calculations.xlsx'; %literature reactor efficiency calculations
    fileName2 = 'Propanol - equilibrium calculations.xlsx'; %equilibrium calculations
    GWP1 = xlsread(fileName1,sheetName,'C5:G9');
    humanHealth1 = xlsread(fileName1,sheetName,'C13:G17');
    ecosystems1 = xlsread(fileName1,sheetName,'C21:G25');
    resources1 = xlsread(fileName1,sheetName,'C29:G33');
    GWP2 = xlsread(fileName2,sheetName,'C5:G9');
    humanHealth2 = xlsread(fileName2,sheetName,'C13:G17');
    ecosystems2 = xlsread(fileName2,sheetName,'C21:G25');
    resources2 = xlsread(fileName2,sheetName,'C29:G33');
    for i = 1:length(GWP1(:,1))
        if i == 1
            GWP = [GWP1(i,:)];
            humanHealth = [humanHealth1(i,:)];
            ecosystems = [ecosystems1(i,:)];
            resources = [resources1(i,:)];
        else
            GWP = [GWP; GWP1(i,:); GWP2(i,:)];
            humanHealth = [humanHealth; humanHealth1(i,:); humanHealth2(i,:)];
            ecosystems = [ecosystems; ecosystems1(i,:); ecosystems2(i,:)];
            resources = [resources; resources1(i,:); resources2(i,:)];
        end
    end
elseif step == 2
    fileName = 'Propanol - intermediate calculations.xlsx'; %stoichiometric calculations
    GWP = xlsread(fileName,sheetName,'C5:I9');
    humanHealth = xlsread(fileName,sheetName,'C13:I17');
    ecosystems = xlsread(fileName,sheetName,'C21:I25');
    resources = xlsread(fileName,sheetName,'C29:I33');
elseif step == 3
    fileName0 = 'Propanol - stoichiometric calculations.xlsx'; %literature reactor efficiency calculations
    fileName1 = 'Propanol - equilibrium calculations.xlsx'; %equilibrium calculations
    fileName2 = 'Propanol - intermediate calculations.xlsx'; %stoichiometric calculations
    GWP0 = xlsread(fileName0,sheetName,'C5:I9');
    humanHealth0 = xlsread(fileName0,sheetName,'C13:I17');
    ecosystems0 = xlsread(fileName0,sheetName,'C21:I25');
    resources0 = xlsread(fileName0,sheetName,'C29:I33');
    GWP1 = xlsread(fileName1,sheetName,'C5:I9');
    humanHealth1 = xlsread(fileName1,sheetName,'C13:I17');
    ecosystems1 = xlsread(fileName1,sheetName,'C21:I25');
    resources1 = xlsread(fileName1,sheetName,'C29:I33');
    GWP2 = xlsread(fileName2,sheetName,'C5:I9');
    humanHealth2 = xlsread(fileName2,sheetName,'C13:I17');
    ecosystems2 = xlsread(fileName2,sheetName,'C21:I25');
    resources2 = xlsread(fileName2,sheetName,'C29:I33');
    for i = 1:length(GWP0(:,1))
        if i == 1
            GWP = [GWP1(i,:)];
            humanHealth = [humanHealth0(1,:)];
            ecosystems = [ecosystems0(1,:)];
            resources = [resources0(1,:)];
        else
            GWP = [GWP;GWP0(i,:);GWP1(i,:);GWP2(i,:)];
            humanHealth = [humanHealth;humanHealth0(i,:);humanHealth1(i,:);...
                humanHealth2(i,:)];
            ecosystems = [ecosystems;ecosystems0(i,:);ecosystems1(i,:);...
                ecosystems2(i,:)];
            resources = [resources;resources0(i,:);resources1(i,:);...
                resources2(i,:)];
        end
    end
end

%% GWP
figure
bh = barh(GWP(:,2:end),'stacked');
% for i = 1:length(bh)
%     bh(i).EdgeColor = 'none';
% end
bh(1).FaceColor = 'flat';
bh(1).CData(1,:) = [0 0 0];
if step == 0 || step == 2
    yticklabels({'BAU','DAC + wind','DAC + wind + gE','NG + wind','NG + wind + gE'})
elseif step == 1
    yticklabels({'BAU','(DAC + wind)_{lit}','(DAC + wind)_{equi}','(DAC + wind)_{lit} + gE',...
        '(DAC + wind)_{equi} + gE','(NG + wind)_{lit}','(NG + wind)_{equi}',...
        '(NG + wind)_{lit} + gE','(NG + wind)_{equi} + gE'})
elseif step == 3
    yticklabels({'BAU','(DAC + wind)_{stoi}','(DAC + wind)_{equi}','(DAC + wind)_{recy}',...
        '(DAC + wind)_{stoi} + gE','(DAC + wind)_{equi} + gE','(DAC + wind)_{recy} + gE',...
        '(NG + wind)_{stoi}','(NG + wind)_{equi}','(NG + wind)_{recy}',...
        '(NG + wind)_{stoi} + gE','(NG + wind)_{equi} + gE','(NG + wind)_{recy} + gE'})
end
xlabel('GWP [kg CO_{2eq}]')
hold on
for i = 1:length(GWP(:,1))
    plot(GWP(i,1),i,'--h','MarkerSize',15,'MarkerFaceColor',[1 0 0],'MarkerEdgeColor',[1 0 0])
end
if step == 0 || step == 1
    legend({'BAU','Carbon dioxide','Hydrogen','Ethylene'})
elseif step == 2 || step == 3
    legend({'BAU','Carbon dioxide','Hydrogen','Ethylene'})
end
legend('boxoff')
set(gca,'FontSize',15)
set(gca,'TickLength',[0 0])

%% Human health
figure
bh = barh(humanHealth(:,2:end),'stacked');
% for i = 1:length(bh)
%     bh(i).EdgeColor = 'none';
% end
bh(1).FaceColor = 'flat';
bh(1).CData(1,:) = [0 0 0];
if step == 0 || step == 2
    yticklabels({'BAU','DAC + wind','DAC + wind + gE','NG + wind','NG + wind + gE'})
elseif step == 1
    yticklabels({'BAU','(DAC + wind)_{lit}','(DAC + wind)_{equi}','(DAC + wind)_{lit} + gE',...
        '(DAC + wind)_{equi} + gE','(NG + wind)_{lit}','(NG + wind)_{equi}',...
        '(NG + wind)_{lit} + gE','(NG + wind)_{equi} + gE'})
elseif step == 3
    yticklabels({'BAU','(DAC + wind)_{stoi}','(DAC + wind)_{equi}','(DAC + wind)_{recy}',...
        '(DAC + wind)_{stoi} + gE','(DAC + wind)_{equi} + gE','(DAC + wind)_{recy} + gE',...
        '(NG + wind)_{stoi}','(NG + wind)_{equi}','(NG + wind)_{recy}',...
        '(NG + wind)_{stoi} + gE','(NG + wind)_{equi} + gE','(NG + wind)_{recy} + gE'})
end
xlabel('Human Health [DALY]')
hold on
for i = 1:length(humanHealth(:,1))
    plot(humanHealth(i,1),i,'--h','MarkerSize',15,'MarkerFaceColor',[1 0 0],'MarkerEdgeColor',[1 0 0])
end
if step == 0 || step == 1
    legend({'BAU','Carbon dioxide','Hydrogen','Ethylene'})
elseif step == 2 || step == 3
    legend({'BAU','Carbon dioxide','Hydrogen','Ethylene'})
end
legend('boxoff')
set(gca,'FontSize',15)
set(gca,'TickLength',[0 0])

%% Ecosystems
figure
bh = barh(ecosystems(:,2:end),'stacked');
% for i = 1:length(bh)
%     bh(i).EdgeColor = 'none';
% end
bh(1).FaceColor = 'flat';
bh(1).CData(1,:) = [0 0 0];
if step == 0 || step == 2
    yticklabels({'BAU','DAC + wind','DAC + wind + gE','NG + wind','NG + wind + gE'})
elseif step == 1
    yticklabels({'BAU','(DAC + wind)_{lit}','(DAC + wind)_{equi}','(DAC + wind)_{lit} + gE',...
        '(DAC + wind)_{equi} + gE','(NG + wind)_{lit}','(NG + wind)_{equi}',...
        '(NG + wind)_{lit} + gE','(NG + wind)_{equi} + gE'})
elseif step == 3
    yticklabels({'BAU','(DAC + wind)_{stoi}','(DAC + wind)_{equi}','(DAC + wind)_{recy}',...
        '(DAC + wind)_{stoi} + gE','(DAC + wind)_{equi} + gE','(DAC + wind)_{recy} + gE',...
        '(NG + wind)_{stoi}','(NG + wind)_{equi}','(NG + wind)_{recy}',...
        '(NG + wind)_{stoi} + gE','(NG + wind)_{equi} + gE','(NG + wind)_{recy} + gE'})
end
xlabel('Ecosystems [species.yr]')
hold on
for i = 1:length(ecosystems(:,1))
    plot(ecosystems(i,1),i,'--h','MarkerSize',15,'MarkerFaceColor',[1 0 0],'MarkerEdgeColor',[1 0 0])
end
if step == 0 || step == 1
    legend({'BAU','Carbon dioxide','Hydrogen','Ethylene'})
elseif step == 2 || step == 3
    legend({'BAU','Carbon dioxide','Hydrogen','Ethylene'})
end
legend('boxoff')
set(gca,'FontSize',15)
set(gca,'TickLength',[0 0])

%% Resources
figure
bh = barh(resources(:,2:end),'stacked');
% for i = 1:length(bh)
%     bh(i).EdgeColor = 'none';
% end
bh(1).FaceColor = 'flat';
bh(1).CData(1,:) = [0 0 0];
if step == 0 || step == 2
    yticklabels({'BAU','DAC + wind','DAC + wind + gE','NG + wind','NG + wind + gE'})
elseif step == 1
    yticklabels({'BAU','(DAC + wind)_{lit}','(DAC + wind)_{equi}','(DAC + wind)_{lit} + gE',...
        '(DAC + wind)_{equi} + gE','(NG + wind)_{lit}','(NG + wind)_{equi}',...
        '(NG + wind)_{lit} + gE','(NG + wind)_{equi} + gE'})
elseif step == 3
    yticklabels({'BAU','(DAC + wind)_{stoi}','(DAC + wind)_{equi}','(DAC + wind)_{recy}',...
        '(DAC + wind)_{stoi} + gE','(DAC + wind)_{equi} + gE','(DAC + wind)_{recy} + gE',...
        '(NG + wind)_{stoi}','(NG + wind)_{equi}','(NG + wind)_{recy}',...
        '(NG + wind)_{stoi} + gE','(NG + wind)_{equi} + gE','(NG + wind)_{recy} + gE'})
end
xlabel('Resources [USD2013]')
hold on
for i = 1:length(resources(:,1))
    plot(resources(i,1),i,'--h','MarkerSize',15,'MarkerFaceColor',[1 0 0],'MarkerEdgeColor',[1 0 0])
end
if step == 0 || step == 1
    legend({'BAU','Carbon dioxide','Hydrogen','Ethylene'})
elseif step == 2 || step == 3
    legend({'BAU','Carbon dioxide','Hydrogen','Ethylene'})
end
legend('boxoff')
set(gca,'FontSize',15)
set(gca,'TickLength',[0 0])

%% Net impact GWP
figure
bh = barh(GWP(:,1)-GWP(1,1));
% for i = 1:length(bh)
%     bh(i).EdgeColor = 'none';
% end
bh(1).FaceColor = 'flat';
bh(1).CData(1,:) = [0 0 0];
if step == 0 || step == 2
    yticklabels({'BAU','DAC + wind','DAC + wind + gE','NG + wind','NG + wind + gE'})
elseif step == 1
    yticklabels({'BAU','(DAC + wind)_{lit}','(DAC + wind)_{equi}','(DAC + wind)_{lit} + gE',...
        '(DAC + wind)_{equi} + gE','(NG + wind)_{lit}','(NG + wind)_{equi}',...
        '(NG + wind)_{lit} + gE','(NG + wind)_{equi} + gE'})
elseif step == 3
    yticklabels({'BAU','(DAC + wind)_{stoi}','(DAC + wind)_{equi}','(DAC + wind)_{recy}',...
        '(DAC + wind)_{stoi} + gE','(DAC + wind)_{equi} + gE','(DAC + wind)_{recy} + gE',...
        '(NG + wind)_{stoi}','(NG + wind)_{equi}','(NG + wind)_{recy}',...
        '(NG + wind)_{stoi} + gE','(NG + wind)_{equi} + gE','(NG + wind)_{recy} + gE'})
end
xlabel('Net GWP [kg CO_{2eq}]')
title('Net impact [(GWP)_{process} - (GWP)_{BAU}]')
hold on
set(gca,'FontSize',15)
set(gca,'TickLength',[0 0])

%% Economics
sheetName = 'Economic results';

if step == 0
    fileName = 'Propanol - stoichiometric calculations.xlsx'; %stoichiometric calculations
    prices = xlsread(fileName,sheetName,'D4:D9');
elseif step == 1
    fileName1 = 'Propanol - literature reaction efficiency calculations.xlsx'; %literature reactor efficiency calculations
    fileName2 = 'Propanol - equilibrium calculations.xlsx'; %equilibrium calculations
    prices1 = xlsread(fileName1,sheetName,'D4:D9');
    prices2 = xlsread(fileName2,sheetName,'D4:D9');    
elseif step == 2
    fileName = 'Propanol - intermediate calculations.xlsx'; %stoichiometric calculations
    prices = xlsread(fileName,sheetName,'D4:D9');
elseif step == 3
    fileName0 = 'Propanol - stoichiometric calculations.xlsx'; %stoichiometric calculations
    fileName2 = 'Propanol - equilibrium calculations.xlsx'; %equilibrium calculations
    fileName2 = 'Propanol - intermediate calculations.xlsx'; %stoichiometric calculations
    prices0 = xlsread(fileName0,sheetName,'D4:D9');
    prices1 = xlsread(fileName1,sheetName,'D4:D9');
    prices2 = xlsread(fileName2,sheetName,'D4:D9');
end
if step == 0 || step == 2
    BAU = [1690 0 0 0];
    DACWind = [0 prices(2) prices(3) prices(4)];
    DACWindGE = [0 prices(2) prices(3) prices(6)];
    NGWind = [0 prices(1) prices(3) prices(4)];
    NGWindGE = [0 prices(1) prices(3) prices(5)];
    eco = [BAU;DACWind;DACWindGE;NGWind;NGWindGE];
elseif step == 1
    BAU = [1690 0 0 0];
    DACWind = [0 prices1(2) prices1(3) prices1(4);0 prices2(2) prices2(3) prices2(4)];
    DACWindGE = [0 prices1(2) prices1(3) prices1(6);0 prices2(2) prices2(3) prices2(6)];
    NGWind = [0 prices1(1) prices1(3) prices1(4);0 prices2(1) prices2(3) prices2(4)];
    NGWindGE = [0 prices1(1) prices1(3) prices1(5);0 prices2(1) prices2(3) prices2(5)];
    eco = [BAU;DACWind;DACWindGE;NGWind;NGWindGE];
elseif step == 3
    BAU = [1690 0 0 0];
    DACWind = [0 prices0(2) prices0(3) prices0(4);0 prices1(2) prices1(3) prices1(4);...
        0 prices2(2) prices2(3) prices2(4)];
    DACWindGE = [0 prices0(2) prices0(3) prices0(6);0 prices1(2) prices1(3) prices1(6);...
        0 prices2(2) prices2(3) prices2(6)];
    NGWind = [0 prices0(1) prices0(3) prices0(4);0 prices1(1) prices1(3) prices1(4);...
        0 prices2(1) prices2(3) prices2(4)];
    NGWindGE = [0 prices0(1) prices0(3) prices0(5);0 prices1(1) prices1(3) prices1(5);...
        0 prices2(1) prices2(3) prices2(5)];
    eco = [BAU;DACWind;DACWindGE;NGWind;NGWindGE];
end
figure
bh = barh(eco,'stacked');
% for i = 1:length(bh)
%     bh(i).EdgeColor = 'none';
% end
bh(1).FaceColor = 'flat';
bh(1).CData(1,:) = [0 0 0];
if step == 0 || step == 2
    yticklabels({'BAU','DAC + wind','DAC + wind + gE','NG + wind','NG + wind + gE'})
elseif step == 1
    yticklabels({'BAU','(DAC + wind)_{lit}','(DAC + wind)_{equi}','(DAC + wind)_{lit} + gE',...
        '(DAC + wind)_{equi} + gE','(NG + wind)_{lit}','(NG + wind)_{equi}',...
        '(NG + wind)_{lit} + gE','(NG + wind)_{equi} + gE'})
elseif step == 3
    yticklabels({'BAU','(DAC + wind)_{stoi}','(DAC + wind)_{equi}','(DAC + wind)_{recy}',...
        '(DAC + wind)_{stoi} + gE','(DAC + wind)_{equi} + gE','(DAC + wind)_{recy} + gE',...
        '(NG + wind)_{stoi}','(NG + wind)_{equi}','(NG + wind)_{recy}',...
        '(NG + wind)_{stoi} + gE','(NG + wind)_{equi} + gE','(NG + wind)_{recy} + gE'})
end
xlabel('$ t^{-1} propanol (only feed)')
legend({'BAU','Carbon dioxide','Hydrogen','Ethylene'})
legend('boxoff')
set(gca,'FontSize',15)
set(gca,'TickLength',[0 0])
