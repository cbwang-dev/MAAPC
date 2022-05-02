% parameters

fs = 200; % sample frequency
load ./rip/lin_ss_model.mat
load ./rip/lin_cl_ss_model.mat % NOTE how to generate this?
C=eye(4,4);   % we can only measure alpha and theta
D=zeros(4,1); % we can only measure alpha and theta

x0 = [0, 0, 0, 0]; xd = [0, 0, 0, 0]; 
% initial and desired state of the system should be updated after the experiment scenario is set.
experiment_scenario = "setPointTracking"; % choices are "setPointTracking" or "disturbanceRejection"
if experiment_scenario == "setPointTracking"
  % define when the setpoint is changed and the amplitude of the change
  setpoint_change_timestamp = 2; % in seconds
  in_delay = setpoint_change_timestamp * fs; % in number of samples.
  setpoint_theta= 90; % in degree, not in radian.
  x0 = x0; % initial state not changed in set point tracking, still zero * 4.
  xd = [setpoint_theta*pi/180, 0, 0, 0]; % degree to radian conversion
elseif experiment_scenario == "disturbanceRejection"
  disturbance_alpha = 30; % disturbance over alpha, in degrees. We can check on the boundary values of this disturbance.
  x0 = [0, disturbance_alpha*pi/180, 0, 0]; % initial state of the system is updated
  xd = xd; % desired state not changed in disturbance rejection, still zero * 4.
else
  error("Unknown experiment scenario");
end

% simulink diagram related parameters
n  = 0.0005; % scaling of the white measurement noise into the system (assumption, and need to be estimated in the real experiment) and it iscombined with thepower of bandlimited noise  block in simulink diagram
wc = 2*2*pi; % parameter required to calculate alpha and theta filter, given in the assignment.
K = 1; % parameter required to calculate alpha and theta filter, given in the assignment.
Ts = 1 / fs;
Vsat = 5; % saturation voltage, [Vsat, -Vsat]
Vquant = 20/(2^16); % quantizer interval, Chengbin has some questions to that. Additional to the email, I think we can add additional saturation block to that position.
% discretizationStrategy = 0; % now bilinear interpolation is used, maybe other discretization strategy can be explored.


%% ======================================== %%
%% evaluate all trials and save the results %%
%% ======================================== %%



for i = 1:length(trial_LUT) % conduct independent experiments.
  fprintf("\nINFO: starting trial %d\n", i);
  trial_index = i;
  ax_all(i) = strcat("trial ",num2str(i));
  Q = trial_LUT(trial_index).Q;
  R = trial_LUT(trial_index).R;
  [K_control,~,~] = lqr(sys, Q, R); % K_control is fed into the simulink diagram
  simOut = sim('discrete_time_realistic_sim');

  % print out the necessary information
  fprintf("description: %s\n", trial_LUT(trial_index).description);
  fprintf("experiment scenario: %s\n", experiment_scenario);

  %% ========================================= %%
  %% experiment results and generating figures %%
  %% ========================================= %%

  % parameters out, if simulink diagram is changed, modify the corresponding mappings
  state_seq_diff_alpha = simOut.logsout{1}; % outport of discrete derivative,  discrete derivative of theta
  state_seq_diff_theta = simOut.logsout{2}; % outport of discrete derivative1, discrete derivative of alpha
  % TODO there is some mis mapping between different variables (state_seq_diff_alpha en state_seq_diff_theta)
  u_control_noSaturate = simOut.logsout{3}; % outport of gain1 (inport of the saturation block)
  state_seq_pos        = simOut.logsout{4}; % outport of quantizer block
  u_control            = simOut.logsout{5}; % outport of the saturation block
  % = simOut.logsout{6}; % outport of the state space block (continuous)
  up_y = pi; down_y = -pi; minx = 0; maxx = 5; % axis definition

  % Figures
  plot_dir = strcat(plot_dir_main, experiment_section_LUT(3), num2str(trial_index), '/');

  fig_states = figure(); % four states changing over time
  subplot(4,1,1);hold on;
  plot(state_seq_pos.Values.Time, state_seq_pos.Values.data(:,1));
  title('Simulink Output of $\theta$ (equal to the state)','Interpreter','latex')
  axis([minx maxx down_y up_y]);xlabel('time [s]');ylabel('angle [rad]');
  subplot(4,1,2);hold on;
  plot(state_seq_pos.Values.Time, state_seq_pos.Values.data(:,2));
  title('Simulink Output of $\alpha$ (equal to the state)','Interpreter','latex')
  axis([minx maxx down_y up_y]);xlabel('time [s]');ylabel('angle [rad]');
  subplot(4,1,3);hold on;
  plot(state_seq_diff_theta.Values.Time, state_seq_diff_theta.Values.data)
  title('Simulink Output of $\dot{\theta}$ (equal to the state)','Interpreter','latex')
  axis([minx maxx down_y up_y]);xlabel('time [s]');ylabel('angular velocity [rad/s]');
  subplot(4,1,4);hold on;
  plot(state_seq_diff_alpha.Values.Time, state_seq_diff_alpha.Values.data)
  title('Simulink Output of $\dot{\alpha}$ (equal to the state)','Interpreter','latex')
  axis([minx maxx down_y up_y]);xlabel('time [s]');ylabel('angular velocity [rad/s]');
  saveas(fig_states, strcat(plot_dir,'fig_1_4_states.fig'));
  saveas(fig_states, strcat(plot_dir,'fig_1_4_states.png'));

  fig_ctrl = figure(); % control signal, before and after saturation
  plot(u_control.Values.Time, u_control_noSaturate.Values.data);hold on;
  plot(u_control.Values.Time, u_control.Values.data);
  title('Simulink Output of Control signal $u = -K*(x-x_d)$','Interpreter','latex');
  legend('$u_{control}$ before saturation','$u_{control}$ after saturation','Interpreter','latex');
  xlabel('time [s]');ylabel('Voltage [V]');
  saveas(fig_ctrl, strcat(plot_dir,'fig_2_ctrl_sigs.fig'));
  saveas(fig_ctrl, strcat(plot_dir,'fig_2_ctrl_sigs.png'));
  close all;
  fprintf("INFO: saved all independent plotted figures in %s for trial %d\n", plot_dir, i);
