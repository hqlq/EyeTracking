function [x_pupil,y_pupil] = findTKZX(image)
%%���ڸĽ��������ҳ�ͫ������Ϊһ����ԽϺõĴ�����Բ����������Բ��ϵ�׼ȷ��
level = graythresh(image);
pic = im2bw(image,level);
% figure;imshow(pic);
se = strel('square',2);
pic = imclose(pic,se);
figure;imshow(pic);
ed = edge(pic,'canny');
% figure;imshow(ed);
[L,num] = bwlabel(ed);
area = regionprops(L,'Area');
Area = cat(1,area.Area);
Area_max = max(max(Area));
for i = 1:num
    number = sum(sum(L==i));
    if number<Area_max
        L(L==i) = 0;
    end
end
ed = L.*ed;
[m,n] = size(ed);
for i = 1:m
    for j = 1:n
        if ed(i,j) >1
            ed(i,j) = 1;
        end
    end
end
% figure;imshow(ed);
[x0,y0] = find(ed==1);
xy = [x0,y0];
raw_min = min(xy(:,1));
raw_max = max(xy(:,1));
col_min = min(xy(:,2));
col_max = max(xy(:,2));
%% ������ĵ�
dot = find(xy(:,1)==raw_min);
dot_y = xy(dot,2);
dot_y = sort(dot_y);
dot_y = median(dot_y);
dot_y = round(dot_y);
six_dots(1,1) = raw_min;
six_dots(1,2) = dot_y;
%% ������ĵ�
dot = find(xy(:,1)==raw_max);
dot_y = xy(dot,2);
dot_y = sort(dot_y);
dot_y = median(dot_y);
dot_y = round(dot_y);
six_dots(2,1) = raw_max;
six_dots(2,2) = dot_y;
%% ��һ����
dot = find(xy(:,2)==col_min);
dot_x = xy(dot,1);
dot_x = sort(dot_x);
dot_x = median(dot_x);
dot_x = round(dot_x);
six_dots(3,2) = col_min;
six_dots(3,1) = dot_x;
%% �ڶ�����
dot = find(xy(:,2)==col_max);
dot_x = xy(dot,1);
dot_x = sort(dot_x);
dot_x = median(dot_x);
dot_x = round(dot_x);
six_dots(4,2) = col_max;
six_dots(4,1) = dot_x;
%% ��������
x1 = [];
for i = 1:size(xy(:,1))
    if xy(i,1)>six_dots(1,1) && xy(i,1)<six_dots(3,1)
        x1 =[x1; xy(i,1)];
    end
end
if isempty(x1)
    for i = 1:size(xy(:,1))
        if xy(i,1)>=six_dots(1,1) && xy(i,1)<=six_dots(4,1)
            x1 =[x1; xy(i,1)];
        end
    end
end
h = 1;
while(size(six_dots(:,1))<5)
    c = randperm(numel(x1));
    b = x1(c(1:1));
    dot_y = find(xy(:,1)==b);
    for i = 1:size(dot_y,1)
        if xy(dot_y(i),2) >= six_dots(3,2) && xy(dot_y(i),2) <= six_dots(1,2)
            six_dots(5,1) = b;
            six_dots(5,2) = xy(dot_y(i),2);
        end
    end
    h = h+1;
    if h > length(x1)^2
        break;
    end
end
%% ���ĸ���
x1 = [];
for i = 1:size(xy(:,1))
    if xy(i,1)>six_dots(4,1) && xy(i,1)<six_dots(2,1)
        x1 =[x1; xy(i,1)];
    end
end
if isempty(x1)
    for i = 1:size(xy(:,1))
        if xy(i,1)>=six_dots(1,1) && xy(i,1)<=six_dots(4,1)
            x1 =[x1; xy(i,1)];
        end
    end
end
h = 1;
while(size(six_dots(:,1))<6)
    c = randperm(numel(x1));
    b = x1(c(1:1));
    dot_y = find(xy(:,1)==b);
    for i = 1:size(dot_y,1)
        if xy(dot_y(i),2) >= six_dots(2,2) && xy(dot_y(i),2) <= six_dots(4,2)
            six_dots(6,1) = b;
            six_dots(6,2) = xy(dot_y(i),2);
        end
    end
    h = h+1;
    if h>length(x1)^2
        break;
    end
end
%% �������
x1 = [];
for i = 1:size(xy(:,1))
    if xy(i,1)>six_dots(1,1) && xy(i,1)<six_dots(4,1)
        x1 =[x1; xy(i,1)];
    end
end
if isempty(x1)
    for i = 1:size(xy(:,1))
        if xy(i,1)>=six_dots(1,1) && xy(i,1)<=six_dots(4,1)
            x1 =[x1; xy(i,1)];
        end
    end
end
h = 1;
while(size(six_dots(:,1))<7)
    c = randperm(numel(x1));
    b = x1(c(1:1));
    dot_y = find(xy(:,1)==b);
    for i = 1:size(dot_y,1)
        if xy(dot_y(i),2) >= six_dots(1,2) && xy(dot_y(i),2) <= six_dots(4,2)
            six_dots(7,1) = b;
            six_dots(7,2) = xy(dot_y(i),2);
        end
    end
    h = h+1;
    if h>length(x1)^2
        break;
    end
end
%% ��������
x1 = [];  
for i = 1:size(xy(:,1))
    if xy(i,1)>six_dots(3,1) && xy(i,1)<six_dots(2,1)
        x1 =[x1; xy(i,1)];
    end
end
if isempty(x1)
    for i = 1:size(xy(:,1))
        if xy(i,1)>=six_dots(1,1) && xy(i,1)<=six_dots(4,1)
            x1 =[x1; xy(i,1)];
        end
    end
end
h = 1;
while(size(six_dots(:,1))<8)
    c = randperm(numel(x1));
    b = x1(c(1:1));
    dot_y = find(xy(:,1)==b);
    for i = 1:size(dot_y,1)
        if xy(dot_y(i),2) >= six_dots(3,2) && xy(dot_y(i),2) <=six_dots(2,2)
            six_dots(8,1) = b;
            six_dots(8,2) = xy(dot_y(i),2);
        end
    end
    h = h+1;
    if h>length(x1)^2
        break;
    end
end

%% ��Բ���
c = randperm(numel(six_dots(:,1)));
six_dots = six_dots(c(1:6),:);
x = six_dots(:,1);
y = six_dots(:,2);
H = [x.^2,x.*y,y.^2,x,y,ones(6,1)];
Q = (H.'*H);
[V,D] = eig(Q);
D = diag(D);
[~,ind] = sort(D);
P = V(:,ind(1));
% v = FitEllip(x,y);
% x_pupil = v(3);
% y_pupil = v(4);
x_pupil = (P(2,1)*P(5,1)-2*P(3,1)*P(4,1))/(4*P(1,1)*P(3,1)-P(2,1)^2);
y_pupil = (P(2,1)*P(4,1)-2*P(1,1)*P(5,1))/(4*P(1,1)*P(3,1)-P(2,1)^2);




