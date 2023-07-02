function [J] = my_imresize_gauss(I,scale)
load 'h';
H = size(I,1);
W = size(I,2);
H2 = round(scale * H);
W2 = round(scale * W);
J = zeros(H2,W2);
for i = 1:H2
    firstd = 1 + ((H - 1)/(H2 - 1))*(i - 1);
    for j = 1: W2
        secondd = 1 + ((W - 1)/(W2 - 1))*(j - 1);
        for k = 1:size(I,3)
%             a = 1/(my_dist(firstd,secondd,floor(firstd),floor(secondd)));
%             b = 1/(my_dist(firstd,secondd,floor(firstd),floor(secondd) + 1));
%             c = 1/(my_dist(firstd,secondd,floor(firstd) + 1,floor(secondd)));
%             d = 1/(my_dist(firstd,secondd,floor(firstd) + 1,floor(secondd) + 1));
%             
%             av = I(floor(firstd),floor(secondd),k);
%             bv = I(floor(firstd),floor(secondd) + 1,k);
%             cv = I(floor(firstd) + 1,floor(secondd),k);
%             dv = I(floor(firstd) + 1,floor(secondd) + 1,k);
            
            p = ones(4,4);
            p = p/2;
            p(2,2) = I(floor(firstd),floor(secondd),k);
            p(2,3) = I(floor(firstd),ceil(secondd),k);
            p(3,2) = I(ceil(firstd),floor(secondd),k);
            p(3,3) = I(ceil(firstd),ceil(secondd),k);

            try
            p(1,2) = I(floor(firstd)-1,floor(secondd),k);
            catch
                p(1,2) = p(2,2);
            end
            try
            p(1,3) = I(floor(firstd)-1,ceil(secondd),k);
            catch
                p(1,3) = p(2,3);
            end
            try
            p(2,1) = I(floor(firstd),floor(secondd)-1,k);
            catch
                p(2,1) = p(2,2);
            end
            try
            p(3,1) = I(ceil(firstd),floor(secondd)-1,k);
            catch
                p(3,1) = p(3,2);
            end
            try
            p(2,4) = I(floor(firstd),ceil(secondd) + 1,k);
            catch
                p(2,4) = p(2,3);
            end
            try
            p(3,4) = I(ceil(firstd),ceil(secondd) + 1,k);
            catch
                p(3,4) = p(3,3);
            end
            try
            p(4,2) = I(ceil(firstd)+1,floor(secondd),k);
            catch
                p(4,1) = p(3,2);
            end
            try
            p(4,3) = I(ceil(firstd)+1,ceil(secondd),k);
            catch
                p(4,3) = p(3,3);
            end
            try
            p(1,1) = I(floor(firstd)-1,floor(secondd)-1,k);
            catch
                p(1,1) = p(2,2);
            end
            try
            p(4,1) = I(ceil(firstd)+1,floor(secondd) - 1,k);
            catch
                p(4,1) = p(3,2);
            end
            try
            p(1,4) = I(floor(firstd)-1,ceil(secondd)+1,k);
            catch
                p(1,4) = p(2,3);
            end
            try
            p(4,4) = I(ceil(firstd)+1,ceil(secondd)+1,k);
            catch
                p(4,4) = p(3,3);
            end

            a = my_dist(firstd,secondd,floor(firstd),floor(secondd));
            b = my_dist(firstd,secondd,floor(firstd),ceil(secondd));
            c = my_dist(firstd,secondd,ceil(firstd),floor(secondd));
            d = my_dist(firstd,secondd,ceil(firstd),ceil(secondd));
            the_sum = 4* 0.2048;
            the_sum2 = (1/a + 1/b + 1/c + 1/d);
            h(2,2) = ((1/a) * the_sum)/the_sum2;
            h(2,3) = ((1/b) * the_sum)/the_sum2;
            h(3,2) = ((1/c) * the_sum)/the_sum2;
            h(3,3) = ((1/d) * the_sum)/the_sum2;

            s = h.*p;
            value = sum(s(:));
            J(i,j,k) = value;

        end
    end
end
for k = 1:size(J,3)
    J(1,1,k) = J(1,2,k);
    J(1,W2,k) = J(1,W2 -1 ,k);
    J(H2,1,k) = J(H2,2,k);
    J(H2,W2,k) = J(H2,W2 - 1,k);
end
end
