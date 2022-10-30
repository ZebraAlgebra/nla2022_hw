function x = solve_periodic(A, b)
    %%% returns solution x of Ax = b where A periodic
    %%% via thomas algorithm with little tweaks
    sz = size(A);
    sz = sz(1);
    % modify the second to the row before last row by thomas algo
    for i = 2: sz - 1
        if A(i - 1, i - 1) <= 10 ^ (-10) % in this case need to swap rows
            temp = b(i - 1);
            b(i - 1) = b(i);
            b(i) = temp;
            temp = A(i - 1, i - 1: end);
            A(i - 1, i - 1: end) = A(i, i - 1: end);
            A(i, i - 1: end) = temp;
        else
            r = A(i, i - 1) / A(i - 1, i - 1);
            b(i) = b(i) - r * b(i - 1);
            A(i, i - 1) = 0;
            A(i, i) = A(i, i) - r * A(i - 1, i);
            A(i, sz) = A(i, sz) - r * A(i - 1, sz);
        end
    end
    % solve the last row iteratively from previous rows
    for i = 1: sz - 1
        if A(i, i) <= 10 ^ (-10) % in this case need to swap rows
            temp = b(i);
            b(i) = b(sz);
            b(sz) = temp;
            temp = A(i, i: end);
            A(i, i: end) = A(sz, i: end);
            A(sz, i: end) = temp;
        else
            r = A(sz, i) / A(i, i);
            b(sz) = b(sz) - r * b(i);
            A(sz, i) = 0;
            A(sz, i + 1) = A(sz, i + 1) - r * A(i, i + 1);
            if i ~= sz - 1
                A(sz, sz) = A(sz, sz) - r * A(i, sz);
            end
        end
    end
    % backward substitution
    for i = sz: -1 :1
        if i < sz
            b(i) = b(i) - A(i, sz) * b(sz);
            if i < sz - 1
                b(i) = b(i) - A(i, sz - 1) * b(sz - 1);
                if i < sz - 2
                    b(i) = b(i) - A(i, i + 1) * b(i + 1);
                end
            end
        end
        b(i) = b(i) / A(i, i);
    end
    x = b;
end