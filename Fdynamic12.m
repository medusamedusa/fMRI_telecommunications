clear all
close all

%After the preliminary figures, let us see what happens to ith RoI transmission
ith=40;

load('afterE000.mat')
Packets1=Packets;
GlobalPackets1=GlobalPackets;
GlobalNMI1=GlobalNMI;

load('afterE001.mat')
Packets2=Packets;
GlobalPackets2=GlobalPackets;
GlobalNMI2=GlobalNMI;

load('afterE010.mat')
Packets3=Packets;
GlobalPackets3=GlobalPackets;
GlobalNMI3=GlobalNMI;

load('afterE011.mat')
Packets4=Packets;
GlobalPackets4=GlobalPackets;
GlobalNMI4=GlobalNMI;

%Second half
load('afterE100.mat')
Packets5=Packets;
GlobalPackets5=GlobalPackets;
GlobalNMI5=GlobalNMI;

load('afterE101.mat')
Packets6=Packets;
GlobalPackets6=GlobalPackets;
GlobalNMI6=GlobalNMI;

load('afterE110.mat')
Packets7=Packets;
GlobalPackets7=GlobalPackets;
GlobalNMI7=GlobalNMI;

load('afterE111.mat')
Packets8=Packets;
GlobalPackets8=GlobalPackets;
GlobalNMI8=GlobalNMI;





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

mu50=[];
mu51=[];
si50=[];
si51=[];

mu60=[];
mu61=[];
si60=[];
si61=[];

mu70=[];
mu71=[];
si70=[];
si71=[];

mu80=[];
mu81=[];
si80=[];
si81=[];

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

    mu50=[mu50 mean(Packets5{i})];
    mu51=[mu51 mean(nonzeros(Packets5{i}))];
    si50=[si50 std(Packets5{i})];
    si51=[si51 std(nonzeros(Packets5{i}))];

    mu60=[mu60 mean(Packets6{i})];
    mu61=[mu61 mean(nonzeros(Packets6{i}))];
    si60=[si60 std(Packets6{i})];
    si61=[si61 std(nonzeros(Packets6{i}))];

    mu70=[mu70 mean(Packets7{i})];
    mu71=[mu71 mean(nonzeros(Packets7{i}))];
    si70=[si70 std(Packets7{i})];
    si71=[si71 std(nonzeros(Packets7{i}))];

    mu80=[mu80 mean(Packets8{i})];
    mu81=[mu81 mean(nonzeros(Packets8{i}))];
    si80=[si80 std(Packets8{i})];
    si81=[si81 std(nonzeros(Packets8{i}))];

end

f=figure;
norm_factor=341;%from 512kB to 1500B
subplot(2,2,1);
histogram(mu10*norm_factor,'Normalization','probability');
hold on
histogram(mu20*norm_factor,'Normalization','probability');
title('Mean of Total Transmitted Packets (MTTP) for 000 and 001')
xlabel('MTTP','FontSize',18,'FontWeight','bold')
ylabel('P(MTTP)','FontSize',18,'FontWeight','bold')
legend('000 - Over-70, healthy, male', '001 - Over-70, healthy, female');
grid on
subplot(2,2,2);
histogram(mu30*norm_factor,'Normalization','probability');
hold on
histogram(mu40*norm_factor,'Normalization','probability');
title('Mean of Total Transmitted Packets (MTTP) for 010 and 011')
xlabel('MTTP','FontSize',18,'FontWeight','bold')
ylabel('P(MTTP)','FontSize',18,'FontWeight','bold')
legend('010 - Over-70, diseased, male', '011 - Over-70, diseased, female');
grid on
subplot(2,2,3);
histogram(mu50*1.4*norm_factor,'Normalization','probability');
hold on
histogram(mu60*1.3*norm_factor,'Normalization','probability');
title('Mean of Total Transmitted Packets (MTTP) for 100 and 101')
xlabel('MTTP','FontSize',18,'FontWeight','bold')
ylabel('P(MTTP)','FontSize',18,'FontWeight','bold')
legend('100 - Under-70, healthy, male', '101 - Under-70, healthy, female');
grid on
subplot(2,2,4);
histogram(mu70*norm_factor,'Normalization','probability');
hold on
histogram(mu80*norm_factor,'Normalization','probability');
title('Mean of Total Transmitted Packets (MTTP) for 110 and 111')
xlabel('MTTP','FontSize',18,'FontWeight','bold')
ylabel('P(MTTP)','FontSize',18,'FontWeight','bold')
legend('110 - Under-70, diseased, male', '111 - Under-70, diseased, female');
grid on
%set(gca,'FontSize',16,'FontWeight','bold')
%title('\DeltaM_i (blue) and m^{C_r}_{i,i}/2 (red), for the urban GA with \theta=0.1 (1veh/s)','FontSize',18,'FontWeight','bold');
pause()
close all


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

roi_i_tx5=cell(48,1);
roi_i_mean5=[];
roi_i_tx6=cell(48,1);
roi_i_mean6=[];
roi_i_tx7=cell(48,1);
roi_i_mean7=[];
roi_i_tx8=cell(48,1);
roi_i_mean8=[];

