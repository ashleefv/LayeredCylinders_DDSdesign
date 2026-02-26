clear variables
clc

%% Setting up values for chitosan-PCL with LHS thicknesses and PCL_fractions for 5% salt leaching
filename{1} = 'LHS_results_5_percent.xlsx';
saltleaching{1} = 5;

%% Setting up values for chitosan-PCL with LHS thicknesses and PCL_fractions for 5% salt leaching
filename{2} = 'LHS_results_7_5_percent.xlsx';
saltleaching{2} = 7.5;

%% Setting up values for GP-suggested chitosan-PCL designs for 5% salt leaching
filename{3} = 'Proposed_by_GP_5_salt_leaching.xlsx';
saltleaching{3} = 5;

%% Setting up values for GP-suggested chitosan-PCL designs for 5% salt leaching
filename{4} = 'Proposed_by_GP_7_5_salt_leaching';
saltleaching{4} = 7.5;
plotyes = 'no';


%Initializing table
T = table([], [], [], [], [], [], [], [], [], [],[], ...
    'VariableNames', {'Salt_percentage','R_core_mm','Polymer_thickness_mm', ...
                      'PCL_fraction','Chi_fraction','a','b','c','d','t_cross_days','dataset'});
R_max = 0.23; %mm
threshold = 0.9; %ug/d


for spreadsheetNumber = 1:length(saltleaching)
    
    %Read info from the datasheets
    file = filename{spreadsheetNumber};
    [~, sheets] = xlsfinfo(file);   % returns sheet names
    tables = cell(numel(sheets), spreadsheetNumber);
    
    if spreadsheetNumber == 1
        fittingoutput = cell(numel(sheets), spreadsheetNumber,2); % to save f and gof for each fit
    end
    
    for k = 1:numel(sheets)
        tables{k,spreadsheetNumber} = readtable(file, 'Sheet', sheets{k});
    end
    
    for i = 1:numel(sheets)
        
        x = tables{i,spreadsheetNumber}.Time_days;
        y = tables{i,spreadsheetNumber}.RelRate_ug_per_day;
    
        x = x(28:end);
        y = y(28:end);
    
        if i == 3 && spreadsheetNumber==3
            t_cross_days = 219;
        else
            [f, gof] = fit(x, y, 'exp2');
            coeffs = coeffvalues(f);
            fittingoutput{i,spreadsheetNumber,1} = f;
            fittingoutput{i,spreadsheetNumber,2} = gof;
        
            % Define the equation f(t) - threshold = 0
            g = @(t) f(t) - threshold;
            
            % Choose a reasonable initial guess (e.g., median of your x-range)
            t_guess = median(x);
            
            % Solve for t
            t_cross_days = fzero(g, t_guess);
        
            % Fix invalid outputs
            if isnan(t_cross_days) || t_cross_days < 0
                t_cross_days = 0;
            end
        end
    
        %Create a new table for storing data
        if spreadsheetNumber <= 2            
            Polymer_thickness_mm = str2double(extractBetween(sheets{1,i}, '=', 'mm'));  
            dataset = 1;  
        else
           Polymer_thickness_mm = tables{i,spreadsheetNumber}.Polymer_thickness(1);
           dataset = tables{i,spreadsheetNumber}.dataset(1);
        end
        
        Salt_percentage = saltleaching{spreadsheetNumber};
        R_core_mm = R_max-Polymer_thickness_mm;
        PCL_fraction = tables{i,spreadsheetNumber}.PCL_fraction(1);
        Chi_fraction = 1-PCL_fraction;
        a = coeffs(1);
        b = coeffs(2);
        c = coeffs(3);
        d = coeffs(4);

        % Create a row table
        newRow = table(Salt_percentage, R_core_mm, Polymer_thickness_mm, ...
                       PCL_fraction, Chi_fraction, a, b, c, d,t_cross_days,dataset);
    
        % Append it
        T = [T; newRow];
    
    end
end

% Display the table
disp(T)
max(T.t_cross_days)

rowsToKeep = T.Salt_percentage == 5;
T_5 = T(rowsToKeep, :);

figure()
plot(T_5.PCL_fraction, T_5.Polymer_thickness_mm,'o')


rowsToKeep = T.Salt_percentage == 7.5;
T_7_5 = T(rowsToKeep, :);

figure()
plot(T_7_5.PCL_fraction, T_7_5.Polymer_thickness_mm,'o')
xlabel('PCL fraction')
ylabel('Polymer thickness (mm)')

% export T as csv for B.O. in Python
writetable(T, 'DataSheetForBO.csv');