%% Run a sensitivity analysis to see how changing brood survival in winter affects results
% Run the elasticity analysis for the "Winter" parameters, but with various
% values for Sb (brood survival) to see if it affects conclusions
figpath = 'D:/natal/D_Documents/Chapter 1 Honeybee aging elasticity analysis/Figures/';
sb_vals = [0.65,0.7,0.75,0.8,0.85,0.9,0.95,0.993];

%% Winter conditions, forager and nurse senescence parameters
% changes the senescence parameter a and calculates the new
% eigenvalue for each value of the parameter
seasonFile = 'winter_setValues.m';
run(seasonFile);

params = ["a","b","l","a_n","b_n","l_n"];
elasticities_winter = zeros(length(params),length(sb_vals));

% for all forager mortality parameters and all values of Sb, find the associated elasticity
for ind = 1:length(params)
    variable = params(ind);
    disp(variable)
    for j = 1:length(sb_vals)
       sb = sb_vals(j);
       disp(sb)
       % find new eigenvalue for every value of parameter a, b, or l
       run('eigenvalueHelper_NLedit.m');
       % linear regression to find elasticity for variable a
       X = [ones(length(x_vector), 1) x_vector'];
       sen = X\e_vector';
       yCalc = X*sen;
       sensitivity_winter = abs(sen(2));
       % elasticity_winter gives the elasticity of parameter in winter
       elasticity_winter = sensitivity_winter * (original_param / original_eig);
       elasticities_winter(ind,j) = elasticity_winter;
    end
end
elasticities_winter_a   = elasticities_winter(1,:); % forager initial mortality
elasticities_winter_b   = elasticities_winter(2,:); % forager age based increase in mortality
elasticities_winter_l   = elasticities_winter(3,:); % forager extrinsic mortality
elasticities_winter_a_n = elasticities_winter(4,:); % nurse initial mortality
elasticities_winter_b_n = elasticities_winter(5,:); % nurse age based increase in mortality
elasticities_winter_l_n = elasticities_winter(6,:); % nurse extrinsic mortality

%% Plot elasticity as a function of brood survival (Sb)
color = [[0, 0.4470, 0.7410]; [0.8500, 0.3250, 0.0980]; [0.9290, 0.6940, 0.1250]];

% elasticity to forager senescence parameters
hold on
plot(sb_vals, elasticities_winter_a, '-o');
plot(sb_vals, elasticities_winter_b, '--s');
plot(sb_vals, elasticities_winter_l, '-.^');
ylabel('Elasticity of Colony Growth Rate','FontSize',12);
xlabel('Brood Survival (S_b)','FontSize',12);
ylim([-0.05,0.6]);
legend('Initial age-dependent forager mortality (\alpha_f)','Age-dependent increase in forager mortality (\beta_f)','Age-independent forager mortality (\gamma_f)','Location','northeast');
title('Elasticity to Winter Forager Mortality as Function of Brood Survival')
saveas(gcf,[figpath,'Figure4BMC'],'png');

%% elasticity to nurse senescence parameters
hold on
plot(sb_vals, elasticities_winter_a_n, '-o', 'MarkerFaceColor', color(1,:));
plot(sb_vals, elasticities_winter_b_n, '--s', 'MarkerFaceColor', color(2,:));
plot(sb_vals, elasticities_winter_l_n, '-.^', 'MarkerFaceColor', color(3,:));
ylabel('Elasticity of Colony Growth Rate','FontSize',12);
xlabel('Brood Survival (S_b)','FontSize',12);
ylim([-0.01,0.15]);
legend('Initial age-dependent nurse mortality (\alpha_n)',...
    'Age-dependent increase in nurse mortality (\beta_n)',...
    'Age-independent forager mortality (\gamma_n)',...
    'Location','northeast');
title('Elasticity to Winter Nurse Mortality as Function of Brood Survival')
saveas(gcf,[figpath,'Figure3BMC'],'png');
