addpath(genpath('creating_fourier_trajectory'))

%%
%TIME - time trajectory working
%freq - frequency for send points
%garm - how many garmonics you need
%lim_angle and lim_velos - limits for angle and velosity what set at
%   manipulator
%t - time for plot; for example:  plot(t,q);
%header - header for csv files
%content - is that contain in csv files 
%       p - position(angle);
%       c - velocity(speed);
%       a - acceleration;
name='test';
TIME = 60;
freq = 5e2;
garm = 5;
header = {'pos_0','pos_1','pos_2','pos_3','pos_4','pos_5','vel_0','vel_1','vel_2','vel_3','vel_4','vel_5'};
content = 'pv';

lim_angle = [[-180;180],[-135;-45],[-50;50],[-180;180],[-90;90],[-180;180]]/(180/pi);
lim_velos = [[-2;2],[-2;2],[-2;2],[-2;2],[-2;2],[-2;2]];

[t,q, dq, ddq,a,b,t_s,q0,w0] = ava(lim_angle,lim_velos,garm,freq,TIME);

%%
save_file_full_data(name,q,dq,ddq,a,b,t_s,q0,w0,freq,TIME,content,header);