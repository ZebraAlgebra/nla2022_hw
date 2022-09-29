function A=hello()
%
% explicit construction of the word 'HELLO'
%
A = zeros(15, 40);
%
A(2: 9, [2, 3, 6, 7]) = 1;   % H
A(5: 6, 4: 5) = 1;
%
A(3: 10, 10: 11) = 1;   % E
A([3, 4, 6, 7, 9, 10], 12: 15) = 1;
%
A(4: 11, 18: 19) = 1;   % L
A(10: 11, 20: 23) = 1;
%
A(5: 12, 26: 27) = 1;   % L
A(11: 12, 28: 31) = 1;
%
A([6, 7, 12, 13], 36: 37) = 1;
A(6: 13, [34, 35, 38, 39]) = 1;
%
% Show the nonzero structure of A:
spy(A)
%
xlabel('non-zero elements $n=164$','fontsize',20,'interpreter','latex')
set(gca,'TickLabelInterpreter','latex',...
    'fontsize',20)
print -dpdf hello

end
