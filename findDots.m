function pic = findDots(image)
[m,n] = size(image);
pixel_max = max(max(image));
k3 = 0.8;
BW = zeros(m,n);
for i =1:m
    for j = 1:n
        if image(i,j) > k3*pixel_max;
            BW(i,j) = 1;
        end
    end
end
pic = BW;