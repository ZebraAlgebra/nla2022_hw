function [Y,Z] = newtonNSSqrtm(A, n)
    %%% Newton-Shulz for square root of A
        % n: custom iterate counts
        % A: an spd matrix    
    I = eye(size(A, 1));
    A_fro_norm = norm(A, "fro");
    A = A/A_fro_norm;
    Y = A; % sample point
    Z = I;
    for i = 1:n
        ZY = Z*Y;
        Ytemp = Y*(3*I - ZY)/2;
        Ztemp = (3*I - ZY)*Z/2;
        Y = Ytemp;
        Z = Ztemp;
    end
    Y = Y * sqrt(A_fro_norm);
    Z = Z / sqrt(A_fro_norm);
end