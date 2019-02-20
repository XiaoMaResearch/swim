clear all
close all
clc

max_value_array = [0.026,0.23, 0.3];
min_value_array = -1.*max_value_array;
for i = 1:1:3

    str = sprintf('t_%d.PNG',i);
folder ='z_pos_input';
filename = [folder  '/'   str];


data = imread(filename);
I = rgb2gray(data);
I = double(I);
min_pixel_value = min(min(I));
max_pixel_value = max(max(I));

min_value = min_value_array(i);
max_value = max_value_array(i);

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

disp_Z_store(i,:,:) = disp_Z;
end
%% output 

t = [1 2 3];
generate_text_file('new_input.txt', x,y,disp_Z_store, t)


