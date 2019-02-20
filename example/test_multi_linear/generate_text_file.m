function []=generate_text_file(filename, x,y,f, t)
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
    temp = squeeze(f(i,:,:));
    temp = temp';
    fprintf(fid,'%f\n',temp(:));
       
end
fclose(fid);
