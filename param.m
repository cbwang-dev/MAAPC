clear;clc;close all;
%% Parameters in the mechanical part
L = 0.305;     % (m) the length to the rod's center of mass
m = 0.210;     % (kg) the mass of the rod
r = 0.145;     % (m) the rotating arm length
J_eq = 0.0044; % (kg*m^2) arm inertia
g = 9.81;      % m/s^2, acceleration of gravity
%% Parameters in the electrical part
R_m = 2.6;     % (Ohm) the armature resistance
K_m = 0.00767; % (V/(rad/s)) the back EMF constant
K_t = 0.00767; % (Nm/A) the motor torque constant
eta_m = 0.69;  % motor efficiency
K_g = 70;      % (70:1) the gearbox ratio, the output is slower
eta_g = 0.9;   % the gearbox efficiency
B_eq = 0.004;  % (Nm/(rad/s)) equivalent viscous damping coefficient

%% tuning LQR parameters
% 

% different Q and R matrixes
trial = 'default';
switch trial
case 'default'
  description = 'default scenario in the assignment.';
  Q = [4 0  0 0;
       0 20 0 0;
       0 0  0 0;
       0 0  0 0];
  R = 1.5;
case  'trial_1' 
  description = 'reduce R to 1 w.r.t default scenario. Increase motor voltage.';
  Q = [4 0  0 0;
       0 20 0 0;
       0 0  0 0;
       0 0  0 0];
  R = 1;
end

fprintf("parameters registered.\n")