%This script loads the workspace dataALL2.mat,
%removes outliers, augments data and:
%1) Represents the augmented data for patient i
%2) Represents the data for Limbic RoIs of patient i
%3) Discrtises data through the function buildMatrix, in function of the
%chosen parameters states (states 4, W=20);
%4) Plots the MTPM matrix elements
%5) Saves the data workspaces in function of the selected patient

clear
close all;
load ('dataALL2.mat');

%Decide which class of patients to load
over=0;%1 for over 70, 0 for under 70
good=0;%1 for good, 0 for bad
male=0;%1 male, 0 for female

dataset=0;
name='';
if (over==0)&&(good==0)&&(male==0)
    dataset=u70bf;
    name='u70bf';
elseif (over==0)&&(good==0)&&(male==1)
    dataset=u70bm;
    name='u70bm';
elseif (over==0)&&(good==1)&&(male==0)
    dataset=u70gf;
    name='u70gf';
elseif (over==0)&&(good==1)&&(male==1)
    dataset=u70gm;
    name='u70gm';
elseif (over==1)&&(good==0)&&(male==0)
    dataset=o70bf;
    name='o70bf';
elseif (over==1)&&(good==0)&&(male==1)
    dataset=o70bm;
    name='o70bm';
elseif (over==1)&&(good==1)&&(male==0)
    dataset=o70gf;
    name='o70gf';
elseif (over==1)&&(good==1)&&(male==1)
    dataset=o70gm;
    name='o70gm';
end

%In case of another implementation
%assignin('base',var_name, value)
%Not needed for now

%Which patient to analyse (look at the dataset length)
pat=2;
patient=dataset{pat};
name=[name '_' num2str(pat)];
%It is assumed that for all patients we have the same RoIs and samples
nRoIs=size(patient,2);
nSamples=size(patient,1);
%For the model
states=4;
%After interpolation
sampling_time=0.5;%s with interpolation
%the original is 1s
%Observation window
W=20;
%Healthy 
%Table to array
patient=patient{:,:};
%Remove the heading index row
patient(1,:)=[];

%Interpolate values (for doubling samples) - Data augmentation
patient_i1=[];
for i=1:nRoIs
    patient_i1(:,i)=interpolate(patient(:,i));
end

%Remove the first 10 rows in order to clean starting outliers
for j=1:40
    patient_i1(j,:)=[];
end
%end

%doubling again the number of samples
patient_i2=[];
for i=1:nRoIs
    patient_i2(:,i)=interpolate(patient_i1(:,i));
end
%name_file=['data_' name '.mat'];
%save (name_file);

%Preliminary data plot
plot(patient_i2(:,:))
axis([20 470 min(min(patient_i2)) max(max(patient_i2))])
set(gca,'FontSize',16,'FontWeight','bold')
grid on
title('Raw NIfTI data for patient, T=0.25s, w=470','FontSize',18,'FontWeight','bold');
xlabel('Number of samples','FontSize',18,'FontWeight','bold')
ylabel('Signal amplitude [a.u.]','FontSize',18,'FontWeight','bold')
ax = gca;
pause();

for lobe=1:5
    lobe_curr={};
    sz=size(patient_i2);
    len=sz(2);
    for roi=1:len
        if (ismember(roi,harvard{lobe}))
            lobe_curr{end+1}=patient_i2(:,roi);
        end
    end
    %1Frontal lobe
    %2Lobo-temporale lobe
    %3Parietal lobe
    %4Occipital lobe
    %5Limbic lobe
    
    curr=cell2mat(lobe_curr);
    plot(curr,'LineWidth',1);
    axis([20 470 min(min(curr)) max(max(curr))])
    set(gca,'FontSize',16,'FontWeight','bold')
    grid on
    %Text should be adjusted in function of 
    title('Raw NIfTI data for k=1, T=0.25s, w=470, Limbic lobe RoIs','FontSize',18,'FontWeight','bold');
    xlabel('Number of samples','FontSize',18,'FontWeight','bold')
    ylabel('Signal amplitude [a.u.]','FontSize',18,'FontWeight','bold')
    ax = gca;
    legend('27 - Planum Temporale', '28 - Planum Polare', "29 - Heschl' Gyrus", '30 - Temporal Pole', '34 - Cuneal Cortex', '35 - Lingual Gyrus');
    pause();
    hold off
end

%{
figure('WindowState','maximized','Color',[1 1 1]);
sizeA=120;
x=double(1:sizeA);
axes1 = axes;
hold(axes1,'on');
grid on
roi=10;
%plot(brain1sano(40:160),'Color','black','MarkerSize',8,'Marker','+','LineWidth',1);
scatter(x,h1i(41:sizeA+40,roi),50,'filled','MarkerEdgeColor',[0 0 .6],...
              'MarkerFaceColor',[.5 .5 .8],...
              'LineWidth',1);
box(axes1,'on');
grid(axes1,'on');
hold(axes1,'off');
% Set the remaining axes properties
set(axes1,'FontSize',34,'FontWeight','bold');
axis([1 120 -2 1])
title('fMRI->NIfTI RoI discrete sequence Example')
xlabel('t [s]');
ylabel('Signal amplitude [a.u.]')
%}


M={};
sst={};
thrs={};

for i=1:nRoIs
    M{i}=[];
    sst{i}=[];
    thrs{i}=[];
end

%Creates structure to store matrix elements for each RoI/lobe
for roi=1:nRoIs
   roi
   for j=1:W:length(patient_i2)-W
        [a,b,c]=buildMatrix(patient_i2((j:j+W),roi),states,sampling_time);
        M{roi}=[M{roi} a];
        sst{roi}=[sst{roi} b];
        thrs{end+1}=c;
   end
end
save('selected_patient.mat')

col=1;
row=1;
figure
element_all_lobe=[];%per lobe
newcolors = {'#F00','#F80','#FF0','#0B0','#00F','#50F','#A0F','#A00','#A80','#AF0','#BB0', '#0BF','#A0F','#5FF','#AFF','#A0F','#A8F','#AFF','#BBF'};
colororder(newcolors);
for lobe=3:3
    aa=0;
    lobe
    color=1;
    for roi=1:nRoIs
        element_all_rois=[];%per roi
        hold on;
        if (ismember(roi,harvard{lobe}))
            roi
            array=M{roi};
            element=[];
            %Which element we want to plot
            %ii=2;
            %jj=1;
            for i=1:states:length(array)
                element=[element array(row,i+col-1)];
            end
            %plot(element);
            element_all_rois=[element_all_rois element];
            %make_pdf(element_all_rois);
            make_figure(element_all_rois,color);
            axis([0 22 0.5 1])
            pause()
            aa=aa+1;
            disp(['aa:' num2str(aa)]);
            color = color + 1;
        end
        %axis([0 1 0 0.5])
        hold off
    end
    %hist(element_all,10);
    
    %axis([1 length(element) 0 1])
    grid on
    pause()
    close all
end
name_file=['data_' name '.mat'];
save (name_file);
