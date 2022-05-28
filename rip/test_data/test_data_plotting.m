plot_dir = '../plots/Real_time/';
%% Plotting QR2 setpoint
close all;
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
close all;
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
close all;
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
close all;
%% Plotting QR4 Disturbance
close all;
load('sim_5_disturbance.mat')
label = {'Dist'};
set_pos =77.9;
up_y = 0.5; down_y = -1; minx =73; maxx =103; % axis definition
fig_ctrl = figure('units','normalized','outerposition',[0 0 1 1]);
hold on
plot(meas_ctrl.time,meas_ctrl.signals.values)
xline(set_pos,'-',label)
axis([minx maxx -5 3]);
title('QR4, Disturbance rejection, Real-time Output of Control signal u = -K*(x-x_d)');
legend('$u_{control}$','Interpreter','latex');
xlabel('time [s]');ylabel('Voltage [V]');
saveas(fig_ctrl, strcat(plot_dir,'QR4_disturbance_control.png'));
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
axis([minx maxx -0.1 0.07]);xlabel('time [s]');ylabel('angle [rad]');
subplot(4,1,3);hold on;
xline(set_pos,'-',label);
plot(meas_states.time, meas_states.signals.values(:,3))
title('Real-time Output of $\dot{\theta}$ (equal to the state)','Interpreter','latex')
axis([minx maxx -3 2]);xlabel('time [s]');ylabel('angular velocity [rad/s]');
subplot(4,1,4);hold on;
xline(set_pos,'-',label);
plot(meas_states.time, meas_states.signals.values(:,4))
title('Real-time Output of $\dot{\alpha}$ (equal to the state)','Interpreter','latex')
axis([minx maxx -0.5 0.5]);xlabel('time [s]');ylabel('angular velocity [rad/s]');
sgtitle('QR4, Disturbance rejection, Real-time Output of the estimated state');
saveas(fig_states, strcat(plot_dir,'QR4_disturbance_states.png'));
%% Plotting QR5 setpoint
close all;
load('sim_6_setpoint.mat')
QR = 'QR5';
label = {'x_d','x_0','x_d'};
set_pos1 = 26.55;
set_pos2 = 39.1;
set_pos3 = 60;
set_pos = [set_pos1,set_pos2,set_pos3];
up_y = 0.5; down_y = -1; minx =20; maxx = 50; % axis definition
fig_ctrl = figure('units','normalized','outerposition',[0 0 1 1]);
hold on
plot(meas_ctrl.time,meas_ctrl.signals.values)
xline(set_pos,'-',label)
axis([minx maxx -1.5 1.5]);
title(strcat(QR,', 15° set point, Real-time Output of Control signal u = -K*(x-x_d)'));
legend('$u_{control}$','Interpreter','latex');
xlabel('time [s]');ylabel('Voltage [V]');
saveas(fig_ctrl, strcat(plot_dir,QR,'_setpoint_control.png'));
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
axis([minx maxx -0.05 0.05]);xlabel('time [s]');ylabel('angle [rad]');
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
sgtitle(strcat(QR,', 15° set point, Real-time Output of the estimated state'));
saveas(fig_states, strcat(plot_dir,QR,'_setpoint_states.png'));
%% Plotting QR5 Disturbance
close all;
load('sim_6_disturbance.mat')
label = {'Dist', 'Dist'};
QR = 'QR5';
set_pos =[33.27,55];
up_y = 0.5; down_y = -1; minx =30; maxx =70; % axis definition
fig_ctrl = figure('units','normalized','outerposition',[0 0 1 1]);
hold on
plot(meas_ctrl.time,meas_ctrl.signals.values)
xline(set_pos,'-',label)
axis([minx maxx -3 3]);
title(strcat(QR,', Disturbance rejection, Real-time Output of Control signal u = -K*(x-x_d)'));
legend('$u_{control}$','Interpreter','latex');
xlabel('time [s]');ylabel('Voltage [V]');
saveas(fig_ctrl, strcat(plot_dir,QR,'_disturbance_control.png'));
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
axis([minx maxx -0.1 0.07]);xlabel('time [s]');ylabel('angle [rad]');
subplot(4,1,3);hold on;
xline(set_pos,'-',label);
plot(meas_states.time, meas_states.signals.values(:,3))
title('Real-time Output of $\dot{\theta}$ (equal to the state)','Interpreter','latex')
axis([minx maxx -3 2]);xlabel('time [s]');ylabel('angular velocity [rad/s]');
subplot(4,1,4);hold on;
xline(set_pos,'-',label);
plot(meas_states.time, meas_states.signals.values(:,4))
title('Real-time Output of $\dot{\alpha}$ (equal to the state)','Interpreter','latex')
axis([minx maxx -0.5 0.5]);xlabel('time [s]');ylabel('angular velocity [rad/s]');
sgtitle(strcat(QR,', Disturbance rejection, Real-time Output of the estimated state'));
saveas(fig_states, strcat(plot_dir,QR,'_disturbance_states.png'));
%% Plotting QR6 setpoint
close all;
load('sim_7_setpoint.mat')
QR = 'QR6';
label = {'x_d','x_0','x_d'};
set_pos1 = 21.75;
set_pos2 = 45;
set_pos3 = 60;
set_pos = [set_pos1,set_pos2,set_pos3];
up_y = 0.5; down_y = -1; minx =10; maxx = 40; % axis definition
fig_ctrl = figure('units','normalized','outerposition',[0 0 1 1]);
hold on
plot(meas_ctrl.time,meas_ctrl.signals.values)
xline(set_pos,'-',label)
axis([minx maxx -1.5 1.5]);
title(strcat(QR,', 15° set point, Real-time Output of Control signal u = -K*(x-x_d)'));
legend('$u_{control}$','Interpreter','latex');
xlabel('time [s]');ylabel('Voltage [V]');
saveas(fig_ctrl, strcat(plot_dir,QR,'_setpoint_control.png'));
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
axis([minx maxx -0.05 0.05]);xlabel('time [s]');ylabel('angle [rad]');
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
sgtitle(strcat(QR,', 15° set point, Real-time Output of the estimated state'));
saveas(fig_states, strcat(plot_dir,QR,'_setpoint_states.png'));
%% Plotting QR6 Disturbance
close all;
load('sim_7_disturbance.mat')
label = {'Dist', 'Dist','Dist','Dist','Dist','Dist'};
QR = 'QR6';
set_pos =[52.33,56.405,59.24,62.135,66.954,70.59];
up_y = 0.5; down_y = -1; minx =50; maxx =80; % axis definition
fig_ctrl = figure('units','normalized','outerposition',[0 0 1 1]);
hold on
plot(meas_ctrl.time,meas_ctrl.signals.values)
xline(set_pos,'-',label)
axis([minx maxx -3.5 3]);
title(strcat(QR,', Disturbance rejection, Real-time Output of Control signal u = -K*(x-x_d)'));
legend('$u_{control}$','Interpreter','latex');
xlabel('time [s]');ylabel('Voltage [V]');
saveas(fig_ctrl, strcat(plot_dir,QR,'_disturbance_control.png'));
fig_states = figure('units','normalized','outerposition',[0 0 1 1]);
subplot(4,1,1);hold on;
plot(meas_states.time, meas_states.signals.values(:,1));
xline(set_pos,'-',label);
title('Real-time Output of $\theta$ (equal to the state)','Interpreter','latex')
axis([minx maxx -1 1]);xlabel('time [s]');ylabel('angle [rad]');
subplot(4,1,2);hold on;
xline(set_pos,'-',label);
plot(meas_states.time, meas_states.signals.values(:,2));
title('Real-time Output of $\alpha$ (equal to the state)','Interpreter','latex')
axis([minx maxx -0.1 0.1]);xlabel('time [s]');ylabel('angle [rad]');
subplot(4,1,3);hold on;
xline(set_pos,'-',label);
plot(meas_states.time, meas_states.signals.values(:,3))
title('Real-time Output of $\dot{\theta}$ (equal to the state)','Interpreter','latex')
axis([minx maxx -3 3]);xlabel('time [s]');ylabel('angular velocity [rad/s]');
subplot(4,1,4);hold on;
xline(set_pos,'-',label);
plot(meas_states.time, meas_states.signals.values(:,4))
title('Real-time Output of $\dot{\alpha}$ (equal to the state)','Interpreter','latex')
axis([minx maxx -0.5 0.7]);xlabel('time [s]');ylabel('angular velocity [rad/s]');
sgtitle(strcat(QR,', Disturbance rejection, Real-time Output of the estimated state'));
saveas(fig_states, strcat(plot_dir,QR,'_disturbance_states.png'));
%% Plotting QR7 setpoint
close all;
load('sim_8_setpoint.mat')
QR = 'QR7';
label = {'x_d','x_0','x_d'};
set_pos1 = 57.13;
set_pos2 = 100;
set_pos3 = 120;
set_pos = [set_pos1,set_pos2,set_pos3];
up_y = 0.5; down_y = -1; minx =50; maxx = 80; % axis definition
fig_ctrl = figure('units','normalized','outerposition',[0 0 1 1]);
hold on
plot(meas_ctrl.time,meas_ctrl.signals.values)
xline(set_pos,'-',label)
axis([minx maxx -1.5 1.5]);
title(strcat(QR,', 15° set point, Real-time Output of Control signal u = -K*(x-x_d)'));
legend('$u_{control}$','Interpreter','latex');
xlabel('time [s]');ylabel('Voltage [V]');
saveas(fig_ctrl, strcat(plot_dir,QR,'_setpoint_control.png'));
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
axis([minx maxx -0.05 0.05]);xlabel('time [s]');ylabel('angle [rad]');
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
sgtitle(strcat(QR,', 15° set point, Real-time Output of the estimated state'));
saveas(fig_states, strcat(plot_dir,QR,'_setpoint_states.png'));
%% Plotting QR8 setpoint
close all;
load('sim_9_setpoint.mat')
QR = 'QR8';
label = {'x_d','x_0','x_d'};
set_pos1 = 64.21;
set_pos2 = 40;
set_pos3 = 80;
set_pos = [set_pos1,set_pos2,set_pos3];
up_y = 0.5; down_y = -1; minx =50; maxx = 80; % axis definition
fig_ctrl = figure('units','normalized','outerposition',[0 0 1 1]);
hold on
plot(meas_ctrl.time,meas_ctrl.signals.values)
xline(set_pos,'-',label)
axis([minx maxx -1.5 1.5]);
title(strcat(QR,', 15° set point, Real-time Output of Control signal u = -K*(x-x_d)'));
legend('$u_{control}$','Interpreter','latex');
xlabel('time [s]');ylabel('Voltage [V]');
saveas(fig_ctrl, strcat(plot_dir,QR,'_setpoint_control.png'));
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
axis([minx maxx -0.05 0.01]);xlabel('time [s]');ylabel('angle [rad]');
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
sgtitle(strcat(QR,', 15° set point, Real-time Output of the estimated state'));
saveas(fig_states, strcat(plot_dir,QR,'_setpoint_states.png'));
%% Plotting QR9 disturbance
close all;
load('sim_10_BEST_ALL.mat')
QR = 'QR9';
label = {'Dist','Dist','Dist'};
set_pos1 = 64.21;
set_pos2 = 40.42;
set_pos3 = 80;
set_pos = [set_pos1,set_pos2,set_pos3];
up_y = 0.5; down_y = -1; minx =30; maxx = 50; % axis definition
fig_ctrl = figure('units','normalized','outerposition',[0 0 1 1]);
hold on
plot(meas_ctrl.time,meas_ctrl.signals.values)
xline(set_pos,'-',label)
axis([minx maxx -3 1.5]);
title(strcat(QR,', Disturbance rejection, Real-time Output of Control signal u = -K*(x-x_d)'));
legend('$u_{control}$','Interpreter','latex');
xlabel('time [s]');ylabel('Voltage [V]');
saveas(fig_ctrl, strcat(plot_dir,QR,'_disturbance_control.png'));
fig_states = figure('units','normalized','outerposition',[0 0 1 1]);
subplot(4,1,1);hold on;
plot(meas_states.time, meas_states.signals.values(:,1));
xline(set_pos,'-',label);
title('Real-time Output of $\theta$ (equal to the state)','Interpreter','latex')
axis([minx maxx -1.1 -0.5]);xlabel('time [s]');ylabel('angle [rad]');
subplot(4,1,2);hold on;
xline(set_pos,'-',label);
plot(meas_states.time, meas_states.signals.values(:,2));
title('Real-time Output of $\alpha$ (equal to the state)','Interpreter','latex')
axis([minx maxx -0.07 0.01]);xlabel('time [s]');ylabel('angle [rad]');
subplot(4,1,3);hold on;
xline(set_pos,'-',label);
plot(meas_states.time, meas_states.signals.values(:,3))
title('Real-time Output of $\dot{\theta}$ (equal to the state)','Interpreter','latex')
axis([minx maxx -1.5 1]);xlabel('time [s]');ylabel('angular velocity [rad/s]');
subplot(4,1,4);hold on;
xline(set_pos,'-',label);
plot(meas_states.time, meas_states.signals.values(:,4))
title('Real-time Output of $\dot{\alpha}$ (equal to the state)','Interpreter','latex')
axis([minx maxx -0.3 0.2]);xlabel('time [s]');ylabel('angular velocity [rad/s]');
sgtitle(strcat(QR,', Disturbance rejection, Real-time Output of the estimated state'));
saveas(fig_states, strcat(plot_dir,QR,'_disturbance_states.png'));
%% Plotting QR9 setpoint
close all;
load('sim_10_BEST_ALL.mat')
QR = 'QR9';
label = {'x_d','x_0','x_d'};
set_pos1 = 71.615;
set_pos2 = 40;
set_pos3 = 150;
set_pos = [set_pos1,set_pos2,set_pos3];
up_y = 0.5; down_y = -1; minx =60; maxx = 90; % axis definition
fig_ctrl = figure('units','normalized','outerposition',[0 0 1 1]);
hold on
plot(meas_ctrl.time,meas_ctrl.signals.values)
xline(set_pos,'-',label)
axis([minx maxx -1 1]);
title(strcat(QR,', 15° set point, Real-time Output of Control signal u = -K*(x-x_d)'));
legend('$u_{control}$','Interpreter','latex');
xlabel('time [s]');ylabel('Voltage [V]');
saveas(fig_ctrl, strcat(plot_dir,QR,'_setpoint_control.png'));
fig_states = figure('units','normalized','outerposition',[0 0 1 1]);
subplot(4,1,1);hold on;
plot(meas_states.time, meas_states.signals.values(:,1));
xline(set_pos,'-',label);
title('Real-time Output of $\theta$ (equal to the state)','Interpreter','latex')
axis([minx maxx -0.8 0.5]);xlabel('time [s]');ylabel('angle [rad]');
subplot(4,1,2);hold on;
xline(set_pos,'-',label);
plot(meas_states.time, meas_states.signals.values(:,2));
title('Real-time Output of $\alpha$ (equal to the state)','Interpreter','latex')
axis([minx maxx -0.03 -0.01]);xlabel('time [s]');ylabel('angle [rad]');
subplot(4,1,3);hold on;
xline(set_pos,'-',label);
plot(meas_states.time, meas_states.signals.values(:,3))
title('Real-time Output of $\dot{\theta}$ (equal to the state)','Interpreter','latex')
axis([minx maxx -0.5 0.5]);xlabel('time [s]');ylabel('angular velocity [rad/s]');
subplot(4,1,4);hold on;
xline(set_pos,'-',label);
plot(meas_states.time, meas_states.signals.values(:,4))
title('Real-time Output of $\dot{\alpha}$ (equal to the state)','Interpreter','latex')
axis([minx maxx -0.1 0.1]);xlabel('time [s]');ylabel('angular velocity [rad/s]');
sgtitle(strcat(QR,', 15° set point, Real-time Output of the estimated state'));
saveas(fig_states, strcat(plot_dir,QR,'_setpoint_states.png'));
%% Plotting omega 1 setpoint
close all;
load('sim_11_ALL.mat')
QR = 'QR8';
label = {'x_d','x_0','x_d'};
set_pos1 = 2.175;
set_pos2 = 12.78;
set_pos3 = 150;
set_pos = [set_pos1,set_pos2,set_pos3];
up_y = 0.5; down_y = -1; minx =0; maxx = 20; % axis definition
fig_ctrl = figure('units','normalized','outerposition',[0 0 1 1]);
hold on
plot(meas_ctrl.time,meas_ctrl.signals.values)
xline(set_pos,'-',label)
axis([minx maxx -7 5]);
title(strcat(QR,', 15degree set point, $\omega_{1}$, Real-time Output of Control signal $u = -K*(x-x_d)$'),'Interpreter','latex');
legend('$u_{control}$','Interpreter','latex');
xlabel('time [s]');ylabel('Voltage [V]');
saveas(fig_ctrl, strcat(plot_dir,QR,'_setpoint_control.png'));
fig_states = figure('units','normalized','outerposition',[0 0 1 1]);
subplot(4,1,1);hold on;
plot(meas_states.time, meas_states.signals.values(:,1));
xline(set_pos,'-',label);
title('Real-time Output of $\theta$ (equal to the state)','Interpreter','latex')
xlim([minx maxx]);xlabel('time [s]');ylabel('angle [rad]');
subplot(4,1,2);hold on;
xline(set_pos,'-',label);
plot(meas_states.time, meas_states.signals.values(:,2));
title('Real-time Output of $\alpha$ (equal to the state)','Interpreter','latex')
xlim([minx maxx]);xlabel('time [s]');ylabel('angle [rad]');
subplot(4,1,3);hold on;
xline(set_pos,'-',label);
plot(meas_states.time, meas_states.signals.values(:,3))
title('Real-time Output of $\dot{\theta}$ (equal to the state)','Interpreter','latex')
xlim([minx maxx]);xlabel('time [s]');ylabel('angular velocity [rad/s]');
subplot(4,1,4);hold on;
xline(set_pos,'-',label);
plot(meas_states.time, meas_states.signals.values(:,4))
title('Real-time Output of $\dot{\alpha}$ (equal to the state)','Interpreter','latex')
xlim([minx maxx]);xlabel('time [s]');ylabel('angular velocity [rad/s]');
sgtitle(strcat(QR,', 15degree set point, $\omega_{1}$, Real-time Output of the estimated state'),'Interpreter','latex');
saveas(fig_states, strcat(plot_dir,QR,'_setpoint_states_omega1.png'));
%% Plotting omega 1 disturbance
close all;
load('sim_11_ALL.mat')
QR = 'QR8';
label = {'Dist','Dist','Dist'};
set_pos1 = 30.245;
set_pos2 = 33.285;
set_pos3 = 35.475;
set_pos = [set_pos1,set_pos2,set_pos3];
up_y = 0.5; down_y = -1; minx =20; maxx = 40; % axis definition
fig_ctrl = figure('units','normalized','outerposition',[0 0 1 1]);
hold on
plot(meas_ctrl.time,meas_ctrl.signals.values)
xline(set_pos,'-',label)
xlim([minx maxx]);
title(strcat(QR,', Disturbance rejection, $\omega_{1}$, Real-time Output of Control signal $u = -K*(x-x_d)$'),'Interpreter','latex');
legend('$u_{control}$','Interpreter','latex');
xlabel('time [s]');ylabel('Voltage [V]');
saveas(fig_ctrl, strcat(plot_dir,QR,'_disturbance_control.png'));
fig_states = figure('units','normalized','outerposition',[0 0 1 1]);
subplot(4,1,1);hold on;
plot(meas_states.time, meas_states.signals.values(:,1));
xline(set_pos,'-',label);
title('Real-time Output of $\theta$ (equal to the state)','Interpreter','latex')
xlim([minx maxx]);xlabel('time [s]');ylabel('angle [rad]');
subplot(4,1,2);hold on;
xline(set_pos,'-',label);
plot(meas_states.time, meas_states.signals.values(:,2));
title('Real-time Output of $\alpha$ (equal to the state)','Interpreter','latex')
xlim([minx maxx]);xlabel('time [s]');ylabel('angle [rad]');
subplot(4,1,3);hold on;
xline(set_pos,'-',label);
plot(meas_states.time, meas_states.signals.values(:,3))
title('Real-time Output of $\dot{\theta}$ (equal to the state)','Interpreter','latex')
xlim([minx maxx]);xlabel('time [s]');ylabel('angular velocity [rad/s]');
subplot(4,1,4);hold on;
xline(set_pos,'-',label);
plot(meas_states.time, meas_states.signals.values(:,4))
title('Real-time Output of $\dot{\alpha}$ (equal to the state)','Interpreter','latex')
xlim([minx maxx]);xlabel('time [s]');ylabel('angular velocity [rad/s]');
sgtitle(strcat(QR,', Disturbance rejection, $\omega_{1}$, Real-time Output of the estimated state'),'Interpreter','latex');
saveas(fig_states, strcat(plot_dir,QR,'_disturbance_states_omega1.png'));
%% Plotting omega 2 setpoint
close all;
load('sim_12_ALL.mat')
QR = 'QR8';
label = {'x_d','x_0','x_d'};
set_pos1 = 12.86;
set_pos2 = 2;
set_pos3 = 150;
set_pos = [set_pos1,set_pos2,set_pos3];
up_y = 0.5; down_y = -1; minx =5; maxx = 25; % axis definition
fig_ctrl = figure('units','normalized','outerposition',[0 0 1 1]);
hold on
plot(meas_ctrl.time,meas_ctrl.signals.values)
xline(set_pos,'-',label)
xlim([minx maxx]);
title(strcat(QR,', 15° set point, Real-time Output of Control signal u = -K*(x-x_d)'));
legend('$u_{control}$','Interpreter','latex');
xlabel('time [s]');ylabel('Voltage [V]');
saveas(fig_ctrl, strcat(plot_dir,QR,'_setpoint_control.png'));
fig_states = figure('units','normalized','outerposition',[0 0 1 1]);
subplot(4,1,1);hold on;
plot(meas_states.time, meas_states.signals.values(:,1));
xline(set_pos,'-',label);
title('Real-time Output of $\theta$ (equal to the state)','Interpreter','latex')
xlim([minx maxx]);xlabel('time [s]');ylabel('angle [rad]');
subplot(4,1,2);hold on;
xline(set_pos,'-',label);
plot(meas_states.time, meas_states.signals.values(:,2));
title('Real-time Output of $\alpha$ (equal to the state)','Interpreter','latex')
xlim([minx maxx]);xlabel('time [s]');ylabel('angle [rad]');
subplot(4,1,3);hold on;
xline(set_pos,'-',label);
plot(meas_states.time, meas_states.signals.values(:,3))
title('Real-time Output of $\dot{\theta}$ (equal to the state)','Interpreter','latex')
xlim([minx maxx]);xlabel('time [s]');ylabel('angular velocity [rad/s]');
subplot(4,1,4);hold on;
xline(set_pos,'-',label);
plot(meas_states.time, meas_states.signals.values(:,4))
title('Real-time Output of $\dot{\alpha}$ (equal to the state)','Interpreter','latex')
xlim([minx maxx]);xlabel('time [s]');ylabel('angular velocity [rad/s]');
sgtitle(strcat(QR,', 15° set point, Real-time Output of the estimated state'));
saveas(fig_states, strcat(plot_dir,QR,'_setpoint_states_omega2.png'));
%% Plotting omega 2 disturbance
close all;
load('sim_12_ALL.mat')
QR = 'QR8';
label = {'Dist','Dist','Dist'};
set_pos1 = 30.55;
set_pos2 = 42.8;
set_pos3 = 60;
set_pos = [set_pos1,set_pos2,set_pos3];
up_y = 0.5; down_y = -1; minx =25; maxx = 50; % axis definition
fig_ctrl = figure('units','normalized','outerposition',[0 0 1 1]);
hold on
plot(meas_ctrl.time,meas_ctrl.signals.values)
xline(set_pos,'-',label)
xlim([minx maxx]);
title(strcat(QR,', Disturbance rejection, $\omega_{2}$, Real-time Output of Control signal $u = -K*(x-x_d)$'),'Interpreter','latex');
legend('$u_{control}$','Interpreter','latex');
xlabel('time [s]');ylabel('Voltage [V]');
saveas(fig_ctrl, strcat(plot_dir,QR,'_disturbance_control.png'));
fig_states = figure('units','normalized','outerposition',[0 0 1 1]);
subplot(4,1,1);hold on;
plot(meas_states.time, meas_states.signals.values(:,1));
xline(set_pos,'-',label);
title('Real-time Output of $\theta$ (equal to the state)','Interpreter','latex')
xlim([minx maxx]);xlabel('time [s]');ylabel('angle [rad]');
subplot(4,1,2);hold on;
xline(set_pos,'-',label);
plot(meas_states.time, meas_states.signals.values(:,2));
title('Real-time Output of $\alpha$ (equal to the state)','Interpreter','latex')
xlim([minx maxx]);xlabel('time [s]');ylabel('angle [rad]');
subplot(4,1,3);hold on;
xline(set_pos,'-',label);
plot(meas_states.time, meas_states.signals.values(:,3))
title('Real-time Output of $\dot{\theta}$ (equal to the state)','Interpreter','latex')
xlim([minx maxx]);xlabel('time [s]');ylabel('angular velocity [rad/s]');
subplot(4,1,4);hold on;
xline(set_pos,'-',label);
plot(meas_states.time, meas_states.signals.values(:,4))
title('Real-time Output of $\dot{\alpha}$ (equal to the state)','Interpreter','latex')
xlim([minx maxx]);xlabel('time [s]');ylabel('angular velocity [rad/s]');
sgtitle(strcat(QR,', Disturbance rejection, $\omega_{2}$, Real-time Output of the estimated state'),'Interpreter','latex');
saveas(fig_states, strcat(plot_dir,QR,'_disturbance_states_omega2.png'));
%% Plotting omega 3 setpoint
close all;
load('sim_13_ALL.mat')
QR = 'QR8';
label = {'x_d','x_0','x_d'};
set_pos1 = 34.66;
set_pos2 = 2;
set_pos3 = 150;
set_pos = [set_pos1,set_pos2,set_pos3];
up_y = 0.5; down_y = -1; minx =30; maxx = 40; % axis definition
fig_ctrl = figure('units','normalized','outerposition',[0 0 1 1]);
hold on
plot(meas_ctrl.time,meas_ctrl.signals.values)
xline(set_pos,'-',label)
xlim([minx maxx]);
title(strcat(QR,', 15degree set point, $\omega_{3}$, Real-time Output of Control signal $u = -K*(x-x_d)$'),'Interpreter','latex');
legend('$u_{control}$','Interpreter','latex');
xlabel('time [s]');ylabel('Voltage [V]');
saveas(fig_ctrl, strcat(plot_dir,QR,'_setpoint_control.png'));
fig_states = figure('units','normalized','outerposition',[0 0 1 1]);
subplot(4,1,1);hold on;
plot(meas_states.time, meas_states.signals.values(:,1));
xline(set_pos,'-',label);
title('Real-time Output of $\theta$ (equal to the state)','Interpreter','latex')
xlim([minx maxx]);xlabel('time [s]');ylabel('angle [rad]');
subplot(4,1,2);hold on;
xline(set_pos,'-',label);
plot(meas_states.time, meas_states.signals.values(:,2));
title('Real-time Output of $\alpha$ (equal to the state)','Interpreter','latex')
xlim([minx maxx]);xlabel('time [s]');ylabel('angle [rad]');
subplot(4,1,3);hold on;
xline(set_pos,'-',label);
plot(meas_states.time, meas_states.signals.values(:,3))
title('Real-time Output of $\dot{\theta}$ (equal to the state)','Interpreter','latex')
xlim([minx maxx]);xlabel('time [s]');ylabel('angular velocity [rad/s]');
subplot(4,1,4);hold on;
xline(set_pos,'-',label);
plot(meas_states.time, meas_states.signals.values(:,4))
title('Real-time Output of $\dot{\alpha}$ (equal to the state)','Interpreter','latex')
xlim([minx maxx]);xlabel('time [s]');ylabel('angular velocity [rad/s]');
sgtitle(strcat(QR,', 15degree set point, $\omega_{3}$, Real-time Output of the estimated state'),'Interpreter','latex');
saveas(fig_states, strcat(plot_dir,QR,'_setpoint_states_omega3.png'));
%% Plotting omega 3 disturbance
close all;
load('sim_13_ALL.mat')
QR = 'QR8';
label = {'Dist','Dist','Dist'};
set_pos1 = 61.745;
set_pos2 = 65.4;
set_pos3 = 80;
set_pos = [set_pos1,set_pos2,set_pos3];
up_y = 0.5; down_y = -1; minx =58; maxx = 67; % axis definition
fig_ctrl = figure('units','normalized','outerposition',[0 0 1 1]);
hold on
plot(meas_ctrl.time,meas_ctrl.signals.values)
xline(set_pos,'-',label)
xlim([minx maxx]);
title(strcat(QR,' Disturbance rejection $\omega_{3}$ Real-time Output of Control signal $u = -K*(x-x_d$)'),'Interpreter','latex');
legend('$u_{control}$','Interpreter','latex');
xlabel('time [s]');ylabel('Voltage [V]');
saveas(fig_ctrl, strcat(plot_dir,QR,'_disturbance_control.png'));
fig_states = figure('units','normalized','outerposition',[0 0 1 1]);
subplot(4,1,1);hold on;
plot(meas_states.time, meas_states.signals.values(:,1));
xline(set_pos,'-',label);
title('Real-time Output of $\theta$ (equal to the state)','Interpreter','latex')
xlim([minx maxx]);xlabel('time [s]');ylabel('angle [rad]');
subplot(4,1,2);hold on;
xline(set_pos,'-',label);
plot(meas_states.time, meas_states.signals.values(:,2));
title('Real-time Output of $\alpha$ (equal to the state)','Interpreter','latex')
xlim([minx maxx]);xlabel('time [s]');ylabel('angle [rad]');
subplot(4,1,3);hold on;
xline(set_pos,'-',label);
plot(meas_states.time, meas_states.signals.values(:,3))
title('Real-time Output of $\dot{\theta}$ (equal to the state)','Interpreter','latex')
xlim([minx maxx]);xlabel('time [s]');ylabel('angular velocity [rad/s]');
subplot(4,1,4);hold on;
xline(set_pos,'-',label);
plot(meas_states.time, meas_states.signals.values(:,4))
title('Real-time Output of $\dot{\alpha}$ (equal to the state)','Interpreter','latex')
xlim([minx maxx]);xlabel('time [s]');ylabel('angular velocity [rad/s]');
sgtitle(strcat(QR,' Disturbance rejection $\omega_{3}$ Real-time Output of the estimated state'),'Interpreter','latex');
saveas(fig_states, strcat(plot_dir,QR,'_disturbance_states_omega3.png'));
