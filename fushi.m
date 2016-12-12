function pic = fushi(image)
se = strel('disk',15);
BW0 = imerode(image,se);
% figure;imshow(BW0);
pic = ~BW0;