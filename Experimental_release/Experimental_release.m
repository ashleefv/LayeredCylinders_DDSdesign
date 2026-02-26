clear variables
clc

%% BSA -- PCL-only MCs
% 10% salt leaching
filename = 'Microcapsule_drug_release_ALL_formulations.xlsx';
sheet = 1;

% Experimental data
xlRange = 'A7:A23';
BSA_small_PCL_10_time = xlsread(filename,sheet,xlRange);

xlRange = 'B7:B23';
BSA_small_PCL_10_rel = xlsread(filename,sheet,xlRange);

xlRange = 'C7:C23';
BSA_small_PCL_10_stdv = xlsread(filename,sheet,xlRange);


sheet = 3;
% Experimental data
xlRange = 'A7:A23';
BSA_big_PCL_10_time = xlsread(filename,sheet,xlRange);

xlRange = 'B7:B23';
BSA_big_PCL_10_rel = xlsread(filename,sheet,xlRange);

xlRange = 'C7:C23';
BSA_big_PCL_10_stdv = xlsread(filename,sheet,xlRange);


% 7.5% salt leaching
sheet = 1;

% Experimental data
xlRange = 'E7:E22';
BSA_small_PCL_7_5_time = xlsread(filename,sheet,xlRange);

xlRange = 'F7:F22';
BSA_small_PCL_7_5_rel = xlsread(filename,sheet,xlRange);

xlRange = 'G7:G22';
BSA_small_PCL_7_5_stdv = xlsread(filename,sheet,xlRange);


sheet = 3;
% Experimental data
xlRange = 'E7:E33';
BSA_big_PCL_7_5_time = xlsread(filename,sheet,xlRange);

xlRange = 'F7:F33';
BSA_big_PCL_7_5_rel = xlsread(filename,sheet,xlRange);

xlRange = 'G7:G33';
BSA_big_PCL_7_5_stdv = xlsread(filename,sheet,xlRange);


% 5% salt leaching
sheet = 1;

% Experimental data
xlRange = 'I7:I25';
BSA_small_PCL_5_time = xlsread(filename,sheet,xlRange);

xlRange = 'J7:J25';
BSA_small_PCL_5_rel = xlsread(filename,sheet,xlRange);

xlRange = 'K7:K25';
BSA_small_PCL_5_stdv = xlsread(filename,sheet,xlRange);


sheet = 3;
% Experimental data
xlRange = 'I7:I33';
BSA_big_PCL_5_time = xlsread(filename,sheet,xlRange);

xlRange = 'J7:J33';
BSA_big_PCL_5_rel = xlsread(filename,sheet,xlRange);

xlRange = 'K7:K33';
BSA_big_PCL_5_stdv = xlsread(filename,sheet,xlRange);


%% Bevacizumab -- PCL-only MCs
% 10% salt leaching
sheet = 2;

% Experimental data
xlRange = 'A7:A23';
Bev_small_PCL_10_time = xlsread(filename,sheet,xlRange);

xlRange = 'B7:B23';
Bev_small_PCL_10_rel = xlsread(filename,sheet,xlRange);

xlRange = 'C7:C23';
Bev_small_PCL_10_stdv = xlsread(filename,sheet,xlRange);


sheet = 4;
% Experimental data
xlRange = 'A7:A23';
Bev_big_PCL_10_time = xlsread(filename,sheet,xlRange);

xlRange = 'B7:B23';
Bev_big_PCL_10_rel = xlsread(filename,sheet,xlRange);

xlRange = 'C7:C23';
Bev_big_PCL_10_stdv = xlsread(filename,sheet,xlRange);


% 7.5% salt leaching
sheet = 2;

% Experimental data
xlRange = 'E7:E23';
Bev_small_PCL_7_5_time = xlsread(filename,sheet,xlRange);

xlRange = 'F7:F23';
Bev_small_PCL_7_5_rel = xlsread(filename,sheet,xlRange);

xlRange = 'G7:G23';
Bev_small_PCL_7_5_stdv = xlsread(filename,sheet,xlRange);


sheet = 4;
% Experimental data
xlRange = 'E7:E23';
Bev_big_PCL_7_5_time = xlsread(filename,sheet,xlRange);

