% be sure that this file run after running param.m and lin_state_space.m.
% TODO is digitalization necessary for this part?
load lin_ss_model.mat
sys = ss(A,B,C,D);
fprintf('===============================================\n')
fprintf('=========== starting trial: %s ===========\n', trial)
fprintf('description: %s\n', description)
[K,~,~] = lqr(sys,Q,R);
% TODO draw and reason the simulink block.
fprintf('completed simulation, now analyzing...\n');
% closed loop eigenvalues (pole-zero plot)
% step response: settling-time, rise-time, overshoot, amount of input-signal, ...
% impulse response; damping, the eigenfrequencies of the closed-loop system, ...
% TODO complete what we want to analyze with the three plots and reasoning.
settling_time = 0;
rise_time = 0;
overshoot = 0;

