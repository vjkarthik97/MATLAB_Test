clc;
close all;
clear all;

Xc = 5;
Yc = 4;
R = 3;

Xe = 10;
Ye = 9;

A = (Xc - Xe)/(Yc - Ye);
B = (R^2)/(Yc-Ye);

a1 = ((-A*B) + ( (A*B)^2 - (1+A^2)*(B^2 - R^2) )^(0.5))/(1+A^2);
a2 = (-(A*B) - ( (A*B)^2 - (1+A^2)*(B^2 - R^2) )^(0.5))/(1+A^2);

b1 = -B - A*a1;
b2 = -B - A*a2;

xt1 = a1 + Xc;
yt1 = b1 + Yc;

xt2 = a2 + Xc;
yt2 = b2 + Yc;

%figure(1)
%viscircles([Xc Yc],R)
%grid on;
%line([xt1 Xe],[yt1 Ye])
%hold on;
%line([xt2 Xe],[yt2 Ye])

Vb = [-2 1];


Pe = [Xe Ye] + Vb;
T1 = [xt1 yt1] + Vb;
T2 = [xt2 yt2] + Vb;

figure(2)
viscircles([Xc Yc],R)
grid on;
line([T1(1) Pe(1)],[T1(2) Pe(2)])
hold on;
line([T2(1) Pe(1)],[T2(2) Pe(2)])
hold on;
scatter(Xe,Ye,'filled','b')
hold on;
quiver(Xe,Ye,Vb(1),Vb(2))
hold on;

Va = [-4 -2];
can_Va = [Xe Ye] + Va;

%% Checking collision

test_vector = can_Va - Pe;

quiver(Pe(1),Pe(2),test_vector(1),test_vector(2))
hold on;
quiver(Xe,Ye,Va(1),Va(2))

cross_T1 = cross([T1 0],[test_vector 0])
cross_T2 = cross([T2 0],[test_vector 0])
