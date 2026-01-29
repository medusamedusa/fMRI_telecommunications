clear all
close all
I=40;
J=40;

load('afterE1.mat')
Packets1=Packets;
GlobalPackets1=GlobalPackets;
GlobalNMI1=GlobalNMI;

load('afterE2.mat')
Packets2=Packets;
GlobalPackets2=GlobalPackets;
GlobalNMI2=GlobalNMI;

load('afterE3.mat')
Packets3=Packets;
GlobalPackets3=GlobalPackets;
GlobalNMI3=GlobalNMI;

load('afterE4.mat')
Packets4=Packets;
GlobalPackets4=GlobalPackets;
GlobalNMI4=GlobalNMI;
%Now we have in GlobalPackets the matrix with the total number of exhanged
%packets
%In Packets a linearized matrix of the packets population
mu10=[];
mu11=[];
si10=[];
si11=[];

mu20=[];
mu21=[];
si20=[];
si21=[];

mu30=[];
mu31=[];
si30=[];
si31=[];

mu40=[];
mu41=[];
si40=[];
si41=[];
for i=1:length(Packets1)
    mu10=[mu10 mean(Packets1{i})];
    mu11=[mu11 mean(nonzeros(Packets1{i}))];
    si10=[si10 std(Packets1{i})];
    si11=[si11 std(nonzeros(Packets1{i}))];

    mu20=[mu20 mean(Packets2{i})];
    mu21=[mu21 mean(nonzeros(Packets2{i}))];
    si20=[si20 std(Packets2{i})];
    si21=[si21 std(nonzeros(Packets2{i}))];

    mu30=[mu30 mean(Packets3{i})];
    mu31=[mu31 mean(nonzeros(Packets3{i}))];
    si30=[si30 std(Packets3{i})];
    si31=[si31 std(nonzeros(Packets3{i}))];

    mu40=[mu40 mean(Packets4{i})];
    mu41=[mu41 mean(nonzeros(Packets4{i}))];
    si40=[si40 std(Packets4{i})];
    si41=[si41 std(nonzeros(Packets4{i}))];
end

f=figure;
subplot(2,2,1);
histogram(mu10,'Normalization','probability');
title('Mean of Total Transmitted Packets (MTTP) for k=1 (h)')
xlabel('MTTP','FontSize',18,'FontWeight','bold')
ylabel('P(MTTP)','FontSize',18,'FontWeight','bold')
grid on
subplot(2,2,2);
histogram(mu20,'Normalization','probability');
title('Mean of Total Transmitted Packets (MTTP) for k=2 (h)')
xlabel('MTTP','FontSize',18,'FontWeight','bold')
ylabel('P(MTTP)','FontSize',18,'FontWeight','bold')
grid on
subplot(2,2,3);
histogram(mu30,'Normalization','probability');
title('Mean of Total Transmitted Packets (MTTP) for k=3 (h)')
xlabel('MTTP','FontSize',18,'FontWeight','bold')
ylabel('P(MTTP)','FontSize',18,'FontWeight','bold')
grid on
subplot(2,2,4);
histogram(mu40,'Normalization','probability');
title('Mean of Total Transmitted Packets (MTTP) for k=4 (d)')
xlabel('MTTP','FontSize',18,'FontWeight','bold')
ylabel('P(MTTP)','FontSize',18,'FontWeight','bold')
grid on
%set(gca,'FontSize',16,'FontWeight','bold')
%title('\DeltaM_i (blue) and m^{C_r}_{i,i}/2 (red), for the urban GA with \theta=0.1 (1veh/s)','FontSize',18,'FontWeight','bold');
pause()
close all

%Let us see what happens to RoI 15 transmission
i=I;
figure
%For different k
roi_i_tx1=cell(48,1);
roi_i_mean1=[];
roi_i_tx2=cell(48,1);
roi_i_mean2=[];
roi_i_tx3=cell(48,1);
roi_i_mean3=[];
roi_i_tx4=cell(48,1);
roi_i_mean4=[];
for j=1:nRoIs
    element=ind1(i,j,nRoIs);
    roi_i_tx1{j}=Packets1{element};
    roi_i_tx2{j}=Packets2{element};
    roi_i_tx3{j}=Packets3{element};
    roi_i_tx4{j}=Packets4{element};
    hist(roi_i_tx1{j});
    %plot(roi_i_tx{j})
    %hold on
    pause(0.05);
    roi_i_mean1=[roi_i_mean1 mean(roi_i_tx1{j})];
    roi_i_mean2=[roi_i_mean2 mean(roi_i_tx2{j})];
    roi_i_mean3=[roi_i_mean3 mean(roi_i_tx3{j})];
    roi_i_mean4=[roi_i_mean4 mean(roi_i_tx4{j})];
