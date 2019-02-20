function x = pzk(q,d,a,al,th)
T=1;
for i = 1:max(size(d))
    T=T*[[cos(q(i)+th(i)), -sin(q(i)+th(i))*cos(al(i)), sin(q(i)+th(i))*sin(al(i)), a(i)*cos(q(i)+th(i))];
         [sin(q(i)+th(i)),  cos(q(i)+th(i))*cos(al(i)),-cos(q(i)+th(i))*sin(al(i)), a(i)*sin(q(i)+th(i))];
         [              0,                  sin(al(i)),                 cos(al(i)),                 d(i)];
         [              0,                           0,                          0,                    1]];
end
x=T(1:3,4);
end

