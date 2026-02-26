clear variables
clc
tic
%mphnavigator  %%With this you can find the specific handles or functions
%to call for what you need

%% Call the desired model
mphopen("Uncertainty_Propagation_kcc.mph")

%Set up model parameters
timelist = linspace(0,420*86400,421)';
model.param.set('Dinner', '7.16e-7[cm^2/s]');
model.param.set('D_pcl', '7.16e-7[cm^2/s]');
model.param.set('tc', '28 [d]');
cumulrel_exp = '(burst+(100-burst)*(1-mass_drug1/mass_init1))';
n = 500; %Number of samples
cumul_rel = zeros(n,421);


% Means of the two parameters
mu = [9.85e-3, 3230];   % row vector of parameter means

% Covariance matrix (2x2) from your estimation
Sigma2 = [1.48e-7, 0.11714;
         0.11714, 1.434e5];


% Cholesky factorization
L = chol(Sigma2, 'lower');

% Draw standard normals
Z = randn(n, 2);

% Generate correlated samples
Theta = repmat(mu, n, 1) + Z * L';

% Theta is n x 2, each row is one joint sample of (param1, param2)

%sf
sf_mean = 5.62;
sf_stdv = 0.58;
sf_samples = normrnd(sf_mean, sf_stdv, [n, 1]);

%kc,C
kc_mean = 8.67e-11;
kc_stdv = 1.26e-11;
kc_samples = normrnd(kc_mean, kc_stdv, [n, 1]);

for i=1:n
    porosity = Theta(i,1);
    tortuosity = Theta(i,2);


    model.param.set('porosity', num2str(porosity));
    model.param.set('tau_final', num2str(tortuosity));
    model.param.set('sf', num2str(sf_samples(i)));
    model.param.set('kc', strcat(num2str(kc_samples(i)),'[m/s]'));
    model.study('std1').feature('time').set('tlist', timelist);
    model.study('std1').run
    cumul_rel(i,:) = mphglobal(model,cumulrel_exp);

end

%% Pointwise intervals
Q_med = median(cumul_rel, 1);              % 1 x n (central curve)
Q_lo  = prctile(cumul_rel, 2.5, 1);        % 1 x n (lower 95% PI bound)
Q_hi  = prctile(cumul_rel, 97.5, 1);       % 1 x n (upper 95% PI bound)
t=linspace(0,420,421);
plot(timelist, Q_med, 'k', timelist, Q_lo, '--r', timelist, Q_hi, '--r');
    
save('UQ_Bev_Large_Chi_PCL_10percent.mat','cumul_rel','Q_med','Q_lo','Q_hi','t')
