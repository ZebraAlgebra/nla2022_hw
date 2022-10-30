errs = zeros(12, 6);
for k = 2: 2: 12
    m = k * 10;
    % generate matrix A and vector b
    for l = 1: 12
        A = 2 * eye(m) - (triu(ones(m)))';
        A(:, m) = ones(m, 1);
        b = rand(m, 1);
        if l ~= 1 % add perturbation
            A = A + 10^(-l) * rand(m, m);
        end
        x = gs_el_p_p(A, b);
        errs(l, k / 2) = norm(A * x - b);
    end
end
disp(log(errs))
