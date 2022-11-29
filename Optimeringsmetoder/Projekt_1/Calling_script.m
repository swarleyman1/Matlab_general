%script som callar funktionen levmarq
t_data = [0.5 1.0 1.5 2.0 2.5 3.0 3.5 4.0];
y_data = [7.2 3.0 1.5 0.85 0.48 0.25 0.20 0.15];

[x,resnorm,residual] = levmarq('lsq_test',[1; 1], 'lsq_gradient'); % Real min: [9.0861, -1.109]
[x_correct, residual_correct] = lsqnonlin(@lsq_test, [1; 1]);
tt = linspace(0.5,4,1000);
figure(1)
hold on
plot(t_data, y_data, 'rx')
plot(tt, lsq_test_f(tt, x(1), x(2)), 'b-')
hold off
