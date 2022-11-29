function [g] = lsq_gradient(x)
    t_data = [0.5 1.0 1.5 2.0 2.5 3.0 3.5 4.0];
    g = [exp(x(2)*t_data); x(1)*t_data.*exp(x(2)*t_data)];
end