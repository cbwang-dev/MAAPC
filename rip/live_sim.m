%% Loading parameters
trial_index = 1;
fprintf("\nINFO: starting trial %d\n", trial_index);
Q = trial_LUT(trial_index).Q;
R = trial_LUT(trial_index).R;
[K_control,~,~] = lqr(sys, Q, R); % K_control is fed into the simulink diagram
experiment_scenario = "disturbanceRejection"; % choices are "setPointTracking" or "disturbanceRejection"
%Simulink parameters
% simulink diagram related parameters
wc = 2*2*pi; % parameter required to calculate alpha and theta filter, given in the assignment.
K = 1; % parameter required to calculate alpha and theta filter, given in the assignment.
Ts = 1 / fs;

x0 = [0, 0, 0, 0]; xd = [0, 0, 0, 0]; 
% initial and desired state of the system should be updated after the experiment scenario is set.
if experiment_scenario == "setPointTracking"  % define when the setpoint is changed and the amplitude of the change
  setpoint_theta= 90; % in degree, not in radian.
  x0 = x0; % initial state not changed in set point tracking, still zero * 4.
  xd = [setpoint_theta*pi/180, 0, 0, 0]; % degree to radian conversion
elseif experiment_scenario == "disturbanceRejection"
  xd = xd; % desired state not changed in disturbance rejection, still zero * 4.
else
  error("Unknown experiment scenario");
end

%% Saving simout
save('sim1.mat','simout''Q','R','x0','xd','wc','K_control');
