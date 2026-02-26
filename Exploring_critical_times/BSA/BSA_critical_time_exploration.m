clear variables
clc

%% BSA 
% 5% salt leaching
filename = 'Results_compilation_BSA.xlsx';
sheet = 1;

% Experimental data
xlRange = 'AZ3:AZ20';
exp_time = xlsread(filename,sheet,xlRange);

xlRange = 'BA3:BA20';
exp_rel = xlsread(filename,sheet,xlRange);

xlRange = 'BB3:BB20';
exp_stdv = xlsread(filename,sheet,xlRange);

%tc=3d
xlRange = 'L4:L256';
sim_time = xlsread(filename,sheet,xlRange);

xlRange = 'M4:M256';
sim_results_average_3d = xlsread(filename,sheet,xlRange);

xlRange = 'P4:P256';
sim_results_best_3d = xlsread(filename,sheet,xlRange);

xlRange = 'J3:J53';
sim_results_errors_3d = xlsread(filename,sheet,xlRange);

%tc=7d
xlRange = 'AD4:AD256';
sim_results_average_7d = xlsread(filename,sheet,xlRange);

xlRange = 'AG4:AG256';
sim_results_best_7d = xlsread(filename,sheet,xlRange);

xlRange = 'AA3:AA53';
sim_results_errors_7d = xlsread(filename,sheet,xlRange);

%tc=14d
xlRange = 'AU4:AU256';
sim_results_average_14d = xlsread(filename,sheet,xlRange);

xlRange = 'AX4:AX256';
sim_results_best_14d = xlsread(filename,sheet,xlRange);

xlRange = 'AR3:AR53';
sim_results_errors_14d = xlsread(filename,sheet,xlRange);

figure(53) %figure6.S3
figname = 'figureS3';
subplot(2,3,4)
set(gca,'ColorOrderIndex',6)
co = get(gca, 'ColorOrder'); % Get the default color order
color1 = co(1, :); 
color2 = co(2, :);
color3 = co(3, :);
color4 = co(4, :);
color5 = co(5, :);
color6 = co(6, :); 
color7 = co(7, :);

errorbar (exp_time,exp_rel,exp_stdv,'ko')
hold on
plot (sim_time,sim_results_average_3d,'Color',color6,'LineWidth',2)
plot (sim_time,sim_results_best_3d,'--','Color',color3,'LineWidth',2)
ylabel('Cumulative drug release (%)','FontName','Arial','FontSize',8)
xlabel('Time (days)','FontName','Arial','FontSize',8)
legend('Jiang et al. (2020)', 'Average model','Best model','FontName','Arial','FontSize',6,'location','southeast')
axis([0,270,0,105])
hold off

subplot(2,3,5)
errorbar (exp_time,exp_rel,exp_stdv,'ko')
hold on
plot (sim_time,sim_results_average_7d,'Color',color4,'LineWidth',2)
plot (sim_time,sim_results_best_7d,'--','Color',color5,'LineWidth',2)
xlabel('Time (days)','FontName','Arial','FontSize',8)
ylabel('Cumulative drug release (%)','FontName','Arial','FontSize',8)
legend('Jiang et al. (2020)', 'Average model','Best model','FontName','Arial','FontSize',6,'location','southeast')
axis([0,270,0,105])
hold off

subplot(2,3,6)
errorbar (exp_time,exp_rel,exp_stdv,'ko')
hold on
plot (sim_time,sim_results_average_14d,'Color',color7,'LineWidth',2)
plot (sim_time,sim_results_best_14d,'--','Color',color1,'LineWidth',2)
xlabel('Time (days)','FontName','Arial','FontSize',8)
ylabel('Cumulative drug release (%)','FontName','Arial','FontSize',8)
legend('Jiang et al. (2020)', 'Average model','Best model','FontName','Arial','FontSize',6,'location','southeast')
axis([0,270,0,105])
hold off


n_restart = linspace(1,50,50);

