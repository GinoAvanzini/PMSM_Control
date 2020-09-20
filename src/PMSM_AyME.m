
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

% Controlador PID
n = 2.5;
w_pos = 800;

% Método de sintonía serie correspondiente a 
% un filtro Butterworth de tercer orden
ba = n*J_eq*w_pos;
Ksa = n*J_eq*w_pos*w_pos;
Ksia = J_eq*w_pos*w_pos*w_pos;

%% Análisis para observador de estado
clc

syms K_e_theta K_e_omega b_eq_sym J_eq_sym s
b_eq_sym = 0

A = [0 1
    0 -b_eq_sym/J_eq_sym ];

C = [1 0];

Ke = [K_e_theta
    K_e_omega];

A_prime = A - Ke*C;

collect(det(s*eye(2) - A_prime), s)

% Obtenemos el siguiente polinomio:
% s^2 + ((b_eq + J_eq*K_e_theta)*s)/J_eq + (K_e_theta*b_eq + J_eq*K_e_omega)/J_eq

% Importante: si en el modulador de torque desacoplamos la realimentación
% de la fricción, podemos considerar el modelo de la planta con b_eq = 0. 
% De esa forma, se obtiene el siguiente polinomio:
% s^2 + K_e_theta*s + K_e_omega

p_obs = -3200;

collect( (s-p_obs)^2)
% Obtenemos s^2 + 6400*s + 10240000

%% Ganancias de observador
clc

% Igualando término a término los polinomios:

K_e_theta = -b_eq/J_eq - 2*p_obs;
K_e_omega = p_obs^2 - K_e_theta*b_eq/J_eq;

% Si realizamos el desacople de la fricción en el modulador de torque,
% las ganancias quedan:
K_e_theta = -2*p_obs;
K_e_omega = p_obs^2;


