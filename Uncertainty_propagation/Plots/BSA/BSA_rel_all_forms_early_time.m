clear variables
clc
%%
fig = figure(59); %Figure S9
figname = 'figureS9'; 
co = orderedcolors("gem");
    color1 = co(3, :);
    color2 = co(1,:);
    color3 = co(2,:);

color = [color1, color2, color3];
filenames = ["5_percent_formulations.xlsx", "7_5_percent_formulations.xlsx", "10_percent_formulations.xlsx"];
titles = ["5% salt leaching", "7.5% salt leaching", "10% salt leaching"];
mat_files_small_pcl_only = ["UQ_BSA_Small_5percent.mat", "UQ_BSA_Small_7_5percent.mat", "UQ_BSA_Small_10percent.mat"];
mat_files_large_pcl_only = ["UQ_BSA_Large_PCL_only_5percent.mat", "UQ_BSA_Large_PCL_only_7_5percent.mat", "UQ_BSA_Large_PCL_only_10percent.mat"];
mat_files_small_chi_pcl = ["UQ_BSA_Small_Chi_PCL_5percent.mat", "UQ_BSA_Small_Chi_PCL_7_5percent.mat", "UQ_BSA_Small_Chi_PCL_10percent.mat"];
mat_files_large_chi_pcl = ["UQ_BSA_Large_Chi_PCL_5percent.mat", "UQ_BSA_Large_Chi_PCL_7_5percent.mat", "UQ_BSA_Large_Chi_PCL_10percent.mat"];

