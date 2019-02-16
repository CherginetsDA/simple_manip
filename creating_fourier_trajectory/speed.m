function dq = speed(t_s,t,w0,a,b,dq0,nt)
    dq = zeros(size(t,1),size(dq0,2)); 
    for i = 1:size(dq0,2)
        dq(:,i)=dq0(i);
        for n =1:nt 
        dq(:,i) = dq(:,i) + n*w0(i)*a(n,i)*sin(n*w0(i)*(t_s(i)+t)) -n*w0(i)*b(n,i)*cos(n*w0(i)*(t_s(i)+t));
        end
    end
end