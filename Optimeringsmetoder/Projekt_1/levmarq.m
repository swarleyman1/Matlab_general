function [x,resnorm,residual] = levmarq(func, x0)
    t_data = [0.5 1.0 1.5 2.0 2.5 3.0 3.5 4.0];
    y_data = [7.2 3.0 1.5 0.85 0.48 0.25 0.20 0.15];
    mu = 100; % Maybe?
    func = str2func(func);
    x = x0;
    %F = ones(length(t_data), 1);
    F = inf;
    i = 0;
    while norm(F) > 0.0001 && i < 100
        i = i + 1;
        [F, gradF] = residualfunc(x);
        A = gradF *gradF' + mu * eye(length(x));
        b = -gradF*F;
        p = A\b;
        x = x+p;
        disp(x)
        disp(p)
    end
    disp(i)
    resnorm = norm(F);
    residual = F;

        
        
        
    function [r,gradr]=residualfunc(xx)
%         gradr = zeros(length(x), length(F));
%         for i = 1:length(x)
%             for j = length(F)
%                 gradr(i,j) = 
% 
%             end
%         end
          gradr = [exp(xx(2)*t_data); xx(1)*xx(2)*exp(xx(2)*t_data)];
          r = func(xx, t_data, y_data)';
          
          
    end
end