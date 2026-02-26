clear variables
clc

%% BSA 
filename = 'Dimensionless_Plotting_Both.xlsx';
sheet = 1;

% Model results small MCs
xlRange = 'A4:A256';
BSA_small_5_dim_time = xlsread(filename,sheet,xlRange);

xlRange = 'B4:B256';
BSA_small_5_dim_rel = xlsread(filename,sheet,xlRange);

xlRange = 'D4:D256';
BSA_small_7_5_dim_time = xlsread(filename,sheet,xlRange);

xlRange = 'E4:E256';
BSA_small_7_5_dim_rel = xlsread(filename,sheet,xlRange);

xlRange = 'G4:G256';
BSA_small_10_dim_time = xlsread(filename,sheet,xlRange);

xlRange = 'H4:H256';
BSA_small_10_dim_rel = xlsread(filename,sheet,xlRange);


% Experimental results small MCs
xlRange = 'S4:S20';
BSA_small_5_dim_time1_exp = xlsread(filename,sheet,xlRange);

xlRange = 'T4:T20';
BSA_small_5_dim_time2_exp = xlsread(filename,sheet,xlRange);

xlRange = 'U4:U20';
BSA_small_5_dim_rel_exp = xlsread(filename,sheet,xlRange);

xlRange = 'W4:W17';
BSA_small_7_5_dim_time1_exp = xlsread(filename,sheet,xlRange);

xlRange = 'X4:X17';
BSA_small_7_5_dim_time2_exp = xlsread(filename,sheet,xlRange);

xlRange = 'Y4:Y17';
BSA_small_7_5_dim_rel_exp = xlsread(filename,sheet,xlRange);

xlRange = 'AA4:AA17';
BSA_small_10_dim_time1_exp = xlsread(filename,sheet,xlRange);

xlRange = 'AB4:AB17';
BSA_small_10_dim_time2_exp = xlsread(filename,sheet,xlRange);

xlRange = 'AC4:AC17';
BSA_small_10_dim_rel_exp = xlsread(filename,sheet,xlRange);

fig1=figure(511); %figure6.S11
figname = 'figureS11';
subplot(3,3,1)
set(gca,'ColorOrderIndex',6)
co = get(gca, 'ColorOrder'); % Get the default color order
color1 = co(1, :); 
color2 = co(2, :);
color3 = co(3, :);
color4 = co(4, :);
color5 = co(5, :);
color6 = co(6, :); 
color7 = co(7, :);

plot (BSA_small_5_dim_time1_exp,BSA_small_5_dim_rel_exp*100,'^','Color',color3,'LineWidth',1)
hold on
plot (BSA_small_5_dim_time2_exp,BSA_small_5_dim_rel_exp*100,'o','Color',color1,'LineWidth',1)
plot (BSA_small_5_dim_time(1:8),BSA_small_5_dim_rel(1:8)*100,'k-','LineWidth',2)
plot (BSA_small_5_dim_time(9:end),BSA_small_5_dim_rel(9:end)*100,'k--','LineWidth',2)
title ("5% salt leaching",'FontWeight','Normal', "FontSize", 8)
axis([0,0.3,0,105])
hold off

subplot(3,3,2)
plot (BSA_small_7_5_dim_time1_exp,BSA_small_7_5_dim_rel_exp*100,'^','Color',color3,'LineWidth',1)
hold on
plot (BSA_small_7_5_dim_time2_exp,BSA_small_7_5_dim_rel_exp*100,'o','Color',color1,'LineWidth',1)
plot (BSA_small_7_5_dim_time(1:8),BSA_small_7_5_dim_rel(1:8)*100,'k-','LineWidth',2)
plot (BSA_small_7_5_dim_time(9:end),BSA_small_7_5_dim_rel(9:end)*100,'k--','LineWidth',2)
title ("7.5% salt leaching",'FontWeight','Normal', "FontSize", 8)
axis([0,0.22,0,105])
hold off

