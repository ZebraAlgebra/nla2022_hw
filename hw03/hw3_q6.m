t = (1: 25)';
y = [5.0291   6.5099   5.3666   4.1272   4.2948
    6.1261  12.5140  10.0502   9.1614   7.5677
    7.2920  10.0357  11.0708  13.4045  12.8415
    11.9666  11.0765  11.7774  14.5701  17.0440
    17.0398  15.9069  15.4850  15.5112  17.6572];
y = y(:);
v = zeros(25, 3);
v(:, 1) = ones(25, 1);
v(:, 2) = t';
v(:, 3) = sin(t)';

% fit straight line
[Qlin, Rlin] = qr(v(:, 1: 2));
xlin = Rlin \ (Qlin' * y);
err_lin = abs(v(:, 1: 2) * xlin - y);

% fit sined line
[Qsin, Rsin] = qr(v);
xsin = Rsin \ (Qsin' * y);
err_sin = abs(v * xsin - y);

% determine outlier and use qrdelete to do the job, liner case
[val, idx] = max(abs(err_lin'));
t_linnew = cat(1, t(1: idx - 1), t(idx + 1 : end));
y_linnew = cat(1, y(1: idx - 1), y(idx + 1 : end));
[Qlinnew, Rlinnew] = qrdelete(Qlin, Rlin, idx, 'row');
xlinnew = Rlinnew \ (Qlinnew' * y_linnew);
v_linnew = zeros(24, 2);
v_linnew(:, 1) = ones(24 ,1);
v_linnew(:, 2) = t_linnew;
err_linnew = abs(v_linnew * xlinnew - y_linnew);

% determine outlier and use qrdelete to do the job, sined case
[val, idx] = max(abs(err_sin'));
t_sinnew = cat(1, t(1: idx - 1), t(idx + 1 : end));
y_sinnew = cat(1, y(1: idx - 1), y(idx + 1 : end));
[Qsinnew, Rsinnew] = qrdelete(Qsin, Rsin, idx, 'row');
xsinnew = Rsinnew \ (Qsinnew' * y_sinnew);
v_sinnew = zeros(24, 3);
v_sinnew(:, 1) = ones(24 ,1);
v_sinnew(:, 2) = t_sinnew;
v_sinnew(:, 2) = sin(t_sinnew);
err_sinnew = abs(v_sinnew * xsinnew - y_sinnew);

% plot erros in linear case
figure('Name','Plot of hw3_q6 : linear');
title("points and there residuals, linear, with/without outlier");
hold on;
plot(t, err_lin);
plot(t_linnew, err_linnew);
legend("with outlier", "without outlier");
hold off;

% plot erros in sined case
figure('Name','Plot of hw3-q6 : sined');
title("points and there residuals, sined, with/without outlier");
hold on;
plot(t, err_sin);
plot(t_sinnew, err_sinnew);
legend("with outlier", "without outlier");
hold off;