end

fprintf("INFO: combine all plots into one separate plot\n");
ax_all = string(zeros(1,length(trial_LUT))); 
for i = 1:length(trial_LUT) % conduct independent experiments.
  trial_index = i;
  ax_all(i) = strcat("trial ",num2str(i));
  Q = trial_LUT(trial_index).Q;
  R = trial_LUT(trial_index).R;
  [K_control,~,~] = lqr(sys, Q, R); % K_control is fed into the simulink diagram
  simOut = sim('discrete_time_realistic_sim');

  %% ========================================= %%
  %% experiment results and generating figures %%
  %% ========================================= %%

  % parameters out, if simulink diagram is changed, modify the corresponding mappings
  state_seq_diff_theta = simOut.logsout{1}; % outport of discrete derivative,  discrete derivative of theta
  state_seq_diff_alpha = simOut.logsout{2}; % outport of discrete derivative1, discrete derivative of alpha
  % TODO there is some mis mapping between different variables (state_seq_diff_alpha en state_seq_diff_theta)
  u_control_noSaturate = simOut.logsout{3}; % outport of gain1 (inport of the saturation block)
  state_seq_pos        = simOut.logsout{4}; % outport of quantizer block
  u_control            = simOut.logsout{5}; % outport of the saturation block
  % = simOut.logsout{6}; % outport of the state space block (continuous)
  up_y = pi; down_y = -pi; minx = 0; maxx = 5; % axis definition

  % Figures
  figure(1); % four states changing over time
  subplot(4,1,1);hold on;
  plot(state_seq_pos.Values.Time, state_seq_pos.Values.data(:,1));
  title('Simulink Output of $\theta$ (equal to the state)','Interpreter','latex')
  axis([minx maxx down_y up_y]);xlabel('time [s]');ylabel('angle [rad]');ax1=gca;
  subplot(4,1,2);hold on;
  plot(state_seq_pos.Values.Time, state_seq_pos.Values.data(:,2));
  title('Simulink Output of $\alpha$ (equal to the state)','Interpreter','latex')
  axis([minx maxx down_y up_y]);xlabel('time [s]');ylabel('angle [rad]');ax2=gca;
  subplot(4,1,3);hold on;
  plot(state_seq_diff_theta.Values.Time, state_seq_diff_theta.Values.data)
  title('Simulink Output of $\dot{\theta}$ (equal to the state)','Interpreter','latex')
  axis([minx maxx down_y up_y]);xlabel('time [s]');ylabel('angular velocity [rad/s]');ax3=gca;
  subplot(4,1,4);hold on;
  plot(state_seq_diff_alpha.Values.Time, state_seq_diff_alpha.Values.data)
  title('Simulink Output of $\dot{\alpha}$ (equal to the state)','Interpreter','latex')
  axis([minx maxx down_y up_y]);xlabel('time [s]');ylabel('angular velocity [rad/s]');ax4=gca;

  figure(2); % control signal, before and after saturation
  subplot(2,1,1);hold on;
  plot(u_control.Values.Time, u_control_noSaturate.Values.data);
  title('Simulink Output of Control signal $u = -K*(x-x_d)$ (before saturation block)','Interpreter','latex')
  xlabel('time [s]');ylabel('Voltage [V]');ax5=gca;
  subplot(2,1,2);hold on;
  plot(u_control.Values.Time, u_control.Values.data);hold on;
  title('Simulink Output of Control signal $u = -K*(x-x_d)$ (after saturation block)','Interpreter','latex')
  xlabel('time [s]');ylabel('Voltage [V]');ax6=gca;
end
legend(ax1,ax_all);legend(ax2,ax_all);legend(ax3,ax_all);legend(ax4,ax_all);
legend(ax5,ax_all);legend(ax6,ax_all);
plot_dir = strcat(plot_dir_main, experiment_section_LUT(3), 'all', '/');
if ~exist(plot_dir, 'dir')
  mkdir(plot_dir);
end
saveas(figure(1), strcat(plot_dir,'fig_1_4_states.fig'));
saveas(figure(1), strcat(plot_dir,'fig_1_4_states.png'));
saveas(figure(2), strcat(plot_dir,'fig_2_ctrl_sigs.fig'));
saveas(figure(2), strcat(plot_dir,'fig_2_ctrl_sigs.png'));
close all