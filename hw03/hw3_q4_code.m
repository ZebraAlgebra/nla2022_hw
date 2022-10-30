% Generate the symmetric pentadiagonal matrix A
A = zeros(5, 5);
for idx = 1: 5
    A(idx, idx) = 4;
end
for idx = 1: 4
    A(idx, idx + 1) = 2;
    A(idx + 1, idx) = 2;
end
for idx = 1: 3
    A(idx, idx + 2) = 1;
    A(idx + 2, idx) = 1;
end
% go through entries below the tridiagonal of A and do Givens rotation
for idy = 1: 3
    for idx = 1: 4 - idy
        x = 6 - idx;
        if abs(A(x, idy)) > 10 ^ (-8) % need to eliminate
            % find cosine and sine for rotation matrix
            c = A(x- 1, idy);
            s = A(x, idy);
            n = norm([c, s]);
            c = c / n;
            s = s / n;
            % generate Givens matrix
            G = eye(5);
            G(x - 1, x - 1) = c;
            G(x, x) = c;
            G(x, x - 1) = -s;
            G(x - 1, x) = s;
            % get result
            A = G * A * G';
        end
    end
end
disp(A);