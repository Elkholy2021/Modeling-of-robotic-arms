clear all
clc
close all
syms th1 th2 th3 th4 th5 d0 d1 d3 d4 d5 d6 d7

T01= [cos(th1) 0 -sin(th1) 0;
sin(th1) 0  cos(th1) 0;
0 -1 0 d0;
0 0 0 1];
T12= [-sin(th2) cos(th2) 0 d3*cos(th2);
cos(th2)  sin(th2) 0 d3*sin(th2);
0 0 -1 d1;
0 0 0 1];
T23= [sin(th3) 0 -cos(th3) -d5*cos(th3);
-cos(th3) 0 -sin(th3) -d5*sin(th3);
0 1 0 d4;
0 0 0 1];

T34=[sin(th4) 0 cos(th4) 0;
    -cos(th4) 0 sin(th4) 0;
    0 -1 0 d6;
    0 0 0 1];
T45=[cos(th5) -sin(th5) 0 d7*sin(th5);
     sin(th5) cos(th5) 0 -d7*cos(th5);
     0 0 1 0;
     0 0 0 1]


T05= T01*T12*T23*T34*T45;

P= T05(1:3,4);
dp_dth1=diff(P,th1);
dp_dth2=diff(P,th2);
dp_dth3=diff(P,th3);
dp_dth4=diff(P,th4);
dp_dth5=diff(P,th5);
Jacobian=[dp_dth1,dp_dth2,dp_dth3,dp_dth4,dp_dth5]







