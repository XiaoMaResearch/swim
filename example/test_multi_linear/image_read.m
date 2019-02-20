clear all
close all
clc




folder ='z_pos_input';
filename = [folder  '/'   'temp.PNG'];


data = imread(filename);
I = rgb2gray(data);
I = double(I);
min_pixel_value = min(min(I));
max_pixel_value = max(max(I));

min_value = -0.3;
max_value = 0.3;

scale = (max_value-min_value)/typecast(max_pixel_value-min_pixel_value,'double');

disp_Z = I*scale+min_value;


[ny,nx] = size(I);

ymin = -15e3;
ymax = 15e3;
xmin = -20e3;
xmax = 20e3;
dx = (xmax-xmin)/nx;
dy = (ymax-ymin)/ny;

x = linspace(xmin,xmax,nx);
y = linspace(ymin,ymax,ny);

[X,Y] = meshgrid(x,y);
%%
figure (1)
pcolor(X,Y,disp_Z),shading interp
colorbar()

%% output 

t = [0 1 2];
generate_text_file('new_input.txt', x,y,disp_Z', t)


