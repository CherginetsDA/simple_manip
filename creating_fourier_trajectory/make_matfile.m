function make_matfile(name,folder_name,a,b,t_s,q0,w0,freq,TIME)
param_file_name = [folder_name,'/trajectory_param.mat'];
file = matfile(param_file_name,'Writable',true);
file.a=a;
file.b=b;
file.freq=freq;
file.t_s=t_s;
file.q0=q0;
file.w0=w0;
file.name=name;
file.TIME=TIME;
end