subplot(3,3,3)
plot (BSA_small_10_dim_time1_exp,BSA_small_10_dim_rel_exp*100,'^','Color',color3,'LineWidth',1)
hold on
plot (BSA_small_10_dim_time2_exp,BSA_small_10_dim_rel_exp*100,'o','Color',color1,'LineWidth',1)
plot (BSA_small_10_dim_time(1:8),BSA_small_10_dim_rel(1:8)*100,'k-','LineWidth',2)
plot (BSA_small_10_dim_time(9:end),BSA_small_10_dim_rel(9:end)*100,'k--','LineWidth',2)
title ("10% salt leaching",'FontWeight','Normal', "FontSize", 8)
text(1.1, 0.5, {["Small"],["PCL-only"] }, 'Units', 'normalized', 'FontWeight', 'Normal','FontSize',8)
axis([0,0.5,0,105])
hold off

%
% Model results big MCs - No release through caps
xlRange = 'J4:J424';
BSA_big_5_dim_time = xlsread(filename,sheet,xlRange);

xlRange = 'K4:K424';
BSA_big_5_dim_rel = xlsread(filename,sheet,xlRange);

xlRange = 'M4:M424';
BSA_big_7_5_dim_time = xlsread(filename,sheet,xlRange);

xlRange = 'N4:N424';
BSA_big_7_5_dim_rel = xlsread(filename,sheet,xlRange);

xlRange = 'P4:P424';
BSA_big_10_dim_time = xlsread(filename,sheet,xlRange);

xlRange = 'Q4:Q424';
BSA_big_10_dim_rel = xlsread(filename,sheet,xlRange);

% Experimental results small MCs
xlRange = 'AE4:AE30';
BSA_big_5_dim_time1_exp = xlsread(filename,sheet,xlRange);

xlRange = 'AF4:AF30';
BSA_big_5_dim_time2_exp = xlsread(filename,sheet,xlRange);

xlRange = 'AG4:AG30';
BSA_big_5_dim_rel_exp = xlsread(filename,sheet,xlRange);

xlRange = 'AI4:AI30';
BSA_big_7_5_dim_time1_exp = xlsread(filename,sheet,xlRange);

xlRange = 'AJ4:AJ30';
BSA_big_7_5_dim_time2_exp = xlsread(filename,sheet,xlRange);

xlRange = 'AK4:AK30';
BSA_big_7_5_dim_rel_exp = xlsread(filename,sheet,xlRange);

xlRange = 'AM4:AM30';
BSA_big_10_dim_time1_exp = xlsread(filename,sheet,xlRange);

xlRange = 'AN4:AN30';
BSA_big_10_dim_time2_exp = xlsread(filename,sheet,xlRange);

xlRange = 'AO4:AO30';
BSA_big_10_dim_rel_exp = xlsread(filename,sheet,xlRange);

subplot(3,3,4)
plot (BSA_big_5_dim_time1_exp,BSA_big_5_dim_rel_exp*100,'^','Color',color2,'LineWidth',1)
hold on
plot (BSA_big_5_dim_time2_exp,BSA_big_5_dim_rel_exp*100,'o','Color',color5,'LineWidth',1)
plot (BSA_big_5_dim_time(1:8),BSA_big_5_dim_rel(1:8)*100,'k-','LineWidth',2)
plot (BSA_big_5_dim_time(9:end),BSA_big_5_dim_rel(9:end)*100,'k--','LineWidth',2)
axis([0,0.031,0,80])
hold off

subplot(3,3,5)
plot (BSA_big_7_5_dim_time1_exp,BSA_big_7_5_dim_rel_exp*100,'^','Color',color2,'LineWidth',1)
hold on
plot (BSA_big_7_5_dim_time2_exp,BSA_big_7_5_dim_rel_exp*100,'o','Color',color5,'LineWidth',1)
plot (BSA_big_7_5_dim_time(1:8),BSA_big_7_5_dim_rel(1:8)*100,'k-','LineWidth',2)
plot (BSA_big_7_5_dim_time(9:end),BSA_big_7_5_dim_rel(9:end)*100,'k--','LineWidth',2)
axis([0,0.031,0,90])
hold off

