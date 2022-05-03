% be sure that this file run after running param.m and lin_state_space.m.
% TODO is digitalization necessary for this part?
%Gaetan: No, assignment 2.2 states the controller is designed in continuous
%time. I guess the discretization comes afterwards. 
load ./rip/lin_ss_model.mat
C = eye(4);
D = zeros(4,1);
sys = ss(A,B,C,D);
trial_index  = 4;
fprintf('===============================================\n')
fprintf('=========== starting trial: %s ===========\n', trial_LUT(trial_index).name)
[K,~,~] = lqr(sys,trial_LUT(trial_index).Q,trial_LUT(trial_index).R);
% TODO draw and reason the simulink block.
%Reminder: system state structure = [theta,alpha,diff_theta,diff_alfa]
x0 = [0,0,0,0]; %desired convergence state of the system
xd = [30*pi/180,0,0,0]; %initial state of the system
simOut = sim('continuous_time_sim_r2021b');
fprintf('completed simulation, now analyzing...\n');
%% Extracting logged signals from the simulation results
state_seq = simOut.logsout{6};
theta_out = simOut.logsout{1};
alpha_out = simOut.logsout{2};
theta_diff_out = simOut.logsout{3};
alpha_diff_out = simOut.logsout{4};
u_control = simOut.logsout{5};

fig_state = figure('units','normalized','outerposition',[0 0 1 1]);
plot(simOut.tout,state_seq.Values.data)
legend('theta','alpha', 'dif theta', 'dif alpha')
title('Model state response')
xlabel('time [s]')
ylabel('angle (rad)/ angular velocity (rad/s)')
saveas(fig_state,strcat('rip/plots/Q_and_R_plots/Set_index_',int2str(trial_index),'/sim_state.png'))
clear fig_state;
fig_out = figure('units','normalized','outerposition',[0 0 1 1]);
subplot(4,1,1)
plot(simOut.tout, theta_out.Values.data)
title('Simulink Output of the theta angle (equal to the state)')
xlabel('time [s]')
ylabel('angle (rad)')
subplot(4,1,2)
plot(simOut.tout, alpha_out.Values.data)
title('Simulink Output of the alpha angle (equal to the state)')
xlabel('time [s]')
ylabel('angule (rad)')
subplot(4,1,3)
plot(simOut.tout, theta_diff_out.Values.data)
title('Simulink Output of the theta diff angle (equal to the state)')
xlabel('time [s]')
ylabel('angular velocity (rad/s)')
subplot(4,1,4)
plot(simOut.tout, alpha_diff_out.Values.data)
title('Simulink Output of the alpha diff angle (equal to the state)')
xlabel('time [s]')
ylabel('angular velocity (rad/s)')
saveas(fig_out,strcat('rip/plots/Q_and_R_plots/Set_index_',int2str(trial_index),'/sim_out.png'))
clear fig_out;
fig_control = figure('units','normalized','outerposition',[0 0 1 1]);
plot(simOut.tout, u_control.Values.data);
title('Simulink Control signal u = -K*(x-xd)')
xlabel('time [s]')
ylabel('Voltage [V]')
saveas(fig_control,strcat('rip/plots/Q_and_R_plots/Set_index_',int2str(trial_index),'/sim_control.png'))
clear fig_control;
%% Analysis of closed loop properties
% closed loop eigenvalues (pole-zero plot)
% step response: settling-time, rise-time, overshoot, amount of input-signal, ...
% impulse response; damping, the eigenfrequencies of the closed-loop system, ...
% TODO complete what we want to analyze with the three plots and reasoning.

%modelling the feedback system has been done using multibple methods listed
%below:


% Method 1:The feedback is created using a system where only the input directly influences
% the output => D = K
% A_feedback = zeros(4);
% B_feedback = zeros(4);
% C_feedback = zeros(1,4);
% D_feedback = K; 
% sys_feedback = ss(A_feedback,B_feedback,C_feedback,D_feedback);
% sys_cl = feedback(sys, sys_feedback);
%PROMBLEM => renders 4 poles at the origin on top of the existing poles
%=> dangerous for dicretization shift => not practically usable

%Method2: Directly connecting the system output to the control law
%sys_cl = feedback(K*sys,1);
%source: https://www.ctms.engin.umich.edu/CTMS/index.php?example=Introduction&section=ControlRootLocus
% PROBLEM: In this case, the 4 poles at the origin disappear. However, this then returns 
% a single output system that doesn't correspond to the physical 
% system (alpha and theta should be present as outputs) => no correct state
% feedback => not usable

