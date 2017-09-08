function visualize_search(G,t,x,y)
% G is a graph or digraph object, and t is a table resulting from a call to
% BFSEARCH or DFSEARCH on that graph.
%
% Example inputs:
% g = digraph([1 2 3 3 3 3 4 5 6 7 8 9 9 9 10], [7 6 1 5 6 8 2 4 4 3 7 1 6 8 2]);
% t = dfsearch(g, 1, 'allevents', 'Restart', true);

% Copyright 1984-2015 The MathWorks, Inc.
% This is not my function! As you can see above, it was provided by
% Mathworks as a method of visualizing BFS and DFS. I modified it slightly
% to fit my needs

% Helpful rubric copied from the site:
%'startnode' - Starting nodes increase in size.
%'discovernode' - Nodes turn red as they are discovered.
%'finishnode' - Nodes turn black after they are finished.
%'edgetonew' - Edges that lead to undiscovered nodes turn blue.
%'edgetodiscovered' - Edges that lead to discovered nodes turn magenta.
%'edgetofinished' - Edges that lead to finished nodes turn green.


if isa(G,'graph')
    % Replace graph with corresponding digraph, because we need separate
    % edges for both directions
    G = digraph(adjacency(G));
end

h = plot(G,'NodeColor',[0.5 0.5 0.5],'EdgeColor',[0.5 0.5 0.5],'XData',x,'YData',y);

for ii=1:size(t,1)
    switch t.Event(ii)
        case 'startnode'
            highlight(h,t.Node(ii),'MarkerSize',min(h.MarkerSize)*2);
        case 'discovernode'
            highlight(h,t.Node(ii),'NodeColor','r');
        case 'finishnode'
            highlight(h,t.Node(ii),'NodeColor','k');
        case 'edgetonew'
            highlight(h,t.Edge(ii,1),t.Edge(ii,2),'EdgeColor','b');
        case 'edgetodiscovered'
            highlight(h,t.Edge(ii,1),t.Edge(ii,2),'EdgeColor',[0.8 0 0.8]);
        case 'edgetofinished'
            highlight(h,t.Edge(ii,1),t.Edge(ii,2),'EdgeColor',[0 0.8 0]);
    end
    
    disp('Strike any key to continue...')
    pause
end
disp('Done.')
close all