subplot(2,3,1)
plot(n_restart,sim_results_errors_3d,'.','Color',color6)
ylabel('Sum of squared errors','FontName','Arial','FontSize',8)
xlabel('Completed multi-start run','FontName','Arial','FontSize',8)
legend('Simulation','FontName','Arial','FontSize',6,'location','northwest')
axis([0,50,150,400])

subplot(2,3,2)
plot(n_restart,sim_results_errors_7d,'.','Color',color4)
ylabel('Sum of squared errors','FontName','Arial','FontSize',8)
xlabel('Completed multi-start run','FontName','Arial','FontSize',8)
legend('Simulation','FontName','Arial','FontSize',6,'location','northwest')
axis([0,50,150,400])

subplot(2,3,3)
plot(n_restart,sim_results_errors_14d,'.','Color',color7)
ylabel('Sum of squared errors','FontName','Arial','FontSize',8)
xlabel('Completed multi-start run','FontName','Arial','FontSize',8)
legend('Simulation','FontName','Arial','FontSize',6,'location','northwest')
axis([0,50,150,400])



labelstring = {'a)', 'b)', 'c)','d)','e)','f)'};
for v = 1:6
    subplot(2,3,v)
    hold on
    text(-0.225, 1.05, labelstring(v)', 'Units', 'normalized', 'FontWeight', 'bold','FontSize',8)
     set(gca,'FontName','Arial','FontSize',8)
end

widthInches = 6.5;
heightInches = 5;

run('ScriptForExportingImages.m')




%% 7.5% salt leaching
filename = 'Results_compilation_BSA.xlsx';
sheet = 2;

% Experimental data
xlRange = 'AZ3:AZ17';
exp_time = xlsread(filename,sheet,xlRange);

xlRange = 'BA3:BA17';
exp_rel = xlsread(filename,sheet,xlRange);

xlRange = 'BB3:BB17';
exp_stdv = xlsread(filename,sheet,xlRange);

%tc=3d
xlRange = 'L4:L172';
sim_time = xlsread(filename,sheet,xlRange);

xlRange = 'M4:M172';
sim_results_average_3d = xlsread(filename,sheet,xlRange);

xlRange = 'P4:P172';
sim_results_best_3d = xlsread(filename,sheet,xlRange);

xlRange = 'J3:J53';
sim_results_errors_3d = xlsread(filename,sheet,xlRange);

%tc=7d
xlRange = 'AD4:AD172';
sim_results_average_7d = xlsread(filename,sheet,xlRange);

xlRange = 'AG4:AG172';
sim_results_best_7d = xlsread(filename,sheet,xlRange);

xlRange = 'AA3:AA53';
sim_results_errors_7d = xlsread(filename,sheet,xlRange);

%tc=14d
xlRange = 'AU4:AU172';
sim_results_average_14d = xlsread(filename,sheet,xlRange);

xlRange = 'AX4:AX172';
sim_results_best_14d = xlsread(filename,sheet,xlRange);

xlRange = 'AR3:AR53';
sim_results_errors_14d = xlsread(filename,sheet,xlRange);

figure(54) %figure6.S4
figname = 'figureS4';
subplot(2,3,4)
set(gca,'ColorOrderIndex',6)
co = get(gca, 'ColorOrder'); % Get the default color order
color1 = co(1, :); 
color2 = co(2, :);
color3 = co(3, :);
color4 = co(4, :);
color5 = co(5, :);
color6 = co(6, :); 
color7 = co(7, :);

errorbar (exp_time,exp_rel,exp_stdv,'ko')
hold on
plot (sim_time,sim_results_average_3d,'Color',color6,'LineWidth',2)
plot (sim_time,sim_results_best_3d,'--','Color',color3,'LineWidth',2)
ylabel('Cumulative drug release (%)','FontName','Arial','FontSize',8)
xlabel('Time (days)','FontName','Arial','FontSize',8)
legend('Jiang et al. (2020)', 'Average model','Best model','FontName','Arial','FontSize',6,'location','southeast')
axis([0,170,0,105])
hold off

subplot(2,3,5)
errorbar (exp_time,exp_rel,exp_stdv,'ko')
hold on
plot (sim_time,sim_results_average_7d,'Color',color4,'LineWidth',2)
plot (sim_time,sim_results_best_7d,'--','Color',color5,'LineWidth',2)
xlabel('Time (days)','FontName','Arial','FontSize',8)
ylabel('Cumulative drug release (%)','FontName','Arial','FontSize',8)
legend('Jiang et al. (2020)', 'Average model','Best model','FontName','Arial','FontSize',6,'location','southeast')
axis([0,170,0,105])
hold off

subplot(2,3,6)
errorbar (exp_time,exp_rel,exp_stdv,'ko')
hold on
plot (sim_time,sim_results_average_14d,'Color',color7,'LineWidth',2)
plot (sim_time,sim_results_best_14d,'--','Color',color1,'LineWidth',2)
xlabel('Time (days)','FontName','Arial','FontSize',8)
ylabel('Cumulative drug release (%)','FontName','Arial','FontSize',8)
legend('Jiang et al. (2020)', 'Average model','Best model','FontName','Arial','FontSize',6,'location','southeast')
axis([0,170,0,105])
hold off


n_restart = linspace(1,50,50);

subplot(2,3,1)
plot(n_restart,sim_results_errors_3d,'.','Color',color6)
ylabel('Sum of squared errors','FontName','Arial','FontSize',8)
xlabel('Completed multi-start run','FontName','Arial','FontSize',8)
legend('Simulation','FontName','Arial','FontSize',6,'location','northwest')
axis([0,50,150,900])

subplot(2,3,2)
plot(n_restart,sim_results_errors_7d,'.','Color',color4)
ylabel('Sum of squared errors','FontName','Arial','FontSize',8)
xlabel('Completed multi-start run','FontName','Arial','FontSize',8)
legend('Simulation','FontName','Arial','FontSize',6,'location','northwest')
axis([0,50,150,900])

subplot(2,3,3)
plot(n_restart,sim_results_errors_14d,'.','Color',color7)
ylabel('Sum of squared errors','FontName','Arial','FontSize',8)
xlabel('Completed multi-start run','FontName','Arial','FontSize',8)
legend('Simulation','FontName','Arial','FontSize',6,'location','northwest')
axis([0,50,150,900])



labelstring = {'a)', 'b)', 'c)','d)','e)','f)'};
for v = 1:6
    subplot(2,3,v)
    hold on
    text(-0.225, 1.05, labelstring(v)', 'Units', 'normalized', 'FontWeight', 'bold','FontSize',8)
     set(gca,'FontName','Arial','FontSize',8)
end

widthInches = 6.5;
heightInches = 5;

run('ScriptForExportingImages.m')


%% 10% salt leaching
filename = 'Results_compilation_BSA.xlsx';
sheet = 3;

% Experimental data
xlRange = 'AZ3:AZ17';
exp_time = xlsread(filename,sheet,xlRange);

xlRange = 'BA3:BA17';
exp_rel = xlsread(filename,sheet,xlRange);

xlRange = 'BB3:BB17';
exp_stdv = xlsread(filename,sheet,xlRange);

%tc=3d
xlRange = 'L4:L172';
sim_time = xlsread(filename,sheet,xlRange);

xlRange = 'M4:M172';
sim_results_average_3d = xlsread(filename,sheet,xlRange);

xlRange = 'P4:P172';
sim_results_best_3d = xlsread(filename,sheet,xlRange);

xlRange = 'J3:J53';
sim_results_errors_3d = xlsread(filename,sheet,xlRange);

%tc=7d
xlRange = 'AD4:AD172';
sim_results_average_7d = xlsread(filename,sheet,xlRange);

xlRange = 'AG4:AG172';
sim_results_best_7d = xlsread(filename,sheet,xlRange);

xlRange = 'AA3:AA53';
sim_results_errors_7d = xlsread(filename,sheet,xlRange);

%tc=14d
xlRange = 'AU4:AU172';
sim_results_average_14d = xlsread(filename,sheet,xlRange);

xlRange = 'AX4:AX172';
sim_results_best_14d = xlsread(filename,sheet,xlRange);

xlRange = 'AR3:AR53';
sim_results_errors_14d = xlsread(filename,sheet,xlRange);

figure(55) %figure6.S5
figname = 'figureS5';
subplot(2,3,4)
set(gca,'ColorOrderIndex',6)
co = get(gca, 'ColorOrder'); % Get the default color order
color1 = co(1, :); 
color2 = co(2, :);
color3 = co(3, :);
color4 = co(4, :);
color5 = co(5, :);
color6 = co(6, :); 
color7 = co(7, :);

errorbar (exp_time,exp_rel,exp_stdv,'ko')
hold on
plot (sim_time,sim_results_average_3d,'Color',color6,'LineWidth',2)
plot (sim_time,sim_results_best_3d,'--','Color',color3,'LineWidth',2)
ylabel('Cumulative drug release (%)','FontName','Arial','FontSize',8)
xlabel('Time (days)','FontName','Arial','FontSize',8)
legend('Jiang et al. (2020)', 'Average model','Best model','FontName','Arial','FontSize',6,'location','southeast')
axis([0,170,0,105])
hold off

subplot(2,3,5)
errorbar (exp_time,exp_rel,exp_stdv,'ko')
hold on
plot (sim_time,sim_results_average_7d,'Color',color4,'LineWidth',2)
plot (sim_time,sim_results_best_7d,'--','Color',color5,'LineWidth',2)
xlabel('Time (days)','FontName','Arial','FontSize',8)
ylabel('Cumulative drug release (%)','FontName','Arial','FontSize',8)
legend('Jiang et al. (2020)', 'Average model','Best model','FontName','Arial','FontSize',6,'location','southeast')
axis([0,170,0,105])
hold off

subplot(2,3,6)
errorbar (exp_time,exp_rel,exp_stdv,'ko')
hold on
plot (sim_time,sim_results_average_14d,'Color',color7,'LineWidth',2)
plot (sim_time,sim_results_best_14d,'--','Color',color1,'LineWidth',2)
xlabel('Time (days)','FontName','Arial','FontSize',8)
ylabel('Cumulative drug release (%)','FontName','Arial','FontSize',8)
legend('Jiang et al. (2020)', 'Average model','Best model','FontName','Arial','FontSize',6,'location','southeast')
axis([0,170,0,105])
hold off


n_restart = linspace(1,50,50);

subplot(2,3,1)
plot(n_restart,sim_results_errors_3d,'.','Color',color6)
ylabel('Sum of squared errors','FontName','Arial','FontSize',8)
xlabel('Completed multi-start run','FontName','Arial','FontSize',8)
legend('Simulation','FontName','Arial','FontSize',6,'location','northwest')
axis([0,50,50,250])

subplot(2,3,2)
plot(n_restart,sim_results_errors_7d,'.','Color',color4)
ylabel('Sum of squared errors','FontName','Arial','FontSize',8)
xlabel('Completed multi-start run','FontName','Arial','FontSize',8)
legend('Simulation','FontName','Arial','FontSize',6,'location','northwest')
axis([0,50,50,250])

subplot(2,3,3)
plot(n_restart,sim_results_errors_14d,'.','Color',color7)
ylabel('Sum of squared errors','FontName','Arial','FontSize',8)
xlabel('Completed multi-start run','FontName','Arial','FontSize',8)
legend('Simulation','FontName','Arial','FontSize',6,'location','northwest')
axis([0,50,50,250])



labelstring = {'a)', 'b)', 'c)','d)','e)','f)'};
for v = 1:6
    subplot(2,3,v)
    hold on
    text(-0.225, 1.05, labelstring(v)', 'Units', 'normalized', 'FontWeight', 'bold','FontSize',8)
     set(gca,'FontName','Arial','FontSize',8)
end

widthInches = 6.5;
heightInches = 5;

run('ScriptForExportingImages.m')