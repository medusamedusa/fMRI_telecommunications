clear all
close all

%These figures have been created by the source below the imshow
h1 = openfig('Lobes01-ZeN01.fig','reuse'); 
ax1 = gca; 
h2 = openfig('Lobes02-ZeN01.fig','reuse'); 
ax2 = gca;
h3 = openfig('Lobes03-ZeN01.fig','reuse'); 
ax3 = gca;
h4 = openfig('Lobes04-ZeN01.fig','reuse'); 
ax4 = gca;
 
figure;
tcl=tiledlayout(2,2);
ax1.Parent=tcl;
ax1.Layout.Tile=1;
ax2.Parent=tcl;
ax2.Layout.Tile=2;
ax3.Parent=tcl;
ax3.Layout.Tile=3;
ax4.Parent=tcl;
ax4.Layout.Tile=4;
pause()


close all
clear all
h1 = openfig('Lobes01-ZeN02.fig','reuse'); 
ax1 = gca; 
h2 = openfig('Lobes02-ZeN02.fig','reuse'); 
ax2 = gca;
h3 = openfig('Lobes03-ZeN02.fig','reuse'); 
ax3 = gca;
h4 = openfig('Lobes04-ZeN02.fig','reuse'); 
ax4 = gca;
 
figure;
tcl=tiledlayout(2,2);
ax1.Parent=tcl;
ax1.Layout.Tile=1;
ax2.Parent=tcl;
ax2.Layout.Tile=2;
ax3.Parent=tcl;
ax3.Layout.Tile=3;
ax4.Parent=tcl;
ax4.Layout.Tile=4;
pause()

close all
clear all
h1 = openfig('Lobes01-ZeN03.fig','reuse'); 
ax1 = gca; 
h2 = openfig('Lobes02-ZeN03.fig','reuse'); 
ax2 = gca;
h3 = openfig('Lobes03-ZeN03.fig','reuse'); 
ax3 = gca;
h4 = openfig('Lobes04-ZeN03.fig','reuse'); 
ax4 = gca;
 
figure;
tcl=tiledlayout(2,2);
ax1.Parent=tcl;
ax1.Layout.Tile=1;
ax2.Parent=tcl;
ax2.Layout.Tile=2;
ax3.Parent=tcl;
ax3.Layout.Tile=3;
ax4.Parent=tcl;
ax4.Layout.Tile=4;
pause()

close all
clear all
h1 = openfig('Lobes01-ZeN04.fig','reuse'); 
ax1 = gca; 
h2 = openfig('Lobes02-ZeN04.fig','reuse'); 
ax2 = gca;
h3 = openfig('Lobes03-ZeN04.fig','reuse'); 
ax3 = gca;
h4 = openfig('Lobes04-ZeN04.fig','reuse'); 
ax4 = gca;
 
figure;
tcl=tiledlayout(2,2);
ax1.Parent=tcl;
ax1.Layout.Tile=1;
ax2.Parent=tcl;
ax2.Layout.Tile=2;
ax3.Parent=tcl;
ax3.Layout.Tile=3;
ax4.Parent=tcl;
ax4.Layout.Tile=4;
pause()

close all
clear all
h1 = openfig('Lobes01-ZeN05.fig','reuse'); 
ax1 = gca; 
h2 = openfig('Lobes02-ZeN05.fig','reuse'); 
ax2 = gca;
h3 = openfig('Lobes03-ZeN05.fig','reuse'); 
ax3 = gca;
h4 = openfig('Lobes04-ZeN05.fig','reuse'); 
ax4 = gca;

figure;
tcl=tiledlayout(2,2);
ax1.Parent=tcl;
ax1.Layout.Tile=1;
ax2.Parent=tcl;
ax2.Layout.Tile=2;
ax3.Parent=tcl;
ax3.Layout.Tile=3;
ax4.Parent=tcl;
ax4.Layout.Tile=4;
pause()

