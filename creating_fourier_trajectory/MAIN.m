clear all

%TIME - time trajectory working
%freq - frequency for send points
%garm - how many garmonics you need
%lim_angle and lim_velos - limits for angle and velosity what set at
%   manipulator
%t - time for plot; for example:  plot(t,q);
name='comau';
TIME = 60;
freq = 125;
garm = 6;
lim_angle = [[-0.8;0.8],[-1.48;0.6],[-2.967;0],[-3.66;3.66],[-2.26;2.26],[-47;47]];
lim_velos = [[-2;2],[-2;2],[-3;3],[-3;3],[-3;3],[-3;3]];
[t,q, dq, ddq] = ava(lim_angle,lim_velos,garm,freq,TIME);
save_file(name,q,dq,ddq);

