% script to question 3 in hw 2
% initialization
m = 50; % number of points
n = 47; % order of fitting polynomial
t = linspace(1, 0, m); % sample points
A = zeros(m, n);
for i = 1: m
    for j = 1: n
        A(i, j) = t(i)^(j - 1);
    end
end
y = arrayfun(@(x) cos(4*x), t)';
x = zeros(3, n); % stores result obtained via different methods
errs = zeros(3, 1); % stores error of x and y
errs_ortho = zeros(2, 1); % stores error in Q

% hw2_q3(a) : solve via normal equation
x(1, :) = (A' * A) \ (A' * y);
errs(1) = norm(A * x(1, :)' - y);

% hw2_q3(b) : solve via modified Gram-Schmidt
func_names = ["mgs", "house"];
for i = 1: 2
    [Qtemp, Rtemp] = feval(func_names(i), A);
    x(i+1, :) = Rtemp \ (Qtemp' * y);
    errs_ortho(i) = norm(Qtemp' * Qtemp - eye(n));
    errs(i + 1) = norm(A * x(i + 1, :)' - y);
end

% hw2_q3(c) : readily computed above