clc;
clear;

format long;

tol = 0.0001;
maks_iterasi = 20;

% Fungsi-fungsi soal
f{1} = @(x) 3*x.^3 - 5*x.^2 + 4*x - 8;
f{2} = @(x) exp(x) - x.^2;
f{3} = @(x) log(x + 2) + 2*x - 3;

% Interval awal [a, b]
interval = [1, 2;
           -1, 0;
            0, 1];

for k = 1:3
    a = interval(k,1);
    b = interval(k,2);
    fa = f{k}(a);
    fb = f{k}(b);

    fprintf('\n====================================\n');
    fprintf('REGULA FALSI - PERSAMAAN %d\n', k);
    fprintf('====================================\n');

    if fa * fb > 0
        fprintf('Interval awal tidak memenuhi syarat.\n');
        fprintf('f(a) dan f(b) harus berlainan tanda.\n');
        continue;
    end

    fprintf('Iterasi       a              b');
    fprintf('              c             f(c)          Error\n');

    c_lama = NaN;

    for i = 1:maks_iterasi
        penyebut = fa - fb;

        if penyebut == 0
            fprintf('Perhitungan berhenti: penyebut nol.\n');
            break;
        end

        c = b - (fb * (a - b)) / penyebut;
        fc = f{k}(c);

        if i == 1
            error = NaN;
        else
            error = abs(c - c_lama);
        end

        fprintf('%3d   %12.6f  %12.6f  %12.6f  %12.6f  %12.6f\n', ...
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

    fprintf('Akar hampiran = %.8f\n', c);
    fprintf('Jumlah iterasi = %d\n', i);
    fprintf('f(akar) = %.8f\n', f{k}(c));
end

