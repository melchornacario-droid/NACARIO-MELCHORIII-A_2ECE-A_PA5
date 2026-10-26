
R=[5 -2 0 7; 1 3 -4 2; 6 0 8 -1]
Z=[2+3i -1+4i 5-2i; -3+i 6 2+5i]

transpose(R)
R'
R.'

transpose(Z)
Z'
Z.'

A = [ 2 -1  3  2; 1  4 -2  1; 3  2  1 -1; -2  3  4  2];

b = [16; -7; 6; 7];

x_inv = inv(A) * b;

det_A = det(A);
n = length(b);
x_cramer = zeros(n, 1);

for i = 1:n
    A_temp = A;
    A_temp(:, i) = b;
    x_cramer(i) = det(A_temp) / det_A;
end

det_A
x_inv
x_cramer

norm_diff = norm(x_inv - x_cramer)
norm_residual = norm(A * x_inv - b)