end
pause()
j=J;
roi_j_mean1=[];
roi_j_rx1=cell(48,1);
roi_j_mean2=[];
roi_j_rx2=cell(48,1);
roi_j_mean3=[];
roi_j_rx3=cell(48,1);
roi_j_mean4=[];
roi_j_rx4=cell(48,1);
for i=1:nRoIs
    element=ind1(i,j,nRoIs);
    roi_j_rx1{i}=Packets1{element};
    roi_j_rx2{i}=Packets2{element};
    roi_j_rx3{i}=Packets3{element};
    roi_j_rx4{i}=Packets4{element};
    hist(roi_j_rx1{i});
    pause(0.05);
    roi_j_mean1=[roi_j_mean1 mean(roi_j_rx1{i})];
    roi_j_mean2=[roi_j_mean2 mean(roi_j_rx2{i})];
    roi_j_mean3=[roi_j_mean3 mean(roi_j_rx3{i})];
    roi_j_mean4=[roi_j_mean4 mean(roi_j_rx4{i})];
end
pause()

m=6;
f=figure;
subplot(2,2,1);
plot(roi_i_mean1,'-*', 'MarkerSize',m,'Color',[0.0,0.0,1],'LineWidth',0.8);
hold on
plot(roi_j_mean1,'-*', 'MarkerSize',m,'Color',[1,0.0,0.0],'LineWidth',0.8);
plot(roi_i_mean4,'-+', 'MarkerSize',m,'Color',[0.0,0.0,0],'LineWidth',0.8);
plot(roi_j_mean4,'-+', 'MarkerSize',m,'Color',[0,1.0,0.0],'LineWidth',0.8);
grid on
title('RoI 40: "Occipital Fusiform Gyrus" TX/RX packets')
xlabel('RoI','FontSize',12,'FontWeight','bold')
ylabel('Packets','FontSize',12,'FontWeight','bold')
legend('TX Packets (k=1)', 'RX Packets (k=1)', 'TX Packets (k=4)', 'RX Packets (k=4)');
set(gca,'FontSize',10,'FontWeight','bold')
axis([1 48 80 240]);

subplot(2,2,2);
plot(roi_i_mean2,'-*', 'MarkerSize',m,'Color',[0.0,0.0,1],'LineWidth',0.8);
hold on
plot(roi_j_mean2,'-*', 'MarkerSize',m,'Color',[1,0.0,0.0],'LineWidth',0.8);
plot(roi_i_mean4,'-+', 'MarkerSize',m,'Color',[0.0,0.0,0],'LineWidth',0.8);
plot(roi_j_mean4,'-+', 'MarkerSize',m,'Color',[0,1.0,0.0],'LineWidth',0.8);
grid on
title('RoI 40: "Occipital Fusiform Gyrus" TX/RX packets')
xlabel('RoI','FontSize',12,'FontWeight','bold')
ylabel('Packets','FontSize',12,'FontWeight','bold')
legend('TX Packets (k=2)', 'RX Packets (k=2)', 'TX Packets (k=4)', 'RX Packets (k=4)');
set(gca,'FontSize',10,'FontWeight','bold')
axis([1 48 90 240]);

subplot(2,2,[3,4]);
plot(roi_i_mean3,'-*', 'MarkerSize',m,'Color',[0.0,0.0,1],'LineWidth',0.8);
hold on
plot(roi_j_mean3,'-*', 'MarkerSize',m,'Color',[1,0.0,0.0],'LineWidth',0.8);
plot(roi_i_mean4,'-+', 'MarkerSize',m,'Color',[0.0,0.0,0],'LineWidth',0.8);
plot(roi_j_mean4,'-+', 'MarkerSize',m,'Color',[0,1.0,0.0],'LineWidth',0.8);
grid on
title('RoI 40: "Occipital Fusiform Gyrus" TX/RX packets')
xlabel('RoI','FontSize',12,'FontWeight','bold')
ylabel('Packets','FontSize',12,'FontWeight','bold')
legend('TX Packets (k=3)', 'RX Packets (k=3)', 'TX Packets (k=4)', 'RX Packets (k=4)');
set(gca,'FontSize',10,'FontWeight','bold')
axis([1 48 90 240]);

%

%%%%%%%%%%%%%%%%%%%%%%%%
function elem=ind1(i,j,col_elems)
    elem=(i-1)*col_elems+j;
end

function [i j]=ind2(ind,col_elems)
    i = uint8(ind) / LineLength;  
    j = mod(uint8(ind),col_elems+1); 
end


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
%harvard={};
%harvard{1}=[1,3,4,5,6,7,25,26,33,41,42];
%harvard{2}=[2,8,9,10,11,12,13,14,15,16,37,38,39,44,45,46];
%harvard{3}=[17,18,19,20,21,31,43];
%harvard{4}=[22,23,24,32,36,40,47,48];
%harvard{5}=[27,28,29,30,34,35];

mean(roi_i_mean1)
mean(roi_j_mean1)
mean(roi_i_mean2)
mean(roi_j_mean2)
mean(roi_i_mean3)
mean(roi_j_mean3)
mean(roi_i_mean4)
mean(roi_j_mean4)