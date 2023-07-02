clc; clear; close all
I =  im2double(imread('Peppers.tif'));
J =  im2double(imread('LR_Peppers.tif'));
res_I = imresize_rand(J,2);
subplot(1,2,1)
imshow(I,[]);
title("original");
subplot(1,2,2)
imshow(res_I,[]);
title("resized x2 randomized_bilinear");