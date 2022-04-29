sys = ss(A,B,C,D);
transf = tf(sys);
Ts = 0.05;
sys_d = c2d(sys,Ts,'zoh');
transf_d = tf(sys_d);
[A_d,B_d,C_d,D_d] = ssdata(tf_DT_bilinear);