subplot(3,3,6)
plot (BSA_big_10_dim_time1_exp,BSA_big_10_dim_rel_exp*100,'^','Color',color2,'LineWidth',1)
hold on
plot (BSA_big_10_dim_time2_exp,BSA_big_10_dim_rel_exp*100,'o','Color',color5,'LineWidth',1)
plot (BSA_big_10_dim_time(1:8),BSA_big_10_dim_rel(1:8)*100,'k-','LineWidth',2)
plot (BSA_big_10_dim_time(9:end),BSA_big_10_dim_rel(9:end)*100,'k--','LineWidth',2)
text(1.1, 0.5, {["Large"],["PCL-only"],['no k_{c,P}']}, 'Units', 'normalized', 'FontWeight', 'Normal','FontSize',8)
axis([0,0.07,0,100])
hold off

%
% Model results big MCs - Release through caps
xlRange = 'AQ4:AQ424';
BSA_big_5_dim_time = xlsread(filename,sheet,xlRange);

xlRange = 'AR4:AR424';
BSA_big_5_dim_rel = xlsread(filename,sheet,xlRange);

xlRange = 'AT4:AT424';
BSA_big_7_5_dim_time = xlsread(filename,sheet,xlRange);

xlRange = 'AU4:AU424';
BSA_big_7_5_dim_rel = xlsread(filename,sheet,xlRange);

xlRange = 'AW4:AW424';
BSA_big_10_dim_time = xlsread(filename,sheet,xlRange);

xlRange = 'AX4:AX424';
BSA_big_10_dim_rel = xlsread(filename,sheet,xlRange);

% Experimental results small MCs
xlRange = 'AE4:AE30';
BSA_big_5_dim_time1_exp = xlsread(filename,sheet,xlRange);

xlRange = 'AF4:AF30';
BSA_big_5_dim_time2_exp = xlsread(filename,sheet,xlRange);

xlRange = 'AG4:AG30';
BSA_big_5_dim_rel_exp = xlsread(filename,sheet,xlRange);

xlRange = 'AI4:AI30';
BSA_big_7_5_dim_time1_exp = xlsread(filename,sheet,xlRange);

xlRange = 'AJ4:AJ30';
BSA_big_7_5_dim_time2_exp = xlsread(filename,sheet,xlRange);

xlRange = 'AK4:AK30';
BSA_big_7_5_dim_rel_exp = xlsread(filename,sheet,xlRange);

xlRange = 'AM4:AM30';
BSA_big_10_dim_time1_exp = xlsread(filename,sheet,xlRange);

xlRange = 'AN4:AN30';
BSA_big_10_dim_time2_exp = xlsread(filename,sheet,xlRange);

xlRange = 'AO4:AO30';
BSA_big_10_dim_rel_exp = xlsread(filename,sheet,xlRange);

subplot(3,3,7)
plot (BSA_big_5_dim_time1_exp,BSA_big_5_dim_rel_exp*100,'^','Color',color2,'LineWidth',1)
hold on
plot (BSA_big_5_dim_time2_exp,BSA_big_5_dim_rel_exp*100,'o','Color',color5,'LineWidth',1)
plot (BSA_big_5_dim_time(1:29),BSA_big_5_dim_rel(1:29)*100,'-','Color',color4,'LineWidth',2.5)
plot (BSA_big_5_dim_time(30:end),BSA_big_5_dim_rel(30:end)*100,'--','Color',color4,'LineWidth',2.5)
axis([0,0.03,0,100])
hold off

