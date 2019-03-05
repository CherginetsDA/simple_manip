function save_file(folder_name,k,freq,TIME)
       folder_name = ['../data/' folder_name];
       header_json = {'target_q_0', 'target_q_1', 'target_q_2', 'target_q_3', 'target_q_4', 'target_q_5'};
       param=dlmread([folder_name, '/arguments.csv'],',');
       t_s=param(1,:);
       q0=param(2,:);
       w0=param(3,:);
       a=param(4:4+(size(param,1)-3)/2,:);
       b=param(size(param,1) - (size(param,1)-3)/2:size(param,1),:);
       
       q = angle(t_s,[1:1/freq:TIME]',k*w0,a,b,q0);
       
       eval(['cd '  folder_name]);
       header_string_json = header_json{1};
       for i = 2:length(header_json)
          header_string_json = [header_string_json,',',header_json{i}];
       end
       fid = fopen(['trajectory',num2str(freq),'.csv'],'w');
       fprintf(fid,'%s\r\n',header_string_json);
       fclose(fid);
       dlmwrite(['trajectory',num2str(freq),'.csv'], q,'-append','delimiter',',');
       eval('cd ../../creating_fourier_trajectory');
end

%[t_s;q0;w0;a;b]

