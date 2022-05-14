% ASSUMPTION: whole state vector available!

Q = eye(size(C_d,2));
% Uncomment the Q element assigments below for separate testing
%Test1:
% Q(1:3,1:3) = 1E1*Q(1:3,1:3);
% Q(4:6,4:6) = 1E1*Q(4:6,4:6);

%The nature of the reference that needs to be tracked is a path along x,y,z
%axes. The angular reference = set_angle is zero, which means no boosting
%of the control action is required for state values 7:12
%The test above renders and almost immediate crash with an altitude drop
%below 20m. This means the altitude control is too slow and needs to be
%made more agressive. The corresponding state elements are 3 and 6

%Test2:
% Q(1:3,1:3) = 1E1*Q(1:3,1:3);
% Q(3,3) = 8E6*Q(3,3);
% Q(4:6,4:6) = 1E1*Q(4:6,4:6);
% Q(6,6) = 8E6*Q(6,6);

%The tremendously increased z position and z-velocity state Q-weights indeed show a much more
%aggressive control action and prompt correction of the free fall at the
%start of the simulation. However, an altitude offset remains compared to
%the reference. The x and y position control action can also
%be made more aggressive by increasing their weights.

% Possible explanation for steady state error: the purely proportional
% controller only takes in the error from the previous sample => blind for
% long term steady state error correction. No adaptation possible if
% control action insufficient => integral action necessary.

%Test3:
Q(1:3,1:3) = 3E1*Q(1:3,1:3);
Q(3,3) = 8E6*Q(3,3);
Q(4:6,4:6) = 1E1*Q(4:6,4:6);
Q(6,6) = 8E6*Q(6,6);

%Increasing the 3,3 and 6,6 weights will eventually make the controller
%unstable before it reaches the reference. (Due to numerical reasons?) 

R = eye(size(B_d,2));
[~,K,~] = idare(A_d,B_d, Q,R,[],[]);
N = [A_d-eye(size(A_d)), B_d; C_d,D_d]\[zeros(size(A_d,1),size(C_d,1)); eye(size(C_d,1),size(C_d,1))];
Nx = N(1:size(A_d,1),:);
Nu = N(size(A_d,1)+1:end,:);
Vmax = 100;
set_angle = [0;0;0];
Tmax = 50;
sim("quadcopter_LQR_sim.slx", Tmax);
generate_report(0);

% PAYLOAD:
%Difficulty at checkpoint 4 , psi angle problem => lack of robustness