subplot(3,3,8)
plot (BSA_big_7_5_dim_time1_exp,BSA_big_7_5_dim_rel_exp*100,'^','Color',color2,'LineWidth',1)
hold on
plot (BSA_big_7_5_dim_time2_exp,BSA_big_7_5_dim_rel_exp*100,'o','Color',color5,'LineWidth',1)
plot (BSA_big_7_5_dim_time(1:29),BSA_big_7_5_dim_rel(1:29)*100,'-','Color',color4,'LineWidth',2.5)
plot (BSA_big_7_5_dim_time(30:end),BSA_big_7_5_dim_rel(30:end)*100,'--','Color',color4,'LineWidth',2.5)
axis([0,0.03,0,100])
hold off

subplot(3,3,9)
plot (BSA_big_10_dim_time1_exp,BSA_big_10_dim_rel_exp*100,'^','Color',color2,'LineWidth',1)
hold on
plot (BSA_big_10_dim_time2_exp,BSA_big_10_dim_rel_exp*100,'o','Color',color5,'LineWidth',1)
plot (BSA_big_10_dim_time(1:29),BSA_big_10_dim_rel(1:29)*100,'-','Color',color4,'LineWidth',2.5)
plot (BSA_big_10_dim_time(30:end),BSA_big_10_dim_rel(30:end)*100,'--','Color',color4,'LineWidth',2.5)
text(1.1, 0.5, {["Large"],["PCL-only"],['with k_{c,P}'] }, 'Units', 'normalized', 'FontWeight', 'Normal','FontSize',8)
axis([0,0.025,0,101])
hold off

% Common y-axis label
han = axes(fig1, 'visible', 'off'); 
han.YLabel.Visible = 'on';
ylabel(han, 'Cumulative BSA release (%)',"Position",[-0.04,0.5,1],'FontName','Arial','FontSize',8);

% Common x-axis label
han = axes(fig1, 'visible', 'off'); 
han.XLabel.Visible = 'on';
xlabel(han, 'Dimensionless time','FontName','Arial','FontSize',8);

widthInches = 6.5;
heightInches = 5;

run('ScriptForExportingImages.m')





%% Bevacizumab 
sheet = 2;

% Model results small MCs
xlRange = 'A4:A256';
Bev_small_5_dim_time = xlsread(filename,sheet,xlRange);

xlRange = 'B4:B256';
Bev_small_5_dim_rel = xlsread(filename,sheet,xlRange);

xlRange = 'D4:D256';
Bev_small_7_5_dim_time = xlsread(filename,sheet,xlRange);

xlRange = 'E4:E256';
Bev_small_7_5_dim_rel = xlsread(filename,sheet,xlRange);

xlRange = 'G4:G256';
Bev_small_10_dim_time = xlsread(filename,sheet,xlRange);

xlRange = 'H4:H256';
Bev_small_10_dim_rel = xlsread(filename,sheet,xlRange);


% Experimental results small MCs
xlRange = 'S4:S20';
Bev_small_5_dim_time1_exp = xlsread(filename,sheet,xlRange);

xlRange = 'T4:T20';
Bev_small_5_dim_time2_exp = xlsread(filename,sheet,xlRange);

xlRange = 'U4:U20';
Bev_small_5_dim_rel_exp = xlsread(filename,sheet,xlRange);

xlRange = 'W4:W20';
Bev_small_7_5_dim_time1_exp = xlsread(filename,sheet,xlRange);

xlRange = 'X4:X20';
Bev_small_7_5_dim_time2_exp = xlsread(filename,sheet,xlRange);

xlRange = 'Y4:Y20';
Bev_small_7_5_dim_rel_exp = xlsread(filename,sheet,xlRange);

xlRange = 'AA4:AA20';
Bev_small_10_dim_time1_exp = xlsread(filename,sheet,xlRange);

xlRange = 'AB4:AB20';
Bev_small_10_dim_time2_exp = xlsread(filename,sheet,xlRange);

xlRange = 'AC4:AC20';
Bev_small_10_dim_rel_exp = xlsread(filename,sheet,xlRange);

