function X = newtonSqrtm(A, n)
    %%% Newton sqrtm for square root of A
        % n: custom iterate counts
        % A: an spd matrix
    X = A; % sample point
    for i=1:n
        X = (X + X\A)/2;
    end
end