%% Run elasticity analysis for forager mortality parameters and graph results

%% Run sensitivity analyses
% run('eigenvalueL_2.m');
% run('eigenvalueA_2.m');
% run('eigenvalueB_2.m');
figpath = '/Figures/';
run('elasticityallseasons_foragers.m'); % find elasticity values for params a, b, and l for spring, summer, fall and winter


%% Graphs of elasticity for three seasons and three forager params

% fall/spring are combined because they are the same parameters

% bar graphs of the elasticity values of gamma (l) in the four seasons
elast_gamma = [elasticity_spring_l, elasticity_summer_l, elasticity_winter_l];
seasons = {'Spring/Fall','Summer','Winter'};
fig4 = bar(elast_gamma);
set(gca, 'XTick', 1:3, 'XTickLabel', seasons,'FontSize',22);
title('Elasticity to forager extrinsic mortality','FontSize',24);
ylabel('Elasticity','FontSize',22);
%xlabel('Season');
%ylim([0,.18]);
% fig = gcf;
% set(fig,'PaperUnits','inches');
% set(fig,'PaperPosition',[0 0 4.5 4.5]);
saveas(fig4, 'Figure4_talk.png');

%% bar graphs of the elasticity values of alpha/a in the four seasons
elast_alpha = [elasticity_spring_a, elasticity_summer_a, elasticity_winter_a];
seasons = {'Spring/Fall','Summer','Winter'};
fig5 = bar(elast_alpha);
set(gca, 'XTick', 1:3, 'XTickLabel', seasons,'FontSize',22);
title('Elasticity to forager initial mortality','FontSize',24);
ylabel('Elasticity','FontSize',22);
% xlabel('Season');
%ylim([0,.18]);
saveas(fig5, 'Figure5_talk.png');

%% bar graphs of the Elasticity values of beta in the four seasons
elast_beta = [elasticity_spring_b, elasticity_summer_b, elasticity_winter_b];
seasons = {'Spring/Fall','Summer','Winter'};
fig6 = bar(elast_beta);
set(gca, 'XTick', 1:3, 'XTickLabel', seasons,'FontSize',22);
title('Elasticity to forager senescent mortality','FontSize',24);
ylabel('Elasticity','FontSize',22);
% xlabel('Season');
%ylim([0,.18]);
saveas(fig6, 'Figure6_talk.png');

%% combined bar graph of elasticity values of alpha, beta, and gamma
elast = [elast_alpha;elast_beta;elast_gamma];
elast = elast';
fig7 = bar(elast);
set(gca, 'XTick', 1:4, 'XTickLabel', seasons,'FontSize',12);
title('Elasticity of colony growth to age-dependent and age-independent forager mortality','FontSize',14);
set(gca,'Units','normalized')
titleHandle = get( gca ,'Title' );
pos  = get( titleHandle , 'position' );
pos1 = pos + [0 0.001 0] ;
set( titleHandle , 'position' , pos1 );
ylabel('Elasticity','FontSize',12);
%xlabel('Season');
legend('Initial age-dependent forager mortality (\alpha_f)',...
    'Age-dependent increase in forager mortality (\beta_f)',...
    'Age-independent forager mortality (\gamma_f)',...
    'Location','northwest');
set(gcf,'units','points','position',[5,1,590,350])
saveas(gcf,[figpath,'Figure2BMC'],'png');

%% Make a table

% Rows = {'Spring/Fall';'Summer';'Winter'};
% Columns = {'alpha','beta','gamma'};
% Table3 = table(elast_alpha',elast_beta',elast_gamma','RowNames',Rows,'VariableNames',Columns);
