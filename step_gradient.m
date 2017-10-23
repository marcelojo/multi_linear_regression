function [new_a] = step_gradient(a, data, learning_rate)
    % Get data length
    data_len = size(data)(1);
    
    % Get x and y points from data
    x = ones(data_len, 3);
    x(:,2) = data(:,1);
    x(:,3) = data(:,2);
    
    y = data(:, 3);
    
    % calculate y from cost function
    y_cost = x * a';            % y = a0x0 + a1x1 + a2x2 
    
    % calculate y - y' which will be used in the gradient descent
    y_error = (y_cost - y);

    % gradiente is defined as:
    % (1/n) * sum(i=0:n){x_m*[y' - y]}  where x0 is ALWAYS 1  
    
    temp = y_error' * x;        % sum(i=0:n){x_m*[y' - y]} where x_m can be x0, x1, x2
    a_temp = (temp)/data_len;
    new_a = a - (learning_rate * a_temp);
endfunction