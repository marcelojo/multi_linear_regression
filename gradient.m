% Gradient descent example for linear regression
clc;
clf;
% Define learning rate step
learning_rate = 0.01;

% Define start points a
a = [65 1.37 0.45];

% Define error tolerance to stop
error_tolerance = 10;

% Define max interation
max_interation = 10000;

% Read data
data = dlmread('data.csv', ',', 0, 0);

% Start error greater than tolerance
error = 1;

error_plot = zeros(max_interation,1);

% Loop 
for i = 1:max_interation
    error = norm(calculate_error(a, data));
    error_plot(i) = error;
    % If we got an error smaller than the tolerance, stop
    if error <= error_tolerance
        break;
    endif      
    
    a = step_gradient(a, data, learning_rate);
end
figure(1);
plot(error_plot);
title("error vs iteration");
xlabel("iteration");
ylabel("error");


figure(2);
x = data(:,1);
y = data(:,2);
z = data(:,3);
scatter3(x, y, z, 'r');
title("grade vs age vs sex");
xlabel("age");
ylabel("sex");
zlabel("grade");

figure(3);
x = data(:,1);
y = data(:,2);
z = data(:,3);
scatter3(x, y, z, 'r');
title("grade vs age vs sex");
xlabel("age");
ylabel("sex");
zlabel("grade");

hold;

x = meshgrid(5:1:16);
y = meshgrid(0:0.1:1.1);
z = a(1) + a(2) * x + a(3) * y;
surf(x,y',z);



% Print final results
printf("a0 = %f\n", a(1));
printf("a1 = %f\n", a(2));
printf("a2 = %f\n", a(3));
error
i




