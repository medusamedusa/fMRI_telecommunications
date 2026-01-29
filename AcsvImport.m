%This script reads the content of the converted numerical NiFti-DiCOM files
%and stores it in the workspace dataALL2.mat
%First of all some test profiles are loaded, both for Harvard-Oxford and
%AAL atlases
%Then the final dataset (as illustrated in the paper is loaded)
clear
% oxfo1=readtable('./newdataset/time_series_healthy_2.csv');
% aal31=readtable('./newdataset/time_series_healthy_2_AAL3.csv');
% oxfo2=readtable('./newdataset/time_series_healthy_3.csv');
% aal32=readtable('./newdataset/time_series_healthy_3_AAL3.csv');
% oxfo3=readtable('./newdataset/time_series_covid.csv');
% aal33=readtable('./newdataset/time_series_covid_AAL3.csv');
% oxfo4=readtable('./newdataset/time_series_pd.csv');
% aal34=readtable('./newdataset/time_series_pd_AAL3.csv');

oxford_ind=[14 15 34 35 37 38 39 40];
aal3_ind=[71 111 112 119 149 150 161 162];

%{
Correlazione singola ROI: 8 per l’atlante Oxford, 8 per l’AAL3; cross-correlation fra due ROI diverse: 
1) Atlas AAL3, ROI 149, Thal PuL L (thalamus pulvinar left), & 150, Thal PuL R (thalamus pulvinar right)
2) Atlas AAL3, 150, Thal PuL R (thalamus pulvinar right) & 162, SN pc R (substantia nigra, pars compacta, right)

——
ROIs da considerare:

Oxford (forse le ROI devono essere considerate come N-1):

14 Inferior Temporal Gyrus, anterior division
15 Inferior Temporal Gyrus, posterior division
34 parahippocampal gyrus anterior
35 parahippocampal gyrus posterior
37 temporal fusiform cortex anterior
38 temporal fusiform cortex posterior
39 temporal occipital fusiform cortex
40 occipital fusiform gyrus


AAL3 (forse le ROI devono essere considerate come N-1), qui i numeri seguono il nome della ROI:
119, Vermis IX
171, Precuneus L
111, Cerebellum X L
112, Cerebellum X R
149, Thal PuL L (thalamus pulvinar left)
150, Thal PuL R (thalamus pulvinar right)
161, SN pc L (substantia nigra, pars compacta, left)
162, SN pc R (substantia nigra, pars compacta, right)
%}
i=5;
harvard={};
harvard{1}=[1,3,4,5,6,7,25,26,33,41,42];
harvard{2}=[2,8,9,10,11,12,13,14,15,16,37,38,39,44,45,46];
harvard{3}=[17,18,19,20,21,31,43];
harvard{4}=[22,23,24,32,36,40,47,48];
harvard{5}=[27,28,29,30,34,35];
% sano1=oxfo1;
% sano2=oxfo2;
% sano3=oxfo3(1:141,:);
% malato1=oxfo4(1:141,:);
%END of test files


%Starting loading of final patient profiles
listing_over70_good = dir('./newdataset/new_data/group1-over70/sani');
listing_over70_bad = dir('./newdataset/new_data/group1-over70/malati');
listing_under70_good = dir('./newdataset/new_data/group2-under70/sani');
listing_under70_bad = dir('./newdataset/new_data/group2-under70/malati');

%Over70good
o70gm={};
o70gf={};
for i=1:length(listing_over70_good)-2%to take into account . and ..
    file=listing_over70_good(i+2).name;
    curr_name=[listing_over70_good(i+2).folder '\' file];
    t=readtable(curr_name);
    if (file(1)=='m')
        o70gm{end+1}=t;
    elseif (file(1)=='f')
        o70gf{end+1}=t;
    else
        disp('Gender not recognized!')
    end
end

%Over70bad
o70bm={};
o70bf={};
for i=1:length(listing_over70_bad)-2%to take into account . and ..
    file=listing_over70_bad(i+2).name;
    curr_name=[listing_over70_bad(i+2).folder '\' file];
    t=readtable(curr_name);
    if (file(1)=='m')
        o70bm{end+1}=t;
    elseif (file(1)=='f')
        o70bf{end+1}=t;
    else
        disp('Gender not recognized!')
    end
end

%under70good
u70gm={};
u70gf={};
for i=1:length(listing_under70_good)-2%to take into account . and ..
    file=listing_under70_good(i+2).name;
    curr_name=[listing_under70_good(i+2).folder '\' file];
    t=readtable(curr_name);
    if (file(1)=='m')
        u70gm{end+1}=t;
    elseif (file(1)=='f')
        u70gf{end+1}=t;
    else
        disp('Gender not recognized!')
    end
end

%under70good
u70bm={};
u70bf={};
for i=1:length(listing_under70_bad)-2%to take into account . and ..
    file=listing_under70_bad(i+2).name;
    curr_name=[listing_under70_bad(i+2).folder '\' file];
    t=readtable(curr_name);
    if (file(1)=='m')
        u70bm{end+1}=t;
    elseif (file(1)=='f')
        u70bf{end+1}=t;
    else
        disp('Gender not recognized!')
    end
end

%All data is stored in the cell MATLAB structure
save("dataALL2.mat");