for i=1:length(filenames)
    % BSA - small PCL-only 
    filename = filenames(i);
    sheet = 1;
    
    % Experimental data
    xlRange = 'R4:R21';
    exp_time_BSA = xlsread(filename,sheet,xlRange);
    
    xlRange = 'S4:S21';
    exp_rel_BSA = xlsread(filename,sheet,xlRange);
    
    xlRange = 'T4:T21';
    exp_stdv_BSA = xlsread(filename,sheet,xlRange);
    
    %tc=7d
    xlRange = 'L4:L256';
    sim_time_BSA = xlsread(filename,sheet,xlRange);
    
    xlRange = 'M4:M256';
    sim_results_average_BSA = xlsread(filename,sheet,xlRange);
    
    load(mat_files_small_pcl_only(i))
    
    subplot(4,3,i)
    errorbar (exp_time_BSA,exp_rel_BSA,exp_stdv_BSA,'ko')
    hold on
    plot (sim_time_BSA,sim_results_average_BSA,'-','Color',color((i-1)*3+1:i*3),'LineWidth',1)
    fill([sim_time_BSA' fliplr(sim_time_BSA')], [Q_lo fliplr(Q_hi)], ...
      color((i-1)*3+1:i*3), ...  %Keeping the color
     'FaceAlpha', 0.2, ...   % transparency (0 = invisible, 1 = opaque)
     'EdgeColor', 'none');   % no border

    if i ==3 
        text(1.1, 0.5, {["Small"],["PCL-only"] }, 'Units', 'normalized', 'FontWeight', 'Normal','FontSize',8)
    end
    title(titles(i),'FontWeight','Normal', "FontSize", 8)
    axis([0,30,0,85])
    hold off
    
    %%
    % BSA - large PCL-only 
    sheet = 2;
    
    % Experimental data
    xlRange = 'O4:O30';
    exp_time_BSA = xlsread(filename,sheet,xlRange);
    
    xlRange = 'P4:P30';
    exp_rel_BSA = xlsread(filename,sheet,xlRange);
    
    xlRange = 'Q4:Q30';
    exp_stdv_BSA = xlsread(filename,sheet,xlRange);
    
    %tc=28d
    xlRange = 'I4:I424';
    sim_time_BSA = xlsread(filename,sheet,xlRange);
    
    xlRange = 'J4:J424';
    sim_results_average_BSA = xlsread(filename,sheet,xlRange);
    
    load(mat_files_large_pcl_only(i))

    subplot(4,3,i+6)
    errorbar (exp_time_BSA,exp_rel_BSA,exp_stdv_BSA,'ko')
    hold on
    plot (sim_time_BSA,sim_results_average_BSA,'-.','Color',color((i-1)*3+1:i*3),'LineWidth',2)
    fill([sim_time_BSA' fliplr(sim_time_BSA')], [Q_lo(1:length(sim_time_BSA)) fliplr(Q_hi(1:length(sim_time_BSA)))], ...
      color((i-1)*3+1:i*3), ...  %Keeping the color
     'FaceAlpha', 0.2, ...   % transparency (0 = invisible, 1 = opaque)
     'EdgeColor', 'none');   % no border
    if i ==3 
        text(1.1, 0.5, {["Large"], ["PCL-only"]}, 'Units', 'normalized', 'FontWeight', 'Normal','FontSize',8)
    end
    axis([0,30,0,85])
    hold off
    
    %%
    % BSA - small chitosan-PCL 
    sheet = 3;
    
    % Experimental data
    xlRange = 'O4:O21';
    exp_time_BSA = xlsread(filename,sheet,xlRange);
    
    xlRange = 'P4:P21';
    exp_rel_BSA = xlsread(filename,sheet,xlRange);
    
    xlRange = 'Q4:Q21';
    exp_stdv_BSA = xlsread(filename,sheet,xlRange);
    
    %tc=7d
    xlRange = 'I4:I256';
    sim_time_BSA = xlsread(filename,sheet,xlRange);
    
    xlRange = 'J4:J256';
    sim_results_average_BSA = xlsread(filename,sheet,xlRange);
    
    load(mat_files_small_chi_pcl(i))

    subplot(4,3,i+3)
    errorbar (exp_time_BSA,exp_rel_BSA,exp_stdv_BSA,'ko')
    hold on
    plot (sim_time_BSA,sim_results_average_BSA,'--','Color',color((i-1)*3+1:i*3),'LineWidth',1)
    fill([sim_time_BSA' fliplr(sim_time_BSA')], [Q_lo(1:length(sim_time_BSA)) fliplr(Q_hi(1:length(sim_time_BSA)))], ...
      color((i-1)*3+1:i*3), ...  %Keeping the color
     'FaceAlpha', 0.2, ...   % transparency (0 = invisible, 1 = opaque)
     'EdgeColor', 'none');   % no border
    if i ==3 
        text(1.1, 0.5, {["Small"],["Chi-PCL"] }, 'Units', 'normalized', 'FontWeight', 'Normal','FontSize',8)
    end
    axis([0,30,0,85])
    hold off
    
    %%
    % BSA - large chitosan-PCL
    sheet = 4;
    
    % Experimental data
    xlRange = 'O4:O30';
    exp_time_BSA = xlsread(filename,sheet,xlRange);
    
    xlRange = 'P4:P30';
    exp_rel_BSA = xlsread(filename,sheet,xlRange);
    
    xlRange = 'Q4:Q30';
    exp_stdv_BSA = xlsread(filename,sheet,xlRange);
    
    %tc=28d
    xlRange = 'I4:I424';
    sim_time_BSA = xlsread(filename,sheet,xlRange);
    
    xlRange = 'J4:J424';
    sim_results_average_BSA = xlsread(filename,sheet,xlRange);
    
    load(mat_files_large_chi_pcl(i))

    subplot(4,3,i+9)
    errorbar (exp_time_BSA,exp_rel_BSA,exp_stdv_BSA,'ko')
    hold on
    plot (sim_time_BSA,sim_results_average_BSA,':','Color',color((i-1)*3+1:i*3),'LineWidth',2)
    fill([sim_time_BSA' fliplr(sim_time_BSA')], [Q_lo(1:length(sim_time_BSA)) fliplr(Q_hi(1:length(sim_time_BSA)))], ...
      color((i-1)*3+1:i*3), ...  %Keeping the color
     'FaceAlpha', 0.2, ...   % transparency (0 = invisible, 1 = opaque)
     'EdgeColor', 'none');   % no border
    if i ==3 
        text(1.1, 0.5, {["Large"], ["Chi-PCL"]}, 'Units', 'normalized', 'FontWeight', 'Normal','FontSize',8)
    end
    axis([0,30,0,85])
    hold off
end

%%

% Common y-axis label
han = axes(fig, 'visible', 'off'); 
han.YLabel.Visible = 'on';
ylabel(han, 'Cumulative drug release (%)',"Position",[-0.03,0.5,1],'FontName','Arial','FontSize',8);

% Common x-axis label
han = axes(fig, 'visible', 'off'); 
han.XLabel.Visible = 'on';
xlabel(han, 'Time (days)','FontName','Arial','FontSize',8);


%%
widthInches = 6.5;
heightInches = 5;

run('ScriptForExportingImages.m')