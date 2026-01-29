%This script evaluates the states sequences for each RoI (from 1 to 48)
%It stores the values of each RoI (and each state) in the ./network folder
%and, if the variable plo is True, plots the trend of values and quantized
%ones over the time
%All data is saved in the 'AfterPlot.mat' file

clear 
close all

%Plot
plo=1;%0 NO, 1 YES
%Decide which class of patients to load
over=1;%1 for over 70, 0 for under 70
good=0;%1 for good, 0 for bad
male=0;%1 male, 0 for female

%010 bad content from ADNI file1
%110 bad content from ADNI file1

name='';
dim=0;
if (over==0)&&(good==0)&&(male==0)
    name='u70bf';
    dim=4;
elseif (over==0)&&(good==0)&&(male==1)
    name='u70bm';
    dim=2;
elseif (over==0)&&(good==1)&&(male==0)
    name='u70gf';
    dim=3;
elseif (over==0)&&(good==1)&&(male==1)
    name='u70gm';
    dim=3;
elseif (over==1)&&(good==0)&&(male==0)
    name='o70bf';
    dim=5;
elseif (over==1)&&(good==0)&&(male==1)
    name='o70bm';
    dim=4;
elseif (over==1)&&(good==1)&&(male==0)
    name='o70gf';
    dim=4;
elseif (over==1)&&(good==1)&&(male==1)
    name='o70gm';
    dim=2;
end

%MAX 4 files per time
filename1='';
filename2='';
filename3='';
filename4='';

network_name=['./network_' name];
if (dim>4)
    dim=4;
end
for i=1:dim
    if i==1
        filename1=['./data_' name '_' num2str(i) '.mat'];
    end
    if i==2
        filename2=['./data_' name '_' num2str(i) '.mat'];
    end
    if i==3
        filename3=['./data_' name '_' num2str(i) '.mat'];
    end
    if i==4
        filename4=['./data_' name '_' num2str(i) '.mat'];
    end
end
time_to_simulate=500;
load(filename1);
M1=M;
SST1=sst;
THR1=thrs;
load(filename2);
M2=M;
SST2=sst;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
THR2=thrs;
if (filename3=="")
    load(filename2);
else
    load(filename3);
end
M3=M;
SST3=sst;
THR3=thrs;
if (filename4=="")
    load(filename2)
else
    load(filename4);
end
M4=M;
SST4=sst;
THR4=thrs;

%THRS have empty elements at the beginning and must be clean
THR1new={};
THR2new={};
THR3new={};
THR4new={};
for i=nRoIs+1:length(THR1)
    THR1new{end+1}=THR1{i};
    THR2new{end+1}=THR2{i};
    THR3new{end+1}=THR3{i};
    THR4new{end+1}=THR4{i};
end
THR1=THR1new;
THR2=THR2new;
THR3=THR3new;
THR4=THR4new;
clear THR1new;
clear THR2new;
clear THR3new;
clear THR4new;


%CHOOSE THE PATIENT
curr_m=M1;
curr_sst=SST1;
curr_thr=THR1;



%Evaluate matrix distributions
disp('Evaluating MTPM statistics and distributions');
MallM={};
MallS={};
num_obs=23;
for roi=1:nRoIs
    Mm=zeros(states,states);%mean
    Ms=zeros(states,states);%stdev
    for i=1:states
        for j=1:states
            vectorM=[];
            aaa=0;
            for time=1:num_obs
                ii=(time-1)*states+i;
                jj=j;
                %k=1 %the desired patient
                aaa=curr_m{roi};
                vectorM=[vectorM aaa(jj,ii)];
            end
            vectorM=rmmissing(vectorM);
            %MATRICES
            m=mean(vectorM);
            s=std(vectorM);
            if (isnan(m) | isnan(s))
                m=0; s=0;
                disp('NaN value found in matrices! Set to 0')
            end
            %disp(['M: ' num2str(m) ' S: ' num2str(s)]);
            Mm(j,i)=m;
            Ms(j,i)=s;
        end
    end
    MallM{end+1}=Mm;
    MallS{end+1}=Ms;
