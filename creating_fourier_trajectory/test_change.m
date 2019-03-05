%Enter path to .mat file with parameters yours trajectory
path="/home/cherginets/trajectory_param.mat";

%Enter the path where save the .csv file, if you want to choice where save file.
%And use   ds_change(path,k,freq,save_path);
%Default path for save file is folder where the .mat file is.
save_path = "~";

%Enter a speed increase factor.
k=2;

%Enter the frequency of discrediting time, if you want to use the default value, enter 0
freq = 100;

%It should work!
ds_change(path,k,freq,save_path);


