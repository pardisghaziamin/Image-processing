clc
close all
clear all
I=imread('road.png');

I2=double(I);
[s1,s2,s3]=size(I2);
m=(I2(:,:,1)+I2(:,:,2)+I2(:,:,3))/3;
I3=uint8(m);
BW1=edge(I3,'sobel');

imshow(BW1);