%Method 3: Proposed method in the inverted pendulum example on toledo
%Other source: http://mocha-java.uccs.edu/ECE5520/ECE5520-CH06.pdf
%+ page 100 in Handbook
A_feedback = A - B*K;
B_feedback = B;
C_feedback = C;
D_feedback = D; 
sys_cl = ss(A_feedback,B_feedback,C_feedback,D_feedback);
save('./rip/lin_cl_ss_model.mat','A_feedback','B_feedback','C_feedback','D_feedback');
%closed loop poles
fig_pz = figure('units','normalized','outerposition',[0 0 1 1]);
pzmap(sys_cl)
[p_cl,z_cl] = pzmap(sys_cl);
saveas(fig_pz,strcat('rip/plots/Q_and_R_plots/Set_index_',int2str(trial_index),'/pzmap.png'))
clear fig_pz;
% All poles in left half plane => stable. 

%step response: 
%TODO: what exactly is meant by 'amount of input-signal' in the assignment?
%The step amplitude and offset can be adapted using the opt struct below,
%but it is not supported by the stepinfo function.
opt = stepDataOptions('InputOffset',-1,'StepAmplitude',2);

fig_step = figure('units','normalized','outerposition',[0 0 1 1]);
%step(sys_cl,5,opt)
step(sys_cl,5)
S = stepinfo(sys_cl);
saveas(fig_step,strcat('rip/plots/Q_and_R_plots/Set_index_',int2str(trial_index),'/step.png'))
clear fig_step;

%Impulse response
fig_imp = figure('units','normalized','outerposition',[0 0 1 1]);
impulse(sys_cl,5)
[wn, zeta] = damp(sys_cl);
saveas(fig_imp,strcat('rip/plots/Q_and_R_plots/Set_index_',int2str(trial_index),'/imp.png'))
clear fig_imp;

%Printing system properties (see book p. 78-79)
% The values for the overshoot/undershoot and settlingtime are weird.
% Probably due to the fact thatfor a step the alpha and angular velocities
% return to zero (as physically expected), but the property calculator
% expects them to settle at a nonzero value.

for i = 1:length(S)
    fprintf("Step properties mode %d \n",i);
    disp(S(i));
end
T = struct2table(S);
writetable(T, strcat('rip/plots/Q_and_R_plots/Set_index_',int2str(trial_index),'/param_step.xlsx'),"WriteMode","append","AutoFitWidth",false)

eigenfrequencies = wn;
damping_ratio = zeta;
fprintf("Pole amount:\n");
disp(size(p_cl,1));
fprintf("Poles:\n");
disp(p_cl);
fprintf("Impulse Response:\n");
fprintf("> The system has eigenfrequencies: [rad/s] \n");
disp(eigenfrequencies);
fprintf("> The system has damping ratios.\n");
disp(damping_ratio);

%Saving the system parameters
T = table(p_cl, wn, zeta,'VariableNames', { 'Closed loop poles', 'Eigenfrequencies', 'Damping ratios'} );
writetable(T, strcat('rip/plots/Q_and_R_plots/Set_index_',int2str(trial_index),'/param_imp.xlsx'),"WriteMode","append","AutoFitWidth",false)
writetable(T, strcat('rip/plots/Q_and_R_plots/Set_index_',int2str(trial_index),'/param_imp.txt'))

%% Q and R factor discussion (based on the plots and datafiles stored in rip/plots/Q_and_R_plots
%Comparison of the 4 last parameter sets to the default one:

%Set1: Smaller R value (1 instead of 1.5):
%Imp: Similar real pole values but larger complex part, larger eigenfrequencies
%(mostly) and smaller damping ratios (when not one)
%Step: Every timing value is smaller: rise time, transient, settling, peak
%and peak value also smaller
%Sim: control signal peak voltage has increased => more agressive
%controller => motor moves faster => shorter timings

%Set2: Larger R value (3 instead of 1.5):
%Imp: Poles have all negative real value (stable), but no complex parts!
%Similar eigenfrequencies, but damping ratios are all 1 (increase) => no
%oscillation at all!?
%Step: Larger times for every convergence => larger peak value
%Sim: Much lower control signal peak => lower motor voltage => slower
%response + convergence

%Set 3: Smaller Q diagonal elements (half)
%Imp: Exact same poles as in set2, as the proportional parameter difference
%is exactly the same! => same eigenfrequencies and damping
%Step: Same longer times
%Sim: Same lower control value: same proportion of the QR parameters causes
%same weaker motor voltage and slower response

%Set4: Larger Q diagonal elements (double)
%Imp: More negative real pole values (for the smallest ones) and larger
%complex parts => interesting for stability!, smaller damping ratios
%Step: Shorter timings for everything, lower peak value
%Sim: largest control voltage peak up till now => faster moving motor =>
%faster convergence

%Conslusion: complementary and proportional weight changes give similar
%results as in both cases the same input of the cost function J is
%favoured. Either the control signal u is small compared to the state values if the
%first have the largest weight R compared to Q, or the response u is larger
%if it has smaller weight R compared to Q. When the Q is smaller
%proportionally to R, the theta and alpha angles have much smaller negative
%signed osicillations (see output plots of sets 4 and 5) as only those
%state values are maximized du to the smaller first 2 diagonal Q values.
%http://www.cds.caltech.edu/~murray/courses/cds110/wi06/lqr.pdf
