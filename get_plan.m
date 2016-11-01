%%
% Get optimal plan
% returns: the optimal plan as a ordinal array
function y = get_plan()
    global HRZN TRix CHix;
    
    optimal = -ones(1,HRZN);        % initialize plan
    x = 1;
    for i=1:HRZN
        optimal(i) = CHix(i,x);     % store current optimal decision
        x = TRix(i,x);              % get next state
    end
    y=ordinal(optimal,{'keep';'replace'});
end

