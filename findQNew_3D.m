function [q_new] = findQNew_3D(q_near, q_rand, delta_q)

    v = double(q_rand - q_near);
    
    u = v / norm(v);
    
    q_new = int32(double(q_near) + delta_q * u);
    
end