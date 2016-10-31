%%
% Plot the graph, highlight chosen path
% returns: nothing
function plot_plan()
    global PLAN HRZN TRix;
    
    % get ordinate's matrix and transpose it
    i = 1; x = 1;
    g = transpose(gen_graph(i, x , [], []));
    
    % plot graph
    figure
    p1 = plot(g,'o-k','MarkerSize',10, 'MarkerFaceColor', [0.5 0.5 0.5]);
    hold on
    set(gcf,'color','w')
    set(gca,'color',[0.95 0.95 0.95])
    
    % plot optimal path
    opt = ones(PLAN, 1);
    for i=1:PLAN-1
        newX = TRix(i,x);
        opt(i+1) = newX;
        x = newX;
    end
    p2 = plot(opt, 'o-k', 'Color', 'r','LineWidth', 2, ...
              'MarkerSize', 10, 'MarkerFaceColor', 'r',...
              'MarkerEdgeColor', 'k');
    hold off
 
    % set axis intervals and ticks
    axis([0,PLAN+1,0,HRZN+1])
    
    % set title and axix labels
    title('Plans', 'FontSize', 16, 'FontWeight','bold')
    xlabel('Years (stages)', 'FontSize', 12, 'FontWeight','bold')
    ylabel('Motorcycle Age (states)', 'FontSize', 12, 'FontWeight','bold')
    legend([p1(1) p2],{'possible','optimal'},'Location','northwest')
end

%%
% Generate the graph
% xx: X-axis values (stages)
% yy: Y-axis values (states)
% path: the path known so far (cumulative)
% graph: the graph known so far (cumulative)
% returns: a matrix with the YYs (ordinates) for the absissa (column index)
function g = gen_graph(xx, yy, path, graph)
    global PLAN HRZN;
    
    if PLAN < xx
        g = [graph; path];
        return;
    end
    
    if yy < HRZN
        % DEBUG
        % g0 = gen_graph(xx+1, yy+1, [path [xx yy]], graph)
        g0 = gen_graph(xx+1, yy+1, [path yy], graph);
    else
        g0 = [];
    end
    % DEBUG
    % g1 = gen_graph(xxi+1, 1, [path [xx yy]], graph)
    g1 = gen_graph(xx+1, 1, [path yy], graph);
    
    g = [graph;unique([g0;g1],'rows','stable')];
end