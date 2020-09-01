%% Find elasticities for all seasons for parameters a, b, and l (forager parameters)

%% Find elasticity for variable a

variable = 'a';
run('eigenvalue_v3_NLalt.m')

elasticity_spring_a = elasticity_spring;
elasticity_summer_a = elasticity_summer;
elasticity_fall_a = elasticity_fall;
elasticity_winter_a = elasticity_winter;

%% Find elasticity for variable b

variable = 'b';
run('eigenvalue_v3_NLalt.m')

elasticity_spring_b = elasticity_spring;
elasticity_summer_b = elasticity_summer;
elasticity_fall_b = elasticity_fall;
elasticity_winter_b = elasticity_winter;

%% Find elasticity for variable l
variable = 'l';

run('eigenvalue_v3_NLalt.m')

elasticity_spring_l = elasticity_spring;
elasticity_summer_l = elasticity_summer;
elasticity_fall_l = elasticity_fall;
elasticity_winter_l = elasticity_winter;
