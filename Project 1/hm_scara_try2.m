clear all
clc
close all
syms th1 th2 th3 d0 d1 d3 d4 d5

T01= [cos(th1) 0 -sin(th1) 0;
sin(th1) 0  cos(th1) 0;
0 -1 0 d0;
0 0 0 1];

T1_1b= [cos(th2) -sin(th2) 0 0;
       sin(th2)  cos(th2) 0 0;
        0 0 1 d1;
        0 0 0 1];
    

T1b_2= [0 1 0 d3;
       1  0 0 0;
        0 0 -1 0;
        0 0 0 1];


% T12= [-sin(th2) cos(th2) 0 d3*cos(th2);
% cos(th2)  sin(th2) 0 d3*sin(th2);
% 0 0 -1 d1;
% 0 0 0 1];
T23= [sin(th3) 0 -cos(th3) -d5*cos(th3);
-cos(th3) 0 -sin(th3) -d5*sin(th3);
0 1 0 d4;
0 0 0 1];

T03= T01*T1_1b*T1b_2*T23;

P= T03(1:3,4);
dp_dth1=diff(P,th1);
dp_dth2=diff(P,th2);
dp_dth3=diff(P,th3);
Jacobian=[dp_dth1,dp_dth2,dp_dth3]