fig2=figure(512); %figure6.S12
figname = 'figureS12';
subplot(3,3,1)
set(gca,'ColorOrderIndex',6)
co = get(gca, 'ColorOrder'); % Get the default color order
color1 = co(1, :); 
color2 = co(2, :);
color3 = co(3, :);
color4 = co(4, :);
color5 = co(5, :);
color6 = co(6, :); 
color7 = co(7, :);
 
plot (Bev_small_5_dim_time1_exp,Bev_small_5_dim_rel_exp*100,'^','Color',color3,'LineWidth',1)
hold on
plot (Bev_small_5_dim_time2_exp,Bev_small_5_dim_rel_exp*100,'o','Color',color1,'LineWidth',1)
plot (Bev_small_5_dim_time(1:4),Bev_small_5_dim_rel(1:4)*100,'k-','LineWidth',2)
plot (Bev_small_5_dim_time(5:end),Bev_small_5_dim_rel(5:end)*100,'k--','LineWidth',2)
title ("5% salt leaching",'FontWeight','Normal', "FontSize", 8)
axis([0,0.031,0,40])
hold off

subplot(3,3,2)
plot (Bev_small_7_5_dim_time1_exp,Bev_small_7_5_dim_rel_exp*100,'^','Color',color3,'LineWidth',1)
hold on
plot (Bev_small_7_5_dim_time2_exp,Bev_small_7_5_dim_rel_exp*100,'o','Color',color1,'LineWidth',1)
plot (Bev_small_7_5_dim_time(1:4),Bev_small_7_5_dim_rel(1:4)*100,'k-','LineWidth',2)
plot (Bev_small_7_5_dim_time(5:end),Bev_small_7_5_dim_rel(5:end)*100,'k--','LineWidth',2)
title ("7.5% salt leaching",'FontWeight','Normal', "FontSize", 8)
axis([0,0.075,0,70])
hold off

subplot(3,3,3)
plot (Bev_small_10_dim_time1_exp,Bev_small_10_dim_rel_exp*100,'^','Color',color3,'LineWidth',1)
hold on
plot (Bev_small_10_dim_time2_exp,Bev_small_10_dim_rel_exp*100,'o','Color',color1,'LineWidth',1)
plot (Bev_small_10_dim_time(1:4),Bev_small_10_dim_rel(1:4)*100,'k-','LineWidth',2)
plot (Bev_small_10_dim_time(5:end),Bev_small_10_dim_rel(5:end)*100,'k--','LineWidth',2)
title ("10% salt leaching",'FontWeight','Normal', "FontSize", 8)
text(1.1, 0.5, {["Small"],["PCL-only"] }, 'Units', 'normalized', 'FontWeight', 'Normal','FontSize',8)
axis([0,0.0651,0,80])
hold off

%
% Model results big MCs - No release through caps
xlRange = 'J4:J424';
BSA_big_5_dim_time = xlsread(filename,sheet,xlRange);

xlRange = 'K4:K424';
BSA_big_5_dim_rel = xlsread(filename,sheet,xlRange);

xlRange = 'M4:M424';
BSA_big_7_5_dim_time = xlsread(filename,sheet,xlRange);

xlRange = 'N4:N424';
BSA_big_7_5_dim_rel = xlsread(filename,sheet,xlRange);

xlRange = 'P4:P424';
BSA_big_10_dim_time = xlsread(filename,sheet,xlRange);

xlRange = 'Q4:Q424';
BSA_big_10_dim_rel = xlsread(filename,sheet,xlRange);

% Experimental results small MCs
xlRange = 'AE4:AE30';
BSA_big_5_dim_time1_exp = xlsread(filename,sheet,xlRange);

xlRange = 'AF4:AF30';
BSA_big_5_dim_time2_exp = xlsread(filename,sheet,xlRange);

xlRange = 'AG4:AG30';
BSA_big_5_dim_rel_exp = xlsread(filename,sheet,xlRange);

