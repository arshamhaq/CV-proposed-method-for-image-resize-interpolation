clc; clear; close all
I =  im2double(imread('lena.ppm'));
J = I(1:2:end,1:2:end,:);
% J =  im2double(imread('LR_Peppers.tif'));
res_I = my_imresize_gauss(J,2);
subplot(1,2,1)
imshow(I,[]);
title("original");
subplot(1,2,2)
imshow(res_I,[]);
title(["resized x2  PSNR: " my_psnr(res_I,I)]);

%vanilla gaussian matrix 
%     0.0023    0.0215    0.0215    0.0023
%     0.0215    0.2048    0.2048    0.0215
%     0.0215    0.2048    0.2048    0.0215
%     0.0023    0.0215    0.0215    0.0023