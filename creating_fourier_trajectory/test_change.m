%Enter path to .mat file with parameters yours trajectory
path="/home/cherginets/simple_manip/data/eva_2019-03-17_1102/eva_2019-03-17_1102.mat";

%Enter the path where save the .csv file, if you want to choice where save file.
%And use   ds_change(path,k,freq,save_path);
%Default path for save file is folder where the .mat file is.
save_path = "~/Downloads";

%Enter a speed increase factor.
k=1;

%Enter the frequency of discrediting time, if you want to use the default value, enter 0
freq = 100;

%It should work!
ds_change(path,k,freq);

k=0.6;
freq = 125;
ds_change(path,k,freq);


k=0.3;
freq = 125;
ds_change(path,k,freq);


k=1;
freq = 125;
ds_change(path,k,freq);

k= 1;
freq = 150;
ds_change(path,k,freq);



