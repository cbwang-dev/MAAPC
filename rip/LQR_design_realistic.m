% be sure that this file run after running param.m and lin_state_space.m
% and LQR_design.m. 
load ./rip/lin_ss_model.mat
load ./rip/lin_cl_ss_model.mat
C=eye(4,4);   % we can only measure alpha and theta
D=zeros(4,1); % we can only measure alpha and theta
sys = ss(A,B,C,D);
sys_cl = ss(A_feedback,B_feedback, C, D);
% Discretization of the closed loop sytstem
% Use of the biliniear rule: guaratneed stable pole mapping, Dwonside: loss
% of physical meaning

trial_index  = 4;
[K_control,~,~] = lqr(sys,trial_LUT(trial_index).Q,trial_LUT(trial_index).R);
%Check of the poles

% figure
% pzmap(cl_tf_DT_bilinear)
% title('Closed loop discrete system pole zero plot')
% 
% figure
% pzmap(tf_DT_bilinear)
% title('Open loop discrete system pole zero plot')
%TODO: Pole diagrams reveal that the open loop system becomes unstable
%after discretization => visible in simulink response. But: the closed loop
%system remains stable and that is technically the one implemented



%[A_dst,B_dst,C_dst,D_dst] = ssdata(tf_DT_bilinear);
%% Simulink simulation of discrete closed loop system
% TODO draw and reason the simulink block.
%Reminder: system state structure = [theta,alpha,diff_theta,diff_alfa]

%Preparing the simulation parameters
x0 = [0,0,0,0]; %initial state of the system
xd = [30*pi/180,0,0,0]; %desired convergence state of the system
n  = 0.0005; %scaling of the white measurement noise into the system (assumption)
wc = 2*2*pi;
Ts = 1/200; %As the sampling frequency is 200Hz
K = 1;
Vsat = 5;
Vquant = 20/(2^16);
simOut = sim('discrete_time_realistic_sim');
%% Simulink data anlysis
state_seq_pos = simOut.logsout{4};
state_seq_diff_theta = simOut.logsout{2};
state_seq_diff_alpha = simOut.logsout{1};
u_control = simOut.logsout{5};
up_y = 0.5;
down_y = -0.5;
minx = 0;
maxx = 5;

figure('units','normalized','outerposition',[0 0 1 1]);
subplot(4,1,1)
plot(state_seq_pos.Values.Time, state_seq_pos.Values.data(:,1))
title('Simulink Output of the theta angle (equal to the state)')
axis([minx maxx down_y up_y])
xlabel('time [s]')
ylabel('angle (rad)')
subplot(4,1,2)
plot(state_seq_pos.Values.Time, state_seq_pos.Values.data(:,2))
axis([minx maxx down_y up_y])
title('Simulink Output of the alpha angle (equal to the state)')
xlabel('time [s]')
ylabel('angule (rad)')
subplot(4,1,3)
plot(state_seq_diff_theta.Values.Time, state_seq_diff_theta.Values.data)
axis([minx maxx down_y up_y])
title('Simulink Output of the theta diff angle (equal to the state)')
xlabel('time [s]')
ylabel('angular velocity (rad/s)')
subplot(4,1,4)
plot(state_seq_diff_alpha.Values.Time, state_seq_diff_alpha.Values.data)
axis([minx maxx down_y up_y])
title('Simulink Output of the alpha diff angle (equal to the state)')
xlabel('time [s]')
ylabel('angular velocity (rad/s)')
%saveas(fig_out,strcat('rip/plots/Q_and_R_plots/Set_index_',int2str(trial_index),'/sim_out.png'))
clear fig_out;

figure('units','normalized','outerposition',[0 0 1 1]);
plot(u_control.Values.Time, u_control.Values.data);
title('Simulink Control signal u = -K*(x-xd)')
xlabel('time [s]')
ylabel('Voltage [V]')
%saveas(fig_control,strcat('rip/plots/Q_and_R_plots/Set_index_',int2str(trial_index),'/sim_control.png'))
clear fig_control;

% figure('units','normalized','outerposition',[0 0 1 1]);
% plot(simOut.tout, u_meas.Values.data);
% title('Simulink Measured signal')
% xlabel('time [s]')
% ylabel('Voltage [V]')
% %saveas(fig_control,strcat('rip/plots/Q_and_R_plots/Set_index_',int2str(trial_index),'/sim_control.png'))
% clear fig_control;

