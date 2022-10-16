function [Q, R] = house(A) 
[m,n] = size(A); % assume m >= n
R = zeros(m,n);
Q = eye(m,m);
z = zeros(m);
    for j = 1:n
        y = A(j:end,j);
        w = y +sign(A(j,j))*norm(y)*eye(size(y,1),1);
        v = w/norm(w);
        Dummy = 2*(v*v');
        z(j:end,j:end) = Dummy;
        H = eye(m) - z;
        A = H*A;
        Q = Q*H;
        z = zeros(m);
    end
    for i = 1:m
        for j = i:n
            R(i,j) = A(i,j);
        end
    end
% trim down
Q = Q(:, 1:n);
R = R(1:n, :);
end