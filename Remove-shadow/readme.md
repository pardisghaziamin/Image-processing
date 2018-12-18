

# Removing Watermark
 
 we use this method to **remove watermark** from a picture whithout destroy text.
## First:
find **histogram** of image to **find out** the brightness level of watermark

    I=imread('paye.jpg');
    I1=rgb2gray(I);
    imhist(I1)

    
   
   ![enter image description here](https://lh3.googleusercontent.com/CilbI-YzR6CaqCvHmrTWB4PzbVTr0EB0R30z3uzhWKrgzpoeHMW-hv8NAHZPzt8JzfVIvrQY9AU "hist")

 As you can see,we have a brightness level between 210 to 250,which is mostly probably related to **wetermark** .so let's check it!
## Second:

now,we are trying to remove whereever of the picture that its brightness level is between 210 to 240:


    for i=1:s1
     for j=1:s2
        if I1(i,j)>210 && I1(i,j)<240
            I1(i,j)=255;
        end
     end
    end
    figure,imshow(I1)



![enter image description here](https://lh3.googleusercontent.com/-iWeeeLW4ta1RRgTL3kS2crPmCQFOnKws-PTW7MPerSi0gLZBgc_-Lcun1vxHbPIm4HNh3P8GdY "watermark")



> picture at the left is the orginal picture and the right one is after implementation.
## Third:
In furthermore,we can **seperate** the **watermark** of the picture such as this:

    for i=1:s1
     for j=1:s2
        if I1(i,j)<210 || I1(i,j)>240
            I1(i,j)=255;
        end
     end
    end


![enter image description here](https://lh3.googleusercontent.com/eKuitt3RXlfYIuueTziw6XhYltXLXWBpG_0uGuKtMu4A1hZPp5Us2d8VJDdXszIXLuzi-WYtHAU "g")
