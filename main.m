clear all;

%%
% Declare global variables
%
% GLOBAL VARIABLES
% ================
% HRZN: plan duration (stages)
% LIFE: expected service life in year/maximum age for a motorcycle (states)
% DCSN: decision variable: {keep = 0, replace = 1}
% COST: price of a new motorcycle
% MNTC: maintenance price of a motorcycle x years old
% SELL: selling price of a motorcycle x years old
% FNix: function value memory at stage i, state x
% TRix: transaction memory at stage i, state x
% CHix: decision memory at stage i, state x (cube)
global HRZN LIFE DCSN MNTC RESV FNix TRix CHix;

HRZN = 10;
LIFE = 7;
DCSN = [0 1]; % {0=keep, 1=replace}
 
COST = 2250;
MNTC = [100 150 150 175 195 195 250];  
SELL = [1750 1550 1450 1200 1000 700 600];
RESV = COST - SELL;

FNix = Inf(HRZN, LIFE);
FNix(HRZN,:) = MNTC + COST - SELL; % Boundary condition

CHix = NaN(HRZN, LIFE);
CHix(HRZN,:) = DCSN(2); % Always "replace" at last year

TRix = NaN(HRZN, LIFE);

%%
% Solve problem
rec_fun(1,1)    % calculate plan
get_plan()      % determine optimal path
plot_plan();    % plot optimal path

