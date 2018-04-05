clear all;
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

filename = sprintf('./A_star_path.txt');
[x y z value] = textread(filename, '%n %n %n %n', 'headerlines', 2);
l = size(x);
x_path = int32.empty(0,1);
y_path = int32.empty(0,1);
z_path = int32.empty(0,1);

for i = 1:l
       x_path = [x_path; x(i)];
       y_path = [y_path; y(i)];
       z_path = [z_path; z(i)];
end

scatter3(x_path, y_path, z_path, '*', 'b');
hold on;
plot3(x_close, y_close, z_close, 'r');