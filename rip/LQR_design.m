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
x0 = [0,0,0,0]; %desired convergence state of the system
xd = [90*pi/180,0,0,0]; %initial state of the system
simOut = sim('continuous_time_sim');
fprintf('completed simulation, now analyzing...\n');
%% Extracting logged signals from the simulation results
state_seq = simOut.logsout{4};
theta_out = simOut.logsout{1};
alpha_out = simOut.logsout{2};
u_control = simOut.logsout{3};
figure
plot(simOut.tout,state_seq.Values.data)
legend('theta','alpha', 'dif theta', 'dif alpha')
title('Model state response')
xlabel('time [s]')
ylabel('angle (rad)/ angular velocity (rad/s)')

figure
subplot(2,1,1)
plot(simOut.tout, theta_out.Values.data)
title('Output of the theta angle (equal to the state)')
xlabel('time [s]')
ylabel('angle (rad)')
subplot(2,1,2)
plot(simOut.tout, alpha_out.Values.data)
title('Output of the alpha angle (equal to the state)')
xlabel('time [s]')
ylabel('angle (rad)')

figure 
plot(simOut.tout, u_control.Values.data)
title('Control signal u = -K*(x-xd)')
xlabel('time [s]')
ylabel('Voltage [V]')

%% Analysis of closed loop properties
% closed loop eigenvalues (pole-zero plot)
% step response: settling-time, rise-time, overshoot, amount of input-signal, ...
% impulse response; damping, the eigenfrequencies of the closed-loop system, ...
% TODO complete what we want to analyze with the three plots and reasoning.

%modelling the feedback system:

%TODO: The C and D matrices of the original system have to be expanded as I
%only found a method to implement output feedback. In this case it doesn't
%matter that much as the output = state
Cfull = eye(4);
Dfull  = zeros(4,1);
sysfull = ss(A,B,Cfull,Dfull);

% TODO: It is clearly stated in the assignment that the Simulink
% implementation should be done with this (x-xd) controller input. However,
% I am not certain this is needed in the matlab system properties analysis.
% The feedback is created using a system where only the input directly influences
% the output => D = K
A_feedback = zeros(4);
B_feedback = zeros(4);
C_feedback = zeros(1,4);
D_feedback = K; 
sys_feedback = ss(A_feedback,B_feedback,C_feedback,D_feedback);
sys_cl = feedback(sysfull, sys_feedback);

%TODO: The closed loop system as defined above keeps 4 outputs, and has 4
%modes. However, when checking the step properties of those modes, 3 out of
%4 seem to have NaN settling time. I'd expect to have at least 2 modes that
%settle correctly, being the 'real' outputs alpha and theta. Another way to
%compute the closed loop system is as follows:
%sys_cl = feedback(K*sysfull,1);
%source: https://www.ctms.engin.umich.edu/CTMS/index.php?example=Introduction&section=ControlRootLocus
% In this case, the 4 poles at the origin disappear. However, this then returns 
% a single output system that doesn't correspond to the physical 
% system (alpha and theta should be present as outputs).
% The problem probably is that I'm doing state feedback with an output
% feedback matlab function, but don't know how to fix this at the moment. 

%closed loop poles
figure
pzmap(sys_cl)
[p_cl,z_cl] = pzmap(sys_cl);
% All poles in left half plane => stable. However: pole on origin, which
% will likely deviate during distortion due to discretization => RISKY
% The 4 poles situated on the origin correspond to the 0 eigenfrequienties
% and the -1 damping ratios. 

%step response: 
%TODO: what exactly is meant by 'amount of input-signal' in the assignment?
%The step amplitude and offset can be adapted using the opt struct below,
%but it is not supported by the stepinfo function.
opt = stepDataOptions('InputOffset',-1,'StepAmplitude',2);

figure
%step(sys_cl,5,opt)
step(sys_cl,5)
S = stepinfo(sys_cl);

%Impulse response
figure
impulse(sys_cl,5)
[wn, zeta] = damp(sys_cl);

%Printing system properties (see book p. 78-79)
for i = 1:4
    fprintf("Step properties of mode %d \n",i);
    S(i)
end
eigenfrequencies = wn;
damping_ratio = zeta;
fprintf("Pole amount:\n")
disp(size(p_cl,1))
fprintf("Impulse Response:\n")
fprintf("> The system has eigenfrequencies: [rad/s] \n");
disp(eigenfrequencies)
fprintf("> The system has damping ratios.\n");
disp(damping_ratio)
