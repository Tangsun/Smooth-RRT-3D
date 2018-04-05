function [q_near, qNearIndex] = findQNear_3D(q_rand, vertices)

    [rowCount, ~] = size(vertices);
    
    if rowCount < 1
        error('RRT: solution not found :(');
    end
    
    euclideanDistances = double.empty(0, 1);
    
    for ii = 1 : rowCount
        euclideanDistances(ii, 1) = pdist2(double(q_rand), double(vertices(ii, :)), 'euclidean');
    end
    
    minDistanceIndex = find(euclideanDistances == min(euclideanDistances));
    
    q_near = vertices(minDistanceIndex(1), :);
    
    qNearIndex = minDistanceIndex(1);

end