tau = [0.2 0.1 0.05 0.01];
m = 500;
maxiter = 30;
R = triu(-1 + 2 * rand(m), 1);
A = R+R';
b = randn(m, 1);
x_direct_sol = A \ b; % direction solution of Ax = b

%% The following generates the graphs for (a), (b)
for i = 1:4
    for j = 1:m
        for k = 1:m
            if abs(A(j,k)) > tau(i)
                A(j,k) = 0;
            end
        end
    end
    A = A + eye(m);
    [x, flag, err] = custom_CG(A, b, tol, maxiter, tau(i) < 0.2, i);
    subtitle(strcat("tau = ", num2str(tau(i))));
    if tau(i) < 0.01
        figure(2 * i), subtitle(strcat("tau = ", num2str(tau(i))));
    end
end
