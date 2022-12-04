function [x, flag, err] = custom_GD(A, b, tol, maxiter, want_conv, figure_num)
%CG : Gradient descent method for solving Ax = b, starting from origin
%   tol : allowed error (2-norm difference in Ax and b)
%   maxiter : allowed maximum iteration count
%   flag : variable recording if the procedure computed a solution
%       under tol and maxiter
%   err : norm-2 error of A * x - b
%   want_conv : plots graph comparing condition number and convergence rate
%   figure_num : only to help tracking which figure to plot
    %% initialize and set starting position
    %%%% setups for GD method
    m = size(A); m = m(1);
    x = zeros(m, 1); % sample point; here we use origin
    err = norm(b);
    residual = b;
    flag = (err < tol);
    %%%% setups for computing convergence rate
    x_direct_sol = A \ b; % direct solution of Ax = b
    e0 = sqrt(x_direct_sol' * A * x_direct_sol);
    kappa = cond(A); % condition number of A
    %% do GD until terminating conditions reached
    itercount = 0;
    figure(2 * figure_num - 1); hold on; title("GD iteration - itercount vs log10(error)");
    if want_conv
        figure(2 * figure_num); hold on; title("GD iteration - convergence vs cond(A)");
    end
    while (itercount <= maxiter) && ~flag
        figure(2 * figure_num - 1), scatter(itercount, log10(err));
        alpha = (residual' * residual) / (residual' * A * residual);
        x = x + alpha * residual;
        residual = residual - alpha * A * residual;
        err = norm(residual);
        itercount = itercount + 1;
        flag = (err < tol);
        if want_conv && itercount > 1
            e_next = (x - x_direct_sol)' * A * (x - x_direct_sol);
            figure(2 * figure_num), scatter(itercount, e_next / e0);
        end
    end
    if want_conv
        figure(2 * figure_num), plot((linspace(0, itercount)), ((kappa - 1) / (kappa + 1)) .^ (linspace(0, itercount)));
    end
end