close all
%Lobes definition (just to remind them)
n=5;
harvard{1}=[1,3,4,5,6,7,25,26,33,41,42];
harvard{2}=[2,8,9,10,11,12,13,14,15,16,37,38,39,44,45,46];
harvard{3}=[17,18,19,20,21,31,43];
harvard{4}=[22,23,24,32,36,40,47,48];
harvard{5}=[27,28,29,30,34,35];

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

PKTS=0;
for k=1:4
    if (k==1)
        PKTS=Packets1;
    end
    if (k==2)
        PKTS=Packets2;
    end
    if (k==3)
        PKTS=Packets3;
    end
    if (k==4)
        PKTS=Packets4;
    end
    %HEALTHY1
    [matmu1, matsi1, matzero1, matzeroperc1]=lobes(PKTS, nRoIs);
    [matmu2, matsi2, matzero2, matzeroperc2]=lobes(PKTS, nRoIs);
    [matmu3, matsi3, matzero3, matzeroperc3]=lobes(PKTS, nRoIs);
    [matmu4, matsi4, matzero4, matzeroperc4]=lobes(PKTS, nRoIs);
    
    %Means
    %harvard{1}=[1,3,4,5,6,7,25,26,33,41,42];
    h11=matmu1(1:1,1:1);
    h12=matmu1(3:7,3:7);
    h13=matmu1(25:26,25:26);
    h14=matmu1(33:33,33:33);
    h15=matmu1(41:42,41:42);
    Hmu1=blkdiag(h11,h12,h13,h14,h15);
    h=heatmap(Hmu1,'CellLabelColor', 'None');
    h.Title = ['Mean of the TX/RX packets, k=' num2str(k)];
    h.XLabel = 'Number of RoIs';
    h.YLabel = 'Number of RoIs';
    pause()
    %harvard{2}=[2,8,9,10,11,12,13,14,15,16,37,38,39,44,45,46];
    h21=matmu1(2:2,2:2);
    h22=matmu1(8:16,8:16);
    h23=matmu1(37:39,37:39);
    h24=matmu1(44:46,44:46);
    Hmu2=blkdiag(h21,h22,h23,h24);
    h=heatmap(Hmu2,'CellLabelColor', 'None');
    h.Title = ['Mean of the TX/RX packets, k=' num2str(k)];
    h.XLabel = 'Number of RoIs';
    h.YLabel = 'Number of RoIs';
    pause()
    %harvard{3}=[17,18,19,20,21,31,43];
    h31=matmu1(17:21,17:21);
    h32=matmu1(31:31,31:31);
    h33=matmu1(43:43,43:43);
    Hmu3=blkdiag(h31,h32,h33);
    h=heatmap(Hmu3,'CellLabelColor', 'None');
    h.Title = ['Mean of the TX/RX packets, k=' num2str(k)];
    h.XLabel = 'Number of RoIs';
    h.YLabel = 'Number of RoIs';
    pause()
    %harvard{4}=[22,23,24,32,36,40,47,48];
    h41=matmu1(22:24,22:24);
    h42=matmu1(32:32,32:32);
    h43=matmu1(36:36,36:36);
    h44=matmu1(40:40,40:40);
    h45=matmu1(47:48,47:48);
    Hmu4=blkdiag(h41,h42,h43,h44,h45);
    h=heatmap(Hmu4,'CellLabelColor', 'None');
    h.Title = ['Mean of the TX/RX packets, k=' num2str(k)];
    h.XLabel = 'Number of RoIs';
    h.YLabel = 'Number of RoIs';
    pause()
    %harvard{5}=[27,28,29,30,34,35];
    h51=matmu1(27:30,27:30);
    h52=matmu1(34:34,34:34);
    h53=matmu1(35:35,35:35);
    Hmu5=blkdiag(h51,h52,h53);
    h=heatmap(Hmu5,'CellLabelColor', 'None');
    h.Title = ['Mean of the TX/RX packets, k=' num2str(k)];
    h.XLabel = 'Number of RoIs';
    h.YLabel = 'Number of RoIs';
    pause()
    
    %STD
    %harvard{1}=[1,3,4,5,6,7,25,26,33,41,42];
    h11=matsi1(1:1,1:1);
    h12=matsi1(3:7,3:7);
    h13=matsi1(25:26,25:26);
    h14=matsi1(33:33,33:33);
    h15=matsi1(41:42,41:42);
    Hsi1=blkdiag(h11,h12,h13,h14,h15);
    h=heatmap(Hsi1,'CellLabelColor', 'None');
    h.Title = ['Standard Deviation of the TX/RX packets, k=' num2str(k)];
    h.XLabel = 'Number of RoIs';
    h.YLabel = 'Number of RoIs';
    pause()
    %harvard{2}=[2,8,9,10,11,12,13,14,15,16,37,38,39,44,45,46];
    h21=matsi1(2:2,2:2);
    h22=matsi1(8:16,8:16);
    h23=matsi1(37:39,37:39);
    h24=matsi1(44:46,44:46);
    Hsi2=blkdiag(h21,h22,h23,h24);
    h=heatmap(Hsi2,'CellLabelColor', 'None');
    h.Title = ['Standard Deviation of the TX/RX packets, k=' num2str(k)];
    h.XLabel = 'Number of RoIs';
    h.YLabel = 'Number of RoIs';
    pause()
    %harvard{3}=[17,18,19,20,21,31,43];
    h31=matsi1(17:21,17:21);
    h32=matsi1(31:31,31:31);
    h33=matsi1(43:43,43:43);
    Hsi3=blkdiag(h31,h32,h33);
    h=heatmap(Hsi3,'CellLabelColor', 'None');
    h.Title = ['Standard Deviation of the TX/RX packets, k=' num2str(k)];
    h.XLabel = 'Number of RoIs';
    h.YLabel = 'Number of RoIs';
    pause()
    %harvard{4}=[22,23,24,32,36,40,47,48];
    h41=matsi1(22:24,22:24);
    h42=matsi1(32:32,32:32);
    h43=matsi1(36:36,36:36);
    h44=matsi1(40:40,40:40);
    h45=matsi1(47:48,47:48);
    Hsi4=blkdiag(h41,h42,h43,h44,h45);
    h=heatmap(Hsi4,'CellLabelColor', 'None');
    h.Title = ['Standard Deviation of the TX/RX packets, k=' num2str(k)];
    h.XLabel = 'Number of RoIs';
    h.YLabel = 'Number of RoIs';
    pause()
    %harvard{5}=[27,28,29,30,34,35];
    h51=matsi1(27:30,27:30);
    h52=matsi1(34:34,34:34);
    h53=matsi1(35:35,35:35);
    Hsi5=blkdiag(h51,h52,h53);
    h=heatmap(Hsi5,'CellLabelColor', 'None');
    h.Title = ['Standard Deviation of the TX/RX packets, k=' num2str(k)];
    h.XLabel = 'Number of RoIs';
    h.YLabel = 'Number of RoIs';
    pause()
    
    %ZEROS
    %harvard{1}=[1,3,4,5,6,7,25,26,33,41,42];
    h11=matzero1(1:1,1:1);
    h12=matzero1(3:7,3:7);
    h13=matzero1(25:26,25:26);
    h14=matzero1(33:33,33:33);
    h15=matzero1(41:42,41:42);
    Hzero1=blkdiag(h11,h12,h13,h14,h15);
    h=heatmap(Hzero1,'CellLabelColor', 'None');
    h.Title = 'Number of zero TX/RX elements';
    h.XLabel = 'Number of RoIs';
    h.YLabel = 'Number of RoIs';
    pause()
    %harvard{2}=[2,8,9,10,11,12,13,14,15,16,37,38,39,44,45,46];
    h21=matzero1(2:2,2:2);
    h22=matzero1(8:16,8:16);
    h23=matzero1(37:39,37:39);
    h24=matzero1(44:46,44:46);
    Hzero2=blkdiag(h21,h22,h23,h24);
    h=heatmap(Hzero2,'CellLabelColor', 'None');
    h.Title = ['Number of zero TX/RX elements, k=' num2str(k)];
    h.XLabel = 'Number of RoIs';
    h.YLabel = 'Number of RoIs';
    pause()
    %harvard{3}=[17,18,19,20,21,31,43];
    h31=matzero1(17:21,17:21);
    h32=matzero1(31:31,31:31);
    h33=matzero1(43:43,43:43);
    Hzero3=blkdiag(h31,h32,h33);
    h=heatmap(Hzero3,'CellLabelColor', 'None');
    h.Title = ['Number of zero TX/RX elements, k=' num2str(k)];
    h.XLabel = 'Number of RoIs';
    h.YLabel = 'Number of RoIs';
    pause()
    %harvard{4}=[22,23,24,32,36,40,47,48];
    h41=matzero1(22:24,22:24);
    h42=matzero1(32:32,32:32);
    h43=matzero1(36:36,36:36);
    h44=matzero1(40:40,40:40);
    h45=matzero1(47:48,47:48);
    Hzero4=blkdiag(h41,h42,h43,h44,h45);
    h=heatmap(Hzero4,'CellLabelColor', 'None');
    h.Title = ['Number of zero TX/RX elements, k=' num2str(k)];
    h.XLabel = 'Number of RoIs';
    h.YLabel = 'Number of RoIs';
    pause()
    %harvard{5}=[27,28,29,30,34,35];
    h51=matzero1(27:30,27:30);
    h52=matzero1(34:34,34:34);
    h53=matzero1(35:35,35:35);
    Hzero5=blkdiag(h51,h52,h53);
    h=heatmap(Hzero5,'CellLabelColor', 'None');
    h.Title = ['Number of zero TX/RX elements, k=' num2str(k)];
    h.XLabel = 'Number of RoIs';
    h.YLabel = 'Number of RoIs';
    pause()
    %ZEROperc
    %harvard{1}=[1,3,4,5,6,7,25,26,33,41,42];
    h11=matzeroperc1(1:1,1:1);
    h12=matzeroperc1(3:7,3:7);
    h13=matzeroperc1(25:26,25:26);
    h14=matzeroperc1(33:33,33:33);
    h15=matzeroperc1(41:42,41:42);
    Hzeroperc1=blkdiag(h11,h12,h13,h14,h15);
    h=heatmap(Hzeroperc1,'CellLabelColor', 'None');
    h.Title = ['Normalized number of zero TX/RX elements, k=' num2str(k)];
    h.XLabel = 'Number of RoIs';
    h.YLabel = 'Number of RoIs';
    pause()
    %harvard{2}=[2,8,9,10,11,12,13,14,15,16,37,38,39,44,45,46];
    h21=matzeroperc1(2:2,2:2);
    h22=matzeroperc1(8:16,8:16);
    h23=matzeroperc1(37:39,37:39);
    h24=matzeroperc1(44:46,44:46);
    Hzeroperc2=blkdiag(h21,h22,h23,h24);
    h=heatmap(Hzeroperc2,'CellLabelColor', 'None');
    h.Title = ['Normalized number of zero TX/RX elements, k=' num2str(k)];
    h.XLabel = 'Number of RoIs';
    h.YLabel = 'Number of RoIs';
    pause()
    %harvard{3}=[17,18,19,20,21,31,43];
    h31=matzeroperc1(17:21,17:21);
    h32=matzeroperc1(31:31,31:31);
    h33=matzeroperc1(43:43,43:43);
    Hzeroperc3=blkdiag(h31,h32,h33);
    h=heatmap(Hzeroperc3,'CellLabelColor', 'None');
    h.Title = ['Normalized number of zero TX/RX elements, k=' num2str(k)];
    h.XLabel = 'Number of RoIs';
    h.YLabel = 'Number of RoIs';
    pause()

    %harvard{4}=[22,23,24,32,36,40,47,48];
    h41=matzeroperc1(22:24,22:24);
    h42=matzeroperc1(32:32,32:32);
    h43=matzeroperc1(36:36,36:36);
    h44=matzeroperc1(40:40,40:40);
    h45=matzeroperc1(47:48,47:48);
    Hzeroperc4=blkdiag(h41,h42,h43,h44,h45);
    h=heatmap(Hzeroperc4,'CellLabelColor', 'None');
    h.Title = ['Normalized number of zero TX/RX elements, k=' num2str(k)];
    h.XLabel = 'Number of RoIs';
    h.YLabel = 'Number of RoIs';
    pause()
    %harvard{5}=[27,28,29,30,34,35];
    h51=matzeroperc1(27:30,27:30);
    h52=matzeroperc1(34:34,34:34);
    h53=matzeroperc1(35:35,35:35);
    Hzeroperc5=blkdiag(h51,h52,h53);
    h=heatmap(Hzeroperc5,'CellLabelColor', 'None');
    h.Title = ['Normalized number of zero TX/RX elements, k=' num2str(k)];
    h.XLabel = 'Number of RoIs';
    h.YLabel = 'Number of RoIs';
    pause()
    
    %subplot(3,2,1);
    %heatmap(Hmu1);
    %subplot(3,2,2);
    %heatmap(Hmu5);
    %subplot(3,2,3);
    %heatmap(Hmu3);
    %subplot(3,2,4);
    %heatmap(Hmu4);
    %subplot(3,2,[5,6]);
    %heatmap(Hmu2);
    %pause()
    %close all

    %subplot(3,2,1);
    %heatmap(Hsi1);
    %subplot(3,2,2);
    %heatmap(Hsi5);
    %subplot(3,2,3);
    %heatmap(Hsi3);
    %subplot(3,2,4);
    %heatmap(Hsi4);
    %subplot(3,2,[5,6]);
    %heatmap(Hsi2);
    %pause()
    %close all

    %subplot(3,2,1);
    %heatmap(Hzero1);
    %subplot(3,2,2);
    %heatmap(Hzero5);
    %subplot(3,2,3);
    %heatmap(Hzero3);
    %subplot(3,2,4);
    %heatmap(Hzero4);
    %subplot(3,2,[5,6]);
    %heatmap(Hzero2);
    %pause()
    %close all

    %subplot(3,2,1);
    %heatmap(Hzeroperc1);
    %subplot(3,2,2);
    %heatmap(Hzeroperc5);
    %subplot(3,2,3);
    %heatmap(Hzeroperc3);
    %subplot(3,2,4);
    %heatmap(Hzeroperc4);
    %subplot(3,2,[5,6]);
    %heatmap(Hzeroperc2);
    %pause()
    %close all
end

%%%%%%%%%%%%%%%%%%%%%%%%
function elem=ind1(i,j,col_elems)
    elem=(i-1)*col_elems+j;
end

function [i j]=ind2(ind,col_elems)
    i = uint8(ind) / LineLength;  
    j = mod(uint8(ind),col_elems+1); 
end



function [matmu, matsi, zero, zero_perc]=lobes(packets, nRoIs)
    for i=1:nRoIs
        for j=1:nRoIs
            index=ind1(i,j,nRoIs);
            curr=[];
            for t=1:length(packets{index})
                curr=[curr packets{index}(t)];
            end
            %plot(curr);
            %pause()
            matmu(i,j)=mean(curr);
            matsi(i,j)=std(curr);
            zero(i,j)=numel(curr)-nnz(curr);
            zero_perc=zero/numel(curr);
        end
    end
end

