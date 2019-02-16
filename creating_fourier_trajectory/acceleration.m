function ddq = acceleration(t_s,t,w0,a,b,ddq0,nt)
    ddq = zeros(size(t,1),size(ddq0,2)); 
    for i = 1:size(ddq0,2)
        ddq(:,i)=ddq0(i);
        for n =1:nt 
        ddq(:,i) = ddq(:,i) - n*n*w0(i)*w0(i)*a(n,i)*cos(n*w0(i)*(t_s(i)+t)) - n*n*w0(i)*w0(i)*b(n,i)*sin(n*w0(i)*(t_s(i)+t));
        end
    end
end