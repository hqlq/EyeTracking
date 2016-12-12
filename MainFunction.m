function [x_mov,y_mov] = MainFunction(image)
         %% 阈值分割
         scrsz = get(0,'ScreenSize');
         level = graythresh(image);
         level = level+0.02;
         BW = im2bw(image,level);
    %      subplot(232);imshow(BW);

         %% 腐蚀处理
         BW0 = fushi(BW);
    %      subplot(233);imshow(BW0);
         [x,y,BW1] = circle(BW0);
         img0 = BW1.*double(image);
         img0 = uint8(img0);
    %      subplot(234);imshow(img0);

         %% 找出左右眼睛的大致区域
         pic_renyan = Renyantu(x,y,image);
    %          for n = 1:length(pic_renyan)
    %              subplot(235);imshow(pic_renyan{n,1});
    %          end
         num_renyan = length(pic_renyan);
         


         %% 找出左右眼的瞳孔的大致区域
         pic_tk = {};
         for n = 1:num_renyan
             pic_tk{n,1} = Tongkong(pic_renyan{n,1});
    %              subplot(236);imshow(pic_tk{i,1});
         end
        

         %% 在瞳孔的大致区域中找出光斑点和瞳孔中心坐标
         x_dots=[];
         y_dots = [];
         x_mean = [];
         y_mean = [];
         for n = 1:length(pic_tk)
              x_brightendots = [];
              y_brightendots = [];
              [x_brightendots,y_brightendots]= fansheDot(pic_tk{n,1});
              if isempty(x_brightendots) || length(x_brightendots) == 1 || length(x_brightendots) > 2
                   continue;
              end
              if length(x_brightendots) == 2
                   x_distance = abs(x_brightendots(1) - x_brightendots(2));
                   y_distance = abs(y_brightendots(1) - y_brightendots(2));
                   if x_distance > 5 || y_distance < 5
                          continue;
                   end
              end
               %% 找瞳孔中心的第一种方法：椭圆拟合法
%                x_pupil = zeros(40,1);
%                y_pupil = zeros(40,1);
%                for j = 1:40
%                    [x_pupil(j),y_pupil(j)] = findTKZX(pic_tk{n,1});
%                end
%                x_biaoqian = grubsn(0.5,x_pupil);
%                y_pupil = y_pupil(x_biaoqian);
%                y_biaoqian = grubsn(0.5,y_pupil);
%                x_pupil = x_pupil(y_biaoqian);
%                y_pupil = y_pupil(y_biaoqian);
%                x_pupil_mean = mean(x_pupil);
%                y_pupil_mean = mean(y_pupil);
                %% 找瞳孔中心的第二种方法：质心法
               [x_pupil_mean,y_pupil_mean] = findTKZX1(pic_tk{n,1});  
               %%
               if isempty(x_pupil_mean)
                   continue;
               end
               m = 1;
               while(m<=length(x_brightendots))
                   if x_brightendots(m) < x_pupil_mean
                       x_brightendots(m) = [];
                       y_brightendots(m) = [];
                   else
                       m = m +1;
                   end
               end
               if length(x_brightendots) ==2 && length(x_pupil_mean) == 1
                   x_dots = [x_dots;x_brightendots];
                   y_dots = [y_dots;y_brightendots];
                   x_mean = [x_mean;x_pupil_mean];
                   y_mean = [y_mean;y_pupil_mean];
               end
          end
          if isempty(x_dots)
              return
          end
          if length(x_dots) == 2
              [x_mov1,y_mov1] = zuomianzhuobiao(x_dots,y_dots,x_mean,y_mean);
              x_mov = x_mov1;
              y_mov = y_mov1;
              x = x_mov;
              y = scrsz(4) - y_mov;
              plot(x,y,'b*');
          end
          if length(x_dots) == 4
              [x_mov1,y_mov1] = zuomianzhuobiao(x_dots(1:2),y_dots(1:2),x_mean(1),y_mean(1));
              [x_mov2,y_mov2] = zuomianzhuobiao(x_dots(3:4),y_dots(3:4),x_mean(2),y_mean(2));
              x_mov = 1/2*(x_mov1+x_mov2);
              y_mov = 1/2*(y_mov1+y_mov2);
              x = x_mov;
              y = scrsz(4) - y_mov;
              plot(x,y,'b*');
          end
      