clc;close all;
%% ================================================ %%
%% Parameters in the mechanical and electrical part %%
%% ================================================ %%

L = 0.305;     % (m) the length to the rod's center of mass
m = 0.210;     % (kg) the mass of the rod
r = 0.145;     % (m) the rotating arm length
J_eq = 0.0044; % (kg*m^2) arm inertia
g = 9.81;      % m/s^2, acceleration of gravity
R_m = 2.6;     % (Ohm) the armature resistance
K_m = 0.00767; % (V/(rad/s)) the back EMF constant
K_t = 0.00767; % (Nm/A) the motor torque constant
eta_m = 0.69;  % motor efficiency
K_g = 70;      % (70:1) the gearbox ratio, the output is slower
eta_g = 0.9;   % the gearbox efficiency
B_eq = 0.004;  % (Nm/(rad/s)) equivalent viscous damping coefficient

%% ========================================================== %%
%% tuning LQR parameters, trials and corresponding parameters %%
%% ========================================================== %%

trial_LUT(1).index = 1;
trial_LUT(1).name = 'default';
trial_LUT(1).description = 'default scenario in the assignment.';
trial_LUT(1).Q = [4 0  0 0;
                  0 20 0 0;
                  0 0  0 0;
                  0 0  0 0];
trial_LUT(1).R = 1.5;
trial_LUT(1).wc = 2*2*pi; % parameter required to calculate alpha and theta filter, given in the assignment.

trial_LUT(2).index = 2;
trial_LUT(2).name = 'trial_1';
trial_LUT(2).description = 'reduce R to 1 w.r.t default scenario. Increase motor voltage.';
trial_LUT(2).Q = [4 0  0 0;
                  0 20 0 0;
                  0 0  0 0;
                  0 0  0 0];
trial_LUT(2).R = 1;
trial_LUT(2).wc = 2*2*pi; % parameter required to calculate alpha and theta filter, given in the assignment.

trial_LUT(3).index = 3;
trial_LUT(3).name = 'trial_2';
trial_LUT(3).description = 'double R to 3 w.r.t default scenario. Decrease motor voltage.';
trial_LUT(3).Q = [4 0  0 0;
                  0 20 0 0;
                  0 0  0 0;
                  0 0  0 0];
trial_LUT(3).R = 3;
trial_LUT(3).wc = 2*2*pi; % parameter required to calculate alpha and theta filter, given in the assignment.

trial_LUT(4).index = 4;
trial_LUT(4).name = 'trial_3';
trial_LUT(4).description = 'half Q elements w.r.t default scenario. Increase state values x. (only theta and alpha)';
trial_LUT(4).Q = [2 0  0 0;
                  0 10 0 0;
                  0 0  0 0;
                  0 0  0 0];
trial_LUT(4).R = 1.5;
trial_LUT(4).wc = 2*2*pi; % parameter required to calculate alpha and theta filter, given in the assignment.

trial_LUT(5).index = 5;
trial_LUT(5).name = 'trial_5';
trial_LUT(5).description = 'double Q elements w.r.t default scenario. Increase state weighting.';
trial_LUT(5).Q = [8 0  0 0;
                  0 40 0 0;
                  0 0  0 0;
                  0 0  0 0];
trial_LUT(5).R = 1.5;
trial_LUT(5).wc = 2*2*pi; % parameter required to calculate alpha and theta filter, given in the assignment.

trial_LUT(6).index = 6;
trial_LUT(6).name = 'trial_6';
trial_LUT(6).description = 'quadruple Q elements w.r.t default scenario. Increase state weighting.';
trial_LUT(6).Q = [16 0  0 0;
                  0 80 0 0;
                  0 0  0 0;
                  0 0  0 0];
trial_LUT(6).R = 1.5;
trial_LUT(6).wc = 2*2*pi; % parameter required to calculate alpha and theta filter, given in the assignment.

trial_LUT(7).index = 7;
trial_LUT(7).name = 'trial_7';
trial_LUT(7).description = '8x Q elements w.r.t default scenario. Increase state weighting.';
trial_LUT(7).Q = [32 0  0 0;
                  0 160 0 0;
                  0 0  0 0;
                  0 0  0 0];
