%function for generated trajectory 
function [t,q,dq,ddq,a,b,t_s,q0,w0] = ava(lim_angle,lim_velos,garm,freq,TIME)
%frame - count of joints
%q0,dq0,ddq0 - inital param
%a and b - koeff of equation
%a_lim - range workespace
%t_s - time offset for velos
t=[0:1/freq:TIME]';
N = size(t,1);
frame = size(lim_angle,2);
q0 = zeros(1,frame);
dq0 = zeros(1,frame);
ddq0 = zeros(1,frame);
w0 = zeros(1,frame) + pi/6;
a = zeros(garm,frame);
b = zeros(garm,frame);
a_lim=lim_angle(2,:)-lim_angle(1,:);
t_s=zeros(1,frame);
%generated koef a and b
for n = 1:frame
    for i = 1:garm
        a(i,n)=rand-0.5;
        b(i,n)=rand-0.5;
    end
end
%created trajectory
q=angle(t_s,t,w0,a,b,q0);
%change range angles for frame
for n = 1:frame
    a(:,n)=a(:,n)*a_lim(n)/(max(q(:,n))-min(q(:,n)));
    b(:,n)=b(:,n)*a_lim(n)/(max(q(:,n))-min(q(:,n)));
end
%Inital offset for angle
q=angle(t_s,t,w0,a,b,q0);
q0=max(lim_angle)-max(q);
dq=speed(t_s,t,w0,a,b,dq0);
%change frequency range
w0=w0.*max(lim_velos)./max(abs(dq));
dq=speed(t_s,t,w0,a,b,dq0);

%add time offset what angle start then velos equaled zero.
for i = 1:N
    for j = 1:frame
        if abs(dq(i,j))<0.005
            t_s(j)=t(i); 
            break;
        end
    end
end
%generated finish angle.velos and accel
q=angle(t_s,t,w0,a,b,q0);
dq=speed(t_s,t,w0,a,b,dq0);
ddq=acceleration(t_s,t,w0,a,b,ddq0);

for j = 1:frame
    i = N;
    while abs(dq(i,j))>0.005
    dq(i,j) = 0;
    ddq(i,j) = 0;
    i = i - 1;
    end
    q(i:N,j)=ones(N-i+1,1)*q(i-1,j);
end
end