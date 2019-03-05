function q = angle(t_s,t,w0,a,b,q0)
    q = zeros(size(t,1),size(q0,2)); 
    for i = 1:size(q0,2)
        q(:,i)=q0(i);
        for n =1:size(a,1) 
        q(:,i) = q(:,i) + a(n,i)*sin(n*w0(i)*(t_s(i)+t)) + b(n,i)*cos(n*w0(i)*(t_s(i)+t));
        end
    end
end
