
# Implementation local-filters on the images
 Actually we can use this method to **Noise reduction** and also **Edges derivation**
## First:
we can convert a image with three layers (R,G,B) to a image which it has just one layer
,such a this:

    I=imread('lll.jpg');
    I1=double(rgb2gray(I));
    

## Mask1 : Averaging
we can use a matrix that is filled by one.
it can be (3* 3) or (5 *5),

> notice that the dimention of this matrix must be = (odd number*odd number)

such as this:

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
    
  
## Mask2 : weighted Averaging
we can use a matrix that is :

 

>`m=[1 1 1;1 2 1;1 1 1]` 
> or
> `m=[1 1 1 1 1;1 2 4 2 1;1 4 8 4 1;1 2 4 2 1;1 1 1 1 1]` and so on...
> it must be has odd dimention too.

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

 
## Mask3 : Derivative
we can use a matrix that is :
also we use this method to show edgs on the image individually.
 

>`n=[0 1 0;1 -4 1;0 1 0]` 
> it must be has odd dimention too.


    n=[0 1 0;1 -4 1;0 1 0];
    mask3=n;
    I6=I1;
    for i=1:s1-2
     for j=1:s2-2
        temp=I1(i:i+2,j:j+2);
        I6(i+1,j+1)=sum(sum(mask3.*temp));
     end
    end
    I7=uint8(I6);

![
](https://lh3.googleusercontent.com/X66nYRSzJdX3b1P4_P9OnMn71wPdvp99hvlc5bGsoGLWRakIoIesLrc39Nl8T5eW-geN3BAKuBQ "mask")


this is **result** that you can see above

 - 1th image is the **orginal** image
 - 2th image is the result of **Mask1** implementation
 - 3th image is the result of **Mask2** implementation
 - 4th image is the result of **Mask3** implementation.

