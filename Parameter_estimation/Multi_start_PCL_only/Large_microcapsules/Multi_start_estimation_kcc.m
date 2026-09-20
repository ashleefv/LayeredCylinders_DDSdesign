clear variables
clc
tic
%mphnavigator  %%With this you can find the specific handles or functions
%to call for what you need

%% Call the desired model
mphopen("Param_estim_kcc.mph")

%% Get LHS values

%The following values are acting as the upper limits for the parameter
%estimation.
kc = 1e-8; % dimensionless. Scaling factor
params =[kc];

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
model.physics('opt').feature('glsobj1').set('fileName', 'BSA_Chi_PCL_Big_MCs_10.csv'); %Update desired file name
model.study('std1').feature('opt').set('nsolvemax', '1000'); %Number of function evaluations
model.param.set('tc', '28 [d]'); %Critical time
model.param.set('porosity', '8.44e-3'); %Previously estimated porosity
model.param.set('tau_final', '450.5');  %Previously estimated tortuosity
model.param.set('sf', '19.5');          %Previously estimated scaling factor
model.param.set('Dinner', '8.41e-7[cm^2/s]');  %Diffusion coefficient of the drug at infinite dilution
model.param.set('D_pcl', '8.41e-7[cm^2/s]');   %Diffusion coefficient of the drug at infinite dilution


storage = zeros(n_restart, num_estim_param+1);

for i=1:n_restart
    init_values = string(guess(i,:));
    model.study('std1').feature('opt').set('initval',...
    {char(init_values(1))}); %scaling factor
    model.study('std1').feature('opt').set('optsolver', 'coordsearch');
    model.study('std1').run
    info = mphtable(model,'tbl11'); %Calling for objective table with results from param estimation
    for j=1:num_estim_param+1
        storage(i,j) = info.data(end,j);
    end
    save('OptimizationResults.mat','storage','guess')
end

toc