trial_LUT(7).R = 1.5;
trial_LUT(7).wc = 2*2*pi; % parameter required to calculate alpha and theta filter, given in the assignment.

trial_LUT(8).index = 8;
trial_LUT(8).name = 'trial_8';
trial_LUT(8).description = '8x Q elements w.r.t default scenario. Increase state weighting.';
trial_LUT(8).Q = [20 0  0 0;
                  0 40 0 0;
                  0 0  0 0;
                  0 0  0 0];
trial_LUT(8).R = 1.5;
trial_LUT(8).wc = 2*2*pi; % parameter required to calculate alpha and theta filter, given in the assignment.

trial_LUT(9).index = 9;
trial_LUT(9).name = 'trial_8';
trial_LUT(9).description = '8x Q elements w.r.t default scenario. Increase state weighting.';
trial_LUT(9).Q = [100 0  0 0;
                  0 160 0 0;
                  0 0  0 0;
                  0 0  0 0];
trial_LUT(9).R = 1.5;
trial_LUT(9).wc = 2*2*pi; % parameter required to calculate alpha and theta filter, given in the assignment.

trial_LUT(10).index = 10;
trial_LUT(10).name = 'trial_8';
trial_LUT(10).description = '8x Q elements w.r.t default scenario. Increase state weighting.';
trial_LUT(10).Q = [10 0  0 0;
                  0 40 0 0;
                  0 0  5 0;
                  0 0  0 0];
trial_LUT(10).R = 1.5;
trial_LUT(10).wc = 2*2*pi; % parameter required to calculate alpha and theta filter, given in the assignment.

trial_LUT(11).index = 11;
trial_LUT(11).name = 'trial_8';
trial_LUT(11).description = '8x Q elements w.r.t default scenario. Increase state weighting.';
trial_LUT(11).Q = [10 0  0 0;
                  0 40 0 0;
                  0 0  0 0;
                  0 0  0 5];
trial_LUT(11).R = 1.5;
trial_LUT(11).wc = 2*2*pi; % parameter required to calculate alpha and theta filter, given in the assignment.
trial_LUT(12).index = 12;
trial_LUT(12).name = 'trial_11';
trial_LUT(12).description = '8x Q elements w.r.t default scenario. Increase state weighting.';
trial_LUT(12).Q = [100 0  0 0;
                  0 160 0 0;
                  0 0  0 0;
                  0 0  0 0];
trial_LUT(12).R = 1.5;
trial_LUT(12).wc = 3*2*pi; % parameter required to calculate alpha and theta filter, given in the assignment.

trial_LUT(13).index = 13;
trial_LUT(13).name = 'trial_11';
trial_LUT(13).description = '8x Q elements w.r.t default scenario. Increase state weighting.';
trial_LUT(13).Q = [100 0  0 0;
                  0 160 0 0;
                  0 0  0 0;
                  0 0  0 0];
trial_LUT(13).R = 1.5;
trial_LUT(13).wc = 1*2*pi; % parameter required to calculate alpha and theta filter, given in the assignment.


trial_LUT(14).index = 14;
trial_LUT(14).name = 'trial_11';
trial_LUT(14).description = '8x Q elements w.r.t default scenario. Increase state weighting.';
trial_LUT(14).Q = [100 0  0 0;
                  0 160 0 0;
                  0 0  0 0;
                  0 0  0 0];
trial_LUT(14).R = 1.5;
trial_LUT(14).wc = 0.2*2*pi; % parameter required to calculate alpha and theta filter, given in the assignment.


trial_display_str = '========= trial name choices start ============\n';
trial_display_str = strcat(trial_display_str, 'index\tname\tdescription\n');
for i=1:length(trial_LUT)
  trial_display_str = strcat(trial_display_str, num2str(trial_LUT(i).index), '\t', trial_LUT(i).name, '\t', trial_LUT(i).description, '\n');
end
trial_display_str = strcat(trial_display_str, '============ trial name choices end ===========\n\n');

%% ====================== %%
%% Directories definition %%
%% ====================== %%

experiment_section_LUT = ["lin_ss_model/", "continuous_slosed_loop/", "realistic_closed_loop/"];
plot_dir_main = './rip/plots/';

fprintf("parameters registered.\n")