clc;
clear all;

% params for function [vertices, edges, path] = rrt(map, q_start, q_goal, k, delta_q, p)

% MAP
% map = load('map.mat');
% q_start = [80, 70];
% q_goal =  [707, 615];

% MAZE
filename = sprintf('./map.txt');
[x y z value] = textread(filename, '%n %n %n %n', 'headerlines', 2);
[l, ~] = size(x);
for i = 1:l
   x(i) = x(i) + 1;
   y(i) = y(i) + 1;
   z(i) = z(i) + 1;
end
for i = 1:l
   map(x(i),y(i),z(i)) = value(i); 
end

q_start = [1, 1, 1];
q_goal = [30, 30, 30];

k = 10000;
delta_q = 2;
p = 0.3;

% params for function [path_smooth] = smooth(map, path, vertices, delta)
delta = 5;


[vertices, edges, path] = rrt_3D(map, q_start, q_goal, k, delta_q, p);

path_smooth = smooth_3D(map, path, vertices, delta);


    %imshow(int32(1 - map), []);
    %title('RRT (Rapidly-Exploring Random Trees) - Smooth');
    % imagesc(1 - map);
    % colormap(gray);
    
    hold on;
    
    [edgesRowCount, ~] = size(edges);
    
    for ii = 1 : edgesRowCount
        plot3(vertices(ii, 1), vertices(ii, 2), vertices(ii, 3), 'cyan*', 'linewidth', 1);
        plot3([vertices(edges(ii, 1), 1), vertices(edges(ii, 2), 1)], ...
        [vertices(edges(ii, 1), 2), vertices(edges(ii, 2), 2)], ...
        [vertices(edges(ii, 1), 3), vertices(edges(ii, 2), 3)], ...
         'b', 'LineWidth', 1);
    end
    
    plot3(q_start(1), q_start(2), q_start(3), 'g*', 'linewidth', 1);
    plot3(q_goal(1), q_goal(2),q_goal(3), 'r*', 'linewidth', 1);
    
    
    [~, pathCount] = size(path);
    
    for ii = 1 : pathCount - 1
        %plot(vertices(ii, 1), vertices(ii, 2), 'cyan*', 'linewidth', 1);
        plot3([vertices(path(ii), 1), vertices(path(ii + 1), 1)], ...
        [vertices(path(ii), 2), vertices(path(ii + 1), 2)], ...
        [vertices(path(ii), 3), vertices(path(ii + 1), 3)], ...
         'r', 'LineWidth', 1);
    end
    
    [~, pathCount] = size(path_smooth);
    
    for ii = 1 : pathCount - 1
        %plot(vertices(ii, 1), vertices(ii, 2), 'cyan*', 'linewidth', 1);
        plot3([vertices(path_smooth(ii), 1), vertices(path_smooth(ii + 1), 1)], ...
        [vertices(path_smooth(ii), 2), vertices(path_smooth(ii + 1), 2)], ...
        [vertices(path_smooth(ii), 3), vertices(path_smooth(ii + 1), 3)], ...
         'blue', 'LineWidth', 2);
    end
    hold on;
filename = sprintf('./map.txt');
[x y z value] = textread(filename, '%n %n %n %n', 'headerlines', 2);
l = size(x);
x_open = int32.empty(0,1);
y_open = int32.empty(0,1);
z_open = int32.empty(0,1);
x_close = int32.empty(0,1);
y_close = int32.empty(0,1);
z_close = int32.empty(0,1);

for i = 1:l
   if value(i) == 0
       x_open = [x_open; x(i)];
       y_open = [y_open; y(i)];
       z_open = [z_open; z(i)];
   else 
       x_close = [x_close; x(i)];
       y_close = [y_close; y(i)];
       z_close = [z_close; z(i)];
   end
end
fill3(x_close, y_close, z_close, 'k');