clc
close all
clear all

I=imread('road.png');
figure, imshow(I);
I1=rgb2gray(I);
[s1,s2,s3]=size(I);
%%
%1)integrator 
I2=double(I1);
m=[1 1 1 1 1;1 2 4 2 1;1 4 8 4 1;1 2 4 2 1;1 1 1 1 1];
mask=m/64;
I3=I2;
for i=1:s1-4
    for j=1:s2-4
        temp=I2(i:i+4,j:j+4);
        I3(i+2,j+2)=sum(sum(mask.*temp));
    end
end

I4=uint8(I3);
figure, imshow(I4);

%%
%2)derivation
I6=double(I);
p=(I6(:,:,1)+I6(:,:,2)+I6(:,:,3))/3;
I7=uint8(p);
bw=edge(I7, 'sobel');
figure, imshow(bw);

%%
%3)2-level pic
for i=1:s1
    for j=1:s2
        if I7(i,j)<=187
            I7(i,j)=0;
        else 
            I7(i,j)=255;
        end
    end
end
figure; imshow(I7);


%%
%4)final image with colored road lane
II=double(I);
for i=1:s1
    for j=1:s2
        if I7(i,j)==255
            II(i,j,1)=100;
            II(i,j,2)=30;
            II(i,j,3)=255;
        end
    end
end
III=uint8(II);
figure, imshow(III);


















