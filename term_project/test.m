n = 5;
A = rand(n, n);
A = A * A';
%[X, Xinv] = newtonNSSqrtm(A, 200);
X = padeSqrtm(A, 7);
disp(norm(X * X - A));
Y = sqrtm(A);
disp(norm(Y * Y - A));
disp(norm(X - Y));