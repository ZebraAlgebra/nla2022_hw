function X = naiveNewtonSqrtm(A, n)
    %%% naive Newton sqrtm for square root of A
        % n: custom iterate counts
        % A: an spd matrix
    X = A; % sample point
    for i=1:n
        X = X + lyap(X, X*X - A);
    end
end