xlRange = 'AI4:AI30';
BSA_big_7_5_dim_time1_exp = xlsread(filename,sheet,xlRange);

xlRange = 'AJ4:AJ30';
BSA_big_7_5_dim_time2_exp = xlsread(filename,sheet,xlRange);

xlRange = 'AK4:AK30';
BSA_big_7_5_dim_rel_exp = xlsread(filename,sheet,xlRange);

xlRange = 'AM4:AM30';
BSA_big_10_dim_time1_exp = xlsread(filename,sheet,xlRange);

xlRange = 'AN4:AN30';
BSA_big_10_dim_time2_exp = xlsread(filename,sheet,xlRange);

xlRange = 'AO4:AO30';
BSA_big_10_dim_rel_exp = xlsread(filename,sheet,xlRange);

subplot(3,3,4)
plot (BSA_big_5_dim_time1_exp,BSA_big_5_dim_rel_exp*100,'^','Color',color2,'LineWidth',1)
hold on
plot (BSA_big_5_dim_time2_exp,BSA_big_5_dim_rel_exp*100,'o','Color',color5,'LineWidth',1)
plot (BSA_big_5_dim_time(1:4),BSA_big_5_dim_rel(1:4)*100,'k-','LineWidth',2)
plot (BSA_big_5_dim_time(5:end),BSA_big_5_dim_rel(5:end)*100,'k--','LineWidth',2)
axis([0,0.002,0,20])
hold off

subplot(3,3,5)
plot (BSA_big_7_5_dim_time1_exp,BSA_big_7_5_dim_rel_exp*100,'^','Color',color2,'LineWidth',1)
hold on
plot (BSA_big_7_5_dim_time2_exp,BSA_big_7_5_dim_rel_exp*100,'o','Color',color5,'LineWidth',1)
plot (BSA_big_7_5_dim_time(1:4),BSA_big_7_5_dim_rel(1:4)*100,'k-','LineWidth',2)
plot (BSA_big_7_5_dim_time(5:end),BSA_big_7_5_dim_rel(5:end)*100,'k--','LineWidth',2)
axis([0,0.005,0,60])
hold off

subplot(3,3,6)
plot (BSA_big_10_dim_time1_exp,BSA_big_10_dim_rel_exp*100,'^','Color',color2,'LineWidth',1)
hold on
plot (BSA_big_10_dim_time2_exp,BSA_big_10_dim_rel_exp*100,'o','Color',color5,'LineWidth',1)
plot (BSA_big_10_dim_time(1:4),BSA_big_10_dim_rel(1:4)*100,'k-','LineWidth',2)
plot (BSA_big_10_dim_time(5:end),BSA_big_10_dim_rel(5:end)*100,'k--','LineWidth',2)
text(1.1, 0.5, {["Large"],["PCL-only"],['no k_{c,P}']}, 'Units', 'normalized', 'FontWeight', 'Normal','FontSize',8)
axis([0,0.006,0,80])
hold off

%
% Model results big MCs - Release through caps
xlRange = 'AQ4:AQ424';
BSA_big_5_dim_time = xlsread(filename,sheet,xlRange);

xlRange = 'AR4:AR424';
BSA_big_5_dim_rel = xlsread(filename,sheet,xlRange);

xlRange = 'AT4:AT424';
BSA_big_7_5_dim_time = xlsread(filename,sheet,xlRange);

xlRange = 'AU4:AU424';
BSA_big_7_5_dim_rel = xlsread(filename,sheet,xlRange);

xlRange = 'AW4:AW424';
BSA_big_10_dim_time = xlsread(filename,sheet,xlRange);

xlRange = 'AX4:AX424';
BSA_big_10_dim_rel = xlsread(filename,sheet,xlRange);

% Experimental results small MCs
xlRange = 'AE4:AE30';
BSA_big_5_dim_time1_exp = xlsread(filename,sheet,xlRange);

