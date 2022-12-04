function [x, flag, err] = custom_PCG(A, M, b, tol, maxiter, figure_num)
%CG : Gradient descent method for solving Ax = b, starting from origin
%   M : a preconditioner used in this method
%   tol : allowed error (2-norm difference in Ax and b)
%   maxiter : allowed maximum iteration count
%   flag : variable recording if the procedure computed a solution
%       under tol and maxiter
%   err : norm-2 error of A * x - b
%   figure_num : only to help tracking which figure to plot
    %% initialize and set starting position
    %%%% setups for PCG method
    m = size(A); m = m(1);
    x = zeros(m, 1); % sample point; here we use origin
    err = norm(b);
    residual = b;
    dir = M \ residual;
    z = dir;
    flag = (err < tol);
    %% do PCG until terminating conditions reached
    itercount = 0;
    figure(figure_num); hold on; title("PCG iteration - itercount vs log10(error)");
    while (itercount <= maxiter) && ~flag
        figure(figure_num), scatter(itercount, log10(err));
        alpha = (residual' * z) / (dir' * A * dir);
        x = x + alpha * dir;
        residual_next = residual - alpha * A * dir;
        z_next = M \ residual_next;
        dir = z_next + ((residual_next' * z_next) / (residual' * z)) * dir;
        err = norm(residual_next);
        residual = residual_next;
        z = z_next;
        itercount = itercount + 1;
        flag = (err < tol);
    end
end