end
pause(0.5);


%Evaluate SST distributions
disp('Evaluating SST statistics and distributions');
SSTallM={};
SSTallS={};
for roi=1:nRoIs
    SSTm=zeros(1,states);%mean
    SSTs=zeros(1,states);%stdev
    for i=1:states
        vectorM=[];
        aaa=0;
        for time=1:num_obs
            ii=(time-1)*states+i;
            %k=1 %the desired patient
            aaa=curr_sst{roi};
            vectorM=[vectorM aaa(1,ii)];
        end
        vectorM=rmmissing(vectorM);
        %To Array
        for cells=1:length(vectorM)
            if (length(vectorM{cells})>1)
                vectorM{cells}=mean(vectorM{cells});
            end
            if (length(vectorM{cells})==0)
                vectorM{cells}=sampling_time;
            end
        end
        vectorM=cell2mat(vectorM);
        m=mean(vectorM);
        s=std(vectorM);
        if (isnan(m) || isnan(s))
            m=0; s=0;
            disp('NaN value found in SSTs! Set to 0')
        end
        %disp(['M: ' num2str(m) ' S: ' num2str(s)]);
        SSTm(i)=m;
        SSTs(i)=s;
    end
    SSTallM{end+1}=SSTm;
    SSTallS{end+1}=SSTs;
end
pause(0.5);

%Evaluate THR distributions (but it is not satisfied so we have to proceed 
% with the maximum and minimum evaluation)
%disp('Evaluating THRs statistics and distributions');
%{
THRallM={};
THRallS={};
for roi=1:nRoIs
    THRm=zeros(1,states);%mean
    THRs=zeros(1,states);%stdev
    for i=1:states+1
        vectorM=[];
        aaa=0;
        for time=1:num_obs
            ii=(roi-1)+(time-1)*(states+1)+i;%+1 because we have nstates+1 thresholds
            %k=1 %the desired patient
            aaa=THR1{ii};
            vectorM=[vectorM aaa(1,i)];
        end
        vectorM=rmmissing(vectorM);
        %To Array
        for cell=1:length(vectorM)
            if (length(vectorM(cell))>1)
                vectorM(cell)=mean(vectorM(cell));
            end
            if (length(vectorM(cell))==0)
                %vectorM{cell}=sampling_time;
                disp('Error in evaluating thresholds distribution!');
            end
        end
        %vectorM=cell2mat(vectorM);
        m=mean(vectorM);
        s=std(vectorM);
        if (isnan(m) || isnan(s))
            m=0; s=0;
            disp('NaN value found in THRs! Set to 0')
        end
        %disp(['M: ' num2str(m) ' S: ' num2str(s)]);
        THRm(i)=m;
        THRs(i)=s;
    end
    THRallM{end+1}=THRm;
    THRallS{end+1}=THRs;
end
save('network1.mat');
pause(0.5);
disp('Done!')
%}

disp('Evaluating THRs statistics and distributions');
%THR cells are structured as {RoIs} x OBS times
THR=curr_thr;
min_vec=zeros(nRoIs,1);%for each RoI
max_vec=zeros(nRoIs,1);%for each RoI
for i=1:length(THR)
    a=mod(nRoIs+i,nRoIs)+1;%RoI index
    row=THR{i};
    min=row(1);
    max=row(states+1);
    if (min_vec(a)==0)
        min_vec(a)=min;
    elseif (max_vec(a)==0)
        max_vec(a)=max;
    else
        if (min<min_vec(a))
            min_vec(a)=min;
        end
        if (max>max_vec(a))
            max_vec(a)=max;
        end
    end
end

