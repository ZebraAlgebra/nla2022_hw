m = 50;
I = speye(m);
e = ones(m,1);
T = spdiags([e -4*e e],[-1 0 1],m,m);
S = spdiags([e e],[-1 1],m,m);
A = kron(I,T) + kron(S,I);
tol = 10 ^ (-4);
maxiter = 100;
b = rand(m*m,1);

disp(max(abs(eig(speye(m*m)- diag(diag(A))\A ))))

[x, flag, err] = custom_J(A, b, tol, maxiter);
[x, flag, err] = custom_GS(A, b, tol, maxiter);