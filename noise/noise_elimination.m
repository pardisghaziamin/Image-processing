clc
close all
clear all
I=imread('road.png');
[s1,s2,s3]=size(I);
I1=double(I);
J = imnoise(I,'gaussian');
mask=[1 1 1;1 2 1;1 1 1];
m1=I1(:,:,1);
m2=I1(:,:,2);
m3=I1(:,:,3);
c1=m1; c2=m2; c3=m3;
for i=1:s1-2
    for j=1:s2-2
        temp1=m1(i:i+2,j:j+2);
        temp2=m2(i:i+2,j:j+2);
        temp3=m3(i:i+2,j:j+2);
        c1(i+2,j+2)=sum(sum(mask.*temp1));
        c2(i+2,j+2)=sum(sum(mask.*temp2));
        c3(i+2,j+2)=sum(sum(mask.*temp3));
    end   
end
I5(:,:,1)=c1;
I5(:,:,2)=c2;
I5(:,:,3)=c3;
I6=(I5/(max(max(max(I5)))))*255;

%figure, imshow(uint8(I6))
subplot(2,1,1)
imshow(J)
subplot(2,1,2)
imshow(uint8(I6))