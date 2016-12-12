function [X2,Y2,pic]=circle(img)
[L,num] = bwlabel(img);
area = regionprops(L,'Area');
Area = cat(1,area.Area);
Area = sort(Area,'descend');
for i = 1:num
    number = sum(sum(L==i));
    if number==Area(1)
        L(L==i) = 0;
    end
end
img = L.*img;
[m,n] = size(img);
for i = 1:m
    for j = 1:n
        if img(i,j) >1
            img(i,j) = 1;
        end
    end
end
pic = img;
L = bwlabel(img);
s = regionprops(L, 'centroid');
centroids = cat(1, s.Centroid);
p=centroids;
X2=p(:,2);
Y2=p(:,1);


