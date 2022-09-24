clc
clear all
close all
syms th1 th2 th3 q4;

T0_1 = [cos(th1) -sin(th1) 0 0;
        sin(th1) cos(th1) 0 0;
        0 0 1 452.4;
        0 0 0 1];

T1_2 = [cos(th2) -sin(th2) 0 220;
        sin(th2) cos(th2) 0 0;
        0 0 1 222.4;
        0 0 0 1];

T2_3 = [cos(th3) -sin(th3) 0 240;
        sin(th3) cos(th3) 0 0;
        0 0 1 -334;
        0 0 0 1];

T3_4 = [1 0 0 0;
        0 1 0 0;
        0 0 1 q4;
        0 0 0 1];

T0_4 = T0_1*T1_2*T2_3*T3_4;
T=T0_4(:,4);
dx_dth1= diff(T(1),th1);
dx_dth2= diff(T(1),th2);
dx_dth3= diff(T(1),th3);
dx_dq4=diff(T(1),q4);

dy_dth1= diff(T(2),th1);
dy_dth2= diff(T(2),th2);
dy_dth3= diff(T(2),th3);
dy_dq4=diff(T(2),q4);

dz_dth1= diff(T(3),th1);
dz_dth2= diff(T(3),th2);
dz_dth3= diff(T(3),th3);
dz_dq4=diff(T(3),q4);
disp("the complete Jacobian matrix: ")
J=[dx_dth1 dx_dth2 dx_dth3 dx_dq4;
   dy_dth1 dy_dth2 dy_dth3 dy_dq4;
   dz_dth1 dz_dth2 dz_dth3 dz_dq4]
disp("the reduced Jacobian matrix: ")
J_reduced=J(1:2,1:2)

dx_dth1_eq= @(th1,th2) - 220*sin(th1) - 240*cos(th1)*sin(th2) - 240*cos(th2)*sin(th1);
dx_dth2_eq= @(th1,th2) - 240*cos(th1)*sin(th2) - 240*cos(th2)*sin(th1);
dx_dth3_eq= 0;
dx_dq4_eq=0;

dy_dth1_eq= @(th1,th2) 220*cos(th1) + 240*cos(th1)*cos(th2) - 240*sin(th1)*sin(th2);
dy_dth2_eq= @(th1,th2) 240*cos(th1)*cos(th2) - 240*sin(th1)*sin(th2);
dy_dth3_eq= 0;
dy_dq4_eq=0;

dz_dth1_eq= 0;
dz_dth2_eq= 0;
dz_dth3_eq= 0;
dz_dq4_eq=1;
step=2;
Ds=[];
c=0;
for tt1=0:step:90
    for tt2=0:step:90
        
        
        t1=deg2rad(tt1);
        t2=deg2rad(tt2);
        M=[dx_dth1_eq(t1,t2) dx_dth2_eq(t1,t2)  ;
           dy_dth1_eq(t1,t2) dy_dth2_eq(t1,t2) ];
        D=det(M);
        if D<=0.01 && D>=-0.01
            c=c+1;
            Ds(c,1)=(tt1);
            Ds(c,2)=(tt2);
            Ds(c,3)=D;
        end
       
    end
end
t=[1:length(Ds)];
%plot(t,Ds(:,3))
disp("Angles of theta 1 and theta 2 that cause singularites")
Ds(:,1:2)
