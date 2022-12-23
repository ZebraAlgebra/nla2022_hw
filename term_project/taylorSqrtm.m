function X = taylorSqrtm(A, n)
    %%% Newton sqrtm for square root of A
        % n: custom iterate counts
        % A: an spd matrix
    A_fro_norm = norm(A, "fro");
    A = A / A_fro_norm;
    I = eye(size(A, 1));
    B = I - A;
    X = I;
    mult = 1/2;
    for k = 1:n
        X = X - abs(mult) * B;
        mult = mult * (1/2 - k) / (k + 1);
        B = B * (I - A);
    end
    X = X * sqrt(A_fro_norm);
end