for j=1:nRoIs
    element=ind1(ith,j,nRoIs);
    roi_i_tx1{j}=Packets1{element};
    roi_i_tx2{j}=Packets2{element};
    roi_i_tx3{j}=Packets3{element};
    roi_i_tx4{j}=Packets4{element};
    roi_i_tx5{j}=Packets5{element};
    roi_i_tx6{j}=Packets6{element};
    roi_i_tx7{j}=Packets7{element};
    roi_i_tx8{j}=Packets8{element};

    %hist(roi_i_tx1{j});
    %plot(roi_i_tx{j})
    %hold on
    %pause(0.05);
    roi_i_mean1=[roi_i_mean1 mean(roi_i_tx1{j})];
    roi_i_mean2=[roi_i_mean2 mean(roi_i_tx2{j})];
    roi_i_mean3=[roi_i_mean3 mean(roi_i_tx3{j})];
    roi_i_mean4=[roi_i_mean4 mean(roi_i_tx4{j})];
    roi_i_mean5=[roi_i_mean5 mean(roi_i_tx5{j})];
    roi_i_mean6=[roi_i_mean6 mean(roi_i_tx6{j})];
    roi_i_mean7=[roi_i_mean7 mean(roi_i_tx7{j})];
    roi_i_mean8=[roi_i_mean8 mean(roi_i_tx8{j})];

end

%pause()
%j=12;
roi_j_mean1=[];
roi_j_rx1=cell(48,1);
roi_j_mean2=[];
roi_j_rx2=cell(48,1);
roi_j_mean3=[];
roi_j_rx3=cell(48,1);
roi_j_mean4=[];
roi_j_rx4=cell(48,1);
roi_j_mean5=[];
roi_j_rx5=cell(48,1);
roi_j_mean6=[];
roi_j_rx6=cell(48,1);
roi_j_mean7=[];
roi_j_rx7=cell(48,1);
roi_j_mean8=[];
roi_j_rx8=cell(48,1);


for i=1:nRoIs
    element=ind1(i,ith,nRoIs);
    roi_j_rx1{i}=Packets1{element};
    roi_j_rx2{i}=Packets2{element};
    roi_j_rx3{i}=Packets3{element};
    roi_j_rx4{i}=Packets4{element};
    roi_j_rx5{i}=Packets5{element};
    roi_j_rx6{i}=Packets6{element};
    roi_j_rx7{i}=Packets7{element};
    roi_j_rx8{i}=Packets8{element};

    %hist(roi_j_rx1{i});
    %pause(0.05);
    roi_j_mean1=[roi_j_mean1 mean(roi_j_rx1{i})];
    roi_j_mean2=[roi_j_mean2 mean(roi_j_rx2{i})];
    roi_j_mean3=[roi_j_mean3 mean(roi_j_rx3{i})];
    roi_j_mean4=[roi_j_mean4 mean(roi_j_rx4{i})];
    roi_j_mean5=[roi_j_mean5 mean(roi_j_rx5{i})];
    roi_j_mean6=[roi_j_mean6 mean(roi_j_rx6{i})];
    roi_j_mean7=[roi_j_mean7 mean(roi_j_rx7{i})];
    roi_j_mean8=[roi_j_mean8 mean(roi_j_rx8{i})];
end
%pause()

work_name=['roi' num2str(ith) '.mat'];
save(work_name);

m=6;
f=figure;
subplot(2,1,1);
plot(roi_i_mean1*norm_factor,'-*', 'MarkerSize',m,'Color',[0.0,0.0,1],'LineWidth',0.8);
hold on
plot(roi_j_mean1*norm_factor,'-*', 'MarkerSize',m,'Color',[1,0.0,0.0],'LineWidth',0.8);
plot(roi_i_mean2*norm_factor,'-+', 'MarkerSize',m,'Color',[0.0,0.0,0],'LineWidth',0.8);
plot(roi_j_mean2*norm_factor,'-+', 'MarkerSize',m,'Color',[0,1.0,0.0],'LineWidth',0.8);
grid on
title('RoI 12: "Right Parietal Cortex" TX/RX packets')
xlabel('RoI','FontSize',12,'FontWeight','bold')
ylabel('Packets','FontSize',12,'FontWeight','bold')
legend('TX Packets (000 - Over 70 - Healthy - Male)', 'RX Packets (000 - Over 70 - Healthy - Male)', 'TX Packets (001 - Over 70 - Healthy - Female)', 'RX Packets (001 - Over 70 - Healthy - Female)');
set(gca,'FontSize',10,'FontWeight','bold')
%axis([1 48 80 270]);

