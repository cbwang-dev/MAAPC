plot_dir = '../plots/Real_time/';
%% Plotting QR2 setpoint
load('sim_3_setpoint.mat')
set_pos = 32;
label = {'x_d'};
up_y = 0.5; down_y = -1; minx =20; maxx = 50; % axis definition
fig_ctrl = figure('units','normalized','outerposition',[0 0 1 1]);
hold on
plot(meas_ctrl.time,meas_ctrl.signals.values)
xline(set_pos,'-',label)
axis([minx maxx -1 1]);
title('QR2, 15° set point, Real-time Output of Control signal u = -K*(x-x_d)');
legend('$u_{control}$','Interpreter','latex');
xlabel('time [s]');ylabel('Voltage [V]');
saveas(fig_ctrl, strcat(plot_dir,'QR2_setpoint_control.png'));
fig_states = figure('units','normalized','outerposition',[0 0 1 1]);
subplot(4,1,1);hold on;
plot(meas_states.time, meas_states.signals.values(:,1));
xline(set_pos,'-',label);
title('Real-time Output of $\theta$ (equal to the state)','Interpreter','latex')
axis([minx maxx -0.5 1]);xlabel('time [s]');ylabel('angle [rad]');
subplot(4,1,2);hold on;
xline(set_pos,'-',label);
plot(meas_states.time, meas_states.signals.values(:,2));
title('Real-time Output of $\alpha$ (equal to the state)','Interpreter','latex')
axis([minx maxx -0.03 0.03]);xlabel('time [s]');ylabel('angle [rad]');
subplot(4,1,3);hold on;
xline(set_pos,'-',label);
plot(meas_states.time, meas_states.signals.values(:,3))
title('Real-time Output of $\dot{\theta}$ (equal to the state)','Interpreter','latex')
axis([minx maxx -1 1]);xlabel('time [s]');ylabel('angular velocity [rad/s]');
subplot(4,1,4);hold on;
xline(set_pos,'-',label);
plot(meas_states.time, meas_states.signals.values(:,4))
title('Real-time Output of $\dot{\alpha}$ (equal to the state)','Interpreter','latex')
axis([minx maxx -0.2 0.2]);xlabel('time [s]');ylabel('angular velocity [rad/s]');
sgtitle('QR2, 15° set point, Real-time Output of the estimated state');
saveas(fig_states, strcat(plot_dir,'QR2_setpoint_states.png'));
%% Plotting QR2 Disturbance
load('sim_3_disturbance.mat')
label = {'Dist'};
set_pos =74.495;
up_y = 0.5; down_y = -1; minx =60; maxx =90; % axis definition
fig_ctrl = figure('units','normalized','outerposition',[0 0 1 1]);
hold on
plot(meas_ctrl.time,meas_ctrl.signals.values)
xline(set_pos,'-',label)
axis([minx maxx -3 3]);
title('QR2, Disturbance rejection, Real-time Output of Control signal u = -K*(x-x_d)');
legend('$u_{control}$','Interpreter','latex');
xlabel('time [s]');ylabel('Voltage [V]');
saveas(fig_ctrl, strcat(plot_dir,'QR2_disturbance_control.png'));
fig_states = figure('units','normalized','outerposition',[0 0 1 1]);
subplot(4,1,1);hold on;
plot(meas_states.time, meas_states.signals.values(:,1));
xline(set_pos,'-',label);
title('Real-time Output of $\theta$ (equal to the state)','Interpreter','latex')
axis([minx maxx -1 0.5]);xlabel('time [s]');ylabel('angle [rad]');
subplot(4,1,2);hold on;
xline(set_pos,'-',label);
plot(meas_states.time, meas_states.signals.values(:,2));
title('Real-time Output of $\alpha$ (equal to the state)','Interpreter','latex')
axis([minx maxx -0.07 0.07]);xlabel('time [s]');ylabel('angle [rad]');
subplot(4,1,3);hold on;
xline(set_pos,'-',label);
plot(meas_states.time, meas_states.signals.values(:,3))
title('Real-time Output of $\dot{\theta}$ (equal to the state)','Interpreter','latex')
axis([minx maxx -2 2]);xlabel('time [s]');ylabel('angular velocity [rad/s]');
subplot(4,1,4);hold on;
xline(set_pos,'-',label);
plot(meas_states.time, meas_states.signals.values(:,4))
title('Real-time Output of $\dot{\alpha}$ (equal to the state)','Interpreter','latex')
axis([minx maxx -0.5 0.5]);xlabel('time [s]');ylabel('angular velocity [rad/s]');
sgtitle('QR2, Disturbance rejection, Real-time Output of the estimated state');
saveas(fig_states, strcat(plot_dir,'QR2_disturbance_states.png'));
%% Plotting QR4 setpoint
load('sim_5_setpoint.mat')
label = {'x_d','x_0','x_d'};
set_pos1 = 14.365;
set_pos2 = 19.485;
set_pos3 = 24.335;
set_pos = [set_pos1,set_pos2,set_pos3];
up_y = 0.5; down_y = -1; minx =10; maxx = 40; % axis definition
fig_ctrl = figure('units','normalized','outerposition',[0 0 1 1]);
hold on
plot(meas_ctrl.time,meas_ctrl.signals.values)
xline(set_pos,'-',label)
axis([minx maxx -1.2 1.2]);
title('QR4, 15° set point, Real-time Output of Control signal u = -K*(x-x_d)');
legend('$u_{control}$','Interpreter','latex');
xlabel('time [s]');ylabel('Voltage [V]');
saveas(fig_ctrl, strcat(plot_dir,'QR4_setpoint_control.png'));
fig_states = figure('units','normalized','outerposition',[0 0 1 1]);
subplot(4,1,1);hold on;
plot(meas_states.time, meas_states.signals.values(:,1));
xline(set_pos,'-',label);
title('Real-time Output of $\theta$ (equal to the state)','Interpreter','latex')
axis([minx maxx -0.5 0.5]);xlabel('time [s]');ylabel('angle [rad]');
subplot(4,1,2);hold on;
xline(set_pos,'-',label);
plot(meas_states.time, meas_states.signals.values(:,2));
title('Real-time Output of $\alpha$ (equal to the state)','Interpreter','latex')
axis([minx maxx -0.03 0.03]);xlabel('time [s]');ylabel('angle [rad]');
subplot(4,1,3);hold on;
xline(set_pos,'-',label);
plot(meas_states.time, meas_states.signals.values(:,3))
title('Real-time Output of $\dot{\theta}$ (equal to the state)','Interpreter','latex')
axis([minx maxx -1 1]);xlabel('time [s]');ylabel('angular velocity [rad/s]');
subplot(4,1,4);hold on;
xline(set_pos,'-',label);
plot(meas_states.time, meas_states.signals.values(:,4))
title('Real-time Output of $\dot{\alpha}$ (equal to the state)','Interpreter','latex')
axis([minx maxx -0.2 0.2]);xlabel('time [s]');ylabel('angular velocity [rad/s]');
sgtitle('QR4, 15° set point, Real-time Output of the estimated state');
saveas(fig_states, strcat(plot_dir,'QR4_setpoint_states.png'));