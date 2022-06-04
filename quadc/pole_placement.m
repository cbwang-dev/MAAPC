%Steps for controller and estimator design:
% We have a MIMO system with 4 inputs and 6 outputs. The system has 12
% modes (12x12 A matrix). 
% - The poles of K can be chosen assuming a second order system assumption, the
% dominant poles can be set and the remaining ones can be set far away as
% non dominant poles.
% -The poles of the estimator can be chosen as having a settling time 2 to 5 times
% shorter than the controller

%% Step 1: Closed loop pole definintion

%setting deisred closed loop properties for controller and estimator in
%continuous time
Ts = 0.05;
zeta_K = 0.8;
t_settling_K = 6; %[s]
zeta_L = 0.8;
t_settling_L = 0.6; %[s]
% zeta_K = 0.9;
% t_settling_K = 8; %[s]
% zeta_L = 0.9;
% t_settling_L = 0.8; %[s]
pole_lst_K = pole_calc(12,t_settling_K,zeta_K);
pole_lst_L = pole_calc(12,t_settling_L,zeta_L);

% Discretizing the pole lists
pole_lst_K_d = exp(Ts.*pole_lst_K);
pole_lst_L_d = exp(Ts.*pole_lst_L);
%% Step 2: Placing the poles and computing controller/estimator gains
K = place(A_d,B_d,pole_lst_K_d);
L = place(A_d',C_d',pole_lst_L_d)';
%% Step 3: Running the controller - estimator simuling model
A_est = A_d - L*C_d;
init_est = zeros(12,1);
B_est = cat(2,B_d-L*D_d,L);
C_est = eye(12);
D_est = zeros(12,10);
N = [A_d-eye(size(A_d)), B_d; C_d,D_d]\[zeros(size(A_d,1),size(C_d,1)); eye(size(C_d,1),size(C_d,1))];
Nx = N(1:size(A_d,1),:);
Nu = N(size(A_d,1)+1:end,:);
Vmax = 100;
set_angle = [0;0;0];
Tmax = 50;
sim("quadcopter_pole_placement_sim.slx", Tmax);
generate_report(1);

function pole_lst = pole_calc(len, t_settling,zeta)
    % computing the corresponding 2 dominant poles
    omega_n = 4.6/(zeta*t_settling);
    disp(omega_n)
    dom_pole_1 = -zeta*omega_n + omega_n*(sqrt(1-zeta^2))*1i;
    dom_pole_2 = -zeta*omega_n - omega_n*(sqrt(1-zeta^2))*1i;
    
    % setting the 10 nondominant poles far away
    pole_lst = zeros(len,1);
    pole_lst(1:2) = [dom_pole_1;dom_pole_2];
    for i = 3:12
        pole_lst(i) = real(dom_pole_2)*5 - 0.02*i;
    end
end

