times = zeros(10, 1);
for m = 100: 100: 2000
    h = 1 / m;
    k = 1 / m;
    a = - k / (h ^ 2);
    b = 1 + 2 * k / (h ^ 2);
    c = - k / (h ^ 2);
    x = (0: m - 1)' * h;
    f = exp(-100 * ((x - 1 / 2).^2));
    U = f;
    A = diag(b * ones(1, m)) + diag(c * ones(1, m - 1), 1) + diag(a * ones(1, m - 1), -1);
    A(1, m) = a;
    A(m, 1) = c;
    y = zeros(m, 6);
    y(:, 1) = f;
    tic
    for it = 1: 100
        U = solve_periodic(A, U);
        if mod(it, 20) == 0
            y(:, it / 20 + 1) = U;
        end
    end
    times(m / 100) = toc;
end
disp(times);