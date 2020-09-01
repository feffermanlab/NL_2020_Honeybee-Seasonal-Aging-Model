% This code changes the parameter of interest and calculates the new
% eigenvalue for each value of the parameter

%vector of values to change the variable by
x_vector = [-0.1, -0.09, -0.08, -0.07, -0.06, -0.05, -0.04, -0.03, -0.02, -0.01, 0.01, 0.02, 0.03, 0.04, 0.05, 0.06, 0.07, 0.08, 0.09, 0.1];
%vector to store the resulting eigenvalues
e_vector = zeros(1, length(x_vector));

%create empty matrix of zeros
LM = zeros(160, 160);
run('insertValues_v3_NLedit.m');

%initial eigen value
original_eig = eigs(LM, 1);

if strcmpi(variable, 'a')
       original_param = a ; 
    elseif strcmpi(variable, 'b')
       original_param = b ;
    elseif strcmpi(variable, 'l')
       original_param = l; 
    elseif strcmpi(variable, 'a_n')
       original_param = a_n;
    elseif strcmpi(variable, 'b_n')
       original_param = b_n;
    elseif strcmpi(variable, 'l_n')
       original_param = l_n;
end

    
for index = 1:20
    
    %change value of x
    x = x_vector(index);
    
    %change variable by x 
    if strcmpi(variable, 'a')
       a = a + (a * x); 
    elseif strcmpi(variable, 'b')
       b = b + (b * x);
    elseif strcmpi(variable, 'l')
       l = l + (l * x); 
    elseif strcmpi(variable, 'a_n')
       a_n = a_n + (a_n * x); 
    elseif strcmpi(variable, 'b_n')
       b_n = b_n + (b_n * x);    
    elseif strcmpi(variable, 'l_n')
       l_n = l_n + (l_n * x); 
    end
    
    run('insertValues_v3_NLedit.m');

    %run population projection

    %initial age distribution
    x0(1:160) = 94;
    x0 = x0';

    %initial age distribution placed into first column
    Xl = zeros(160, t);
    Xl(:,1) = x0;

    %calculate age distributions over t days
    for k = 2:t
    Xl(:,k) = LM*Xl(:,k-1);
    end

    %new eigen value
    n = eigs(LM, 1);
    
    %vector of range of values of variable
    if strcmpi(variable, 'a')
        x_vector(index) = a;
    elseif strcmpi(variable, 'b')
        x_vector(index) = b;
    elseif strcmpi(variable, 'l')
        x_vector(index) = l;
    elseif strcmpi(variable, 'a_n')
        x_vector(index) = a_n;
    elseif strcmpi(variable, 'b_n')
        x_vector(index) = b_n;
    elseif strcmpi(variable, 'l_n')
        x_vector(index) = l_n;
    end
    
    %vector of eigenvalues resulting from corresponding values of variable
    e_vector(index) = n;
end
