clear all

%TIME - time trajectory working
%freq - frequency for send points
%garm - how many garmonics you need
%lim_angle and lim_velos - limits for angle and velosity what set at
%   manipulator
%t - time for plot; for example:  plot(t,q);
name='comau';
TIME = 60;
freq = 2500;
garm = 4;
lim_angle = [[-0.8;0.8],[-1.45;0.85],[-2.75;-0.1],[-2.5;2.5],[-2;2],[-pi;pi]];
lim_velos = [[-2;2],[-2;2],[-2;2],[-3;3],[-3;3],[-3;3]];
[t,q, dq, ddq,a,b,t_s,q0,w0] = ava(lim_angle,lim_velos,garm,freq,TIME);
save_file_full_data(name,q,dq,ddq,a,b,t_s,q0,w0,freq,TIME);

