% First run the quadc_param code

A = [0,0,0,1,0,0,0,0,0,0,0,0;
     0,0,0,0,1,0,0,0,0,0,0,0;
     0,0,0,0,0,1,0,0,0,0,0,0;
     0,0,0,-k_d/m,0,0,0,0,0,0,0,0;
     0,0,0,0,-k_d/m,0,0,0,0,0,0,0;
     0,0,0,0,0,-k_d/m,0,0,0,0,0,0;
     0,0,0,0,0,0,0,0,0,1,0,0;
     0,0,0,0,0,0,0,0,0,0,1,0;
     0,0,0,0,0,0,0,0,0,0,0,1;
     0,0,0,0,0,0,0,0,0,0,0,0;
     0,0,0,0,0,0,0,0,0,0,0,0;
     0,0,0,0,0,0,0,0,0,0,0,0;
     ];
A(4,8) = g;
A(5,7) = -g;
B = [0,0,0,0;
     0,0,0,0;
     0,0,0,0;
     0,0,0,0;
     0,0,0,0;
     (k*C_m)/m,(k*C_m)/m,(k*C_m)/m,(k*C_m)/m;
     0,0,0,0;
     0,0,0,0;
     0,0,0,0;
     (L*k*C_m)/I_xx,0,-(L*k*C_m)/I_xx,0;
     0,(L*k*C_m)/I_yy,0,-(L*k*C_m)/I_yy
     (b*C_m)/I_zz,-(b*C_m)/I_zz,(b*C_m)/I_zz,-(b*C_m)/I_zz];
C = [eye(3) zeros(3,9);zeros(3,6),eye(3),zeros(3,3)];
D=zeros(6,4);
