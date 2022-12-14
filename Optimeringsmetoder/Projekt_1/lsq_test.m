function [err] = lsq_test (x)
    t_data = [0.5 1.0 1.5 2.0 2.5 3.0 3.5 4.0];
    y_data = [7.2 3.0 1.5 0.85 0.48 0.25 0.20 0.15];
    y = lsq_test_f(t_data, x(1), x(2));
    err = y - y_data;
    
    function y = lsq_test_f(t, x1, x2)
    y = x1 * exp(x2 * t);
    end
end