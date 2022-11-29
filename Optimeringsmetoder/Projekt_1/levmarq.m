function [x,resnorm,residual] = levmarq(funcc, x0, gradientt)

    if nargin >2
        residualfunc_name = @residualfunc;
    else
        residualfunc_name = @residualfunc_approx;
    end
    lambda = 10; % Maybe?
    nu = 2; % Above 1

    % https://en.wikipedia.org/wiki/Levenberg%E2%80%93Marquardt_algorithm#Choice_of_damping_parameter
    func = str2func(funcc);
    x = x0;
    x_data = [];
    F = inf;
    i = 0;
    while norm(F) > 0.001 && i < 100000
        i = i + 1;
        [F, gradF] = residualfunc_name(x);
        A = gradF *gradF' + lambda * eye(length(x));
        b = -gradF*F;
        p = A\b;
        x = x+p;
        x_data(:,i) = x;
        
    end
    resnorm = norm(F);
    residual = F;
%     figure(2)
%     plot(x_data(1,:),x_data(2,:)) % Path of the x-values
        
        
        
    function [r,gradr]=residualfunc(xx)
        gradient = str2func(gradientt);
        gradr = gradient(xx);
        r = func(xx)';   
    end

    function [r, gradr] = residualfunc_approx(xx)
        step = lambda/1000;
        r = func(xx)'; 
        gradr = zeros(length(xx), length(r));
        for d = 1:length(xx)
            x_plus = xx;
            x_plus(d) = x_plus(d) + step;
            x_minus = xx;
            x_minus(d) = x_minus(d) - step;
            values1 = func(x_plus);
            values2 = func(x_minus);
            
            gradr(d,:) = (values1 - values2) ./(2*step);
        end
    end
end