clear all
close all
clc


filename1 = 'z_pos_input/disp_z.vtk';
filename2 = 'z_pos_input/coord.vtk';

% tline = fgetl(fid);
% while ischar(tline)
%     if (strcmp(tline,'VECTORS displacement double'))
%         disp(tline)
%         tline = fgetl(fid);
%     end
% end
% 
% 
% fclose(fid);





disp = load(filename1);


coord = load(filename2);



u_z = disp(:,3);
x= coord(:,1);
y = coord(:,2);

x_min = min(x)
x_max = max(x)
y_min = min(y)
y_max = max(y)
dx = 150;
nx = (x_max-x_min)/dx
ny = (y_max-y_min)/dx



figure (1)

pcolor(u_z_mat), shading interp;