xlRange = 'F7:F23';
Bev_big_PCL_7_5_rel = xlsread(filename,sheet,xlRange);

xlRange = 'G7:G23';
Bev_big_PCL_7_5_stdv = xlsread(filename,sheet,xlRange);


% 5% salt leaching
sheet = 2;

% Experimental data
xlRange = 'I7:I23';
Bev_small_PCL_5_time = xlsread(filename,sheet,xlRange);

xlRange = 'J7:J23';
Bev_small_PCL_5_rel = xlsread(filename,sheet,xlRange);

xlRange = 'K7:K23';
Bev_small_PCL_5_stdv = xlsread(filename,sheet,xlRange);

sheet = 4;
% Experimental data
xlRange = 'I7:I23';
Bev_big_PCL_5_time = xlsread(filename,sheet,xlRange);

xlRange = 'J7:J23';
Bev_big_PCL_5_rel = xlsread(filename,sheet,xlRange);

xlRange = 'K7:K23';
Bev_big_PCL_5_stdv = xlsread(filename,sheet,xlRange);

%% BSA -- Chitosan-PCL MCs
% 10% salt leaching
sheet = 1;

% Experimental data
xlRange = 'M7:M27';
BSA_small_Chi_PCL_10_time = xlsread(filename,sheet,xlRange);

xlRange = 'N7:N27';
BSA_small_Chi_PCL_10_rel = xlsread(filename,sheet,xlRange);

xlRange = 'O7:O27';
BSA_small_Chi_PCL_10_stdv = xlsread(filename,sheet,xlRange);


sheet = 3;
% Experimental data
xlRange = 'M7:M33';
BSA_big_Chi_PCL_10_time = xlsread(filename,sheet,xlRange);

xlRange = 'N7:N33';
BSA_big_Chi_PCL_10_rel = xlsread(filename,sheet,xlRange);

xlRange = 'O7:O33';
BSA_big_Chi_PCL_10_stdv = xlsread(filename,sheet,xlRange);


% 7.5% salt leaching
sheet = 1;

% Experimental data
xlRange = 'Q7:Q24';
BSA_small_Chi_PCL_7_5_time = xlsread(filename,sheet,xlRange);

xlRange = 'R7:R24';
BSA_small_Chi_PCL_7_5_rel = xlsread(filename,sheet,xlRange);

xlRange = 'S7:S24';
BSA_small_Chi_PCL_7_5_stdv = xlsread(filename,sheet,xlRange);


sheet = 3;
% Experimental data
xlRange = 'Q7:Q33';
BSA_big_Chi_PCL_7_5_time = xlsread(filename,sheet,xlRange);

xlRange = 'R7:R33';
BSA_big_Chi_PCL_7_5_rel = xlsread(filename,sheet,xlRange);

xlRange = 'S7:S33';
BSA_big_Chi_PCL_7_5_stdv = xlsread(filename,sheet,xlRange);


% 5% salt leaching
sheet = 1;

% Experimental data
xlRange = 'U7:U24';
BSA_small_Chi_PCL_5_time = xlsread(filename,sheet,xlRange);

xlRange = 'V7:V24';
BSA_small_Chi_PCL_5_rel = xlsread(filename,sheet,xlRange);

xlRange = 'W7:W24';
BSA_small_Chi_PCL_5_stdv = xlsread(filename,sheet,xlRange);


sheet = 3;
% Experimental data
xlRange = 'U7:U30';
BSA_big_Chi_PCL_5_time = xlsread(filename,sheet,xlRange);

xlRange = 'V7:V30';
BSA_big_Chi_PCL_5_rel = xlsread(filename,sheet,xlRange);

xlRange = 'W7:W30';
BSA_big_Chi_PCL_5_stdv = xlsread(filename,sheet,xlRange);


%% Bevacizumab -- PCL-only MCs
% 10% salt leaching
sheet = 2;

% Experimental data
xlRange = 'M7:M23';
Bev_small_Chi_PCL_10_time = xlsread(filename,sheet,xlRange);

xlRange = 'N7:N23';
Bev_small_Chi_PCL_10_rel = xlsread(filename,sheet,xlRange);

xlRange = 'O7:O23';
Bev_small_Chi_PCL_10_stdv = xlsread(filename,sheet,xlRange);


