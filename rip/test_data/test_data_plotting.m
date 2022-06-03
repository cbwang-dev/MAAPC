plot_dir = '../plots/Real_time/';
%% Plotting Default setpoint
close all;
load('sim_1_ALL_5_30.mat')
QR = 'Default';
set_pos = [80.125,99.11];
label = {'x_d','x_0'};
up_y = 0.5; down_y = -1; minx =75; maxx = 105; % axis definition
fig_ctrl = figure('units','normalized','outerposition',[0 0 1 1]);
hold on
plot(meas_ctrl.time,meas_ctrl.signals.values)
xline(set_pos,'-',label)
xlim([minx maxx]);
title(strcat(QR,', 15° set point, Real-time Output of Control signal u = -K*(x-x_d)'),'FontSize',25);
legend('$u_{control}$','Interpreter','latex');
xlabel('time [s]');ylabel('Voltage [V]');
saveas(fig_ctrl, strcat(plot_dir,'Default_setpoint_control.png'));
fig_states = figure('units','normalized','outerposition',[0 0 1 1]);
subplot(4,1,1);hold on;
plot(meas_states.time, meas_states.signals.values(:,1));
xline(set_pos,'-',label);
title('Real-time Output of $\theta$ (equal to the state)','Interpreter','latex','FontSize',15)
xlim([minx maxx]);xlabel('time [s]');ylabel('angle [rad]');
subplot(4,1,2);hold on;
xline(set_pos,'-',label);
plot(meas_states.time, meas_states.signals.values(:,2));
title('Real-time Output of $\alpha$ (equal to the state)','Interpreter','latex','FontSize',15)
xlim([minx maxx]);xlabel('time [s]');ylabel('angle [rad]');
subplot(4,1,3);hold on;
xline(set_pos,'-',label);
plot(meas_states.time, meas_states.signals.values(:,3))
title('Real-time Output of $\dot{\theta}$ (equal to the state)','Interpreter','latex','FontSize',15)
xlim([minx maxx]);xlabel('time [s]');ylabel('angular velocity [rad/s]');
subplot(4,1,4);hold on;
xline(set_pos,'-',label);
plot(meas_states.time, meas_states.signals.values(:,4))
title('Real-time Output of $\dot{\alpha}$ (equal to the state)','Interpreter','latex','FontSize',15)
xlim([minx maxx]);xlabel('time [s]');ylabel('angular velocity [rad/s]');
sgtitle(strcat(QR,', 15° set point, Real-time Output of the estimated state'),'FontSize',25);
saveas(fig_states, strcat(plot_dir,'Default_setpoint_states.png'));
%% Default Disturbance
close all;
load('sim_1_ALL_5_30.mat')
label = {'Dist','Dist','Dist','Dist'};
QR = 'Default';
set_pos =[237.355,244.875,251.19,254.9];
up_y = 0.5; down_y = -1; minx =230; maxx =260; % axis definition
fig_ctrl = figure('units','normalized','outerposition',[0 0 1 1]);
hold on
plot(meas_ctrl.time,meas_ctrl.signals.values)
xline(set_pos,'-',label)
xlim([minx maxx]);
title(strcat(QR,', Disturbance rejection, Real-time Output of Control signal u = -K*(x-x_d)'),'FontSize',25);
legend('$u_{control}$','Interpreter','latex');
xlabel('time [s]');ylabel('Voltage [V]');
saveas(fig_ctrl, strcat(plot_dir,'Default_disturbance_control.png'));
fig_states = figure('units','normalized','outerposition',[0 0 1 1]);
subplot(4,1,1);hold on;
plot(meas_states.time, meas_states.signals.values(:,1));
xline(set_pos,'-',label);
title('Real-time Output of $\theta$ (equal to the state)','Interpreter','latex','FontSize',15)
xlim([minx maxx]);xlabel('time [s]');ylabel('angle [rad]');
subplot(4,1,2);hold on;
xline(set_pos,'-',label);
plot(meas_states.time, meas_states.signals.values(:,2));
title('Real-time Output of $\alpha$ (equal to the state)','Interpreter','latex','FontSize',15)
xlim([minx maxx]);xlabel('time [s]');ylabel('angle [rad]');
subplot(4,1,3);hold on;
xline(set_pos,'-',label);
plot(meas_states.time, meas_states.signals.values(:,3))
title('Real-time Output of $\dot{\theta}$ (equal to the state)','Interpreter','latex','FontSize',15)
xlim([minx maxx]);xlabel('time [s]');ylabel('angular velocity [rad/s]');
subplot(4,1,4);hold on;
xline(set_pos,'-',label);
plot(meas_states.time, meas_states.signals.values(:,4))
title('Real-time Output of $\dot{\alpha}$ (equal to the state)','Interpreter','latex','FontSize',15)
xlim([minx maxx]);xlabel('time [s]');ylabel('angular velocity [rad/s]');
sgtitle(strcat(QR,', Disturbance rejection, Real-time Output of the estimated state'),'FontSize',25);
saveas(fig_states, strcat(plot_dir,'Default_disturbance_states.png'));
%% Plotting QR1 setpoint
close all;
load('sim_2_ALL_5_30.mat')
QR = 'QR1';
set_pos = [30.345,49.25];
label = {'x_d','x_0'};
up_y = 0.5; down_y = -1; minx =25; maxx = 55; % axis definition
fig_ctrl = figure('units','normalized','outerposition',[0 0 1 1]);
hold on
plot(meas_ctrl.time,meas_ctrl.signals.values)
xline(set_pos,'-',label)
xlim([minx maxx]);
title(strcat(QR,', 15° set point, Real-time Output of Control signal u = -K*(x-x_d)'),'FontSize',25);
legend('$u_{control}$','Interpreter','latex');
xlabel('time [s]');ylabel('Voltage [V]');
saveas(fig_ctrl, strcat(plot_dir,'QR1_setpoint_control.png'));
fig_states = figure('units','normalized','outerposition',[0 0 1 1]);
subplot(4,1,1);hold on;
plot(meas_states.time, meas_states.signals.values(:,1));
xline(set_pos,'-',label);
title('Real-time Output of $\theta$ (equal to the state)','Interpreter','latex','FontSize',15)
xlim([minx maxx]);xlabel('time [s]');ylabel('angle [rad]');
subplot(4,1,2);hold on;
xline(set_pos,'-',label);
plot(meas_states.time, meas_states.signals.values(:,2));
title('Real-time Output of $\alpha$ (equal to the state)','Interpreter','latex','FontSize',15)
xlim([minx maxx]);xlabel('time [s]');ylabel('angle [rad]');
subplot(4,1,3);hold on;
xline(set_pos,'-',label);
plot(meas_states.time, meas_states.signals.values(:,3))
title('Real-time Output of $\dot{\theta}$ (equal to the state)','Interpreter','latex','FontSize',15)
xlim([minx maxx]);xlabel('time [s]');ylabel('angular velocity [rad/s]');
subplot(4,1,4);hold on;
xline(set_pos,'-',label);
plot(meas_states.time, meas_states.signals.values(:,4))
title('Real-time Output of $\dot{\alpha}$ (equal to the state)','Interpreter','latex','FontSize',15)
xlim([minx maxx]);xlabel('time [s]');ylabel('angular velocity [rad/s]');
sgtitle(strcat(QR,', 15° set point, Real-time Output of the estimated state'),'FontSize',25);
saveas(fig_states, strcat(plot_dir,'QR1_setpoint_states.png'));
%% Plotting QR1 Disturbance
close all;
load('sim_2_ALL_5_30.mat')
label = {'Dist','Dist','Dist','Dist'};
QR = 'QR1';
set_pos =[82.86,86,92.99,97.15];
up_y = 0.5; down_y = -1; minx =70; maxx =100; % axis definition
fig_ctrl = figure('units','normalized','outerposition',[0 0 1 1]);
hold on
plot(meas_ctrl.time,meas_ctrl.signals.values)
xline(set_pos,'-',label)
xlim([minx maxx]);
title(strcat(QR,', Disturbance rejection, Real-time Output of Control signal u = -K*(x-x_d)'),'FontSize',25);
legend('$u_{control}$','Interpreter','latex');
xlabel('time [s]');ylabel('Voltage [V]');
saveas(fig_ctrl, strcat(plot_dir,'QR1_disturbance_control.png'));
fig_states = figure('units','normalized','outerposition',[0 0 1 1]);
subplot(4,1,1);hold on;
plot(meas_states.time, meas_states.signals.values(:,1));
xline(set_pos,'-',label);
title('Real-time Output of $\theta$ (equal to the state)','Interpreter','latex','FontSize',15)
xlim([minx maxx]);xlabel('time [s]');ylabel('angle [rad]');
subplot(4,1,2);hold on;
xline(set_pos,'-',label);
plot(meas_states.time, meas_states.signals.values(:,2));
title('Real-time Output of $\alpha$ (equal to the state)','Interpreter','latex','FontSize',15)
xlim([minx maxx]);xlabel('time [s]');ylabel('angle [rad]');
subplot(4,1,3);hold on;
xline(set_pos,'-',label);
plot(meas_states.time, meas_states.signals.values(:,3))
title('Real-time Output of $\dot{\theta}$ (equal to the state)','Interpreter','latex','FontSize',15)
xlim([minx maxx]);xlabel('time [s]');ylabel('angular velocity [rad/s]');
subplot(4,1,4);hold on;
xline(set_pos,'-',label);
plot(meas_states.time, meas_states.signals.values(:,4))
title('Real-time Output of $\dot{\alpha}$ (equal to the state)','Interpreter','latex','FontSize',15)
xlim([minx maxx]);xlabel('time [s]');ylabel('angular velocity [rad/s]');
sgtitle(strcat(QR,', Disturbance rejection, Real-time Output of the estimated state'),'FontSize',25);
saveas(fig_states, strcat(plot_dir,'QR1_disturbance_states.png'));
%% Plotting QR2 setpoint
close all;
load('sim_3_setpoint.mat')
QR = 'QR2';
set_pos = 32;
label = {'x_d'};
up_y = 0.5; down_y = -1; minx =20; maxx = 50; % axis definition
fig_ctrl = figure('units','normalized','outerposition',[0 0 1 1]);
hold on
plot(meas_ctrl.time,meas_ctrl.signals.values)
xline(set_pos,'-',label)
xlim([minx maxx]);
title(strcat(QR,', 15° set point, Real-time Output of Control signal u = -K*(x-x_d)'),'FontSize',25);
legend('$u_{control}$','Interpreter','latex');
xlabel('time [s]');ylabel('Voltage [V]');
saveas(fig_ctrl, strcat(plot_dir,'QR2_setpoint_control.png'));
fig_states = figure('units','normalized','outerposition',[0 0 1 1]);
subplot(4,1,1);hold on;
plot(meas_states.time, meas_states.signals.values(:,1));
xline(set_pos,'-',label);
title('Real-time Output of $\theta$ (equal to the state)','Interpreter','latex','FontSize',15)
xlim([minx maxx]);xlabel('time [s]');ylabel('angle [rad]');
subplot(4,1,2);hold on;
xline(set_pos,'-',label);
plot(meas_states.time, meas_states.signals.values(:,2));
title('Real-time Output of $\alpha$ (equal to the state)','Interpreter','latex','FontSize',15)
xlim([minx maxx]);xlabel('time [s]');ylabel('angle [rad]');
subplot(4,1,3);hold on;
xline(set_pos,'-',label);
plot(meas_states.time, meas_states.signals.values(:,3))
title('Real-time Output of $\dot{\theta}$ (equal to the state)','Interpreter','latex','FontSize',15)
xlim([minx maxx]);xlabel('time [s]');ylabel('angular velocity [rad/s]');
subplot(4,1,4);hold on;
xline(set_pos,'-',label);
plot(meas_states.time, meas_states.signals.values(:,4))
title('Real-time Output of $\dot{\alpha}$ (equal to the state)','Interpreter','latex','FontSize',15)
xlim([minx maxx]);xlabel('time [s]');ylabel('angular velocity [rad/s]');
sgtitle(strcat(QR,', 15° set point, Real-time Output of the estimated state'),'FontSize',25);
saveas(fig_states, strcat(plot_dir,'QR2_setpoint_states.png'));
%% Plotting QR2 Disturbance
close all;
load('sim_3_disturbance.mat')
label = {'Dist'};
QR = 'QR2';
set_pos =74.495;
up_y = 0.5; down_y = -1; minx =60; maxx =90; % axis definition
fig_ctrl = figure('units','normalized','outerposition',[0 0 1 1]);
hold on
plot(meas_ctrl.time,meas_ctrl.signals.values)
xline(set_pos,'-',label)
xlim([minx maxx]);
title(strcat(QR,', Disturbance rejection, Real-time Output of Control signal u = -K*(x-x_d)'),'FontSize',25);
legend('$u_{control}$','Interpreter','latex');
xlabel('time [s]');ylabel('Voltage [V]');
saveas(fig_ctrl, strcat(plot_dir,'QR2_disturbance_control.png'));
fig_states = figure('units','normalized','outerposition',[0 0 1 1]);
subplot(4,1,1);hold on;
plot(meas_states.time, meas_states.signals.values(:,1));
xline(set_pos,'-',label);
title('Real-time Output of $\theta$ (equal to the state)','Interpreter','latex','FontSize',15)
xlim([minx maxx]);xlabel('time [s]');ylabel('angle [rad]');
subplot(4,1,2);hold on;
xline(set_pos,'-',label);
plot(meas_states.time, meas_states.signals.values(:,2));
title('Real-time Output of $\alpha$ (equal to the state)','Interpreter','latex','FontSize',15)
xlim([minx maxx]);xlabel('time [s]');ylabel('angle [rad]');
subplot(4,1,3);hold on;
xline(set_pos,'-',label);
plot(meas_states.time, meas_states.signals.values(:,3))
title('Real-time Output of $\dot{\theta}$ (equal to the state)','Interpreter','latex','FontSize',15)
xlim([minx maxx]);xlabel('time [s]');ylabel('angular velocity [rad/s]');
subplot(4,1,4);hold on;
xline(set_pos,'-',label);
plot(meas_states.time, meas_states.signals.values(:,4))
title('Real-time Output of $\dot{\alpha}$ (equal to the state)','Interpreter','latex','FontSize',15)
xlim([minx maxx]);xlabel('time [s]');ylabel('angular velocity [rad/s]');
sgtitle(strcat(QR,', Disturbance rejection, Real-time Output of the estimated state'),'FontSize',25);
saveas(fig_states, strcat(plot_dir,'QR2_disturbance_states.png'));
%% Plotting QR4 setpoint
close all;
load('sim_5_setpoint.mat')
label = {'x_d','x_0','x_d'};
set_pos1 = 14.365;
set_pos2 = 19.485;
set_pos3 = 24.335;
QR = 'QR4';
set_pos = [set_pos1,set_pos2,set_pos3];
up_y = 0.5; down_y = -1; minx =10; maxx = 40; % axis definition
fig_ctrl = figure('units','normalized','outerposition',[0 0 1 1]);
hold on
plot(meas_ctrl.time,meas_ctrl.signals.values)
xline(set_pos,'-',label)
xlim([minx maxx]);
title(strcat(QR,', 15° set point, Real-time Output of Control signal u = -K*(x-x_d)'),'FontSize',25);
legend('$u_{control}$','Interpreter','latex');
xlabel('time [s]');ylabel('Voltage [V]');
saveas(fig_ctrl, strcat(plot_dir,'QR4_setpoint_control.png'));
fig_states = figure('units','normalized','outerposition',[0 0 1 1]);
subplot(4,1,1);hold on;
plot(meas_states.time, meas_states.signals.values(:,1));
xline(set_pos,'-',label);
title('Real-time Output of $\theta$ (equal to the state)','Interpreter','latex','FontSize',15)
xlim([minx maxx]);xlabel('time [s]');ylabel('angle [rad]');
subplot(4,1,2);hold on;
xline(set_pos,'-',label);
plot(meas_states.time, meas_states.signals.values(:,2));
title('Real-time Output of $\alpha$ (equal to the state)','Interpreter','latex','FontSize',15)
xlim([minx maxx]);xlabel('time [s]');ylabel('angle [rad]');
subplot(4,1,3);hold on;
xline(set_pos,'-',label);
plot(meas_states.time, meas_states.signals.values(:,3))
title('Real-time Output of $\dot{\theta}$ (equal to the state)','Interpreter','latex','FontSize',15)
xlim([minx maxx]);xlabel('time [s]');ylabel('angular velocity [rad/s]');
subplot(4,1,4);hold on;
xline(set_pos,'-',label);
plot(meas_states.time, meas_states.signals.values(:,4))
title('Real-time Output of $\dot{\alpha}$ (equal to the state)','Interpreter','latex','FontSize',15)
xlim([minx maxx]);xlabel('time [s]');ylabel('angular velocity [rad/s]');
sgtitle(strcat(QR,', 15° set point, Real-time Output of the estimated state'),'FontSize',25);
saveas(fig_states, strcat(plot_dir,'QR4_setpoint_states.png'));
close all;
%% Plotting QR4 Disturbance
close all;
load('sim_5_disturbance.mat')
label = {'Dist'};
set_pos =77.9;
QR = 'QR4';
up_y = 0.5; down_y = -1; minx =73; maxx =103; % axis definition
fig_ctrl = figure('units','normalized','outerposition',[0 0 1 1]);
hold on
plot(meas_ctrl.time,meas_ctrl.signals.values)
xline(set_pos,'-',label)
xlim([minx maxx]);
title(strcat(QR,', Disturbance rejection, Real-time Output of Control signal u = -K*(x-x_d)'),'FontSize',25);
legend('$u_{control}$','Interpreter','latex');
xlabel('time [s]');ylabel('Voltage [V]');
saveas(fig_ctrl, strcat(plot_dir,'QR4_disturbance_control.png'));
fig_states = figure('units','normalized','outerposition',[0 0 1 1]);
subplot(4,1,1);hold on;
plot(meas_states.time, meas_states.signals.values(:,1));
xline(set_pos,'-',label);
title('Real-time Output of $\theta$ (equal to the state)','Interpreter','latex','FontSize',15)
xlim([minx maxx]);xlabel('time [s]');ylabel('angle [rad]');
subplot(4,1,2);hold on;
xline(set_pos,'-',label);
plot(meas_states.time, meas_states.signals.values(:,2));
title('Real-time Output of $\alpha$ (equal to the state)','Interpreter','latex','FontSize',15)
xlim([minx maxx]);xlabel('time [s]');ylabel('angle [rad]');
subplot(4,1,3);hold on;
xline(set_pos,'-',label);
plot(meas_states.time, meas_states.signals.values(:,3))
title('Real-time Output of $\dot{\theta}$ (equal to the state)','Interpreter','latex','FontSize',15)
xlim([minx maxx]);xlabel('time [s]');ylabel('angular velocity [rad/s]');
subplot(4,1,4);hold on;
xline(set_pos,'-',label);
plot(meas_states.time, meas_states.signals.values(:,4))
title('Real-time Output of $\dot{\alpha}$ (equal to the state)','Interpreter','latex','FontSize',15)
xlim([minx maxx]);xlabel('time [s]');ylabel('angular velocity [rad/s]');
sgtitle(strcat(QR,', Disturbance rejection, Real-time Output of the estimated state'),'FontSize',25);
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
xlim([minx maxx]);
title(strcat(QR,', 15° set point, Real-time Output of Control signal u = -K*(x-x_d)'),'FontSize',25);
legend('$u_{control}$','Interpreter','latex');
xlabel('time [s]');ylabel('Voltage [V]');
saveas(fig_ctrl, strcat(plot_dir,QR,'_setpoint_control.png'));
fig_states = figure('units','normalized','outerposition',[0 0 1 1]);
subplot(4,1,1);hold on;
plot(meas_states.time, meas_states.signals.values(:,1));
xline(set_pos,'-',label);
title('Real-time Output of $\theta$ (equal to the state)','Interpreter','latex','FontSize',15)
xlim([minx maxx]);xlabel('time [s]');ylabel('angle [rad]');
subplot(4,1,2);hold on;
xline(set_pos,'-',label);
plot(meas_states.time, meas_states.signals.values(:,2));
title('Real-time Output of $\alpha$ (equal to the state)','Interpreter','latex','FontSize',15)
xlim([minx maxx]);xlabel('time [s]');ylabel('angle [rad]');
subplot(4,1,3);hold on;
xline(set_pos,'-',label);
plot(meas_states.time, meas_states.signals.values(:,3))
title('Real-time Output of $\dot{\theta}$ (equal to the state)','Interpreter','latex','FontSize',15)
xlim([minx maxx]);xlabel('time [s]');ylabel('angular velocity [rad/s]');
subplot(4,1,4);hold on;
xline(set_pos,'-',label);
plot(meas_states.time, meas_states.signals.values(:,4))
title('Real-time Output of $\dot{\alpha}$ (equal to the state)','Interpreter','latex','FontSize',15)
xlim([minx maxx]);xlabel('time [s]');ylabel('angular velocity [rad/s]');
sgtitle(strcat(QR,', 15° set point, Real-time Output of the estimated state'),'FontSize',25);
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
xlim([minx maxx]);
title(strcat(QR,', Disturbance rejection, Real-time Output of Control signal u = -K*(x-x_d)'),'FontSize',25);
legend('$u_{control}$','Interpreter','latex');
xlabel('time [s]');ylabel('Voltage [V]');
saveas(fig_ctrl, strcat(plot_dir,QR,'_disturbance_control.png'));
fig_states = figure('units','normalized','outerposition',[0 0 1 1]);
subplot(4,1,1);hold on;
plot(meas_states.time, meas_states.signals.values(:,1));
xline(set_pos,'-',label);
title('Real-time Output of $\theta$ (equal to the state)','Interpreter','latex','FontSize',15)
xlim([minx maxx]);xlabel('time [s]');ylabel('angle [rad]');
subplot(4,1,2);hold on;
xline(set_pos,'-',label);
plot(meas_states.time, meas_states.signals.values(:,2));
title('Real-time Output of $\alpha$ (equal to the state)','Interpreter','latex','FontSize',15)
xlim([minx maxx]);xlabel('time [s]');ylabel('angle [rad]');
subplot(4,1,3);hold on;
xline(set_pos,'-',label);
plot(meas_states.time, meas_states.signals.values(:,3))
title('Real-time Output of $\dot{\theta}$ (equal to the state)','Interpreter','latex','FontSize',15)
xlim([minx maxx]);xlabel('time [s]');ylabel('angular velocity [rad/s]');
subplot(4,1,4);hold on;
xline(set_pos,'-',label);
plot(meas_states.time, meas_states.signals.values(:,4))
title('Real-time Output of $\dot{\alpha}$ (equal to the state)','Interpreter','latex','FontSize',15)
xlim([minx maxx]);xlabel('time [s]');ylabel('angular velocity [rad/s]');
sgtitle(strcat(QR,', Disturbance rejection, Real-time Output of the estimated state'),'FontSize',25);
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
xlim([minx maxx]);
title(strcat(QR,', 15° set point, Real-time Output of Control signal u = -K*(x-x_d)'),'FontSize',25);
legend('$u_{control}$','Interpreter','latex');
xlabel('time [s]');ylabel('Voltage [V]');
saveas(fig_ctrl, strcat(plot_dir,QR,'_setpoint_control.png'));
fig_states = figure('units','normalized','outerposition',[0 0 1 1]);
subplot(4,1,1);hold on;
plot(meas_states.time, meas_states.signals.values(:,1));
xline(set_pos,'-',label);
title('Real-time Output of $\theta$ (equal to the state)','Interpreter','latex','FontSize',15)
xlim([minx maxx]);xlabel('time [s]');ylabel('angle [rad]');
subplot(4,1,2);hold on;
xline(set_pos,'-',label);
plot(meas_states.time, meas_states.signals.values(:,2));
title('Real-time Output of $\alpha$ (equal to the state)','Interpreter','latex','FontSize',15)
xlim([minx maxx]);xlabel('time [s]');ylabel('angle [rad]');
subplot(4,1,3);hold on;
xline(set_pos,'-',label);
plot(meas_states.time, meas_states.signals.values(:,3))
title('Real-time Output of $\dot{\theta}$ (equal to the state)','Interpreter','latex','FontSize',15)
xlim([minx maxx]);xlabel('time [s]');ylabel('angular velocity [rad/s]');
subplot(4,1,4);hold on;
xline(set_pos,'-',label);
plot(meas_states.time, meas_states.signals.values(:,4))
title('Real-time Output of $\dot{\alpha}$ (equal to the state)','Interpreter','latex','FontSize',15)
xlim([minx maxx]);xlabel('time [s]');ylabel('angular velocity [rad/s]');
sgtitle(strcat(QR,', 15° set point, Real-time Output of the estimated state'),'FontSize',25);
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
xlim([minx maxx]);
title(strcat(QR,', Disturbance rejection, Real-time Output of Control signal u = -K*(x-x_d)'),'FontSize',25);
legend('$u_{control}$','Interpreter','latex');
xlabel('time [s]');ylabel('Voltage [V]');
saveas(fig_ctrl, strcat(plot_dir,QR,'_disturbance_control.png'));
fig_states = figure('units','normalized','outerposition',[0 0 1 1]);
subplot(4,1,1);hold on;
plot(meas_states.time, meas_states.signals.values(:,1));
xline(set_pos,'-',label);
title('Real-time Output of $\theta$ (equal to the state)','Interpreter','latex','FontSize',15)
xlim([minx maxx]);xlabel('time [s]');ylabel('angle [rad]');
subplot(4,1,2);hold on;
xline(set_pos,'-',label);
plot(meas_states.time, meas_states.signals.values(:,2));
title('Real-time Output of $\alpha$ (equal to the state)','Interpreter','latex','FontSize',15)
xlim([minx maxx]);xlabel('time [s]');ylabel('angle [rad]');
subplot(4,1,3);hold on;
xline(set_pos,'-',label);
plot(meas_states.time, meas_states.signals.values(:,3))
title('Real-time Output of $\dot{\theta}$ (equal to the state)','Interpreter','latex','FontSize',15)
xlim([minx maxx]);xlabel('time [s]');ylabel('angular velocity [rad/s]');
subplot(4,1,4);hold on;
xline(set_pos,'-',label);
plot(meas_states.time, meas_states.signals.values(:,4))
title('Real-time Output of $\dot{\alpha}$ (equal to the state)','Interpreter','latex','FontSize',15)
xlim([minx maxx]);xlabel('time [s]');ylabel('angular velocity [rad/s]');
sgtitle(strcat(QR,', Disturbance rejection, Real-time Output of the estimated state'),'FontSize',25);
saveas(fig_states, strcat(plot_dir,QR,'_disturbance_states.png'));
%% Plotting QR7 Disturbance
close all;
load('sim_8_ALL_5_30.mat')
label = {'Dist', 'Dist','Dist'};
QR = 'QR7';
set_pos =[46.38,49.43,53];
up_y = 0.5; down_y = -1; minx =40; maxx =60; % axis definition
fig_ctrl = figure('units','normalized','outerposition',[0 0 1 1]);
hold on
plot(meas_ctrl.time,meas_ctrl.signals.values)
xline(set_pos,'-',label)
xlim([minx maxx]);
title(strcat(QR,', Disturbance rejection, Real-time Output of Control signal u = -K*(x-x_d)'),'FontSize',25);
legend('$u_{control}$','Interpreter','latex');
xlabel('time [s]');ylabel('Voltage [V]');
saveas(fig_ctrl, strcat(plot_dir,QR,'_disturbance_control.png'));
fig_states = figure('units','normalized','outerposition',[0 0 1 1]);
subplot(4,1,1);hold on;
plot(meas_states.time, meas_states.signals.values(:,1));
xline(set_pos,'-',label);
title('Real-time Output of $\theta$ (equal to the state)','Interpreter','latex','FontSize',15)
xlim([minx maxx]);xlabel('time [s]');ylabel('angle [rad]');
subplot(4,1,2);hold on;
xline(set_pos,'-',label);
plot(meas_states.time, meas_states.signals.values(:,2));
title('Real-time Output of $\alpha$ (equal to the state)','Interpreter','latex','FontSize',15)
xlim([minx maxx]);xlabel('time [s]');ylabel('angle [rad]');
subplot(4,1,3);hold on;
xline(set_pos,'-',label);
plot(meas_states.time, meas_states.signals.values(:,3))
title('Real-time Output of $\dot{\theta}$ (equal to the state)','Interpreter','latex','FontSize',15)
xlim([minx maxx]);xlabel('time [s]');ylabel('angular velocity [rad/s]');
subplot(4,1,4);hold on;
xline(set_pos,'-',label);
plot(meas_states.time, meas_states.signals.values(:,4))
title('Real-time Output of $\dot{\alpha}$ (equal to the state)','Interpreter','latex','FontSize',15)
xlim([minx maxx]);xlabel('time [s]');ylabel('angular velocity [rad/s]');
sgtitle(strcat(QR,', Disturbance rejection, Real-time Output of the estimated state'),'FontSize',25);
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
xlim([minx maxx]);
title(strcat(QR,', 15° set point, Real-time Output of Control signal u = -K*(x-x_d)'),'FontSize',25);
legend('$u_{control}$','Interpreter','latex');
xlabel('time [s]');ylabel('Voltage [V]');
saveas(fig_ctrl, strcat(plot_dir,QR,'_setpoint_control.png'));
fig_states = figure('units','normalized','outerposition',[0 0 1 1]);
subplot(4,1,1);hold on;
plot(meas_states.time, meas_states.signals.values(:,1));
xline(set_pos,'-',label);
title('Real-time Output of $\theta$ (equal to the state)','Interpreter','latex','FontSize',15)
xlim([minx maxx]);xlabel('time [s]');ylabel('angle [rad]');
subplot(4,1,2);hold on;
xline(set_pos,'-',label);
plot(meas_states.time, meas_states.signals.values(:,2));
title('Real-time Output of $\alpha$ (equal to the state)','Interpreter','latex','FontSize',15)
xlim([minx maxx]);xlabel('time [s]');ylabel('angle [rad]');
subplot(4,1,3);hold on;
xline(set_pos,'-',label);
plot(meas_states.time, meas_states.signals.values(:,3))
title('Real-time Output of $\dot{\theta}$ (equal to the state)','Interpreter','latex','FontSize',15)
xlim([minx maxx]);xlabel('time [s]');ylabel('angular velocity [rad/s]');
subplot(4,1,4);hold on;
xline(set_pos,'-',label);
plot(meas_states.time, meas_states.signals.values(:,4))
title('Real-time Output of $\dot{\alpha}$ (equal to the state)','Interpreter','latex','FontSize',15)
xlim([minx maxx]);xlabel('time [s]');ylabel('angular velocity [rad/s]');
sgtitle(strcat(QR,', 15° set point, Real-time Output of the estimated state'),'FontSize',25);
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
xlim([minx maxx]);
title(strcat(QR,', 15° set point, Real-time Output of Control signal u = -K*(x-x_d)'),'FontSize',25);
legend('$u_{control}$','Interpreter','latex');
xlabel('time [s]');ylabel('Voltage [V]');
saveas(fig_ctrl, strcat(plot_dir,QR,'_setpoint_control.png'));
fig_states = figure('units','normalized','outerposition',[0 0 1 1]);
subplot(4,1,1);hold on;
plot(meas_states.time, meas_states.signals.values(:,1));
xline(set_pos,'-',label);
title('Real-time Output of $\theta$ (equal to the state)','Interpreter','latex','FontSize',15)
xlim([minx maxx]);xlabel('time [s]');ylabel('angle [rad]');
subplot(4,1,2);hold on;
xline(set_pos,'-',label);
plot(meas_states.time, meas_states.signals.values(:,2));
title('Real-time Output of $\alpha$ (equal to the state)','Interpreter','latex','FontSize',15)
xlim([minx maxx]);xlabel('time [s]');ylabel('angle [rad]');
subplot(4,1,3);hold on;
xline(set_pos,'-',label);
plot(meas_states.time, meas_states.signals.values(:,3))
title('Real-time Output of $\dot{\theta}$ (equal to the state)','Interpreter','latex','FontSize',15)
xlim([minx maxx]);xlabel('time [s]');ylabel('angular velocity [rad/s]');
subplot(4,1,4);hold on;
xline(set_pos,'-',label);
plot(meas_states.time, meas_states.signals.values(:,4))
title('Real-time Output of $\dot{\alpha}$ (equal to the state)','Interpreter','latex','FontSize',15)
xlim([minx maxx]);xlabel('time [s]');ylabel('angular velocity [rad/s]');
sgtitle(strcat(QR,', 15° set point, Real-time Output of the estimated state'),'FontSize',25);
saveas(fig_states, strcat(plot_dir,QR,'_setpoint_states.png'));
%% Plotting QR8 Disturbance
close all;
load('sim_9_ALL_5_30.mat')
label = {'Dist', 'Dist','Dist'};
QR = 'QR8';
set_pos =[53.775,55.75,58.8];
up_y = 0.5; down_y = -1; minx =50; maxx =65; % axis definition
fig_ctrl = figure('units','normalized','outerposition',[0 0 1 1]);
hold on
plot(meas_ctrl.time,meas_ctrl.signals.values)
xline(set_pos,'-',label)
xlim([minx maxx]);
title(strcat(QR,', Disturbance rejection, Real-time Output of Control signal u = -K*(x-x_d)'),'FontSize',25);
legend('$u_{control}$','Interpreter','latex');
xlabel('time [s]');ylabel('Voltage [V]');
saveas(fig_ctrl, strcat(plot_dir,QR,'_disturbance_control.png'));
fig_states = figure('units','normalized','outerposition',[0 0 1 1]);
subplot(4,1,1);hold on;
plot(meas_states.time, meas_states.signals.values(:,1));
xline(set_pos,'-',label);
title('Real-time Output of $\theta$ (equal to the state)','Interpreter','latex','FontSize',15)
xlim([minx maxx]);xlabel('time [s]');ylabel('angle [rad]');
subplot(4,1,2);hold on;
xline(set_pos,'-',label);
plot(meas_states.time, meas_states.signals.values(:,2));
title('Real-time Output of $\alpha$ (equal to the state)','Interpreter','latex','FontSize',15)
xlim([minx maxx]);xlabel('time [s]');ylabel('angle [rad]');
subplot(4,1,3);hold on;
xline(set_pos,'-',label);
plot(meas_states.time, meas_states.signals.values(:,3))
title('Real-time Output of $\dot{\theta}$ (equal to the state)','Interpreter','latex','FontSize',15)
xlim([minx maxx]);xlabel('time [s]');ylabel('angular velocity [rad/s]');
subplot(4,1,4);hold on;
xline(set_pos,'-',label);
plot(meas_states.time, meas_states.signals.values(:,4))
title('Real-time Output of $\dot{\alpha}$ (equal to the state)','Interpreter','latex','FontSize',15)
xlim([minx maxx]);xlabel('time [s]');ylabel('angular velocity [rad/s]');
sgtitle(strcat(QR,', Disturbance rejection, Real-time Output of the estimated state'),'FontSize',25);
saveas(fig_states, strcat(plot_dir,QR,'_disturbance_states.png'));
%% Plotting QR9 disturbance 15
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
xlim([minx maxx]);
title(strcat(QR,', Disturbance rejection, Real-time Output of Control signal u = -K*(x-x_d)'),'FontSize',25);
legend('$u_{control}$','Interpreter','latex');
xlabel('time [s]');ylabel('Voltage [V]');
saveas(fig_ctrl, strcat(plot_dir,QR,'_disturbance_control.png'));
fig_states = figure('units','normalized','outerposition',[0 0 1 1]);
subplot(4,1,1);hold on;
plot(meas_states.time, meas_states.signals.values(:,1));
xline(set_pos,'-',label);
title('Real-time Output of $\theta$ (equal to the state)','Interpreter','latex','FontSize',15)
xlim([minx maxx]);xlabel('time [s]');ylabel('angle [rad]');
subplot(4,1,2);hold on;
xline(set_pos,'-',label);
plot(meas_states.time, meas_states.signals.values(:,2));
title('Real-time Output of $\alpha$ (equal to the state)','Interpreter','latex','FontSize',15)
xlim([minx maxx]);xlabel('time [s]');ylabel('angle [rad]');
subplot(4,1,3);hold on;
xline(set_pos,'-',label);
plot(meas_states.time, meas_states.signals.values(:,3))
title('Real-time Output of $\dot{\theta}$ (equal to the state)','Interpreter','latex','FontSize',15)
xlim([minx maxx]);xlabel('time [s]');ylabel('angular velocity [rad/s]');
subplot(4,1,4);hold on;
xline(set_pos,'-',label);
plot(meas_states.time, meas_states.signals.values(:,4))
title('Real-time Output of $\dot{\alpha}$ (equal to the state)','Interpreter','latex','FontSize',15)
xlim([minx maxx]);xlabel('time [s]');ylabel('angular velocity [rad/s]');
sgtitle(strcat(QR,', Disturbance rejection, Real-time Output of the estimated state'),'FontSize',25);
saveas(fig_states, strcat(plot_dir,QR,'_disturbance_states.png'));
%% Plotting QR9 setpoint 15
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
xlim([minx maxx]);
title(strcat(QR,', 15° set point, Real-time Output of Control signal u = -K*(x-x_d)'),'FontSize',25);
legend('$u_{control}$','Interpreter','latex');
xlabel('time [s]');ylabel('Voltage [V]');
saveas(fig_ctrl, strcat(plot_dir,QR,'_setpoint_control.png'));
fig_states = figure('units','normalized','outerposition',[0 0 1 1]);
subplot(4,1,1);hold on;
plot(meas_states.time, meas_states.signals.values(:,1));
xline(set_pos,'-',label);
title('Real-time Output of $\theta$ (equal to the state)','Interpreter','latex','FontSize',15)
xlim([minx maxx]);xlabel('time [s]');ylabel('angle [rad]');
subplot(4,1,2);hold on;
xline(set_pos,'-',label);
plot(meas_states.time, meas_states.signals.values(:,2));
title('Real-time Output of $\alpha$ (equal to the state)','Interpreter','latex','FontSize',15)
xlim([minx maxx]);xlabel('time [s]');ylabel('angle [rad]');
subplot(4,1,3);hold on;
xline(set_pos,'-',label);
plot(meas_states.time, meas_states.signals.values(:,3))
title('Real-time Output of $\dot{\theta}$ (equal to the state)','Interpreter','latex','FontSize',15)
xlim([minx maxx]);xlabel('time [s]');ylabel('angular velocity [rad/s]');
subplot(4,1,4);hold on;
xline(set_pos,'-',label);
plot(meas_states.time, meas_states.signals.values(:,4))
title('Real-time Output of $\dot{\alpha}$ (equal to the state)','Interpreter','latex','FontSize',15)
xlim([minx maxx]);xlabel('time [s]');ylabel('angular velocity [rad/s]');
sgtitle(strcat(QR,', 15° set point, Real-time Output of the estimated state'),'FontSize',25);
saveas(fig_states, strcat(plot_dir,QR,'_setpoint_states.png'));
%% Plotting QR9 setpoint 30
close all;
load('sim_10_dist_30_new_5_30.mat')
QR = 'QR9';
label = {'x_d','x_0','x_d'};
set_pos1 = 19.305;
set_pos2 = 43.64;
set_pos3 = 150;
set_pos = [set_pos1,set_pos2,set_pos3];
up_y = 0.5; down_y = -1; minx =15; maxx = 50; % axis definition
fig_ctrl = figure('units','normalized','outerposition',[0 0 1 1]);
hold on
plot(meas_ctrl.time,meas_ctrl.signals.values)
xline(set_pos,'-',label)
xlim([minx maxx]);
title(strcat(QR,', 30° set point, Real-time Output of Control signal u = -K*(x-x_d)'),'FontSize',25);
legend('$u_{control}$','Interpreter','latex');
xlabel('time [s]');ylabel('Voltage [V]');
saveas(fig_ctrl, strcat(plot_dir,QR,'_setpoint_control_30deg.png'));
fig_states = figure('units','normalized','outerposition',[0 0 1 1]);
subplot(4,1,1);hold on;
plot(meas_states.time, meas_states.signals.values(:,1));
xline(set_pos,'-',label);
title('Real-time Output of $\theta$ (equal to the state)','Interpreter','latex','FontSize',15)
xlim([minx maxx]);xlabel('time [s]');ylabel('angle [rad]');
subplot(4,1,2);hold on;
xline(set_pos,'-',label);
plot(meas_states.time, meas_states.signals.values(:,2));
title('Real-time Output of $\alpha$ (equal to the state)','Interpreter','latex','FontSize',15)
xlim([minx maxx]);xlabel('time [s]');ylabel('angle [rad]');
subplot(4,1,3);hold on;
xline(set_pos,'-',label);
plot(meas_states.time, meas_states.signals.values(:,3))
title('Real-time Output of $\dot{\theta}$ (equal to the state)','Interpreter','latex','FontSize',15)
xlim([minx maxx]);xlabel('time [s]');ylabel('angular velocity [rad/s]');
subplot(4,1,4);hold on;
xline(set_pos,'-',label);
plot(meas_states.time, meas_states.signals.values(:,4))
title('Real-time Output of $\dot{\alpha}$ (equal to the state)','Interpreter','latex','FontSize',15)
xlim([minx maxx]);xlabel('time [s]');ylabel('angular velocity [rad/s]');
sgtitle(strcat(QR,', 30° set point, Real-time Output of the estimated state'),'FontSize',25);
saveas(fig_states, strcat(plot_dir,QR,'_setpoint_states_30deg.png'));
%% Plotting QR9 setpoint 45
close all;
load('sim_10_dist_45_new_5_30.mat')
QR = 'QR9';
label = {'x_d','x_0','x_d'};
set_pos1 = 26.615;
set_pos2 = 120;
set_pos3 = 150;
set_pos = [set_pos1,set_pos2,set_pos3];
up_y = 0.5; down_y = -1; minx =20; maxx = 60; % axis definition
fig_ctrl = figure('units','normalized','outerposition',[0 0 1 1]);
hold on
plot(meas_ctrl.time,meas_ctrl.signals.values)
xline(set_pos,'-',label)
xlim([minx maxx]);
title(strcat(QR,', 45° set point, Real-time Output of Control signal u = -K*(x-x_d)'),'FontSize',25);
legend('$u_{control}$','Interpreter','latex');
xlabel('time [s]');ylabel('Voltage [V]');
saveas(fig_ctrl, strcat(plot_dir,QR,'_setpoint_control_45deg.png'));
fig_states = figure('units','normalized','outerposition',[0 0 1 1]);
subplot(4,1,1);hold on;
plot(meas_states.time, meas_states.signals.values(:,1));
xline(set_pos,'-',label);
title('Real-time Output of $\theta$ (equal to the state)','Interpreter','latex','FontSize',15)
xlim([minx maxx]);xlabel('time [s]');ylabel('angle [rad]');
subplot(4,1,2);hold on;
xline(set_pos,'-',label);
plot(meas_states.time, meas_states.signals.values(:,2));
title('Real-time Output of $\alpha$ (equal to the state)','Interpreter','latex','FontSize',15)
xlim([minx maxx]);xlabel('time [s]');ylabel('angle [rad]');
subplot(4,1,3);hold on;
xline(set_pos,'-',label);
plot(meas_states.time, meas_states.signals.values(:,3))
title('Real-time Output of $\dot{\theta}$ (equal to the state)','Interpreter','latex','FontSize',15)
xlim([minx maxx]);xlabel('time [s]');ylabel('angular velocity [rad/s]');
subplot(4,1,4);hold on;
xline(set_pos,'-',label);
plot(meas_states.time, meas_states.signals.values(:,4))
title('Real-time Output of $\dot{\alpha}$ (equal to the state)','Interpreter','latex','FontSize',15)
xlim([minx maxx]);xlabel('time [s]');ylabel('angular velocity [rad/s]');
sgtitle(strcat(QR,', 45° set point, Real-time Output of the estimated state'),'FontSize',25);
saveas(fig_states, strcat(plot_dir,QR,'_setpoint_states_45deg.png'));
%% Plotting omega 1 setpoint
close all;
load('trialLUT12_omegac_32pi_shaky.mat')
QR = 'QR8';
label = {'x_d','x_0','x_d'};
set_pos1 = 28.015;
set_pos2 = 100;
set_pos3 = 150;
set_pos = [set_pos1,set_pos2,set_pos3];
up_y = 0.5; down_y = -1; minx =20; maxx = 50; % axis definition
fig_ctrl = figure('units','normalized','outerposition',[0 0 1 1]);
hold on
plot(meas_ctrl.time,meas_ctrl.signals.values)
xline(set_pos,'-',label)
xlim([minx maxx]);
title(strcat(QR,', 15degree set point, $\omega_{1}$, Real-time Output of Control signal $u = -K*(x-x_d)$'),'Interpreter','latex','Fontsize',25);
legend('$u_{control}$','Interpreter','latex');
xlabel('time [s]');ylabel('Voltage [V]');
saveas(fig_ctrl, strcat(plot_dir,QR,'_setpoint_control_omega1.png'));
fig_states = figure('units','normalized','outerposition',[0 0 1 1]);
subplot(4,1,1);hold on;
plot(meas_states.time, meas_states.signals.values(:,1));
xline(set_pos,'-',label);
title('Real-time Output of $\theta$ (equal to the state)','Interpreter','latex','Fontsize',15)
xlim([minx maxx]);xlabel('time [s]');ylabel('angle [rad]');
subplot(4,1,2);hold on;
xline(set_pos,'-',label);
plot(meas_states.time, meas_states.signals.values(:,2));
title('Real-time Output of $\alpha$ (equal to the state)','Interpreter','latex','Fontsize',15)
xlim([minx maxx]);xlabel('time [s]');ylabel('angle [rad]');
subplot(4,1,3);hold on;
xline(set_pos,'-',label);
plot(meas_states.time, meas_states.signals.values(:,3))
title('Real-time Output of $\dot{\theta}$ (equal to the state)','Interpreter','latex','Fontsize',15)
xlim([minx maxx]);xlabel('time [s]');ylabel('angular velocity [rad/s]');
subplot(4,1,4);hold on;
xline(set_pos,'-',label);
plot(meas_states.time, meas_states.signals.values(:,4))
title('Real-time Output of $\dot{\alpha}$ (equal to the state)','Interpreter','latex','Fontsize',15)
xlim([minx maxx]);xlabel('time [s]');ylabel('angular velocity [rad/s]');
sgtitle(strcat(QR,', 15degree set point, $\omega_{1}$, Real-time Output of the estimated state'),'Interpreter','latex','Fontsize',25);
saveas(fig_states, strcat(plot_dir,QR,'_setpoint_states_omega1.png'));
%% Plotting omega 1 disturbance
close all;
load('trialLUT12_omegac_32pi_shaky.mat')
QR = 'QR8';
label = {'Dist','Dist','Dist','Dist','Dist','Dist','Dist','Dist'};
set_pos1 = 78.58;
set_pos2 = 81.31;
set_pos3 = 83.95;
set_pos4 = 86.755;
set_pos5 = 88.315;
set_pos6 = 89.64;
set_pos7 = 91.375;
set_pos8 = 94.44;
set_pos = [set_pos1,set_pos2,set_pos3, set_pos4,set_pos5,set_pos6,set_pos7,set_pos8];
up_y = 0.5; down_y = -1; minx =70; maxx = 100; % axis definition
fig_ctrl = figure('units','normalized','outerposition',[0 0 1 1]);
hold on
plot(meas_ctrl.time,meas_ctrl.signals.values)
xline(set_pos,'-',label)
xlim([minx maxx]);
title(strcat(QR,', Disturbance rejection, $\omega_{1}$, Real-time Output of Control signal $u = -K*(x-x_d)$'),'Interpreter','latex','Fontsize',25);
legend('$u_{control}$','Interpreter','latex');
xlabel('time [s]');ylabel('Voltage [V]');
saveas(fig_ctrl, strcat(plot_dir,QR,'_disturbance_control_omega1.png'));
fig_states = figure('units','normalized','outerposition',[0 0 1 1]);
subplot(4,1,1);hold on;
plot(meas_states.time, meas_states.signals.values(:,1));
xline(set_pos,'-',label);
title('Real-time Output of $\theta$ (equal to the state)','Interpreter','latex','Fontsize',15)
xlim([minx maxx]);xlabel('time [s]');ylabel('angle [rad]');
subplot(4,1,2);hold on;
xline(set_pos,'-',label);
plot(meas_states.time, meas_states.signals.values(:,2));
title('Real-time Output of $\alpha$ (equal to the state)','Interpreter','latex','Fontsize',15)
xlim([minx maxx]);xlabel('time [s]');ylabel('angle [rad]');
subplot(4,1,3);hold on;
xline(set_pos,'-',label);
plot(meas_states.time, meas_states.signals.values(:,3))
title('Real-time Output of $\dot{\theta}$ (equal to the state)','Interpreter','latex','Fontsize',15)
xlim([minx maxx]);xlabel('time [s]');ylabel('angular velocity [rad/s]');
subplot(4,1,4);hold on;
xline(set_pos,'-',label);
plot(meas_states.time, meas_states.signals.values(:,4))
title('Real-time Output of $\dot{\alpha}$ (equal to the state)','Interpreter','latex','FontSize',15)
xlim([minx maxx]);xlabel('time [s]');ylabel('angular velocity [rad/s]');
sgtitle(strcat(QR,', Disturbance rejection, $\omega_{1}$, Real-time Output of the estimated state'),'Interpreter','latex','Fontsize',25);
saveas(fig_states, strcat(plot_dir,QR,'_disturbance_states_omega1.png'));
%% Plotting omega 2 setpoint
close all;
load('trialLUT13_omegac_12pi.mat')
QR = 'QR8';
label = {'x_d','x_0','x_d'};
set_pos1 = 29.1;
set_pos2 = 100;
set_pos3 = 150;
set_pos = [set_pos1,set_pos2,set_pos3];
up_y = 0.5; down_y = -1; minx =20; maxx = 50; % axis definition
fig_ctrl = figure('units','normalized','outerposition',[0 0 1 1]);
hold on
plot(meas_ctrl.time,meas_ctrl.signals.values)
xline(set_pos,'-',label)
xlim([minx maxx]);
title(strcat(QR,', 15degree set point, Real-time Output of Control signal $u = -K*(x-x_d)$'),'Interpreter','latex','FontSize',25);
legend('$u_{control}$','Interpreter','latex');
xlabel('time [s]');ylabel('Voltage [V]');
saveas(fig_ctrl, strcat(plot_dir,QR,'_setpoint_control_omega2.png'));
fig_states = figure('units','normalized','outerposition',[0 0 1 1]);
subplot(4,1,1);hold on;
plot(meas_states.time, meas_states.signals.values(:,1));
xline(set_pos,'-',label);
title('Real-time Output of $\theta$ (equal to the state)','Interpreter','latex','FontSize',15)
xlim([minx maxx]);xlabel('time [s]');ylabel('angle [rad]');
subplot(4,1,2);hold on;
xline(set_pos,'-',label);
plot(meas_states.time, meas_states.signals.values(:,2));
title('Real-time Output of $\alpha$ (equal to the state)','Interpreter','latex','FontSize',15)
xlim([minx maxx]);xlabel('time [s]');ylabel('angle [rad]');
subplot(4,1,3);hold on;
xline(set_pos,'-',label);
plot(meas_states.time, meas_states.signals.values(:,3))
title('Real-time Output of $\dot{\theta}$ (equal to the state)','Interpreter','latex','FontSize',15)
xlim([minx maxx]);xlabel('time [s]');ylabel('angular velocity [rad/s]');
subplot(4,1,4);hold on;
xline(set_pos,'-',label);
plot(meas_states.time, meas_states.signals.values(:,4))
title('Real-time Output of $\dot{\alpha}$ (equal to the state)','Interpreter','latex','FontSize',15)
xlim([minx maxx]);xlabel('time [s]');ylabel('angular velocity [rad/s]');
sgtitle(strcat(QR,', 15degree set point, $\omega_{2}$, Real-time Output of the estimated state'),'Interpreter','latex','Fontsize',25);
saveas(fig_states, strcat(plot_dir,QR,'_setpoint_states_omega2.png'));
%% Plotting omega 2 disturbance
close all;
load('trialLUT13_omegac_12pi.mat')
QR = 'QR8';
label = {'Dist','Dist','Dist','Dist','Dist','Dist'};
set_pos1 = 77.185;
set_pos2 = 79.9;
set_pos3 = 82.53;
set_pos4 = 85.51;
set_pos5 = 88.63;
set_pos6 = 91.86;
set_pos = [set_pos1,set_pos2,set_pos3,set_pos4,set_pos5,set_pos6];
up_y = 0.5; down_y = -1; minx =70; maxx = 100; % axis definition
fig_ctrl = figure('units','normalized','outerposition',[0 0 1 1]);
hold on
plot(meas_ctrl.time,meas_ctrl.signals.values)
xline(set_pos,'-',label)
xlim([minx maxx]);
title(strcat(QR,', Disturbance rejection, $\omega_{2}$, Real-time Output of Control signal $u = -K*(x-x_d)$'),'Interpreter','latex','FontSize',25);
legend('$u_{control}$','Interpreter','latex');
xlabel('time [s]');ylabel('Voltage [V]');
saveas(fig_ctrl, strcat(plot_dir,QR,'_disturbance_control_omega2.png'));
fig_states = figure('units','normalized','outerposition',[0 0 1 1]);
subplot(4,1,1);hold on;
plot(meas_states.time, meas_states.signals.values(:,1));
xline(set_pos,'-',label);
title('Real-time Output of $\theta$ (equal to the state)','Interpreter','latex','FontSize',15)
xlim([minx maxx]);xlabel('time [s]');ylabel('angle [rad]');
subplot(4,1,2);hold on;
xline(set_pos,'-',label);
plot(meas_states.time, meas_states.signals.values(:,2));
title('Real-time Output of $\alpha$ (equal to the state)','Interpreter','latex','FontSize',15)
xlim([minx maxx]);xlabel('time [s]');ylabel('angle [rad]');
subplot(4,1,3);hold on;
xline(set_pos,'-',label);
plot(meas_states.time, meas_states.signals.values(:,3))
title('Real-time Output of $\dot{\theta}$ (equal to the state)','Interpreter','latex','FontSize',15)
xlim([minx maxx]);xlabel('time [s]');ylabel('angular velocity [rad/s]');
subplot(4,1,4);hold on;
xline(set_pos,'-',label);
plot(meas_states.time, meas_states.signals.values(:,4))
title('Real-time Output of $\dot{\alpha}$ (equal to the state)','Interpreter','latex','FontSize',15)
xlim([minx maxx]);xlabel('time [s]');ylabel('angular velocity [rad/s]');
sgtitle(strcat(QR,', Disturbance rejection, $\omega_{2}$, Real-time Output of the estimated state'),'Interpreter','latex','FontSize',25);
saveas(fig_states, strcat(plot_dir,QR,'_disturbance_states_omega2.png'));
%% Plotting omega 3 setpoint
close all;
load('trialLUT14_omegac_022pi.mat')
QR = 'QR8';
% label = {'x_d','x_0','x_d'};
% set_pos1 = 34.66;
% set_pos2 = 2;
% set_pos3 = 150;
% set_pos = [set_pos1,set_pos2,set_pos3];
up_y = 0.5; down_y = -1; minx =0; maxx = 30; % axis definition
fig_ctrl = figure('units','normalized','outerposition',[0 0 1 1]);
hold on
plot(meas_ctrl.time,meas_ctrl.signals.values)
% xline(set_pos,'-',label)
xlim([minx maxx]);
title(strcat(QR,', unstable, $\omega_{3}$, Real-time Output of Control signal $u = -K*(x-x_d)$'),'Interpreter','latex','FontSize',25);
legend('$u_{control}$','Interpreter','latex');
xlabel('time [s]');ylabel('Voltage [V]');
saveas(fig_ctrl, strcat(plot_dir,QR,'_unstable_omega3.png'));
fig_states = figure('units','normalized','outerposition',[0 0 1 1]);
subplot(4,1,1);hold on;
plot(meas_states.time, meas_states.signals.values(:,1));
% xline(set_pos,'-',label);
title('Real-time Output of $\theta$ (equal to the state)','Interpreter','latex','FontSize',15)
xlim([minx maxx]);xlabel('time [s]');ylabel('angle [rad]');
subplot(4,1,2);hold on;
% xline(set_pos,'-',label);
plot(meas_states.time, meas_states.signals.values(:,2));
title('Real-time Output of $\alpha$ (equal to the state)','Interpreter','latex','FontSize',15)
xlim([minx maxx]);xlabel('time [s]');ylabel('angle [rad]');
subplot(4,1,3);hold on;
% xline(set_pos,'-',label);
plot(meas_states.time, meas_states.signals.values(:,3))
title('Real-time Output of $\dot{\theta}$ (equal to the state)','Interpreter','latex','FontSize',15)
xlim([minx maxx]);xlabel('time [s]');ylabel('angular velocity [rad/s]');
subplot(4,1,4);hold on;
% xline(set_pos,'-',label);
plot(meas_states.time, meas_states.signals.values(:,4))
title('Real-time Output of $\dot{\alpha}$ (equal to the state)','Interpreter','latex','FontSize',15)
xlim([minx maxx]);xlabel('time [s]');ylabel('angular velocity [rad/s]');
sgtitle(strcat(QR,', unstable, $\omega_{3}$, Real-time Output of the estimated state'),'Interpreter','latex','FontSize',25);
saveas(fig_states, strcat(plot_dir,QR,'_unstable_omega3.png'));
%% Plotting omega 3 disturbance
% close all;
% load('trialLUT13_omegac_022pi.mat')
% QR = 'QR8';
% label = {'Dist','Dist','Dist'};
% set_pos1 = 61.745;
% set_pos2 = 65.4;
% set_pos3 = 80;
% set_pos = [set_pos1,set_pos2,set_pos3];
% up_y = 0.5; down_y = -1; minx =58; maxx = 67; % axis definition
% fig_ctrl = figure('units','normalized','outerposition',[0 0 1 1]);
% hold on
% plot(meas_ctrl.time,meas_ctrl.signals.values)
% xline(set_pos,'-',label)
% xlim([minx maxx]);
% title(strcat(QR,' Disturbance rejection $\omega_{3}$ Real-time Output of Control signal $u = -K*(x-x_d$)'),'Interpreter','latex','FontSize',25);
% legend('$u_{control}$','Interpreter','latex');
% xlabel('time [s]');ylabel('Voltage [V]');
% saveas(fig_ctrl, strcat(plot_dir,QR,'_disturbance_control_omega3.png'));
% fig_states = figure('units','normalized','outerposition',[0 0 1 1]);
% subplot(4,1,1);hold on;
% plot(meas_states.time, meas_states.signals.values(:,1));
% xline(set_pos,'-',label);
% title('Real-time Output of $\theta$ (equal to the state)','Interpreter','latex','FontSize',15)
% xlim([minx maxx]);xlabel('time [s]');ylabel('angle [rad]');
% subplot(4,1,2);hold on;
% xline(set_pos,'-',label);
% plot(meas_states.time, meas_states.signals.values(:,2));
% title('Real-time Output of $\alpha$ (equal to the state)','Interpreter','latex','FontSize',15)
% xlim([minx maxx]);xlabel('time [s]');ylabel('angle [rad]');
% subplot(4,1,3);hold on;
% xline(set_pos,'-',label);
% plot(meas_states.time, meas_states.signals.values(:,3))
% title('Real-time Output of $\dot{\theta}$ (equal to the state)','Interpreter','latex','FontSize',15)
% xlim([minx maxx]);xlabel('time [s]');ylabel('angular velocity [rad/s]');
% subplot(4,1,4);hold on;
% xline(set_pos,'-',label);
% plot(meas_states.time, meas_states.signals.values(:,4))
% title('Real-time Output of $\dot{\alpha}$ (equal to the state)','Interpreter','latex','FontSize',15)
% xlim([minx maxx]);xlabel('time [s]');ylabel('angular velocity [rad/s]');
% sgtitle(strcat(QR,' Disturbance rejection $\omega_{3}$ Real-time Output of the estimated state'),'Interpreter','latex','FontSize',25);
% saveas(fig_states, strcat(plot_dir,QR,'_disturbance_states_omega3.png'));
%% Plotting QR10 disturbance 15
close all;
load('sim_11_ALL_new_5_30.mat')
QR = 'QR10';
label = {'Dist','Dist','Dist'};
set_pos1 = 64.625;
set_pos2 = 71.8;
set_pos3 = 76.97;
set_pos = [set_pos1,set_pos2,set_pos3];
up_y = 0.5; down_y = -1; minx =60; maxx = 90; % axis definition
fig_ctrl = figure('units','normalized','outerposition',[0 0 1 1]);
hold on
plot(meas_ctrl.time,meas_ctrl.signals.values)
xline(set_pos,'-',label)
xlim([minx maxx]);
title(strcat(QR,', Disturbance rejection, Real-time Output of Control signal u = -K*(x-x_d)'),'FontSize',25);
legend('$u_{control}$','Interpreter','latex');
xlabel('time [s]');ylabel('Voltage [V]');
saveas(fig_ctrl, strcat(plot_dir,QR,'_disturbance_control.png'));
fig_states = figure('units','normalized','outerposition',[0 0 1 1]);
subplot(4,1,1);hold on;
plot(meas_states.time, meas_states.signals.values(:,1));
xline(set_pos,'-',label);
title('Real-time Output of $\theta$ (equal to the state)','Interpreter','latex','FontSize',15)
xlim([minx maxx]);xlabel('time [s]');ylabel('angle [rad]');
subplot(4,1,2);hold on;
xline(set_pos,'-',label);
plot(meas_states.time, meas_states.signals.values(:,2));
title('Real-time Output of $\alpha$ (equal to the state)','Interpreter','latex','FontSize',15)
xlim([minx maxx]);xlabel('time [s]');ylabel('angle [rad]');
subplot(4,1,3);hold on;
xline(set_pos,'-',label);
plot(meas_states.time, meas_states.signals.values(:,3))
title('Real-time Output of $\dot{\theta}$ (equal to the state)','Interpreter','latex','FontSize',15)
xlim([minx maxx]);xlabel('time [s]');ylabel('angular velocity [rad/s]');
subplot(4,1,4);hold on;
xline(set_pos,'-',label);
plot(meas_states.time, meas_states.signals.values(:,4))
title('Real-time Output of $\dot{\alpha}$ (equal to the state)','Interpreter','latex','FontSize',15)
xlim([minx maxx]);xlabel('time [s]');ylabel('angular velocity [rad/s]');
sgtitle(strcat(QR,', Disturbance rejection, Real-time Output of the estimated state'),'FontSize',25);
saveas(fig_states, strcat(plot_dir,QR,'_disturbance_states.png'));
%% Plotting QR10 setpoint 15
close all;
load('sim_11_ALL_new_5_30.mat')
QR = 'QR10';
label = {'x_d','x_0','x_d'};
set_pos1 = 27.69;
set_pos2 = 44.78;
set_pos3 = 150;
set_pos = [set_pos1,set_pos2,set_pos3];
up_y = 0.5; down_y = -1; minx =20; maxx = 50; % axis definition
fig_ctrl = figure('units','normalized','outerposition',[0 0 1 1]);
hold on
plot(meas_ctrl.time,meas_ctrl.signals.values)
xline(set_pos,'-',label)
xlim([minx maxx]);
title(strcat(QR,', 15° set point, Real-time Output of Control signal u = -K*(x-x_d)'),'FontSize',25);
legend('$u_{control}$','Interpreter','latex');
xlabel('time [s]');ylabel('Voltage [V]');
saveas(fig_ctrl, strcat(plot_dir,QR,'_setpoint_control.png'));
fig_states = figure('units','normalized','outerposition',[0 0 1 1]);
subplot(4,1,1);hold on;
plot(meas_states.time, meas_states.signals.values(:,1));
xline(set_pos,'-',label);
title('Real-time Output of $\theta$ (equal to the state)','Interpreter','latex','FontSize',15)
xlim([minx maxx]);xlabel('time [s]');ylabel('angle [rad]');
subplot(4,1,2);hold on;
xline(set_pos,'-',label);
plot(meas_states.time, meas_states.signals.values(:,2));
title('Real-time Output of $\alpha$ (equal to the state)','Interpreter','latex','FontSize',15)
xlim([minx maxx]);xlabel('time [s]');ylabel('angle [rad]');
subplot(4,1,3);hold on;
xline(set_pos,'-',label);
plot(meas_states.time, meas_states.signals.values(:,3))
title('Real-time Output of $\dot{\theta}$ (equal to the state)','Interpreter','latex','FontSize',15)
xlim([minx maxx]);xlabel('time [s]');ylabel('angular velocity [rad/s]');
subplot(4,1,4);hold on;
xline(set_pos,'-',label);
plot(meas_states.time, meas_states.signals.values(:,4))
title('Real-time Output of $\dot{\alpha}$ (equal to the state)','Interpreter','latex','FontSize',15)
xlim([minx maxx]);xlabel('time [s]');ylabel('angular velocity [rad/s]');
sgtitle(strcat(QR,', 15° set point, Real-time Output of the estimated state'),'FontSize',25);
saveas(fig_states, strcat(plot_dir,QR,'_setpoint_states.png'));
