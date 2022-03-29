fprintf("===============================================\n");
fprintf("==== calculating linear state-space model. ====\n");

% calculate useful parameters for state-space model, chapter 2.1.3
a = J_eq + (m * r^2);
b = m * L * r;
c = (4/3) * m * L^2;
d = m * g * L;
E = a * c - b^2;
G = (eta_m * eta_g * K_t *K_m * K_g^2 + B_eq * R_m) / R_m;

% state space model matrix
A=[0 0     1      0;
   0 0     0      1;
   0 b*d/E -c*G/E 0;
   0 a*d/E -b*G/E 0];
B=[0;
   0;
   c*(eta_m*eta_g*K_t*K_g)/(R_m*E);
   b*(eta_m*eta_g*K_t*K_g)/(R_m*E)];
% TODO: In the assignment: The matrices C and D must be determined based on the
% sensors present in the setup. Can I define C and D as below?
C=eye(2,4);   % we can only measure alpha and theta
D=zeros(2,1); % we can only measure alpha and theta
save('lin_ss_model.mat','A','B','C','D');
fprintf("saved linear state-space model in lin_ss_model.mat. \n");

% simulate the state space model
sys = ss(A,B,C,D);
fprintf("linear state-space model created, in variable sys.\n")

%% analyze the state space model

% step response
fig_step_response = figure();step(sys);
saveas(fig_step_response,'./plots/1_step_response.png');
clear fig_impulse_response;

% impulse response
fig_impulse_response=figure();impulse(sys);
saveas(fig_impulse_response,'./plots/1_impulse_response.png');
clear fig_step_response;

% pole-zero map
fig_pzmap = figure();pzmap(sys);
saveas(fig_pzmap,'./plots/1_pzmap.png');
clear fig_pzmap;

% stability
poles = eig(A);
for pole=poles'
    if pole > 0
        fprintf("The system is unstable with a pole %f.\n",pole);
        break;
    end
    fprintf("The system is stable.\n");
end

% transmission zeros
tzeros = tzero(sys);
fprintf("The system has %d transmission zeros.\n",length(tzeros));

% controllability
fprintf("controllability: controllability matrix rank test:\n")
co = ctrb(sys);
fprintf("> The system has %d states.\n",length(A));
fprintf("> The system has %d controllable states.\n",rank(co));
fprintf("controllability: PBH test:\n")
[V,d] = eig(A');
co = B'*V;
for i_co = co
    if i_co == 0
        fprintf("The system is not controllable.\n");
        break;
    end
    fprintf("> The system is controllable.\n");
end

% observability
oo = obsv(sys);
fprintf("observability:\n")
fprintf("> The system has %d states.\n",length(A));
fprintf("> The system has %d observable states.\n",rank(oo));
fprintf("===============================================\n\n");
close all