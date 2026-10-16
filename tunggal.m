
clc;
clear;
close all;

x = linspace(-2, 3, 1000);

% Tiga fungsi dari soal
f1 = 3*x.^3 - 5*x.^2 + 4*x - 8;
f2 = exp(x) - x.^2;

% Domain fungsi logaritma harus x > -2
x3 = linspace(-1.99, 3, 1000);
f3 = log(x3 + 2) + 2*x3 - 3;

figure;

subplot(3,1,1);
plot(x, f1, 'b', 'LineWidth', 1.5);
hold on;
plot(x, zeros(size(x)), 'k--');
grid on;
xlabel('x');
ylabel('f_1(x)');
title('Grafik Tunggal: f_1(x) = 0');

subplot(3,1,2);
plot(x, f2, 'r', 'LineWidth', 1.5);
hold on;
plot(x, zeros(size(x)), 'k--');
grid on;
xlabel('x');
ylabel('f_2(x)');
title('Grafik Tunggal: f_2(x) = 0');

subplot(3,1,3);
plot(x3, f3, 'm', 'LineWidth', 1.5);
hold on;
plot(x3, zeros(size(x3)), 'k--');
grid on;
xlabel('x');
ylabel('f_3(x)');
title('Grafik Tunggal: f_3(x) = 0');

