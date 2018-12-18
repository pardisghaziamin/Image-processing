clc
close all
clear all
I=imread('lll.jpg');
I1=double(rgb2gray(I));
subplot(1,4,1);
imshow(uint8(I1));
mask1=ones(5,5)/25;
[s1,s2]=size(I1);
I2=I1;
for i=1:s1-4
    for j=1:s2-4
        temp=I1(i:i+4,j:j+4);
        I2(i+2,j+2)=sum(sum(mask1.*temp));
    end
end
I3=uint8(I2);
subplot(1,4,2);
imshow(I3)
m=[1 1 1 1 1;1 2 4 2 1;1 4 8 4 1;1 2 4 2 1;1 1 1 1 1];
mask2=m/64;
I4=I1;
for i=1:s1-4
    for j=1:s2-4
        temp=I1(i:i+4,j:j+4);
        I4(i+2,j+2)=sum(sum(mask2.*temp));
    end
end
I5=uint8(I4);
subplot(1,4,3);
imshow(I5)
n=[0 1 0;1 -4 1;0 1 0];
mask3=n;
I6=I1;
for i=1:s1-2
    for j=1:s1-2
        temp=I1(i:i+2,j:j+2);
        I6(i+1,j+1)=sum(sum(mask3.*temp));
    end
end
I7=uint8(I6);
subplot(1,4,4);
imshow(I7)