%network 
%Initial state
iter=time_to_simulate/sampling_time;
%Initial states
state_vect=randi([0 states-1],1,48);
%disp(state_vect);
warning('off', 'MATLAB:MKDIR:DirectoryExists');
for k=1:iter
    if (mod(k,10)==0)
        perc=k/iter*100;
        disp(['Running: ' num2str(perc) '%'])
    end
    for i=1:nRoIs
        if ~exist(network_name, 'dir')
            mkdir (network_name);
        end
        %name='./network/';
        name=[network_name '/'];
        filename='';
        if (i<=9)
            filename=['0' num2str(i) '.txt'];
        else
            filename=[num2str(i) '.txt'];
        end
        name=[name filename];
        curr_i=state_vect(i);
        next_i=evaluate_next_state(MallM(i),MallS(i),curr_i);
        state_vect(i)=next_i;
        %Let us know how many times the state should be fixed
        %in function of the state soujourn time
        mean_sst=SSTallM{roi};
        %mean_sst=cell2mat(mean_sst);
        mean_sst=mean_sst(curr_i+1);
        std_sst=SSTallS{roi};
        %std_sst=cell2mat(std_sst);
        std_sst=std_sst(curr_i+1);
        sst_time=abs(normrnd(mean_sst,std_sst));
        iterations=floor(sst_time);
        iterations=floor(iterations/sampling_time);
        if (iterations==0)%at least one permanence in the state
            iterations=1;
        end
        fid = fopen(name, 'a+');
        for j=1:iterations
            fprintf(fid, '%d\n', curr_i);            
        end
        fclose(fid);
    end
end
disp('Data written in the network folder... now let s read and display it...');
pause()
disp('Saving workspace...')
%Now the nodes are all synchronized into the files, so we can
%read
%Let us calculate the minimum number of iterations (so we have the same 
%number for all files
%The difference is due to the SST and the number of times a state must
%remain the same
max_it=10000000000000000000000000000;
for i=1:nRoIs
    %name='./network/';
    name=[network_name '/'];
    filename='';
    if (i<=9)
        filename=['0' num2str(i) '.txt'];
    else
        filename=[num2str(i) '.txt'];
    end
    name=[name filename];
    fid = fopen(name,'r');
    n = 0;
    while ~feof(fid)
        fgetl(fid);
        n = n+1;
    end
    fclose(fid);
    if n<max_it
        max_it=n;
    end
    %pause()
end

%Read and plot data
files={};
curr_state=[];
for j=1:nRoIs
    %name='./network/';
    name=[network_name '/'];
    filename='';
    if (j<=9)
        filename=['0' num2str(j) '.txt'];
    else
        filename=[num2str(j) '.txt'];
    end  
    name=[name filename];
    files{end+1}=fileread(name);
end

x=(1:nRoIs);
samples=cell(nRoIs,1);
for sam=1:nRoIs
    samples{sam}=0;
end
%Given that it is a string, we must jump the character following the real
%number
for i=1:2:max_it    
    curr_vect=[];
    %states
    for j=1:nRoIs
        a=files{j};
        num=a(i);
        curr_vect=[curr_vect str2num(num)];
        a=[];
    end
    %stem(x,curr_vect);
    %grid on
    %pause(0.5);
    
    %values
    curr_vect_values=[];
    for j=1:nRoIs
        low=curr_vect(j)+1;
        high=low+1;
        range=(max_vec(j)-min_vec(j))/states;
        thresholds=[];
        for k=1:states+1
            if k==1
               thresholds(k)=min_vec(j);
            elseif k==states+1
               thresholds(k)=max_vec(j);
            else
               threshold(k)=min_vec(j)+(k-1)*range; 
            end
        end
        low_limit=thresholds(low);
        high_limit=thresholds(high);
        value = (high_limit-low_limit).*rand(1) + low_limit;
        curr_vect_values=[curr_vect_values value];
    end
    for sam=1:nRoIs
        samples{sam}=[samples{sam} curr_vect_values(sam)];
    end
    if (plo)
        tiledlayout(1,2)
        % left plot
        ax1 = nexttile;
        stem(ax1,x,curr_vect)
        grid on
        % right  plot
        ax2 = nexttile;  
        stem(ax2,x,curr_vect_values);
        axis([1 48 -3 7])
        grid on
        pause(0.02);
    end
end
fclose('all')
save('afterPlot.mat');
disp('Done!')