%%
% Get optimal plan
% returns: the optimal plan as a ordinal array
function y = get_plan()
    global HRZN TRix CHix;
    optimal = ones(1,HRZN);
    x = 1;
    for i=1:HRZN
        optimal(i) = CHix(i,x);
        x = TRix(i,x);
    end
    y=ordinal(optimal,{'keep';'replace'});
end

