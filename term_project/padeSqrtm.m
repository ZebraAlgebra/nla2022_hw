function X = padeSqrtm(A, N)
    %%% Pade's approximant for square root of A
        % N: custom iterate counts
        % A: an spd matrix    
    %%% initialization
    A_fro_norm = norm(A, "fro");
    A = A/A_fro_norm;
    n = size(A, 1);
    I = eye(n);
    binom_coefficients = zeros(2*N, 1);
    %%% memoize binom_coefficients
    binom_coefficients(1) = 1/2;
    for i=2:2*N
        binom_coefficients(i) = - binom_coefficients(i - 1) * (3/2 - i) / i;
    end
    %%% solve for the coefficients q
    pade_coefficients = toeplitz(binom_coefficients(N:2*N-1), binom_coefficients(N:-1:1));
    disp(cond(pade_coefficients));
    q = -pade_coefficients\binom_coefficients(N+1:2*N);
    %%% solve for the coefficients p
    pade_coefficients = toeplitz(cat(1, 1, binom_coefficients(1:N-1)), cat(1, 1, zeros(N-1,1)));
    p = pade_coefficients * q + binom_coefficients(1:N);
    %%% solve for the matrix P and Q
    P = I;
    Q = I;
    ImA = I - A;
    R = ImA;
    for i=1:N
        P = P - p(i)*R;
        Q = Q - q(i)*R;
        R = R*ImA;
    end
    X = sqrt(A_fro_norm)*(Q\P);
end