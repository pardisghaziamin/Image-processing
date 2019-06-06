
# Road detection


## First


   We can read and convert an image with three layer (R,G,B) to the image which it has just one layer,such as this:
   
   

    I=imread('road.png');
	figure, imshow(I);
	I1=rgb2gray(I);
![enter image description here](https://lh3.googleusercontent.com/MvHEaXFy8VG7dTU4IBFSQ3QVswGJxJvtREp6DMUjYEuMT1GDkkDGPJkcwqTW7Bq84uWhWhRPDTg "i")
Then,extract the **size** of image:

    [s1,s2,s3]=size(I);

   

   


 ## Second
try to **integrate** to make our image **smooth**:

> for this purpose,it is needed to first convert image to **double**.

	   I2=double(I1);



The **integrator mask** here is:

 

    m=[1 1 1 1 1;1 2 4 2 1;1 4 8 4 1;1 2 4 2 1;1 1 1 1 1];
	mask=m/64;

 

    
  Now,apply it on image:
  

    I3=I2;
	for i=1:s1-4
	    for j=1:s2-4
	        temp=I2(i:i+4,j:j+4);
	        I3(i+2,j+2)=sum(sum(mask.*temp));
	    end
	end

> note:
> for show this image,it is needed to convert it to`uint8`


![enter image description here](https://lh3.googleusercontent.com/TdnXAGxrSXpRuWdifdqBiT8PYLWKfoT3CoEzEFnwzFTfaf5WYZJr7_EB6VridvkuZHFNS4nS9IY "k")
## Third
Now,try to **drevative** an image,
as you know,it is a method to extract edges in image:

> note:
> as previous,for show this image,it is needed to convert it to`uint8`
 

 

    I6=double(I);
	p=(I6(:,:,1)+I6(:,:,2)+I6(:,:,3))/3;
	I7=uint8(p);
	bw=edge(I7, 'sobel');
	figure, imshow(bw);
![enter image description here](https://lh3.googleusercontent.com/3b2DWYcko1T0OYnGGjcClkCiLXfvjry-tR5dP9-wiob644rnwfkJbhvQKZ7UmbkVCljaCVAfiWs "5")
for more explain about how to extract edges of image using **"Sobel"** go to :
[here](https://github.com/pardisghaziamin/Image-processing/tree/master/noise) 
 ## Forth
Now,translate image to **two level** .
it helps us to **detect the lane** individualy.

> note:
> actually in this method,we choose a value,then all pixels of image that are **upper than that value** will be the same (here **255**)
> otherwise, will be **another** same value (here **0**)

 

    for i=1:s1
	    for j=1:s2
	        if I7(i,j)<=187
	            I7(i,j)=0;
	        else 
	            I7(i,j)=255;
	        end
	    end
	end
![enter image description here](https://lh3.googleusercontent.com/WCrBChpEPXm6Txmm6Qinw9MvwkRxP1tFfmhc06MO7xzU1RoaXQX1AM_mFJF7HsnshiUKFCy026E "g")
## Fifth
Now,**color** the detected **lane** to make it clear more.

    for i=1:s1
	    for j=1:s2
	        if I7(i,j)==255
	            II(i,j,1)=100;
	            II(i,j,2)=30;
	            II(i,j,3)=255;
	        end
	    end
	end
![enter image description here](https://lh3.googleusercontent.com/0b-smpl8vnwOFRLEv329VG6vyC8ttEgelJF7DDXy_LiBACmRqSg81VT0If_XiXy4ZJUJXdvqnkc "d")