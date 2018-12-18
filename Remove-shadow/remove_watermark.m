clc
close all
clear all

I=imread('paye.jpg');
I1=rgb2gray(I);
[s1,s2]=size(I1);
imhist(I1)
for i=1:s1
    for j=1:s2
        if I1(i,j)>210 && I1(i,j)<240
            I1(i,j)=255;
        end
    end
end
imshow(I1)