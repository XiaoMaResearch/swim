clear all
close all
clc


xmin = -20.0;
xmax = 20.0;
ymin = -20.0;
ymax = 20.0;

x_0 = 10.0;
y_0 = 10.0;
sigma = 1.0
dx = 0.1;
dy = 0.1;


x = xmin:dx:xmax;
y = ymin:dy:ymax;

[X,Y] = meshgrid(x,y);

z1_x = (tanh(-(X-x_0)./sigma)+1.0)./2.0.*(X>0.0);
z2_x = (tanh((X+x_0)./sigma)+1.0)./2.0.*(X<=0.0);
z_x = z1_x+z2_x;
z_x = z_x.*(abs(Y)<=y_0);

z1_y = (tanh(-(Y-y_0)./sigma)+1.0)./2.0.*(Y>0.0);
z2_y = (tanh((Y+y_0)./sigma)+1.0)./2.0.*(Y<=0.0);
z_y = z1_y+z2_y;
z_y = z_y.*(abs(X)<=x_0);


z =z_x+z_y;
figure (1)
% 
surf(X,Y,z_x),shading interp;

xlabel('X')
ylabel('Y')

figure (2)
% 
surf(X,Y,z_y),shading interp;

xlabel('X')
ylabel('Y')


figure (3)
% 
surf(X,Y,z),shading interp;

xlabel('X')
ylabel('Y')