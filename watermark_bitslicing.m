%% Code for image watermarking using bit sclicing 
clc; clear;close all;
%Program of slicing of images
x=imread('lena1.jpg');
x1=imread('p1.png ');
%imshow(x);
% conversion of image from rgb to gray scale.
y=rgb2gray(x);
y1=rgb2gray(x1);
% Finding number of rows and columns of the images
[r,c]=size(y);
[r1,c1]=size(y1);
% initializing two arrays with the dimensions of repective image.
A = zeros(r,c,8);
B = zeros(r1,c1,8);
%Decimal to binary conversion
for i=1:r
    for j=1:c
        A(i,j,:)=fliplr(de2bi(y(i,j),8));
    end
end
for i=1:r1
    for j=1:c1
        B(i,j,:)=fliplr(de2bi(y1(i,j),8));
    end
end
subplot(3,3,1)
imshow(y)

b=zeros(r,c);
% Converting Lsb of original image into msb of watermark image.
 A(:,:,end)=B(:,:,1);
%decimal to binary conversion
for i=1:8
    subplot(3,3,i+1)
    imshow(A(:,:,i))
end
for i=1:r
    for j=1:c       
         b(i,j)=bi2de(fliplr(reshape(A(i,j,:),[1 8])));
    end
end
%conveting double into unit8
b=uint8(b);
figure
subplot(1,3,1)
imshow(y)
title('Original Image');
subplot(1,3,2)
imshow(y1)
title('Watermark Image');
subplot(1,3,3)
imshow(b);
title('Funal Image');