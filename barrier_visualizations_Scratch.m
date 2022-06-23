clc;
close all;
clear all;

Obs = [0 3
    1 3
    2 3;
    3 3
    4 3
    5 3];
Sigma = 0.3;
x=0:0.05:5;
y=0:0.05:5;
[X,Y]=meshgrid(x,y);
%Z=sin(X).^2+cos(Y).^2;

Z = (0.6 - exp(-((X-Obs(1,1)).^2 + (Y-Obs(1,2)).^2)/Sigma));

for i = 2:1:length(Obs(:,1))

    Z = Z - exp(-((X-Obs(i,1)).^2 + (Y-Obs(i,2)).^2)/Sigma);

end
Z = sign(Z);

pcolor(X,Y,Z)
colorbar;