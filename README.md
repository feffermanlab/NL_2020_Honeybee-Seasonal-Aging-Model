# honeybee_seasonal_aging_model

This repository contains the Matlab code associated with the manuscript, "The sensitivity of a honeybee colony to worker mortality depends on season and resource availability."


List of code files and their dependencies:
1. 'graphresults_matrixbeemodel_foragers.m' - depends on 'elasticityallseasons.m'
2. 'graphresults_matrixbeemodel_nurses.m' - depends on 'elasticityallseasons_nurses.m'
3. 'elasticityallseasons.m' - depends on 'eigenvalue_v3_NLalt.m'
4. 'elasticityallseasons_nurses.m' - depends on 'eigenvalue_v3_NLalt_nurses.m'
5. 'eigenvalue_v3_NLalt.m' - depends on 'eigenvalueHelper_NLedit.m', 'spring_setValues.m', 'summer_setValues.m', 'fall_setValues.m', 'winter_setValues.m'
6. 'eigenvalue_v3_NLalt_nurses.m' - depends on 'eigenvalueHelper_NLedit_nurse.m', 'spring_setValues.m', 'summer_setValues.m', 'fall_setValues.m', 'winter_setValues.m'
7. 'eigenvalueHelper_NLedit.m'
8. 'eigenvalueHelper_NLedit_nurse.m'
9. 'spring_setValues.m'
10. 'summer_setValues.m'
11. 'fall_setValues.m'
12. 'winter_setValues.m'
