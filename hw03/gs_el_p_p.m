function x=gs_el_p_p(A, b)
    %%% returns solution x of Ax = b where A invertible
    %%% via gauss elimination with partial pivoting
    sz = size(A);
    sz = sz(1);
    for idx = 1: sz - 1
        % find pivot and swap idx-th row with pivot
        [M, p] = max(abs(A(idx: sz, idx)));
        p = p + idx - 1;
        temp_row = zeros(sz - idx + 1);
        temp_val = 0;
        temp_row = A(idx, idx: sz);
        A(idx, idx: sz) = A(p, idx: sz);
        A(p, idx: sz) = temp_row;
        temp_val = b(idx);
        b(idx) = b(p);
        b(p) = temp_val;
        % kill rows under idx and update b
        for idxx = idx + 1: sz
            coeff = A(idxx, idx) / M;
            A(idxx, idx: sz) = A(idxx, idx: sz) - coeff * A(idx, idx: sz);
            b(idxx) = b(idxx) - coeff * b(idx);
        end
    end
    % now A is upper triag, solve for x
    for idx = sz: -1: 1
        for idxx = idx + 1: sz
            b(idx) = b(idx) - b(idxx) * A(idx, idxx);
        end
        b(idx) = b(idx) / A(idx, idx);
    end
    x = b;
end