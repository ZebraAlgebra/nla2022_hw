function X = newtonDBSqrtm(A, n)
    %%% Denman-Beaver for square root of A
        % n: custom iterate counts
        % A: an spd matrix
    X = A; % sample point
    Y = eye(size(A, 1));
    for i=1:n
        Xnext = (X + inv(Y)) / 2;
        Ynext = (Y + inv(X)) / 2;
        X = Xnext;
        Y = Ynext;
    end
end