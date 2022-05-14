%% Discretization of the linear system

sys = ss(A,B,C,D);
transf = tf(sys);
Ts = 0.05;
sys_d = c2d(sys,Ts,'zoh');
[A_d,B_d,C_d,D_d] = ssdata(sys_d);

%% Stability + controllability analysis

% pole-zero map
pzmap(sys_d)

% stability
poles = eig(A_d);
for pole=poles'
    if abs(pole) > 1
        fprintf("The system is unstable with a pole %f.\n",pole);
        break;
    end
end

% transmission zeros
tzeros = tzero(sys_d);
fprintf("The system has %d transmission zeros.\n",length(tzeros));

% controllability
fprintf("controllability: controllability matrix rank test:\n")
co = ctrb(sys_d);
fprintf("> The system has %d states.\n",length(A_d));
fprintf("> The system has %d controllable states.\n",rank(co));
fprintf("controllability: PBH test:\n")
[V,d] = eig(A_d');
co = B_d'*V;
for i_co = co
    if i_co == 0
        fprintf("The system is not controllable.\n");
        break;
    end
    fprintf("> The system is controllable.\n");
end

% observability
oo = obsv(sys_d);
fprintf("observability:\n")
fprintf("> The system has %d states.\n",length(A));
fprintf("> The system has %d observable states.\n",rank(oo));
fprintf("===============================================\n\n");

%From the controlability full rank and observability full rank follows that
%the system is minimal!