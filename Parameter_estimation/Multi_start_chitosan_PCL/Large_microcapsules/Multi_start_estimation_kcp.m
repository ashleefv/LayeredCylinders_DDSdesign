clear variables
clc
tic
%mphnavigator  %%With this you can find the specific handles or functions
%to call for what you need

%% Call the desired model
mphopen("Param_estim_kcp.mph")

%% Get LHS values

%The following values are acting as the upper limits for the parameter
%estimation.
kc= 1e-8; % dimensionless. Initial porosity
params = [kc];

n_restart = 50; %Number of initializations
num_estim_param = 1; %Number of estimated parameters

%This will help making sure we have a fair distribution between different
% orders of magnitude when using rand function ahead
ll = 0.0001; %Lower limit guess for parameter estimation
ul = 1; %Upper limit guess for parameter estimation
log_ll = log10(ll);
log_ul = log10(ul);


guess = lhsdesign(n_restart,num_estim_param); %Applying latin hypercube sampling for initial guesses
for i=1:num_estim_param
    for j=1:n_restart
            guess(j,i) = 10^(log_ll + (log_ul-log_ll) * guess(j,i))*params(i);
    end
end

%Set up parameters
model.physics('opt').feature('glsobj1').set('fileName', 'Bev_PCL_Big_MCs_10.csv'); %Csv file of interest
model.study('std1').feature('opt').set('nsolvemax', '1000');
model.param.set('Dinner', '7.16e-7[cm^2/s]'); %Update depending on BSA or Bev diffusion coefficient
model.param.set('D_pcl', '7.16e-7[cm^2/s]');  %Update depending on BSA or Bev diffusion coefficient
model.param.set('tc', '28 [d]');              %Update the critical time
model.param.set('porosity', '9.85e-3');       %Update the porosity depending on the formulation
model.param.set('tau_final', '3230');         %Update the tortuosity depending on the formulation
timelist = linspace(0,252*86400,253)';        %Update the timelist (420 days for BSA and 252 for bevacizumab)
model.study('std1').feature('time').set('tlist', timelist);


storage = zeros(n_restart, num_estim_param+1);

for i=1:n_restart
    init_values = string(guess(i,:));
    init_values(1) = init_values(1) + '[m/s]';
    model.study('std1').feature('opt').set('initval',...
    {char(init_values(1))}); %mass transfer rate
    model.study('std1').run
    info = mphtable(model,'tbl6'); %Calling for objective table with results from param estimation
    for j=1:num_estim_param+1
        storage(i,j) = info.data(end,j);
    end
    save('OptimizationResults.mat','storage','guess')
end

toc
