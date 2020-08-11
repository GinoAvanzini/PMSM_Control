
clc
clear variables
close all

% Constantes Mecánicas
r = 314.3008;
J_m = 3.1E-6;
b_m = 1.5E-5;
J_l = 0.252;
b_l = 0.063;

Tl = 1.57;

J_eq = J_m + J_l/r^2;
b_eq = b_m + b_l/r^2;

Tl_eq = Tl/r;

% Constantes Eléctricas
Pp = 3;
L_q = 5.8E-3;
L_d = 6.6E-3;
Lls = 0.8E-3;
R_s = 1.02;

lambda_m = 0.01546;

% Autovalores. Polos y ceros

syms s 
% syms b_eq J_eq Pp lambda_m L_q R_s

A = [ 
    0     1       0
    0   -b_eq/J_eq  1.5*Pp*lambda_m/J_eq
    0   -Pp*lambda_m/L_q   -R_s/L_q];
B = [
    0
    -1/J_eq
    0];

C = [1 0 0];
G = simplify(C*inv(s*eye(3) - A)*B)

[num, den] = ss2tf(A, B, C, 0);
H = tf(num, den)
pzmap(H)
grid on

