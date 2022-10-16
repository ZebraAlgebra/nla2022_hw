% script to question 2 in hw 2
func_names = ["clgs", "mgs", "house"];
m = 50;
conds = zeros(1, 24);
errs = zeros(3, 24);
for k = 1 : 24
    A = hw2_test_matrix(m, 4 * k / 100);
    conds(k) = cond(A);
    for i = 1 : 2
        Q = feval(str2func(func_names(i)), A);
        disp(norm(Q'*Q - eye(m)));
        errs(i, k) = norm(Q'*Q - eye(m));
    end

end

% graph results
figure('Name','Plot of hw2-q2');
title("QR algorithms error comparison (in Q-part)");
hold on;
for i = 1 : 3
    loglog(conds, errs(i, :));
end
legend("classical Gram-Schmidt", "modified Gram-Schmidt", "Householder");
xlabel("Condition number");
ylabel("Error in orthogonality");
hold off;
figure('Name','Plot of hw2-q2 for gs');
title("QR algorithms error comparison (in Q-part)");
hold on;
for i = 1 : 2
    loglog(conds, errs(i, :));
end
legend("classical Gram-Schmidt", "modified Gram-Schmidt");
xlabel("Condition number");
ylabel("Error in orthogonality");
hold off;