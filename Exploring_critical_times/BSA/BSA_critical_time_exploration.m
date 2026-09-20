clear variables
clc

%% Fixed RGB colors for 5%, 7.5%, 10%
color_5 = [221 170 51]/255;   % yellow
color_7_5 = [0 68 136]/255;   % blue
color_10 = [187 85 102]/255;  % red
colors = {color_5, color_7_5, color_10};

%% File
filename = 'Results_compilation_BSA.xlsx';
figname = 'figure_tc_best_BSA';

%% Salt leaching sheets
sheets = [1, 2, 3];
titles = ["5% salt leaching", "7.5% salt leaching", "10% salt leaching"];

%% Create figure
figure(300)
set(gcf,'Position',[200 200 1100 550])

for i = 1:3
    sheet = sheets(i);

    %% Experimental data
    exp_time = xlsread(filename, sheet, 'AZ3:AZ20');
    exp_rel  = xlsread(filename, sheet, 'BA3:BA20');
    exp_stdv = xlsread(filename, sheet, 'BB3:BB20');

    %% Simulation time
    sim_time = xlsread(filename, sheet, 'L4:L256');

    %% Load all tc curves
    sim_avg_3d  = xlsread(filename, sheet, 'M4:M256');
    err_3d      = xlsread(filename, sheet, 'J3:J53');

    sim_avg_7d  = xlsread(filename, sheet, 'AD4:AD256');
    err_7d      = xlsread(filename, sheet, 'AA3:AA53');

    sim_avg_14d  = xlsread(filename, sheet, 'AU4:AU256');
    err_14d      = xlsread(filename, sheet, 'AR3:AR53');

    %% Determine best tc (lowest SSE)
    SSE = [min(err_3d), min(err_7d), min(err_14d)];
    [~, idx_best] = min(SSE);

    tc_values = [3, 7, 14];
    best_tc = tc_values(idx_best);

    %% --- TOP ROW: Cumulative drug release (ALL 3 tc curves) ---
    subplot(2,3,i)

    % Data (experimental)
    hData = errorbar(exp_time, exp_rel, exp_stdv, 'k^', 'LineWidth',1.0);
    hold on

    % tc = 3 days (solid)
    h3  = plot(sim_time, sim_avg_3d,  '-',  'Color', colors{i}, 'LineWidth', 2);

    % tc = 7 days (dashed)
    h7  = plot(sim_time, sim_avg_7d,  '--', 'Color', colors{i}, 'LineWidth', 2);

    % tc = 14 days (dotted)
    h14 = plot(sim_time, sim_avg_14d, ':',  'Color', colors{i}, 'LineWidth', 2);

    % Two-line column title
    title({titles(i), sprintf("(Best t_c = %d days)", best_tc)}, ...
        'FontName','Arial','FontSize',10)

    xlabel('Time (days)','FontName','Arial','FontSize',8)
    ylabel('Cumulative drug release (%)','FontName','Arial','FontSize',8)

    yticks(0:150:max(exp_rel)*1.2)
    axis([0 max(sim_time) 0 max(exp_rel)*1.2])

    % Individual legend for each cumulative release plot
    legend([hData, h3, h7, h14], ...
        {'Data','t_c = 3 days','t_c = 7 days','t_c = 14 days'}, ...
        'FontSize',7, 'Location','southeast')

    hold off

    %% --- BOTTOM ROW: Error curves (ALL 3 tc curves) ---
    subplot(2,3,i+3)

    n3  = linspace(1, length(err_3d),  length(err_3d));
    n7  = linspace(1, length(err_7d),  length(err_7d));
    n14 = linspace(1, length(err_14d), length(err_14d));

    plot(n3,  err_3d,  '-',  'Color', colors{i}, 'LineWidth', 2);
    hold on
    plot(n7,  err_7d,  '--', 'Color', colors{i}, 'LineWidth', 2);
    plot(n14, err_14d, ':',  'Color', colors{i}, 'LineWidth', 2);

    xlabel('Completed multi-start run','FontName','Arial','FontSize',8)
    ylabel('Sum of squared errors','FontName','Arial','FontSize',8)

    yticks(0:150:900)
    axis([0 max([length(err_3d),length(err_7d),length(err_14d)]) 0 900])

    hold off
end

%% Export
widthInches = 6.5;
heightInches = 5;
run('ScriptForExportingImages.m')