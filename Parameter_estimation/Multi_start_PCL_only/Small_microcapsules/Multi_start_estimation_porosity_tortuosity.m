clear variables
clc
tic
%mphnavigator  %%With this you can find the specific handles or functions
%to call for what you need

%% Call the desired model
mphopen("Param_estim_porosity_tortuosity.mph")

%% Get LHS values

%The following values are acting as the upper limits for the parameter
%estimation.
porosity= 0.1; % dimensionless. Initial porosity
tortuosity = 10000; % dimensionless. Final porosity
params = [porosity, tortuosity];

n_restart = 50; %Number of initializations
num_estim_param = 2; %Number of estimated parameters

%This will help making sure we have a fair distribution between different
% orders of magnitude when using rand function ahead
ll = 0.01; %Lower limit guess for parameter estimation
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
model.physics('opt').feature('glsobj1').set('fileName', 'BSA_PCL_MCs_5.csv'); %Update file to read
model.study('std1').feature('opt').set('nsolvemax', '1000'); %Number of iterations
model.param.set('tc', '7 [d]'); %Update tc (tc=3d bevacizumab, tc = 7d BSA).
model.param.set('Dinner', '8.41e-7[cm^2/s]'); %Update depending on BSA or Bev
model.param.set('D_pcl', '8.41e-7[cm^2/s]');  %Update depending on BSA or Bev

storage = zeros(n_restart, num_estim_param+1);

for i=1:n_restart
    init_values = string(guess(i,:));
    model.study('std1').feature('opt').set('initval',...
    {char(init_values(1)),char(init_values(2))}); %porosity, tortuosity
    model.study('std1').run
    info = mphtable(model,'tbl6'); %Calling for objective table with results from param estimation
    for j=1:num_estim_param+1
        storage(i,j) = info.data(end,j);
    end
    save('OptimizationResults.mat','storage','guess')  %This saves the results after each iteration
end

toc
