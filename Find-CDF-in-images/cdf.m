clc
close all
clear all
I=imread('lll.jpg');
[s1,s2,s3]=size(I);
figure;imshow(I);
%figure;imshow(I(:,:,1));
%figure;imshow(I(:,:,2));
%figure;imshow(I(:,:,3));
I2=double(I);
m=(I2(:,:,1)+I2(:,:,2)+I2(:,:,3)/3);
I3=uint8(m);
figure;imshow(I3);
H=zeros(1,256);
for i=1:s1
    for j=1:s2
        l=I3(i,j);
        H(l+1)=H(l+1)+1;
    end
end
%figure;bar(H);
s=zeros(1,256);
for i=1:256
    for j=1:i
        s(i)=s(i)+H(j);
    end
end
figure;bar(s);
for i=1:s1
    for j=1:s2
        l=I3(i,j);
        t=s(l+1);
        I4(i,j)=t;
    end
end
I4=(I4/(max(max(I4))))*255;
I4=uint8(I4);
figure;imhist(I4);
figure;imshow(I4);
