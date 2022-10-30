% size parameter
m = 100;
% some predefined constants in the question
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
for it = 1: 100
    U = solve_periodic(A, U);
    if mod(it, 20) == 0
        y(:, it / 20 + 1) = U;
    end
end
% plot the results
figure('Name', "Plot of hw3-q5-code.m");
for it = 1: 6
    subplot(2,3,it);
    plot(x, y(:, it));
    title(strcat('Plot of ', int2str(20 * (it - 1)), "th iteration"));
    subtitle(strcat('Range :', num2str(max(y(:, it)) - min(y(:, it)), "%e")));
end