%%
% Recursive function
% i: integer {1,2,3,4,5,6,7,8,9,10} (stage)
% x: integer {1,2,3,4,5,6,7} (state)
% returns: minimum value to spend to have a motorcycle all the time, for a
% period from year i up to year 10, retaining the same motorcycle for at
% most 7 years
function y = rec_fun(i, x)
    % global COST SELL;
    global LIFE DCSN MNTC RESV FNix CHix;
    
    y = FNix(i, x); % retrieve previous value
    if(y ~= Inf)
        return; % computed
    end
    % DEBUG
    % sprintf('f%d(%d)\n',i,x)
    
    replace = RESV(x) + rec_fun(i+1, 1);
    % DEBUG:
    % sprintf('M(%d)+C-S(%d)+f%d(1)=%d+%d-%d+%d=%d\n',...
    %         x,x,i+1,MNTC(x),COST,SELL(x),FNix(i+1,1),MNTC(x)+replace)
    if(x == LIFE)
        keep = Inf; % Must sell
    else
        keep = rec_fun(i+1, x+1);
        % DEBUG:
        % sprintf('M(%d)+f%d(%d)=%d+%d=%d\n',...
        %         x,i+1,x+1,MNTC(x),FNix(i+1,x+1),MNTC(x)+keep)
    end
    
    value = min(keep, replace);
    if(value == keep)
        choice = DCSN(1);
    else
        choice = DCSN(2);
    end
    
    y = MNTC(x) + value;
    FNix(i,x) = y;                      % store for later use
    CHix(i,x) = choice;                 % store for later use
end