function [t,q,dq,ddq] = ava(lim_angle,lim_velos,garm,freq,TIME)
t=[0:1/freq:TIME]';
frame = size(lim_angle,2);
q0 = zeros(1,frame);
dq0 = zeros(1,frame);
ddq0 = zeros(1,frame);
w0 = zeros(1,6) + pi/6;
a = zeros(garm,frame);
b = zeros(garm,frame);
a_lim=lim_angle(2,:)-lim_angle(1,:);
t_s=zeros(1,frame);

for n = 1:frame
    for i = 1:garm
        a(i,n)=rand-0.5;
        b(i,n)=rand-0.5;
    end
end
q=angle(t_s,t,w0,a,b,q0,garm);
for n = 1:frame
    a(:,n)=a(:,n)*a_lim(n)/(max(q(:,n))-min(q(:,n)));
    b(:,n)=b(:,n)*a_lim(n)/(max(q(:,n))-min(q(:,n)));
end
q=angle(t_s,t,w0,a,b,q0,garm);
q0=max(lim_angle)-max(q);
dq=speed(t_s,t,w0,a,b,dq0,garm);
w0=w0.*max(lim_velos)./max(abs(dq));
dq=speed(t_s,t,w0,a,b,dq0,garm);

for i =1:size(t,1)
    for j = 1:frame
        if abs(dq(i,j))<0.05
            t_s(j)=t(i); 
            break;
        end
    end
end

q=angle(t_s,t,w0,a,b,q0,garm);
dq=speed(t_s,t,w0,a,b,dq0,garm);
ddq=acceleration(t_s,t,w0,a,b,ddq0,garm);
end


