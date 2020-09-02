
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
L_q = 5.8E-3;
L_d = 6.6E-3;
Lls = 0.8E-3;
R_s = 1.02;

lambda_m = 0.01546;

% Constantes Térmicas

R_tsa = 55;     % [°C/W]
C_t = 1.091;    % [W/(°C/s)]

% Constantes de control

p_i = -5000;
R_cq = -p_i*L_q;

R_q = -p_i*L_q;
R_d = -p_i*L_d;
R_0 = -p_i*Lls;

%controlador PID
n=2.5;
w_pos=800;
%Ganancias PID
ba=n*J_eq*w_pos;
Ksa=n*J_eq*w_pos*w_pos;
Ksia=J_eq*w_pos*w_pos*w_pos;
