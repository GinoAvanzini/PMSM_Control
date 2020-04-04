
clc
clear variables
close all

%% Permanent Magnet Synchronous Motor Field-Oriented Control

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
Lq = 5.8E-3;
Ld = 6.6E-3;
Lls = 0.8E-3;
Rs = 1.02;

lambda_m = 0.01546;

% Constantes de control

p_i = -5000;
R_cq = -p_i*Lq;

