function [path] = fillSolutionPath_3D(edges, vertices)

    path = edges(end, 1);
    
    prev = edges(end, 2);
    
    ii = 0;
    [edgesCount, ~] = size(edges);
    
    while prev ~= 1
        if ii > edgesCount
            error('RRT: no path found :(');
        end
        prevIndex = find(edges(:, 1) == prev);
        prev = edges(prevIndex(1), 2);
        path = [path, prev];
        ii = ii + 1;
    end

end