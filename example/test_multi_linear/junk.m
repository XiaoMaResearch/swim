clear all
close all
clc

filename = 'z_pos_input/haha.png';
data = imread(filename);
I = rgb2gray(data);

imshow(I)