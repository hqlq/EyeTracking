function [x_move,y_move] = zuomianzhuobiao(x_brightendots,y_brightendots,x_pupil_mean,y_pupil_mean)

    scrsz = get(0,'ScreenSize'); 

    facula_1_index_x=x_brightendots(1);
    facula_1_index_y=y_brightendots(1);

    facula_2_index_x=x_brightendots(2);
    facula_2_index_y=y_brightendots(2);

    pupil_index_x=x_pupil_mean;
    pupil_index_y=y_pupil_mean;
    facula_1.x=abs(facula_1_index_y-facula_2_index_y);
    facula_1.y=abs(facula_2_index_x-facula_1_index_x);

    facula_2.x=abs(facula_2_index_y-facula_2_index_y);
    facula_2.y=abs(facula_2_index_x-facula_2_index_x);

    pupil.x=abs(pupil_index_y-facula_2_index_y);
    pupil.y=abs(facula_2_index_x-pupil_index_x);
    
    screen_left.x=0;
    screen_left.y=0;
    screen_right.x=scrsz(3);
    screen_right.y=0;
    [x, y] = Fixation_point_estimation(facula_1,facula_2,pupil,screen_left,screen_right);
%     if y>=850 && x<=640
%         dx0 = 96.399010316273920;
%         dy0 = 2.917646812687942e+02;
%         x = x - dx0;
%         y = y- dy0;
%     else if y>=850 && x<=960
%             dx1 = 1.728433458421970e+02;
%             dy1 = 2.445129207619258e+02;
%             x = x - dx1;
%             y = y - dy1;
%         else if y>=1000 && x>960
%                 dx2 = 2.053017461668426e+02;
%                 dy2 = 2.924595533845516e+02;
%                 x = x - dx2;
%                 y = y - dy2;
%             else if y >= 700 && x<=640
%                     dx3 = 23.709356163228108;
%                     dy3 = 2.680154887966507e+02;
%                     x = x - dx3;
%                     y = y - dy3;
%                 else if y>=700 && x<=960
%                         dx4 = 67.192489256703310;
%                         dy4 = 2.570487592899910e+02;
%                         x = x - dx4;
%                         y = y - dy4;
%                     else if y>=700 && x>960
%                             dx5 = 2.361856475560312e+02;
%                             dy5 = 3.044764817825800e+02;
%                             x = x - dx5;
%                             y = y - dy5;
%                         else if x<=640
%                                 dx6 = 33.953818289539186;
%                                 dy6 = 2.792586461256805e+02;
%                                 x = x - dx6;
%                                 y = y - dy6;
%                             else if x<=960
%                                     dx7 = 1.108864789605194e+02;
%                                     dy7 = 2.267821822131444e+02;
%                                     x = x - dx7;
%                                     y = y - dy7;
%                                 else
%                                     dx8 = 1.179940937003080e+02;
%                                     dy8 = 2.892793755503064e+02;
%                                     x = x - dx8;
%                                     y = y - dy8;
%                                 end
%                             end
%                         end
%                     end
%                 end
%             end
%         end
%     end
    x_move=x;
    y_move=scrsz(4)-y;