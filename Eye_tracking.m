clear all;
close all;
clc;
jiemian;
pause(1);
vidobj = videoinput('winvideo',1,'YUY2_1024x768');
triggerconfig(vidobj,'manual');
start(vidobj);
for i = 1:500
    tic
    snapshot = getsnapshot(vidobj);
         %% Ô­Í¼Ïñ2
    image = ycbcr2rgb(snapshot);
    image = rgb2gray(image);
    try
        [x_mov,y_mov] = MainFunction(image);
        mousemove(x_mov,y_mov);
    catch
        continue  
    end
    %      pause(0.0001);
    toc
end
stop(vidobj);
delete(vidobj);