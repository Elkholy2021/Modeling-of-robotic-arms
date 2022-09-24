clc
clear all
syms th1 th2 th3 L1 L2 L3 
T0_1 = [cos(th1) -sin(th1) 0 0;
        sin(th1) cos(th1) 0 0;
        0 0 1 0;
        0 0 0 1];

T1_2 = [cos(th2) -sin(th2) 0 L1;
        0 0 -1 0;
        sin(th2) cos(th2) 0 0;
        0 0 0 1];

T2_3 = [cos(th3) -sin(th3) 0 L2;
        sin(th3) cos(th3) 0 0;
        0 0 1 0;
        0 0 0 1];

T3_4 = [1 0 0 L3;
        0 1 0 0;
        0 0 1 0;
        0 0 0 1];

T0_4 = T0_1*T1_2*T2_3*T3_4;
T=T0_4(:,4)
dx_dth1= diff(T(1),th1);
dx_dth2= diff(T(1),th2);
dx_dth3= diff(T(1),th3);

dy_dth1= diff(T(2),th1);
dy_dth2= diff(T(2),th2);
dy_dth3= diff(T(2),th3);

dz_dth1= diff(T(3),th1);
dz_dth2= diff(T(3),th2);
dz_dth3= diff(T(3),th3);

disp("The jacobian matrix")
J=[dx_dth1 dx_dth2 dx_dth3;
   dy_dth1 dy_dth2 dy_dth3;
   dz_dth1 dz_dth2 dz_dth3]

