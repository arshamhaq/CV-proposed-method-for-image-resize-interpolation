function [answer] = my_mse(mainImage,changedImage)
if(size(mainImage,3) == 1)%if grayscale
    Error = (double(mainImage(:)) - double(changedImage(:))).^2;
    answer = sum(Error)/numel(Error);
else
    Error = (double(mainImage(:,:,1)) - double(changedImage(:,:,1))).^2;
    mseR = sum(Error(:))/numel(Error(:));
    Error = (double(mainImage(:,:,2)) - double(changedImage(:,:,2))).^2;
    mseG = sum(Error(:))/numel(Error(:));
    Error = (double(mainImage(:,:,3)) - double(changedImage(:,:,3))).^2;
    mseB = sum(Error(:))/numel(Error(:));
    answer = (mseR + mseB + mseG)/3;
end
end