sheet = 4;
% Experimental data
xlRange = 'M7:M23';
Bev_big_Chi_PCL_10_time = xlsread(filename,sheet,xlRange);

xlRange = 'N7:N23';
Bev_big_Chi_PCL_10_rel = xlsread(filename,sheet,xlRange);

xlRange = 'O7:O23';
Bev_big_Chi_PCL_10_stdv = xlsread(filename,sheet,xlRange);


% 7.5% salt leaching
sheet = 2;

% Experimental data
xlRange = 'Q7:Q23';
Bev_small_Chi_PCL_7_5_time = xlsread(filename,sheet,xlRange);

xlRange = 'R7:R23';
Bev_small_Chi_PCL_7_5_rel = xlsread(filename,sheet,xlRange);

xlRange = 'S7:S23';
Bev_small_Chi_PCL_7_5_stdv = xlsread(filename,sheet,xlRange);


sheet = 4;
% Experimental data
xlRange = 'Q7:Q23';
Bev_big_Chi_PCL_7_5_time = xlsread(filename,sheet,xlRange);

xlRange = 'R7:R23';
Bev_big_Chi_PCL_7_5_rel = xlsread(filename,sheet,xlRange);

xlRange = 'S7:S23';
Bev_big_Chi_PCL_7_5_stdv = xlsread(filename,sheet,xlRange);


% 5% salt leaching
sheet = 2;

% Experimental data
xlRange = 'U7:U23';
Bev_small_Chi_PCL_5_time = xlsread(filename,sheet,xlRange);

xlRange = 'V7:V23';
Bev_small_Chi_PCL_5_rel = xlsread(filename,sheet,xlRange);

xlRange = 'W7:W23';
Bev_small_Chi_PCL_5_stdv = xlsread(filename,sheet,xlRange);

sheet = 4;
% Experimental data
xlRange = 'U7:U23';
Bev_big_Chi_PCL_5_time = xlsread(filename,sheet,xlRange);

xlRange = 'V7:V23';
Bev_big_Chi_PCL_5_rel = xlsread(filename,sheet,xlRange);

xlRange = 'W7:W23';
Bev_big_Chi_PCL_5_stdv = xlsread(filename,sheet,xlRange);


%%


figure(52) %figureS2
figname = 'figureS2';
co = orderedcolors("gem");
    color3 = co(3, :);
    color4 = co(4,:);
    color5 = co(5,:);

subplot(2,2,2)
errorbar (BSA_small_PCL_5_time,BSA_small_PCL_5_rel,BSA_small_PCL_5_stdv,'^','Color',color3,'LineWidth',1)
hold on
errorbar (BSA_small_PCL_7_5_time,BSA_small_PCL_7_5_rel,BSA_small_PCL_7_5_stdv,'^','Color',color4,'LineWidth',1)
errorbar (BSA_small_PCL_10_time,BSA_small_PCL_10_rel,BSA_small_PCL_10_stdv,'^','Color',color5,'LineWidth',1)
errorbar (BSA_small_Chi_PCL_5_time,BSA_small_Chi_PCL_5_rel,BSA_small_Chi_PCL_5_stdv,'o','Color',color3,'LineWidth',1)
errorbar (BSA_small_Chi_PCL_7_5_time,BSA_small_Chi_PCL_7_5_rel,BSA_small_Chi_PCL_7_5_stdv,'o','Color',color4,'LineWidth',1)
errorbar (BSA_small_Chi_PCL_10_time,BSA_small_Chi_PCL_10_rel,BSA_small_Chi_PCL_10_stdv,'o','Color',color5,'LineWidth',1)
ylabel('Cumulative BSA release (%)','FontName','Arial','FontSize',8)
xlabel('Time (days)','FontName','Arial','FontSize',8)
axis([0,252,0,105])
hold off


