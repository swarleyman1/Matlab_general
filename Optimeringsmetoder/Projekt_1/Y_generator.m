x = linspace(-100,100);
y = 5 +1.6*x + 0.12*x.^2;
for i = 1:length(y)
    y(i) = y(i) + random('Uniform', -50, 50);
end