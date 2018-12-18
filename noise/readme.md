

# Test weighted Averaging filter

## First:

 - ## Make images noisy


you can use this method to implement some kind of **noise** on the image.

    I=imread('lll.jpg');
    I2=double(I);
    m=(I2(:,:,1)+I2(:,:,2)+I2(:,:,3))/3;
    I3=uint8(m);
    BW1=edge(I3,'sobel');

> we use **m** as a average of three layer of image

![enter image description here](https://lh3.googleusercontent.com/AH1ajYKjRlm3TH8ARX6NIWkI2g_YFN3poGyuxLA2EEtIxs_fRuUoIXMd07LXAxDerAVJXKwOld8 "sobel")

 actually it helps us to show **edges** of image better.

# Make images noisy & Noise elimination
## First:

 - ## Make images noisy


you can use **imnoise** to implement some kind of **noise** on the image.

    I=imread('road.png');
    J = imnoise(I,'gaussian');
## Second:

 - ## Noise elimination


Then,you can implement **Mask2**,which is explained here: [Mask2](https://github.com/pardisghaziamin/Image-processing/tree/master/Implement-local-filters) 

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

    figure, imshow(uint8(I6))
    subplot(2,1,1)
    imshow(J)
    subplot(2,1,2)
    imshow(uint8(I6))

and this is the **result**:

![enter image description here](https://lh3.googleusercontent.com/JGINkJ-b89xDpRnmgWiPYiv8SUDB0E6wxhWNy0fNhiRI6YrUs7oYaKeaLiwcF68DLGIn-9TO650 "mask")
