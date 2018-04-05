function [isQGoalOnEdge] = isQGoalOnQNearQNewEdge_3D(q_near, q_new, q_goal)
    
    v = double(q_new - q_near);
    
    distance = norm(v);
    
    u = v / distance;
    
    distanceQNearQGoal = norm(double(q_goal - q_near));
    
    if distanceQNearQGoal > distance
        isQGoalOnEdge = 0;
        return;
    end
    
    q_goal_hat = double(q_near) + (distanceQNearQGoal * u);
    
    isQGoalOnEdge = isequal(int32(q_goal_hat), q_goal);
    
end