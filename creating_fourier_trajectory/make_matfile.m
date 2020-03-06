function make_matfile(name,folder_name,a,b,t_s,q0,w0,freq,TIME,content,header)
sf = strfind(folder_name,'/');
sf = sf(size(sf,2));
folder_name = char(folder_name);
filename = folder_name(sf:size(folder_name,2));
param_file_name = [folder_name,filename,'.mat'];
file = matfile(param_file_name,'Writable',true);
file.a=a;
file.b=b;
file.freq=freq;
file.t_s=t_s;
file.q0=q0;
file.w0=w0;
file.name=name;
file.TIME=TIME;
file.content = content;
file.header = header;
end