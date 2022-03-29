fprintf("===============================================\n");
fprintf("Starting calculating linear state-space model. \n");

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
C=eye(2,4);
D=zeros(2,1);

% simulate the state sppace model
sys = ss(A,B,C,D);

% analyze the state space model