subplot(2,1,2);
plot(roi_i_mean3*norm_factor,'-*', 'MarkerSize',m,'Color',[0.0,0.0,1],'LineWidth',0.8);
hold on
plot(roi_j_mean3*norm_factor,'-*', 'MarkerSize',m,'Color',[1,0.0,0.0],'LineWidth',0.8);
plot(roi_i_mean4*norm_factor,'-+', 'MarkerSize',m,'Color',[0.0,0.0,0],'LineWidth',0.8);
plot(roi_j_mean4*norm_factor,'-+', 'MarkerSize',m,'Color',[0,1.0,0.0],'LineWidth',0.8);
grid on
title('RoI 12: "Right Parietal Cortex" TX/RX packets')
xlabel('RoI','FontSize',12,'FontWeight','bold')
ylabel('Packets','FontSize',12,'FontWeight','bold')
legend('TX Packets (010 - Over 70 - Diseased - Male)', 'RX Packets (010 - Over 70 - Diseased - Male)', 'TX Packets (011 - Over 70 - Diseased - Female)', 'RX Packets (011 - Over 70 - Diseased - Female)');
set(gca,'FontSize',10,'FontWeight','bold')
%axis([1 48 80 270]);

pause()

f=figure;
subplot(2,1,1);
plot(roi_i_mean5*norm_factor,'-*', 'MarkerSize',m,'Color',[0.0,0.0,1],'LineWidth',0.8);
hold on
plot(roi_j_mean5*norm_factor,'-*', 'MarkerSize',m,'Color',[1,0.0,0.0],'LineWidth',0.8);
plot(roi_i_mean6*norm_factor,'-+', 'MarkerSize',m,'Color',[0.0,0.0,0],'LineWidth',0.8);
plot(roi_j_mean6*norm_factor,'-+', 'MarkerSize',m,'Color',[0,1.0,0.0],'LineWidth',0.8);
grid on
title('RoI 12: "Right Parietal Cortex" TX/RX packets')
xlabel('RoI','FontSize',12,'FontWeight','bold')
ylabel('Packets','FontSize',12,'FontWeight','bold')
legend('TX Packets (100 - Under 70 - Healthy - Male)', 'RX Packets (100 - Under 70 - Healthy - Male)', 'TX Packets (101 - Under 70 - Healthy - Female)', 'RX Packets (101 - Under 70 - Healthy - Female)');
set(gca,'FontSize',10,'FontWeight','bold')
%axis([1 48 80 270]);

subplot(2,1,2);
plot(roi_i_mean7*norm_factor,'-*', 'MarkerSize',m,'Color',[0.0,0.0,1],'LineWidth',0.8);
hold on
plot(roi_j_mean7*norm_factor,'-*', 'MarkerSize',m,'Color',[1,0.0,0.0],'LineWidth',0.8);
plot(roi_i_mean8*norm_factor,'-+', 'MarkerSize',m,'Color',[0.0,0.0,0],'LineWidth',0.8);
plot(roi_j_mean8*norm_factor,'-+', 'MarkerSize',m,'Color',[0,1.0,0.0],'LineWidth',0.8);
grid on
title('RoI 12: "Right Parietal Cortex" TX/RX packets')
xlabel('RoI','FontSize',12,'FontWeight','bold')
ylabel('Packets','FontSize',12,'FontWeight','bold')
legend('TX Packets (110 - Under 70 - Diseased - Male)', 'RX Packets (110 - Under 70 - Diseased - Male)', 'TX Packets (111 - Under 70 - Diseased - Female)', 'RX Packets (11 - Under 70 - Diseased - Female)');
set(gca,'FontSize',10,'FontWeight','bold')
%axis([1 48 80 270]);

subplot(2,2,[3,4]);
plot(roi_i_mean3,'-*', 'MarkerSize',m,'Color',[0.0,0.0,1],'LineWidth',0.8);
hold on
plot(roi_j_mean3,'-*', 'MarkerSize',m,'Color',[1,0.0,0.0],'LineWidth',0.8);
plot(roi_i_mean4,'-+', 'MarkerSize',m,'Color',[0.0,0.0,0],'LineWidth',0.8);
plot(roi_j_mean4,'-+', 'MarkerSize',m,'Color',[0,1.0,0.0],'LineWidth',0.8);
grid on
title('RoI 12: "Right Parietal Cortex" TX/RX packets')
xlabel('RoI','FontSize',12,'FontWeight','bold')
ylabel('Packets','FontSize',12,'FontWeight','bold')
legend('TX Packets (k=3)', 'RX Packets (k=3)', 'TX Packets (k=4)', 'RX Packets (k=4)');
set(gca,'FontSize',10,'FontWeight','bold')
%axis([1 48 80 270]);

%

%%%%%%%%%%%%%%%%%%%%%%%%
function elem=ind1(i,j,col_elems)
    elem=(i-1)*col_elems+j;
end

function [i j]=ind2(ind,col_elems)
    i = uint8(ind) / LineLength;  
    j = mod(uint8(ind),col_elems+1); 
end

mean(roi_i_mean1)
mean(roi_j_mean1)
mean(roi_i_mean2)
mean(roi_j_mean2)
mean(roi_i_mean3)
mean(roi_j_mean3)
mean(roi_i_mean4)
mean(roi_j_mean4)