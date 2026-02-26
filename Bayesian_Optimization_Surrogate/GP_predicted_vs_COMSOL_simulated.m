clear variables
clc


%% 5% salt leaching
iterations = 1:11;
predicted_t_cross = [216.4 211.9 212.70 217.33 217.73 212.79 124.82 215.41 206.51 209.86];
stdv = [28.12 14.60 12.50 7.48 4.75 5.83 42.36 9.50 10.96 8.42];
real_t_cross = [221.70 200.68 207.46 219.00 215.25 213.12 216.10 215.53 215.48 195.26 218.94];

EI = [8.76 2.18 1.73 1.29 0.54 0.16 0.15 1.44 0.42 0.30];

% Custom color list (RGB triplets)
color_list = [
    0.0 1.0 1.0      % cyan
    1.0 0.0 1.0      % magenta
    0.0 1.0 0.0      % lime
    1.0 0.65 0.0     % orange
    0.0 0.0 1.0      % blue
    0.65 0.16 0.16   % brown
    0.75 0.75 0.75   % silver
    1.0 0.84 0.0     % gold
    0.0 0.5 0.0      % green
    0.82 0.41 0.12   % chocolate
    0.85 0.44 0.84   % orchid
];


fig = figure(1);
figname = 'GP_predicted_vs_simulated'; 
subplot(1,2,1)


% Errorbar (uniform color)
errorbar(iterations(2:end), predicted_t_cross, stdv, ...
    'o', 'LineWidth', 2, 'Color', [0 0 0])   % black
hold on

% Plot real_t_cross with custom marker colors
for i = 1:length(iterations)
    c = color_list(mod(i-1, size(color_list,1)) + 1, :);
    plot(iterations(i), real_t_cross(i), 'x', ...
        'LineWidth', 2, 'Color', c, 'MarkerSize', 10);
end

% Axes and labels
xticks(0:12)
axis([0 12 80 260])
xlabel('Iteration')
ylabel('Time (days) releasing a therapeutic amount')

%% 7.5% salt leaching
iterations = 1:11;
predicted_t_cross = [153.15 159.68 161.30 165.30 173.00 106.50 162.09 174.17 166.52 169.51];
stdv = [17.86 11.60 11.86 15.24 4.55 32.68 22.43 16.53 9.57 8.38];
real_t_cross = [157.60 163.09 168.80 177.17 163.57 173.48 179.11 129.22 100.29 180.14 180.14];

EI = [5.12 3.11 1.90 1.90 0.45 0.18 2.89 4.42 0.42 0.41];




subplot(1,2,2)
% Errorbar (uniform color)
errorbar(iterations(2:end), predicted_t_cross, stdv, ...
    'o', 'LineWidth', 2, 'Color', [0 0 0])   % black
hold on

% Plot real_t_cross with custom marker colors
for i = 1:length(iterations)
    c = color_list(mod(i-1, size(color_list,1)) + 1, :);
    plot(iterations(i), real_t_cross(i), 'x', ...
        'LineWidth', 2, 'Color', c, 'MarkerSize', 10);
end

% Axes and labels
xticks(0:12)
axis([0 12 60 200])
xlabel('Iteration')
ylabel('Time (days) releasing a therapeutic amount')


%Overall legend
legend('GP Predicted','COMSOL LHS best','COMSOL GP design1', 'COMSOL GP design2', 'COMSOL GP design3', 'COMSOL GP design4', ...
    'COMSOL GP design5', 'COMSOL GP design6','COMSOL GP design7', 'COMSOL GP design8', 'COMSOL GP design9', 'COMSOL GP design10', ...
    'location','southwest','FontName','Arial','FontSize',8)
h = legend('Location','southoutside', 'Orientation', 'horizontal','NumColumns', 6);
p = [0.5 0.95 0.03 0.03]; %Format: [left bottom width height] in normalized units
set(h,'Position', p,'Units', 'normalized');      


widthInches = 13;
heightInches = 5;
run('ScriptForExportingImages.m')