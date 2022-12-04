function [x, flag, err] = custom_GS(A, b, tol, maxiter)
%GS : Gauss-Seidal method for solving Ax = b, starting from origin
%   tol : allowed error (2-norm difference in Ax and b)
%   maxiter : allowed maximum iteration count
%   flag : variable recording if the procedure computed a solution
%       under tol and maxiter
%   err : norm-2 error of A * x - b
    %% initialize and set starting position
    m = size(A); m = m(1);
    x = zeros(m, 1); % sample point; here we use origin
    err = norm(b);
    flag = (err < tol);
    %% do GS iteration until terminating conditions reached
    C = A - diag(diag(A));
    itercount = 0;
    figure; hold on; title("GS iteration - itercount vs error");
    while (itercount <= maxiter) && ~flag
        scatter(itercount, err);
        for i = 1: m
            x(i) = A(i, i) \ (b(i) - C(i, :) * x);
        end
        err = norm(A * x - b);
        itercount = itercount + 1;
        flag = (err < tol);
    end
end