subplot(2,2,1)
errorbar (BSA_big_PCL_5_time,BSA_big_PCL_5_rel,BSA_big_PCL_5_stdv,'^','Color',color3,'LineWidth',1)
hold on
errorbar (BSA_big_PCL_7_5_time,BSA_big_PCL_7_5_rel,BSA_big_PCL_7_5_stdv,'^','Color',color4,'LineWidth',1)
errorbar (BSA_big_PCL_10_time,BSA_big_PCL_10_rel,BSA_big_PCL_10_stdv,'^','Color',color5,'LineWidth',1)
errorbar (BSA_big_Chi_PCL_5_time,BSA_big_Chi_PCL_5_rel,BSA_big_Chi_PCL_5_stdv,'o','Color',color3,'LineWidth',1)
errorbar (BSA_big_Chi_PCL_7_5_time,BSA_big_Chi_PCL_7_5_rel,BSA_big_Chi_PCL_7_5_stdv,'o','Color',color4,'LineWidth',1)
errorbar (BSA_big_Chi_PCL_10_time,BSA_big_Chi_PCL_10_rel,BSA_big_Chi_PCL_10_stdv,'o','Color',color5,'LineWidth',1)
ylabel('Cumulative BSA release (%)','FontName','Arial','FontSize',8)
xlabel('Time (days)','FontName','Arial','FontSize',8)
axis([0,420,0,105])
hold off

subplot(2,2,4)
errorbar (Bev_small_PCL_5_time,Bev_small_PCL_5_rel,Bev_small_PCL_5_stdv,'^','Color',color3,'LineWidth',1)
hold on
errorbar (Bev_small_PCL_7_5_time,Bev_small_PCL_7_5_rel,Bev_small_PCL_7_5_stdv,'^','Color',color4,'LineWidth',1)
errorbar (Bev_small_PCL_10_time,Bev_small_PCL_10_rel,Bev_small_PCL_10_stdv,'^','Color',color5,'LineWidth',1)
errorbar (Bev_small_Chi_PCL_5_time,Bev_small_Chi_PCL_5_rel,Bev_small_Chi_PCL_5_stdv,'o','Color',color3,'LineWidth',1)
errorbar (Bev_small_Chi_PCL_7_5_time,Bev_small_Chi_PCL_7_5_rel,Bev_small_Chi_PCL_7_5_stdv,'o','Color',color4,'LineWidth',1)
errorbar (Bev_small_Chi_PCL_10_time,Bev_small_Chi_PCL_10_rel,Bev_small_Chi_PCL_10_stdv,'o','Color',color5,'LineWidth',1)
ylabel('Cumulative bevacizumab release (%)','FontName','Arial','FontSize',8)
xlabel('Time (days)','FontName','Arial','FontSize',8)
axis([0,252,0,80])
hold off


subplot(2,2,3)
errorbar (Bev_big_PCL_5_time,Bev_big_PCL_5_rel,Bev_big_PCL_5_stdv,'^','Color',color3,'LineWidth',1)
hold on
errorbar (Bev_big_PCL_7_5_time,Bev_big_PCL_7_5_rel,Bev_big_PCL_7_5_stdv,'^','Color',color4,'LineWidth',1)
errorbar (Bev_big_PCL_10_time,Bev_big_PCL_10_rel,Bev_big_PCL_10_stdv,'^','Color',color5,'LineWidth',1)
errorbar (Bev_big_Chi_PCL_5_time,Bev_big_Chi_PCL_5_rel,Bev_big_Chi_PCL_5_stdv,'o','Color',color3,'LineWidth',1)
errorbar (Bev_big_Chi_PCL_7_5_time,Bev_big_Chi_PCL_7_5_rel,Bev_big_Chi_PCL_7_5_stdv,'o','Color',color4,'LineWidth',1)
errorbar (Bev_big_Chi_PCL_10_time,Bev_big_Chi_PCL_10_rel,Bev_big_Chi_PCL_10_stdv,'o','Color',color5,'LineWidth',1)
ylabel('Cumulative bevacizumab release (%)','FontName','Arial','FontSize',8)
xlabel('Time (days)','FontName','Arial','FontSize',8)
axis([0,252,0,80])
hold off


%Overall legend top
legend('PCL 5%','PCL 7.5%','PCL 10%','Chi-PCL 5%','Chi-PCL 7.5%','Chi-PCL 10%','FontName','Arial','FontSize',7)
h = legend('Location','northoutside', 'Orientation', 'horizontal');
p = [0.5 0.96 0.03 0.03]; %Format: [left bottom width height] in normalized units
set(h,'Position', p,'Units', 'normalized');




%

widthInches = 6.5;
heightInches = 5;

run('ScriptForExportingImages.m')

