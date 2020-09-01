%% Insert Values

% Create a leslie matrix called LM by inserting survival and fecundity
% values
%% Brood

%brood provisioned per forager
% foragers are in columns 142-160
LM(1, (142:end)) = f;

%brood survival rate inserted into matrix subdiagonals columns 1-21
for i=1:20
    LM(i+1, i) = sb;
end

%% Nurse

%nurse age dependent mortality rates, changed so script goes from 1:120
N = zeros(1, 120);
for i=1:120
    N(i) = min( 1, (a_n * exp(b_n * i) + l_n)); %N(i) is mortality rate of i day old nurse
end

%brood becoming 1 day old nurses after 21 days as brood
LM(22,21) = sb;
%probability of an individual not dying AND not becoming a forager = prob
%of moving to next nurse age class
for i=1:119
    LM(i+22,i+21) = (1-g)*(1-N(i));
end


%% Forager

% nurse to forager "conversion" rate, number of new foragers is prob of nurse day i
% surviving, times prob of becoming a forager
for i=1:120
   LM(142, (21+i) ) = g*(1-N(i));
end

%forager age dependent mortality rates
% 19 forager age classes
M = zeros(1, 19);
for i=1:19
    M(i) = min( 1, (a * exp(b * i) +l));    
end

%forager survival rates
for i = 1:18
    LM(i+142,i+141) = 1-M(i);
end
    LM(160, 160) = 1-M(19);
