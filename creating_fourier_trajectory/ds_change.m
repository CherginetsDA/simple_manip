function q = ds_change(path,k,freq,save_path)
    sf = strfind(path,'/');
    sf = sf(size(sf,2));
    path = char(path);
    filename = path(sf+1:size(path,2)-4);
    if nargin < 4
        save_path = path(1:sf);
    else
        save_path = char(save_path);
        if not(save_path(size(save_path,2)) =='/')
            save_path = [save_path, '/'];
        end
    end
    current_path = pwd;
%     header_json = {'arm_joint_1', 'arm_joint_2', 'arm_joint_3', 'arm_joint_4', 'arm_joint_5', 'arm_joint_6'};
    file = matfile(path);
    if freq == 0
       freq = file.freq; 
    end
    a = file.a;
    b = file.b;
    TIME = file.TIME/k;
    q0=file.q0;
    w0=file.w0*k;
    t_s=file.t_s/k;
    header_json = file.header;
    content = file.content;
    frame = max(size(w0));
    
    
    t=[0:1/freq:TIME]';
    q=angle(t_s,t,w0,a,b,q0);
    dq=speed(t_s,t,w0,a,b,zeros(1,frame));
    ddq=acceleration(t_s,t,w0,a,b,zeros(1,frame));
    
    N = max(size(q));
    for j = 1:frame
        i = N;
        while abs(dq(i,j))>0.005
            dq(i,j) = 0;
            ddq(i,j) = 0;
            i = i - 1;
        end
        q(i:N,j)=ones(N-i+1,1)*q(i-1,j);
    end
    
    header_string_json = header_json{1};
    for i = 2:length(header_json)
        header_string_json = [header_string_json,',',header_json{i}];
    end
    
    if contains(content,'p')
        data = q;
    end
    if contains(content,'v')
        data = [data,dq];
    end
    if contains(content,'a')
        data = [data,ddq];
    end
    
    eval(['cd '  save_path]);
    fid = fopen([save_path,filename,'-',num2str(freq),'-',num2str(k),'.csv'],'w');
    fprintf(fid,'%s\r\n',header_string_json);
    fclose(fid);
    dlmwrite([save_path,filename,'-', num2str(freq),'-',num2str(k),'.csv'], data,'-append','delimiter',',');
    

    joints = q;
    jid = fopen([save_path,'json_files/',filename,'-',num2str(freq),'-',num2str(k),'.json'],'w');
    if jid == -1
        error('File is not opened'); 
    end
    ts=t*1e6;
    fwrite(jid,jsonencode(struct('name','follow_trajectory','targets',table(joints,ts))),'char');
    fclose(jid);
    eval(['cd ' current_path]);
end

