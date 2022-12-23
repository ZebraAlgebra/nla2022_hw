function X = schurSqrtm(A)
    %%% schur method for square root of A
        % A: an spd matrix
    [Q, T] = schur(A);
    n = size(A, 1);
    U = zeros(n, n);
    %%% solve iteratively
    % diagonal elements
    for i = 1:n
        U(i, i) = sqrt(T(i, i));
    end
    % "backward substitution"
    for i = n:-1:1
        for j = n:-1:i+1
            U(i, j) = (T(i, j) - U(i, i+1:j-1) * U(i+1:j-1, j)) / (U(i, i) + U(j, j));
        end
    end
    X = Q*U*Q';
end