%This script shows the desired MTPM elements for the considered patients
%It is not mandatory for the overall execution
clear
close all;

nRoIs=48;
col=1;
row=1;
figure
element_all_lobe=[];%per lobe
newcolors = {'#F00','#F80','#FF0','#0B0','#00F','#50F','#A0F','#A00','#A80','#AF0','#BB0', '#0BF','#A0F','#5FF','#AFF','#A0F','#A8F','#AFF','#BBF'};
colororder(newcolors);
lobe=3;
color=1;
RoI=17;
%This is valid for the previously created datasets regarding the old
%patients
for patients=1:4
    datafile="";
    if patients==1
        datafile="healthy1.mat";
    elseif patients==2
        datafile="healthy2.mat";
    elseif patients==3
        datafile="healthy3.mat";
    else
        datafile="diseased1.mat";
    end
    load(datafile);
    aa=0;
    lobe=3
    %RoI choice
    for roi=RoI:RoI
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
        %hold off
    end
    %hist(element_all,10);
    
    %axis([1 length(element) 0 1])
    grid on
    pause()
    %close all
end
legend('k=1', 'k=2', 'k=3', 'k=4')
title('MTPM^A element pdf, M=4, w=20, \alpha=0, \beta=0, i=17 (Postcentral Gyrus RoI), A="Oxford", k=1,2,3,4','FontSize',18,'FontWeight','bold');