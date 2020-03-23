addpath(genpath('creating_fourier_trajectory'))

%%
% TODO: if header is empty don't write comas.
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
name='ur5eS';
TIME = 60;
freq = 5e2;
garm = 5;
% header = {'arm_joint_1', 'arm_joint_2', 'arm_joint_3', 'arm_joint_4', 'arm_joint_5','vel_0','vel_1','vel_2','vel_3','vel_4'};
% content = 'pv';
header = {'','','','','',''};
content = 'p';

% lim_angle = [[-180;180],[-135;-45],[-50;50],[-180;180],[-90;90],[-180;180]]/(180/pi);
% lim_velos = [[-2;2],[-2;2],[-2;2],[-2;2],[-2;2],[-2;2]];
%% youbot
% lim_angle = [[0.1745;5.5851],[0.47;1.69],[-3.7612;-0.95],[0.6458;2.8449],[0.1745;5.5851]];
% lim_velos = [[-2;2],[-2;2],[-2;2],[-2;2],[-2;2]]*0.75;
%% UR5e which near UR10
lim_angle = [[-pi;pi],[-130;-50]*pi/180,[-pi/3;pi/3],[-1.5*pi;pi/2],[-pi/2;pi/2],[-pi;pi]];
lim_velos = [[-2;2],[-2;2],[-2;2],[-2;2],[-2;2],[-2;2]]*1.5;


[t,q, dq, ddq,a,b,t_s,q0,w0] = ava(lim_angle,lim_velos,garm,freq,TIME);

%%
save_file_full_data(name,q,dq,ddq,a,b,t_s,q0,w0,freq,TIME,content,header);
disp("Done.")