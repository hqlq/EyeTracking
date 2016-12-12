%界面初始化
function jiemian()
scrsz=get(0,'ScreenSize');
set(gcf,'Position',[0,0.04*scrsz(4),scrsz(3),0.96*scrsz(4)],'menubar','non');%设置figure的大小和尺寸位置
h1=gcf;
set (gca,'position',[0,0,1,1]);%设置figure上坐标轴大小，[left,bottom,width,high]
% 为axes在figure中的左边界，下边界，宽度，高度，最小为0，最大为1（左边界，下边界为0，上边界，右边界为1)
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