xlRange = 'AF4:AF30';
BSA_big_5_dim_time2_exp = xlsread(filename,sheet,xlRange);

xlRange = 'AG4:AG30';
BSA_big_5_dim_rel_exp = xlsread(filename,sheet,xlRange);

xlRange = 'AI4:AI30';
BSA_big_7_5_dim_time1_exp = xlsread(filename,sheet,xlRange);

xlRange = 'AJ4:AJ30';
BSA_big_7_5_dim_time2_exp = xlsread(filename,sheet,xlRange);

xlRange = 'AK4:AK30';
BSA_big_7_5_dim_rel_exp = xlsread(filename,sheet,xlRange);

xlRange = 'AM4:AM30';
BSA_big_10_dim_time1_exp = xlsread(filename,sheet,xlRange);

xlRange = 'AN4:AN30';
BSA_big_10_dim_time2_exp = xlsread(filename,sheet,xlRange);

xlRange = 'AO4:AO30';
BSA_big_10_dim_rel_exp = xlsread(filename,sheet,xlRange);

subplot(3,3,7)
plot (BSA_big_5_dim_time2_exp,BSA_big_5_dim_rel_exp*100,'o','Color',color5,'LineWidth',1)
hold on
plot (BSA_big_5_dim_time1_exp,BSA_big_5_dim_rel_exp*100,'^','Color',color2,'LineWidth',1)
plot (BSA_big_5_dim_time(1:29),BSA_big_5_dim_rel(1:29)*100,'-','Color',color4,'LineWidth',2.5)
plot (BSA_big_5_dim_time(30:end),BSA_big_5_dim_rel(30:end)*100,'--','Color',color4,'LineWidth',2.5)
axis([0,0.004,0,20])
hold off

subplot(3,3,8)
plot (BSA_big_7_5_dim_time1_exp,BSA_big_7_5_dim_rel_exp*100,'^','Color',color2,'LineWidth',1)
hold on
plot (BSA_big_7_5_dim_time2_exp,BSA_big_7_5_dim_rel_exp*100,'o','Color',color5,'LineWidth',1)
plot (BSA_big_7_5_dim_time(1:29),BSA_big_7_5_dim_rel(1:29)*100,'-','Color',color4,'LineWidth',2.5)
plot (BSA_big_7_5_dim_time(30:end),BSA_big_7_5_dim_rel(30:end)*100,'--','Color',color4,'LineWidth',2.5)
axis([0,0.018,0,60])
hold off

subplot(3,3,9)
plot (BSA_big_10_dim_time2_exp,BSA_big_10_dim_rel_exp*100,'o','Color',color5,'LineWidth',1)
hold on
plot (BSA_big_10_dim_time1_exp,BSA_big_10_dim_rel_exp*100,'^','Color',color2,'LineWidth',1)
plot (BSA_big_10_dim_time(1:29),BSA_big_10_dim_rel(1:29)*100,'-','Color',color4,'LineWidth',2.5)
plot (BSA_big_10_dim_time(30:end),BSA_big_10_dim_rel(30:end)*100,'--','Color',color4,'LineWidth',2.5)
text(1.1, 0.5, {["Large"],["PCL-only"],['with k_{c,P}']}, 'Units', 'normalized', 'FontWeight', 'Normal','FontSize',8)
axis([0,0.021,0,80])
hold off

% Common y-axis label
han = axes(fig2, 'visible', 'off'); 
han.YLabel.Visible = 'on';
ylabel(han, 'Cumulative bevacizumab release (%)',"Position",[-0.04,0.5,1],'FontName','Arial','FontSize',8);

% Common x-axis label
han = axes(fig2, 'visible', 'off'); 
han.XLabel.Visible = 'on';
xlabel(han, 'Dimensionless time','FontName','Arial','FontSize',8);

widthInches = 6.5;
heightInches = 5;

run('ScriptForExportingImages.m')