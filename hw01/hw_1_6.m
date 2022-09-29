A = importdata("Hello_Mat.mat");
%<-- A peak at the singular values of S -->
v = svd(A);
display(v);
figure 
plot(v);
figure;
semilogy(v); % The mathematical rank of A is 12
%<-- Get U, V for the SVD of A -->
figure;
[U, S, V] = svd(A);
%<-- Approximations of A -->
[x1, x2] = size(A);
A_k = zeros(x1, x2, 12); % 12 is the rank computed above
S_k = zeros(x1, x2); 
str = 'Graph_for_A_';
for i = 1: 12
    S_k(i, i) = v(i);
    A_k(:, :, i) = U * S_k * V';
    % the following saves the results of the picture
    imagesc(A_k(:, :, i));
    colormap(flipud(gray));
    saveas(gcf, strcat(str, int2str(i), '.png'));
end