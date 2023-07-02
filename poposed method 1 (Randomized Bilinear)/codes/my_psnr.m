function [answer] = my_psnr(mainImage,ChangedImage)
answer = 10 * log10 ( (1^2) / double(my_mse(mainImage, ChangedImage)));

end