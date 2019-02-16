clear all

%TIME - time trajectory working
%freq - frequency for send points
%garm - how many garmonics you need
%lim_angle and lim_velos - limits for angle and velosity what set at
%   manipulator
%t - time for plot; for example:  plot(t,q);
TIME = 180;
freq = 8;
garm = 6;
lim_angle = [[-pi;pi],[-pi;0],[-2.52;2.52],[-pi;pi],[-pi/2;pi/2],[-pi;pi]];
lim_velos = [[-2;2],[-2;2],[-3;3],[-3;3],[-3;3],[-3;3]];
[t,q, dq, ddq] = ava(lim_angle,lim_velos,garm,freq,TIME);
save_file(q,dq,ddq);

