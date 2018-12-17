
# Find CDF in image
 Actually we use this method to **equalizing** the **histogram** of the image
## First:
Separating **three layers** of image (R,G,B) and define **m** as a **average** of them
,such a this:

    I=imread('lll.jpg');
    I2=double(I);
    m=(I2(:,:,1)+I2(:,:,2)+I2(:,:,3)/3);
    I3=uint8(m);
    figure;imshow(I3);

## Second:
Then, define **"s"** as a **CDF** of the image,such as this:

    H=zeros(1,256);
    for i=1:s1
     for j=1:s2
        l=I3(i,j);
        H(l+1)=H(l+1)+1;
     end
    end
    figure;bar(H);
    s=zeros(1,256);
    for i=1:256
     for j=1:i
        s(i)=s(i)+H(j);
     end
    end
    figure;bar(s);
  
  ![enter image description here](https://lh3.googleusercontent.com/UlvWv-_ceAyG7092GMNRNCmrZTkVCBsN_RX2HxRsa2gxLotQ_K8B_rCNnaym6dJP2RcITlVGfNM "cdf")

actually CDF is always **Ascending**
## Third:
This  is implementation of **CDF** on the image:

    for i=1:s1
     for j=1:s2
        l=I3(i,j);
        t=s(l+1);
        I4(i,j)=t;
     end
    end

> notice that after this implementation,you must normalize your image.
> `
> 
> `I4=(I4/(max(max(I4))))*255;`



![
](https://lh3.googleusercontent.com/gT4i-nDwpS6fejutrzDlAycuymTVYdICSQa279fBxy2_M8Qz4uVWiJ9i3_t9SYoivBPTsnMVqN4 "imp")


this is **result** that you can see above
that is helping us to  **extend histogram**.