clc;
clear;
format long;

tol = 0.0001;
maks_iterasi = 20;

f{1} = @(x) 3*x.^3 - 5*x.^2 + 4*x - 8;
f{2} = @(x) exp(x) - x.^2;
f{3} = @(x) log(x + 2) + 2*x - 3;

interval = [1, 2;
           -1, 0;
            0, 1];

for k = 1:3
    a = interval(k, 1);
    b = interval(k, 2);

    fa = f{k}(a);
    fb = f{k}(b);

    fprintf('\n====================================\n');
    fprintf('Persamaan ke-%d\n', k);
    fprintf('====================================\n');

    fprintf('a awal = %.8f\n', a);
    fprintf('b awal = %.8f\n', b);
    fprintf('f(a) = %.8f\n', fa);
    fprintf('f(b) = %.8f\n', fb);

    if fa * fb > 0
        fprintf('Interval tidak memenuhi syarat Bisection.\n');
        continue;
    end

    fprintf('\nIterasi\t\ta\t\tb\t\tc\t\tf(c)\t\tError\n');

    c_lama = NaN;

    for i = 1:maks_iterasi
        c = (a + b) / 2;
        fc = f{k}(c);

        if i == 1
            error = NaN;
        else
            error = abs(c - c_lama);
        end

        fprintf('%d\t\t%.6f\t%.6f\t%.6f\t%.6f\t%.6f\n', ...
                i, a, b, c, fc, error);

        if fc == 0
            break;
        end

        if fa * fc < 0
            b = c;
            fb = fc;
        else
            a = c;
            fa = fc;
        end

        if i > 1 && error < tol
            break;
        end

        c_lama = c;
    end

    fprintf('\nAkar hampiran = %.8f\n', c);
    fprintf('Jumlah iterasi = %d\n', i);
    fprintf('f(akar) = %.8f\n', f{k}(c));
end

