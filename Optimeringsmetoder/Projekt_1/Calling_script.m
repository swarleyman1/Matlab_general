%script som callar funktion
t_data = [0.5 1.0 1.5 2.0 2.5 3.0 3.5 4.0];
y_data = [7.2 3.0 1.5 0.85 0.48 0.25 0.20 0.15];

[x,resnorm,residual] = levmarq('lsq_test',[1; 1]);
figure(1)
hold on
plot(t_data, y_data, 'rx')
plot(t_data, lsq_test_f(t_data, x(1), x(2)), 'b-')
hold off
