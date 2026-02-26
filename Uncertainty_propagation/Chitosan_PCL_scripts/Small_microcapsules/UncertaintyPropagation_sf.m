clear variables
clc
tic
%mphnavigator  %%With this you can find the specific handles or functions
%to call for what you need

%% Call the desired model
mphopen("Uncertainty_Propagation_sf.mph")

%Set up model parameters
timelist = linspace(0,252*86400,253)';
model.param.set('Dinner', '8.41e-7[cm^2/s]');
model.param.set('D_pcl', '8.41e-7[cm^2/s]');
model.param.set('tc', '7 [d]');
cumulrel_exp = '(burst+(100-burst)*(1-mass_drug1/mass_init1))';
n = 500; %Number of samples
cumul_rel = zeros(n,253);


% Means of the two parameters
mu = [8.14e-3, 968.5];   % row vector of parameter means

% Covariance matrix (2x2) from your estimation
Sigma2 = [2.01e-7, 0.0674;
         0.0674, 50563];


% Cholesky factorization
L = chol(Sigma2, 'lower');

% Draw standard normals
Z = randn(n, 2);

% Generate correlated samples
Theta = repmat(mu, n, 1) + Z * L';

% Theta is n x 2, each row is one joint sample of (param1, param2)

%sf
sf_mean = 7.85;
sf_stdv = 0.76;
sf_samples = normrnd(sf_mean, sf_stdv, [n, 1]);

for i=1:n
    porosity = Theta(i,1);
    tortuosity = Theta(i,2);


    model.param.set('porosity', num2str(porosity));
    model.param.set('tau_final', num2str(tortuosity));
    model.param.set('sf', strcat(num2str(sf_samples(i))));
    model.study('std1').feature('time').set('tlist', timelist);
    model.study('std1').run
    cumul_rel(i,:) = mphglobal(model,cumulrel_exp);

end

%% Pointwise intervals
Q_med = median(cumul_rel, 1);              % 1 x n (central curve)
Q_lo  = prctile(cumul_rel, 2.5, 1);        % 1 x n (lower 95% PI bound)
Q_hi  = prctile(cumul_rel, 97.5, 1);       % 1 x n (upper 95% PI bound)
t=linspace(0,252,253);
plot(timelist, Q_med, 'k', timelist, Q_lo, '--r', timelist, Q_hi, '--r');
    
save('UQ_BSA_Small_Chi_PCL_7_5percent.mat','cumul_rel','Q_med','Q_lo','Q_hi','t')
