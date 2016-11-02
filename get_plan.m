%%
% Get optimal plan
% returns: the optimal plan as a ordinal array
function y = get_plan()
    global HRZN CHix;
    
    optimal = NaN(1,HRZN);          % initialize plan
    x = 1;
    for i=1:HRZN
        optimal(i) = CHix(i,x);     % store current optimal decision
        d = 1 - CHix(i,x);
        x = x^d + d;                % get next state
    end
    y = ordinal(optimal,{'keep';'replace'});
end

