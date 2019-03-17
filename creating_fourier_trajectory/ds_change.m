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
    header_json = {'target_q_0', 'target_q_1', 'target_q_2', 'target_q_3', 'target_q_4', 'target_q_5'};
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
    
    
    t=[0:1/freq:TIME]';
    q = zeros(size(t,1),size(q0,2)); 
    for i = 1:size(q0,2)
        q(:,i)=q0(i);
        for n =1:size(a,1) 
        q(:,i) = q(:,i) + a(n,i)*sin(n*w0(i)*(t_s(i)+t)) + b(n,i)*cos(n*w0(i)*(t_s(i)+t));
        end
    end 
    
    header_string_json = header_json{1};
    for i = 2:length(header_json)
        header_string_json = [header_string_json,',',header_json{i}];
    end
    
    eval(['cd '  save_path]);
    fid = fopen([save_path,filename,'-',num2str(freq),'-',num2str(k),'.csv'],'w');
    fprintf(fid,'%s\r\n',header_string_json);
    fclose(fid);
    dlmwrite([save_path,filename,'-', num2str(freq),'-',num2str(k),'.csv'], q,'-append','delimiter',',');
    
    
    joints = q;
    jid = fopen([save_path,filename,'-',num2str(freq),'-',num2str(k),'.json'],'w');
    if jid == -1
        error('File is not opened'); 
    end
    ts=t*1e6;
    fwrite(jid,jsonencode(struct('name','follow_trajectory','targets',table(joints,ts))),'char');
    fclose(jid);
    eval(['cd ' current_path]);
end

