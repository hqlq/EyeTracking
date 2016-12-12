function pic = Renyantu(x,y,image)
if length(x) > 1
    pic = cell(2,1);
    x0 = x;
    x0 = sort(x0);
    x0 = [x0(1),x0(2)];
    y0 = zeros(1,2);
    m = size(x,1);
    for i = 1:2
        for j = 1:m
            if x(j) == x0(i)
                y0(i) = y(j);
            end
        end
    end
    [y_right,y1] = min(y0);
    x_right = x0(y1);
    [y_left,y1] = max(y0);
    x_left = x0(y1);
    x_right = round(x_right);
    y_right = round(y_right);
    x_left = round(x_left);
    y_left = round(y_left);
    step1 = 15;
    step2 = 15;
    pic{1,1} = image(x_right-step1:x_right+step1,y_right-step2:y_right+step2);
    pic{2,1} = image(x_left-step1:x_left+step1,y_left-step2:y_left+step2);
else
    pic = cell(1,1);
    step1 = 15;
    step2 = 15;
    x = round(x);
    y = round(y);
    pic{1,1} = image(x-step1:x+step1,y-step2:y+step2);
end

