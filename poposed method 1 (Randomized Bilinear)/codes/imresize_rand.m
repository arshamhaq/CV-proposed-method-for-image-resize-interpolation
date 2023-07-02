function [J] = imresize_rand(I,scale)
H = size(I,1);
W = size(I,2);
H2 = round(scale * H);
W2 = round(scale * W);
J = zeros(H2,W2);

rng(0,'twister');
a = -0.025;
b = 0.025;
r = (b-a)*rand(H2,W2) + a;

for i = 1:H2
    firstd = 1 + ((H - 1)/(H2 - 1))*(i - 1);
    for j = 1: W2
        secondd = 1 + ((W - 1)/(W2 - 1))*(j - 1);
        try
            for k = 1:size(I,3)
                x = secondd - floor(secondd);
                y = firstd - floor(firstd);
                a = I(floor(firstd),floor(secondd),k);
                b = I(floor(firstd),floor(secondd) + 1,k);
                c = I(floor(firstd) + 1,floor(secondd),k);
                d = I(floor(firstd) + 1,floor(secondd) + 1,k);
                J(i,j,k) = (a +  (b - a)* x + (c - a)* y + (a - b - c + d)* x * y);
            end
        catch
            for ss = 1:size(I,3)
                J(i,j,ss) = I(floor(firstd),floor(secondd),ss);
            end
            continue
        end
    end
end
J = J + r;
end
