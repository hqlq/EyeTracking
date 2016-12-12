function pic = Threshold(image,T)
[m,n] = size(image);
BW = zeros(m,n);
for i = 1:m
    for j = 1:n
        if image(i,j)>T
            BW(i,j) = 1;
        end
    end
end
pic = BW;

