%% Find elasticities for all seasons for parameters a_n, b_n, and l_n (nurse parameters)

%% Find elasticity for variable a_n

variable = 'a_n';
run('eigenvalue_v3_NLalt_nurses.m')

elasticity_spring_a = elasticity_spring;
elasticity_summer_a = elasticity_summer;
elasticity_fall_a = elasticity_fall;
elasticity_winter_a = elasticity_winter;

%% Find elasticity for variable b_n

variable = 'b_n';
run('eigenvalue_v3_NLalt_nurses.m')

elasticity_spring_b = elasticity_spring;
elasticity_summer_b = elasticity_summer;
elasticity_fall_b = elasticity_fall;
elasticity_winter_b = elasticity_winter;

%% Find elasticity for variable l_n
variable = 'l_n';

run('eigenvalue_v3_NLalt_nurses.m')

elasticity_spring_l = elasticity_spring;
elasticity_summer_l = elasticity_summer;
elasticity_fall_l = elasticity_fall;
elasticity_winter_l = elasticity_winter;
