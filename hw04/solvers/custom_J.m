function [x, flag, err] = custom_J(A, b, tol, maxiter)
%J : Jacobi method for solving Ax = b, starting from origin
%   also plots result of each iteration.
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
    %% do Jacobi iteration until terminating conditions reached
    B = diag(diag(A)); % splitting factor in this method is diagonal of A
    size(B)
    C = A - B;
    itercount = 0;
    figure; hold on; title("Jacobi iteration - itercount vs error");
    while (itercount <= maxiter) && ~flag
        scatter(itercount, err);
        x = B \ (b - C * x);
        err = norm(A * x - b);
        itercount = itercount + 1;
        flag = (err < tol);
    end
end