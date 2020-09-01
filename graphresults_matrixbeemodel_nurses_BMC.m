%% Run elasticity analysis for nurse mortality parameters and graph results
clear

%% Run sensitivity analyses
% run('eigenvalueL_2.m');
% run('eigenvalueA_2.m');
% run('eigenvalueB_2.m');
figpath = 'D:/natal/D_Documents/Chapter 1 Honeybee aging elasticity analysis/Figures/';
run('elasticityallseasons_nurses.m'); % find elasticity values for params a_n, b_n, and l_n for spring, summer, fall and winter


%% Graphs of elasticity for three seasons and three nurse params

% fall/spring are combined because they are the same parameters

% bar graphs of the elasticity values of gamma (l) in the four seasons
elast_gamma = [elasticity_spring_l, elasticity_summer_l, elasticity_winter_l];
seasons = {'Spring/Fall','Summer','Winter'};
fig1 = bar(elast_gamma);
set(gca, 'XTick', 1:3, 'XTickLabel', seasons,'FontSize',22);
title('Elasticity to nurse extrinsic mortality','FontSize',24);
ylabel('Elasticity','FontSize',22);
% xlabel('Season');
%ylim([0,.18]);
saveas(fig1, 'Figure1_talk.png');

%% bar graphs of the elasticity values of alpha/a in the four seasons
elast_alpha = [elasticity_spring_a, elasticity_summer_a, elasticity_winter_a];
seasons = {'Spring/Fall','Summer','Winter'};
fig2 = bar(elast_alpha);
set(gca, 'XTick', 1:3, 'XTickLabel', seasons,'FontSize',22);
title('Elasticity to nurse initial mortality','FontSize',24);
ylabel('Elasticity','FontSize',22);
% xlabel('Season');
%ylim([0,.18]);
saveas(fig2, 'Figure2_talk.png');

%% bar graphs of the Elasticity values of beta in the four seasons
elast_beta = [elasticity_spring_b, elasticity_summer_b, elasticity_winter_b];
seasons = {'Spring/Fall','Summer','Winter'};
fig3 = bar(elast_beta);
set(gca, 'XTick', 1:3, 'XTickLabel', seasons,'FontSize',22);
title('Elasticity to nurse senescent mortality','FontSize',24);
ylabel('Elasticity','FontSize',22);
% xlabel('Season');
%ylim([0,.18]);
saveas(fig3, 'Figure3_talk.png');

%% combined bar graph of elasticity values of alpha, beta, and gamma
elast = [elast_alpha;elast_beta;elast_gamma];
elast = elast';
fig8 = bar(elast);
set(gca, 'XTick', 1:4, 'XTickLabel', seasons,'FontSize',12);
title('Elasticity of colony growth to age-dependent and age-independent nurse mortality','FontSize',14);
set(gca,'Units','normalized')
titleHandle = get( gca ,'Title' );
pos  = get( titleHandle , 'position' );
pos1 = pos + [0 0.001 0] ;
set( titleHandle , 'position' , pos1 );
ylabel('Elasticity','FontSize',12);
%xlabel('Season','FontSize',12);
legend('Initial age-dependent nurse mortality (\alpha_n)',...
    'Age-dependent increase in nurse mortality (\beta_n)',...
    'Age-independent nurse mortality (\gamma_n)',...
    'Location','northwest');
set(gcf,'units','points','position',[1,1,590,350])
saveas(gcf,[figpath,'Figure1BMC'],'png');

%% Make a table of elasticity values for nurse params

% Rows = {'Spring/Fall';'Summer';'Winter'};
% Columns = {'alpha','beta','gamma'};
% Table2 = table(elast_alpha',elast_beta',elast_gamma','RowNames',Rows,'VariableNames',Columns);
