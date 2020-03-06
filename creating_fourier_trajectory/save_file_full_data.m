function save_file_full_data(name,q,dq,ddq,a,b,t_s,q0,w0,freq,TIME,content,headOFcontent)
        qqq = angle(t_s,[0:0.01:60]',w0,a,b,q0);
        
        if max(size(headOFcontent)) == 0
            header_json = {'target_q_0', 'target_q_1', 'target_q_2', 'target_q_3', 'target_q_4', 'target_q_5'};           
        else
            header_json = headOFcontent;
            if max(size(headOFcontent)) ~= max(size(w0))*max(size(content))
                disp("Check dimension of header...")
                return
            end
        end

       
        header_coll = {'arm_joint_1', 'arm_joint_2', 'arm_joint_3', 'arm_joint_4', 'arm_joint_5', 'arm_joint_6'};
        folder_name=['./data/',name,datestr(now,'_yyyy-mm-dd_HHMM')];
        eval(['mkdir '  folder_name]);
       
        make_matfile(name,folder_name,a,b,t_s,q0,w0,freq,TIME,content,headOFcontent);
        eval(['cd '  folder_name]);
        eval(['mkdir json_files'])
       
        header_string_coll = header_coll{1};
        header_string_json = header_json{1};
        for i = 2:max(length(headOFcontent))
            if i <= max(size(header_coll))
                header_string_coll = [header_string_coll,',',header_coll{i}];
            end
            header_string_json = [header_string_json,',',header_json{i}];
        end
       
        data = [];
        if contains(content,'p')
            data = q;
        end
        if contains(content,'v')
            data = [data,dq];
        end
        if contains(content,'a')
            data = [data,ddq];
        end
       
        fid = fopen(['collision-',num2str(freq),'.csv'],'w');
        fprintf(fid,'%s\r\n',header_string_coll);
        fclose(fid);
       
        dlmwrite(['collision-',num2str(freq),'.csv'],qqq ,'-append','delimiter',',');
       
        fid = fopen(['trajectory-',num2str(freq),'.csv'],'w');
        fprintf(fid,'%s\r\n',header_string_coll);
        fclose(fid);
        dlmwrite(['trajectory-',num2str(freq),'.csv'], data,'-append','delimiter',',');
       
        csvwrite('speed.csv',dq);
        csvwrite('acceleration.csv',ddq);
        eval('cd ../../creating_fourier_trajectory');    
end