load('references_10.mat')

m = 0.5;
L = 0.25;
k = 3e-6;
b = 1e-7;
g = 9.81;
k_d = 0.25;
I_xx = 5e-3;
I_yy = 5e-3;
I_zz = 1e-2;
C_m = 1e4;
u_set = (g*m)/(4*k*C_m);
Ts = 0.05;