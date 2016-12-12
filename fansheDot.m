function [X,Y] = fansheDot(image)
max_pixel = max(max(image));
T1 = 0.90*max_pixel;
BW = Threshold(image,T1);
% figure;imshow(BW);
[L,num] = bwlabel(BW);
area = regionprops(L,'Area');
Area = cat(1,area.Area);
Area = sort(Area,'descend');
for i = 1:num
    number = sum(sum(L==i));
    if number ~= Area(1) && number ~=Area(2)
        L(L==i) = 0;
    end
end
BW = L.*BW;
[m,n] = size(BW);
for i = 1:m
    for j = 1:n
        if BW(i,j)>1
            BW(i,j) = 1;
        end
    end
end
L = bwlabel(BW);
s = regionprops(L, 'centroid');
centroids = cat(1, s.Centroid);
p=centroids;
X=p(:,2);
Y=p(:,1);
