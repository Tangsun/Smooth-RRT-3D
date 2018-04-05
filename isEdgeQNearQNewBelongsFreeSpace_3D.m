function [isBelongsFreeSpace] = isEdgeQNearQNewBelongsFreeSpace_3D(map, q_near, q_new)
    
    % In order to check if an edge belongs to the free space,
    % use the incremental (left) or subdivision (right) strategies.
    % You can use 10 intermediate points.
    intermediatePointCount = 2;
    
    v = double(q_new - q_near);
    
    distance = norm(v);
    
    u = v / distance;
    
    delta_q = distance / intermediatePointCount;
    
    currentCoordinate = double(q_near);
    
    for ii = 1 : intermediatePointCount
        
        currentCoordinate = currentCoordinate + (delta_q * u);
        
        if map(int32(currentCoordinate(1)), int32(currentCoordinate(2)), int32(currentCoordinate(3))) == 1 % map(q_new(1), q_new(2))
            isBelongsFreeSpace = 0;
            return;
        end
        
    end
    
    isBelongsFreeSpace = 1;

end
