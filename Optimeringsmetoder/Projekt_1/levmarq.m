function [x,resnorm,residual] = levmarq(func, x0, gradient)

    if nargin >2
        residualfunc_name = @residualfunc;
        gradient = str2func(gradient);
    else
        residualfunc_name = @residualfunc_approx;
    end
    func = str2func(func);
    x = x0;
    
    
    tol = 0.2;
    max_iter = 10000;
    F = tol+1; % Initializing larger than tol
    lambda = 10; % Maybe?
    %nu = 2; % Above 1

    old_norm = 0;
    x_data = [];
    i = 0;
    while norm(F) > tol && i < max_iter
        i = i + 1;
        [F, gradF] = residualfunc_name(x);
        A = gradF *gradF' + lambda * eye(length(x));
        b = -gradF*F;
        p = A\b;
        x = x+p;
        x_data(:,i) = x;
        lambda = 10/norm(F);
        if abs(old_norm / norm(F)-1) < 0.1
            lambda = lambda/2;
        end
        old_norm = norm(F);
    end
    resnorm = norm(F);
    residual = F;
%     figure(2)
%     plot(x_data(1,:),x_data(2,:)) % Path of the x-values
    
    i
        
    function [r,gradr]=residualfunc(xx)

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