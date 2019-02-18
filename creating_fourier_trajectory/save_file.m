function save_file(name,q,dq,ddq)
       header = {'shoulder_pan_joint', 'shoulder_lift_joint', 'elbow_joint', 'wrist_1_joint', 'wrist_2_joint', 'wrist_3_joint'};
       file_name=[name,datestr(now,'_yyyy-mm-dd_HHMM')];
       file_name_angle=['../data/angle/',file_name,'_angle','.csv'];
       file_name_speed=['../data/speed/',file_name,'_speed','.csv'];
       file_name_acceleration=['../data/accel/',file_name,'_accel','.csv'];
       csvwrite_wh(file_name_angle, q,header);
       csvwrite(file_name_speed,dq);
       csvwrite(file_name_acceleration,ddq);
end


