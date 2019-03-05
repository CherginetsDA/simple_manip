function save_file_full_data(name,q,dq,ddq,a,b,t_s,q0,w0,freq,TIME)
       qqq = angle(t_s,[0:0.01:60]',w0,a,b,q0);

       header_json = {'target_q_0', 'target_q_1', 'target_q_2', 'target_q_3', 'target_q_4', 'target_q_5'};
       header_coll = {'shoulder_pan_joint', 'shoulder_lift_joint', 'elbow_joint', 'wrist_1_joint', 'wrist_2_joint', 'wrist_3_joint'};
       folder_name=['../data/',name,datestr(now,'_yyyy-mm-dd_HHMM')];
       eval(['mkdir '  folder_name]);
       
       make_matfile(name,folder_name,a,b,t_s,q0,w0,freq,TIME);
       eval(['cd '  folder_name]);
       
       
       header_string_coll = header_coll{1};
       header_string_json = header_json{1};
       for i = 2:length(header_coll)
          header_string_coll = [header_string_coll,',',header_coll{i}];
          header_string_json = [header_string_json,',',header_json{i}];
       end
       
       fid = fopen(['collision',num2str(freq),'.csv'],'w');
       fprintf(fid,'%s\r\n',header_string_coll);
       fclose(fid);
       
       dlmwrite(['collision',num2str(freq),'.csv'],qqq ,'-append','delimiter',',');
       
       fid = fopen(['trajectory',num2str(freq),'.csv'],'w');
       fprintf(fid,'%s\r\n',header_string_json);
       fclose(fid);
       dlmwrite(['trajectory',num2str(freq),'.csv'], q,'-append','delimiter',',');
       
       csvwrite('speed.csv',dq);
       csvwrite('acceleration.csv',ddq);
       eval('cd ../../creating_fourier_trajectory');
       
end

