function subshow(t,dq,lim_velos)
TIME=max(t);
subplot(321)
plot(t,dq(:,1),[0,TIME],[lim_velos(1,1),lim_velos(1,1)],'k',[0,TIME],[lim_velos(2,1),lim_velos(2,1)],'k');
subplot(322)
plot(t,dq(:,2),[0,TIME],[lim_velos(1,2),lim_velos(1,2)],'k',[0,TIME],[lim_velos(2,2),lim_velos(2,2)],'k');
subplot(323)
plot(t,dq(:,3),[0,TIME],[lim_velos(1,3),lim_velos(1,3)],'k',[0,TIME],[lim_velos(2,3),lim_velos(2,3)],'k');
subplot(324)
plot(t,dq(:,4),[0,TIME],[lim_velos(1,4),lim_velos(1,4)],'k',[0,TIME],[lim_velos(2,4),lim_velos(2,4)],'k');
subplot(325)
plot(t,dq(:,5),[0,TIME],[lim_velos(1,5),lim_velos(1,5)],'k',[0,TIME],[lim_velos(2,5),lim_velos(2,5)],'k');
subplot(326)
plot(t,dq(:,6),[0,TIME],[lim_velos(1,6),lim_velos(1,6)],'k',[0,TIME],[lim_velos(2,6),lim_velos(2,6)],'k');
end

