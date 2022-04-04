% be sure that this file run after running param.m and lin_state_space.m.
% TODO is digitalization necessary for this part?
%Gaetan: No, assignment 2.2 states the controller is designed in continuous
%time. I guess the discretization comes afterwards. 
load ./rip/lin_ss_model.mat
sys = ss(A,B,C,D);
trial_index  = 1;
fprintf('===============================================\n')
fprintf('=========== starting trial: %s ===========\n', trial_LUT(trial_index).name)
[K,~,~] = lqr(sys,trial_LUT(trial_index).Q,trial_LUT(trial_index).R);
% TODO draw and reason the simulink block.
%Reminder: system state structure = [theta,alpha,diff_theta,diff_alfa]
xd = [0,0,0,0]; %desired convergence state of the system
x0 = [90*pi/180,0,0,0]; %initial state of the system
simOut = sim('continuous_time_sim');
fprintf('completed simulation, now analyzing...\n');
% closed loop eigenvalues (pole-zero plot)
% step response: settling-time, rise-time, overshoot, amount of input-signal, ...
% impulse response; damping, the eigenfrequencies of the closed-loop system, ...
% TODO complete what we want to analyze with the three plots and reasoning.
settling_time = 0;
rise_time = 0;
overshoot = 0;

