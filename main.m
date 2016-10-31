clear all;

%%
% Declare and inicialize variables
%
% GLOBAL VARIABLES
% ================
% HRZN: planning horizon in year / maximum age for a motorcycle (states)
% DCSN: decision variable: {keep = 0, replace = 1}
% COST: price of a new motorcycle
% MNTC: maintenance price of a motorcycle x years old
% SELL: selling price of a motorcycle x years old
% FNix: function value memory at stage i, state x
% TRix: transaction memory at stage i, state x
% CHix: decision memory at stage i, state x (cube)
%
% LOCAL VARIABLES
% ===============
% PLAN: plan duration (stages)
global PLAN HRZN COST DCSN MNTC SELL FNix TRix CHix;

PLAN = 10;
HRZN = 7;

COST = 2250;
MNTC = [100 150 150 175 195 195 250];  
SELL = [1750 1550 1450 1200 1000 700 600];
DCSN = [0 1];

FNix = Inf(PLAN, HRZN);
FNix(PLAN,:) = MNTC + COST - SELL; % Boundary condition

CHix = NaN(PLAN, HRZN, 1 + length(DCSN));
CHix(PLAN,:, 1) = DCSN(2); % Always "replace" at last year

TRix = NaN(PLAN, HRZN);

%%
% Solve
rec_fun(1,1)    % calculate plan
plot_plan()     % plot optimal path

