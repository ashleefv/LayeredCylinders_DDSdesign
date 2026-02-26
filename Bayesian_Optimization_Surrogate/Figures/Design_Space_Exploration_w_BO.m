clear variables
clc
tic
%mphnavigator  %%With this you can find the specific handles or functions
%to call for what you need


%User input
file_name = "Results_Compilation_BO.xlsx";
threshold = 1; %ug/day
tolerance = 0.1; %

%Read .csv file
data1 = readtable(file_name,'Sheet','5percent');
data2 = readtable(file_name,'Sheet','7.5percent');

time = data1.Time_days;

%Cumulative release
c5_best = data1.CumulRel_percentage;
c7_5_best = data2.CumulRel_percentage;

%Release rate
r5_best = data1.RelRate_ug_per_day;
r7_5_best = data2.RelRate_ug_per_day;

%% Cumulative release figure

fig1 = figure(1);
figname = 'Cumulative_and_release_best';

subplot(2,2,1)
plot(time,c5_best,'LineWidth',2)
legend('F_{PCL} = 0.95, \delta_{pol} = 0.015 mm','FontName','Arial','FontSize',5.6)
ylabel('Cumulative release (%)','FontName','Arial','FontSize',8)
axis([0 max(time) 0 100])
ax = gca;
ax.XTick = 0:10:max(time);                 % major ticks
ax.XMinorTick = 'on';
ax.XAxis.MinorTickValues = 0:5:max(time);  % minor ticks
labels = string(ax.XTick);                 % label only 50s
labels(mod(ax.XTick,50) ~= 0) = "";
ax.XTickLabel = labels;
xtickangle(0) 
ax.YMinorTick = 'on';
ax.YAxis.MinorTickValues = 0:5:100;


subplot(2,2,2)
plot(time,c7_5_best,'LineWidth',2)
legend('F_{PCL} = 0.45, \delta_{pol} = 0.011 mm','FontName','Arial','FontSize',5.6)
axis([0 max(time) 0 100])
ax = gca;
ax.XTick = 0:10:max(time);                 % major ticks
ax.XMinorTick = 'on';
ax.XAxis.MinorTickValues = 0:5:max(time);  % minor ticks
labels = string(ax.XTick);                 % label only 50s
labels(mod(ax.XTick,50) ~= 0) = "";
ax.XTickLabel = labels;
xtickangle(0) 
ax.YMinorTick = 'on';
ax.YAxis.MinorTickValues = 0:5:100;

subplot(2,2,3)
semilogy(time,r5_best,'LineWidth',2)
hold on
plotfill(time,r5_best,threshold,tolerance)
legend('F_{PCL} = 0.95, \delta_{pol} = 0.015 mm', ['Days within \pm' num2str(tolerance*100) '% of ' num2str(threshold) ' \mug/day threshold'], [num2str(threshold) ' \mug/day threshold'],'FontName','Arial','FontSize',5.6)
ylabel('Release rate (\mug/day)','FontName','Arial','FontSize',8)
axis([0 max(time) 1e-1 3e2])
ax = gca;
ax.XTick = 0:10:max(time);                 % major ticks
ax.XMinorTick = 'on';
ax.XAxis.MinorTickValues = 0:5:max(time);  % minor ticks
labels = string(ax.XTick);                 % label only 50s
labels(mod(ax.XTick,50) ~= 0) = "";
ax.XTickLabel = labels;
xtickangle(0)

subplot(2,2,4)
semilogy(time,r7_5_best,'LineWidth',2)
hold on
plotfill(time,r7_5_best,threshold,tolerance)
legend('F_{PCL} = 0.45, \delta_{pol} = 0.011 mm',['Days within \pm' num2str(tolerance*100) '% of ' num2str(threshold) ' \mug/day threshold'], [num2str(threshold) ' \mug/day threshold'],'FontName','Arial','FontSize',5.6)
xlabel('Time (days)','FontName','Arial','FontSize',8)
ylabel('Release rate (\mug/day)','FontName','Arial','FontSize',8)
axis([0 max(time) 1e-1 3e2])
ax = gca;
ax.XTick = 0:10:max(time);                 % major ticks
ax.XMinorTick = 'on';
ax.XAxis.MinorTickValues = 0:5:max(time);  % minor ticks
labels = string(ax.XTick);                 % label only 50s
labels(mod(ax.XTick,50) ~= 0) = "";
ax.XTickLabel = labels;
xtickangle(0) 


labelstring = {'a)', 'b)', 'c)','d)'};
for v = 1:4
    subplot(2,2,v)
    hold on
    text(-0.225, 1.05, labelstring(v)', 'Units', 'normalized', 'FontWeight', 'bold','FontSize',8)
     set(gca,'FontName','Arial','FontSize',8)
end

widthInches = 6.5;
heightInches = 5;

run('ScriptForExportingImages.m')