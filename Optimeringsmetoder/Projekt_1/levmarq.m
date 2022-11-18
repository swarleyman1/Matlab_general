function [x,resnorm,residual] = levmarq(func, x0, resgrad)
    if resgrad == 1
        
    end
    %F =[];
    func = str2func(func);
    [F,f_name] = func(x0)
    

        
        
        
    function [r,gradr]=residualfunc(x)
        gradr = zeros(length(x), length(F));
        for i = 1:length(x)
            for j = length(F)
                %gradr(i,j) = diff(f_name,

            end
        end
    end
end