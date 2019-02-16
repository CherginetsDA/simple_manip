clear all
hold on
TIME = 180;
freq = 8;
garm = 6;
lim_angle = [[-pi;pi],[-pi;0],[-2.52;2.52],[-pi;pi],[-pi/2;pi/2],[-pi;pi]];
lim_velos = [[-2;2],[-2;2],[-3;3],[-3;3],[-3;3],[-3;3]];
[t,q, dq, ddq] = ava(lim_angle,lim_velos,garm,freq,TIME);
save_file(q,dq,ddq);

