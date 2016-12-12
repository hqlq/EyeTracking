function [x_pupil,y_pupil] = findTKZX1(image)
level = graythresh(image);
pic = im2bw(image,level);
% figure;imshow(pic);
se = strel('square',2);
pic = imclose(pic,se);
% figure;imshow(pic);
pic = ~pic;
[L,num] = bwlabel(pic);
area = regionprops(L,'Area');
Area = cat(1,area.Area);
Area_max = max(max(Area));
for i = 1:num
    number = sum(sum(L==i));
    if number<Area_max
        L(L==i) = 0;
    end
end
pic = L.*pic;
[m,n] = size(pic);
for i = 1:m
    for j = 1:n
        if pic(i,j) >1
            pic(i,j) = 1;
        end
    end
end
[x0,y0] = find(pic==1);
x_pupil = mean(x0);
y_pupil = mean(y0);