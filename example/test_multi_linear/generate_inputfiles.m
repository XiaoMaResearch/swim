clear all
close all
clc 

xmin = -3;
xmax = 3;
nx = 60;
ymin = -3;
ymax = 3;
ny = 60;

dx = (xmax-xmin)/nx;
dy = (ymax-ymin)/ny;

dt = 0.01;
x = xmin:dx:xmax;
y = ymin:dy:ymax;

v = 10.0;

f_1 = zeros(nx+1,ny+1);


[X,Y] = meshgrid(x,y);

t = 0:dt:10.0;


f = 1000.0*ones(length(t),nx+1,ny+1);

for k = 1:length(t)
    for i = 1:1:nx
        for j = 1:1:ny

            R = sqrt((X(i,j)+v*t(k))^2+Y(i,j)^2);


            if (R<=1.0)

                f(k,i,j) = f(k,i,j)-1.0;
            end
        end
    end
end



figure (1)


pcolor(X,Y,squeeze(f(1,:,:))); shading interp
axis equal

filename = 'test_input.txt';
AXIS_X = sprintf('AXIS X\n');
fid=fopen(filename, 'wt');
fprintf(fid, AXIS_X);  % header
fprintf(fid,'%f ',x);
fprintf(fid,'\n');
AXIS_Y = sprintf('AXIS Y\n');
fprintf(fid,AXIS_Y);
fprintf(fid,'%f ',y);
fprintf(fid,'\n');
AXIS_T = sprintf('AXIS T\n');
fprintf(fid,AXIS_T);
fprintf(fid,'%f ',t);
fprintf(fid,'\n');
DATA = sprintf('DATA\n');
fprintf(fid,DATA);

for i = 1:length(t)
    temp = f(i,:,:);
    fprintf(fid,'%f\n',temp(:));
end
fclose(fid);




