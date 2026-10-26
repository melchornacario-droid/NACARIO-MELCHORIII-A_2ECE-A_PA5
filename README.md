# ECE 2112: Experiment 5 - Introduction to MATLAB Programming


EXPERIMENT 5: INTRODUCTION TO MATLAB PROGRAMMING\
Name: Nacario Melchor III A\
Section: 2ECE-A\
Date Submitted: 10/26/2026 

```matlab
%% PROBLEM A: TRANSPOSE OPERATIONS
% Define matrices R and Z
R = [5 -2 0 7; 1 3 -4 2; 6 0 8 -1];
Z = [2+3i -1+4i 5-2i; -3+i 6 2+5i];

% Compute and display transpose operations for R
transpose(R)
R'
R.'

% Compute and display transpose operations for Z
transpose(Z)
Z'
Z.'
```
Expected Output:
```matlab
%transpose(R), R', and R.'
ans =
     5     1     6
    -2     3     0
     0    -4     8
     7     2    -1

%transpose(Z) and Z.'
ans =
   2.0000 + 3.0000i  -3.0000 + 1.0000i
  -1.0000 + 4.0000i   6.0000 + 0.0000i
   5.0000 - 2.0000i   2.0000 + 5.0000i

%Z'
ans =
   2.0000 - 3.0000i  -3.0000 - 1.0000i
  -1.0000 - 4.0000i   6.0000 - 0.0000i
   5.0000 + 2.0000i   2.0000 - 5.0000i
```

 Answers to Problem A Questions:\
 a. Which operations give identical results for the real matrix R?\
  transpose(R), R', and R.' yield identical results because real numbers have imaginary parts equal to zero ($0i$), making complex conjugation redundant.

 b. Which two operations give identical results for the complex matrix Z?\
 transpose(Z) and Z.' give identical results. Both perform a purely structural transpose (swapping rows and columns) without altering the signs of the imaginary components.
 
 c. What additional operation is performed by the apostrophe operator (') 
    when the matrix contains complex entries?\
The apostrophe operator (') computes the complex-conjugate transpose, which transposes the dimensions AND takes the 
complex conjugate (negating the imaginary part) of every entry.

```matlab
%% PROBLEM B: TWO METHODS FOR A LINEAR SYSTEM
% Create coefficient matrix A and right-hand-side vector b
A = [ 2 -1  3  2; 
      1  4 -2  1; 
      3  2  1 -1; 
     -2  3  4  2];

b = [16; -7; 6; 7];

% Method 1: Inverse Method
x_inv = inv(A) * b;

% Method 2: Cramer's Rule using a loop
det_A = det(A);
n = length(b);
x_cramer = zeros(n, 1);

for i = 1:n
    A_temp = A;           % Create temporary copy of A
    A_temp(:, i) = b;     % Replace the i-th column with vector b
    x_cramer(i) = det(A_temp) / det_A;
end

% Display required outputs
det_A
x_inv
x_cramer
```
Expected Output:
```matlab
det_A =
   280

x_inv =
     2
    -1
     3
     1

x_cramer =
     2
    -1
     3
     1

norm_diff =
   2.3941e-15

norm_residual =
   8.8818e-16
```
Explanation of Built-in MATLAB Functions Used
### Explanation of Built-in MATLAB Functions Used

| Function | Description & Purpose in Script |
| :--- | :--- |
| `inv(A)` | Computes the matrix inverse (A^-1) of a square matrix A. Used in Method 1 to solve x=(A^-1)b. |
| `det(A)` | Calculates the scalar determinant of matrix A. Used to verify non-singularity detA and compute Cramer's Rule ratios. |
| `length(b)` | Returns the number of elements in vector b. Used to dynamically set the matrix dimension size n for loop iteration. |
| `zeros(n, 1)` | Pre-allocates an nx1 column vector initialized with zeros. Improves computational efficiency before populating `x_cramer` inside the loop. |
| `norm(V)` | Computes the Euclidean norm (magnitude) of vector V. Used for numerical validation checks:<br><br>1. `norm(x_inv - x_cramer)` measures consistency between both methods.<br><br>2. `norm(A * x_inv - b)` measures residual error against the target vector b. |
