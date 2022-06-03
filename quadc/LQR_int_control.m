% Using one integrator

% Constructing the augmented system 
sz_A = size(A_d);
sz_B = size(B_d);
A_aug = [A_d,zeros(sz_A(1),3);
         eye(3),zeros(3,sz_A(1)-3),eye(3)];
B_aug = [B_d;zeros(3,sz_B(2))];
% A_aug = [A_d,zeros(sz_A(1),6);
%          eye(6),zeros(6,sz_A(1)-6),eye(6)];
% B_aug = [B_d;zeros(6,sz_B(2))];
% Checking the rank of relevant matrices
fprintf('Rank of the controllability matrix = %i',rank(ctrb(A_aug,B_aug)))
%TODO: Controllability problem??


%Creating new Q and R matrices that match the augmented model. The 3 added
%rows represent the position error. hence, the weight on the z-component of
%that error has to be increased to increase the integral control action


Q = eye(size(A_aug,2));
Q(1:2,1:2) = 30E0*Q(1:2,1:2);
Q(3,3) = 8E3*Q(3,3);
Q(4:5,4:5) = 10E0*Q(4:5,4:5);
Q(6,6) = 8E3*Q(6,6);
Q(13,13) = 1;
Q(14,14) = 1;
Q(size(A_aug,2),size(A_aug,2)) = 1E3;
% Q(15,15) = 1E2;
% Q(16:18,16:18) = 2;
R = eye(size(B_aug,2));

% TODO: The solving of the Ricatti equation renders no solution when the
% A matrix without gravity additions are used. Possible reason: the error
% that is taken to compute the integrator error is the difference between
% output and the reference y(t) - r(t) => the gravity must be taken into account.
% Before, it was pure state feedback, thus no gravity influence!
% However, this is not solvable with the external gain method we used in
% the template. Therefore, we need to know why that gravity can be added in
% thos elements of the A matrix...

[K,~,~] = dlqr(A_aug,B_aug, Q,R,[]);

Ks = K(:,1:12);
Ki = K(:,13:end);
Vmax = 100;
Tmax = 50;
set_angle = [0;0;0];
sim( "quadcopter_int_LQR_sim.slx",Tmax)
generate_report(0);

%PAYLOAD: 
% Less issues with the psi angle, still through all checkpoints,even faster
% circuit completion!

