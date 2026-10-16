clc;
clear;
close all;

x = linspace(-2, 3, 1000);

% Persamaan 1:
% 3x^3 - 5x^2 + 4x - 7 = 1
y1_kiri = 3*x.^3 - 5*x.^2 + 4*x - 7;
y1_kanan = ones(size(x));

% Persamaan 2:
% exp(x) - x^2 = 0
y2_kiri = exp(x) - x.^2;
y2_kanan = zeros(size(x));

% Persamaan 3:
% log(x + 2) + 2x - 3 = 0
x3 = linspace(-1.99, 3, 1000);
y3_kiri = log(x3 + 2) + 2*x3;
y3_kanan = 3*ones(size(x3));

figure;

subplot(3,1,1);
plot(x, y1_kiri, 'b', 'LineWidth', 1.5);
hold on;
plot(x, y1_kanan, 'r--', 'LineWidth', 1.5);
grid on;
xlabel('x');
ylabel('y');
title('Grafik Ganda Persamaan 1');
legend('y = 3x^3 - 5x^2 + 4x - 7', 'y = 1', ...
       'Location', 'best');

subplot(3,1,2);
plot(x, y2_kiri, 'b', 'LineWidth', 1.5);
hold on;
plot(x, y2_kanan, 'r--', 'LineWidth', 1.5);
grid on;
xlabel('x');
ylabel('y');
title('Grafik Ganda Persamaan 2');
legend('y = exp(x) - x^2', 'y = 0', ...
       'Location', 'best');

subplot(3,1,3);
plot(x3, y3_kiri, 'b', 'LineWidth', 1.5);
hold on;
plot(x3, y3_kanan, 'r--', 'LineWidth', 1.5);
grid on;
xlabel('x');
ylabel('y');
title('Grafik Ganda Persamaan 3');
legend('y = log(x + 2) + 2x', 'y = 3', ...
       'Location', 'best');

