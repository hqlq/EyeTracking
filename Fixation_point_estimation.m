function [x,y] = Fixation_point_estimation( facula_1,facula_2,pupil,screen_left,screen_right)
x=(pupil.x-facula_2.x)*(screen_right.x-screen_left.x)/(facula_1.x-facula_2.x);
y=(pupil.y-facula_2.y)*(screen_right.x-screen_left.x)/(facula_1.x-facula_2.x);
end