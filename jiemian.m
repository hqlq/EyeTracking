%�����ʼ��
function jiemian()
scrsz=get(0,'ScreenSize');
set(gcf,'Position',[0,0.04*scrsz(4),scrsz(3),0.96*scrsz(4)],'menubar','non');%����figure�Ĵ�С�ͳߴ�λ��
h1=gcf;
set (gca,'position',[0,0,1,1]);%����figure���������С��[left,bottom,width,high]
% Ϊaxes��figure�е���߽磬�±߽磬��ȣ��߶ȣ���СΪ0�����Ϊ1����߽磬�±߽�Ϊ0���ϱ߽磬�ұ߽�Ϊ1)
xlim([0 scrsz(3)]);
ylim([0 0.96*scrsz(4)]);
width_int=scrsz(3)/4;
high_int=scrsz(4)/4;
hold on
axis off;
for i=1:3
    for j=1:3
        x=i*width_int;
        y=j*high_int;
        plot(x,y,'r+'); 
    end
end
