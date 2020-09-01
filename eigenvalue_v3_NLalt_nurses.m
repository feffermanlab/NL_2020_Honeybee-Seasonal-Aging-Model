%% runs perterbation analysis (eigenvaluehelper) 
% uses linear regression to calculate elasticity for each of 4 seasons
% Version that analyses nurse parameters
% Changed instead of while statement


%% Spring

seasonFile = 'spring_setValues.m';
run('eigenvalueHelper_NLedit_nurse.m');   % this code finds the new eigenvalue for every value of nurse param of interest

%rename e_vector so it can be accessed after code is run
spring_e_vector = e_vector; %vector containing eigenvalues

%calculate linear regression
X = [ones(length(x_vector), 1) x_vector'];
sen = X\e_vector';
yCalc = X*sen;

%calculate elasticity of the eigenvalue to the variable
sensitivity_spring = abs(sen(2));
elasticity_spring = sensitivity_spring * (original_param / original_eig);


% figure(1);
% subplot(4, 1, 1);
% scatter(x_vector, e_vector)
% hold on
% plot(x_vector', yCalc)
% %ylim([0.8, 1.2])
% title('Spring: B vs Eigenvalue');
% xlabel('b');
% ylabel('Eigenvalue');

%% Summer

seasonFile = 'summer_setValues.m';
run('eigenvalueHelper_NLedit_nurse.m');

%rename e_vector so it can be accessed after code is run
summer_e_vector = e_vector;

%calculate linear regression
X = [ones(length(x_vector), 1) x_vector'];
sen = X\e_vector';
yCalc = X*sen;

%calculate elasticity of the eigenvalue to the variable
sensitivity_summer = abs(sen(2));
elasticity_summer = sensitivity_summer * (original_param / original_eig);

% figure(1);
% subplot(4, 1, 2);
% scatter(x_vector, e_vector)
% hold on
% plot(x_vector', yCalc)
% %ylim([0.8, 1.2])
% title('Summer: B vs Eigenvalue');
% xlabel('b');
% ylabel('Eigenvalue');

%% Fall

seasonFile = 'fall_setValues.m';
run('eigenvalueHelper_NLedit_nurse.m');

%rename e_vector so it can be accessed after code is run
fall_e_vector = e_vector;

%calculate linear regression
X = [ones(length(x_vector), 1) x_vector'];
sen = X\e_vector';
yCalc = X*sen;

%calculate elasticity of the eigenvalue to the variable
sensitivity_fall = abs(sen(2));
elasticity_fall = sensitivity_fall * (original_param / original_eig);

% figure(1);
% subplot(4, 1, 3);
% scatter(x_vector, e_vector)
% hold on
% plot(x_vector', yCalc)
% %ylim([0.8, 1.2])
% title('Fall: B vs Eigenvalue');
% xlabel('b');
% ylabel('Eigenvalue');

%% Winter

seasonFile = 'winter_setValues.m';
run('eigenvalueHelper_NLedit_nurse.m');

%rename e_vector so it can be accessed after code is run
winter_e_vector = e_vector;

%calculate linear regression
X = [ones(length(x_vector), 1) x_vector'];
sen = X\e_vector';
yCalc = X*sen;

%calculate elasticity of the eigenvalue to the variable
sensitivity_winter = abs(sen(2));
elasticity_winter = sensitivity_winter * (original_param / original_eig);

% figure(1);
% subplot(4, 1, 4);
% scatter(x_vector, e_vector)
% hold on
% plot(x_vector', yCalc)
% %ylim([0.8, 1.2])
% title('Winter: B vs Eigenvalue');
% xlabel('b');
% ylabel('Eigenvalue');
% 
% savefig('eigenvalueB');

