% script to question 4 in hw 2
t = 1:25;
y = [5.0291   6.5099   5.3666   4.1272   4.2948
    6.1261  12.5140  10.0502   9.1614   7.5677
    7.2920  10.0357  11.0708  13.4045  12.8415
    11.9666  11.0765  11.7774  14.5701  17.0440
    17.0398  15.9069  15.4850  15.5112  17.6572];
y = y(:)';
v = zeros(3, 25);
v(1, :) = ones(1, 25);
v(2, :) = t;
v(3, :) = sin(t);

% hw2_q4(a) : fit straight line
x = lsqr(v(1: 2, :)', y');
res = v(1: 2, :)' * x - y';
%%% plot of linear fit with outlier
figure('Name','Plot of hw2-q4-linear-1');
title("points and there residuals (linear, with outlier)");
hold on;
plot(t, abs(res'));
hold off;

% hw2_q4(b) : kill outlier and refit linear
%%% discard outlier
[val, idx] = max(abs(res_lin'));
t_lin = cat(2, t(1: idx - 1), t(idx + 1 : end));
y_lin = cat(2, y(1: idx - 1), t(idx + 1 : end));
v_lin = zeros(2, 24);
v_lin(1, :) = ones(1, 24);
v_lin(2, :) = t_lin;
x_lin = lsqr(v_lin(1: 2, :)', y_lin');
res_lin = v_lin(1: 2, :)' * x_lin - y_lin';
figure('Name','Plot of hw2-q4-linear-2');
title("points and there residuals (linear, without outlier)");
hold on;
plot(t_lin, abs(res_lin'));
hold off;

% hw2_q4(c) : fit straight line and sin
x = lsqr(v(1: 3, :)', y');
res = v(1: 3, :)' * x - y';
%%% plot of linear fit with outlier
figure('Name','Plot of hw2-q4-linear-and-sin-1');
title("points and there residuals (linear with sin, with outlier)");
hold on;
plot(t, abs(res'));
hold off;

% hw2_q4(d) : kill outlier and refit linear
%%% discard outlier
[val, idx] = max(abs(res'));
t_lin_sin = cat(2, t(1: idx - 1), t(idx + 1 : end));
y_lin_sin = cat(2, y(1: idx - 1), t(idx + 1 : end));
v_lin_sin = zeros(3, 24);
v_lin_sin(1, :) = ones(1, 24);
v_lin_sin(2, :) = t_lin_sin;
v_lin_sin(3, :) = sin(t_lin_sin);
x_lin_sin = lsqr(v_lin_sin(1: 3, :)', y_lin_sin');
res_lin_sin = v_lin_sin(1: 3, :)' * x_lin_sin - y_lin_sin';
figure('Name','Plot of hw2-q4-linear-and-sin-2');
title("points and there residuals (linear with sin, without outlier)");
hold on;
plot(t_lin_sin, abs(res_lin_sin'));
hold off;

%%% plot on finer grid
t_fine = linspace(0, 26, 100);
v_fine = zeros(3, 100);
v_fine(1, :) = ones(1, 100);
v_fine(2, :) = t_fine;
v_fine(3, :) = sin(t_fine);
fitted = v_fine(1: 3, :)' * x_lin_sin;
figure('Name','Final plot');
title("Fitted curve and original data");
hold on;
plot(t_fine, fitted, '-');
plot(t, y, 'o');
plot(t_lin_sin(idx), val, '*');
legend("Fitted curve", "Originl data");
hold off;
