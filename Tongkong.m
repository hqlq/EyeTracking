function pic = Tongkong(image)
BW2 = pso(image);
BW2 = ~BW2;
% figure;imshow(BW2);
[L,num] = bwlabel(BW2);
area = regionprops(L,'Area');
Area = cat(1,area.Area);
max_area = max(max(Area));
for i = 1:num
    number = sum(sum(L==i));
    if number ~= max_area;
        L(L==i) = 0;
    end
end
BW2 = L.*BW2;
L = bwlabel(BW2);
s = regionprops(L, 'centroid');
centroids = cat(1, s.Centroid);
p=centroids;
X2=p(:,2);
Y2=p(:,1);
X2 = round(X2);
Y2 = round(Y2);
step1 = 8;
step2 = 10;
a = X2-step1;
b = X2+step1;
c = Y2-step2;
d = Y2+step2;
if a<=0
    a = 1;
end
if b>size(image,1);
    b = size(image,1);
end
if c <=0
    c = 1;
end
if d > size(image,2);
    d = size(image,2);
end
pic = image(a:b,c:d);