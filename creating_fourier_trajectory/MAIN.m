clear all

%TIME - time trajectory working
%freq - frequency for send points
%garm - how many garmonics you need
%lim_angle and lim_velos - limits for angle and velosity what set at
%   manipulator
%t - time for plot; for example:  plot(t,q);
name='eva';
TIME = 60;
freq = 125;
garm = 4;
lim_angle = [[-1.37;3.7],[-1.57;2.1],[-2.76;-0.34]];
lim_velos = [[-2.5;2.5],[-2.5;2.5],[-2.5;2.5]];

% lim_angle = [[-2.9;2.9],[0;0],[-2.9;0],[0;0],[-2.5;2.5],[0;0]];
% lim_velos = [[-2;2],[0;0],[-2;2],[0;0],[-3;3],[0;0]];
[t,q, dq, ddq,a,b,t_s,q0,w0] = ava(lim_angle,lim_velos,garm,freq,TIME);
save_file_full_data(name,q,dq,ddq,a,b,t_s,q0,w0,freq,TIME);

