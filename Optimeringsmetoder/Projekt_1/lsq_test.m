function [err] = lsq_test (x, t_data, y_data)
    
    y = lsq_test_f(t_data, x(1), x(2));
    err = y - y_data;
end