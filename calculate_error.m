function error = calculate_error (a, data)
    
    % linear regression y = a0x0 + a1x1 + a2x2 ==> where x0 is always 1
    % The cost function is the mean square error
    % Error = 1/2n * sum(i=1:n)[y' - y]^2
    % where y is the real value and y´ is the estimation value

    data_len = size(data)(1);
    
    x = ones(data_len, 3);
    x(:,2) = data(:,1);
    x(:,3) = data(:,2);
    
    y = data(:, 3);
    
    % create vector and calculate all points
    y_cost = x * a';            % y = a0x0 + a1x1 + a2x2 
    y_error = y_cost - y;
    error = (y_error' * y_error)/(2 * data_len);
endfunction