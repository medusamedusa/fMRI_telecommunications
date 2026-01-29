%This script evaluates the Mutual information related to the previous data,
%as well as the packets exchanged through Intra and Inter RoIs connections.
clear
close all

plot_graph=0;
plot_heat=0;
paus=0;
%To consider auto-activity in the statistics or not
self=1;
%Just for the image
a=figure;
M=zeros(48);
M=M+1;
g=graph(M);
LWidths = g.Edges.Weight/max(g.Edges.Weight)/3;
%plot(g,'EdgeLabel',g.Edges.Weight,'LineWidth',LWidths)
if (plot_graph)
    plot(g,'LineWidth',LWidths)
    %p = plot(g, 'LineWidth', g.Edges.Weight);
end
title('G_1(A) representation for the STATNET');
if (paus)
    pause()
end

load('afterPlot.mat')
%Evaluating the Normalized Mutual Information
clear min
W=20;
BA=0.001;
%2*W because we have to jump separators (files is cell of characters)
MI=zeros(nRoIs);
it=1;
Ts=0.25;
GlobalNMI=zeros(nRoIs);
GlobalPackets=zeros(nRoIs);
%Linearized matrix
%(i-1)*nRoIs+j
%Row = I / LineLength; // Integer division 
%Column = I % LineLength+1; // Remainder of the division of I by LineLength
Packets=cell(nRoIs*nRoIs,1);
for i=1:nRoIs*nRoIs
    Packets{i}=0;
end
disp('Working...')
lim=2*max_it-2*W;
for i=1:2*W:lim   
    disp(['' num2str(i) ' over ' num2str(lim) '']);
    it=it+1;
    curr_state={};
    %Dummy
    for ii=1:nRoIs
        curr_state{ii}=-1;
    end
    %states
    for j=1:nRoIs
        a=files{j};
        %jump separators
        for k=i:2:i+2*W-1
            curr_state{j}=[curr_state{j} str2num(a(k))];
            %curr_state{1}
            %pause()
        end
    end
    %remove dummy
    for ii=1:nRoIs
        curr_state{ii}(1)=[];
    end
    for ii=1:nRoIs
        samples{ii}(1)=[];
    end
    curr_mat=[];
    for ii=1:nRoIs
        curr_mat(:,ii)=curr_state{ii};
    end
    %curr_mat
    %pause(0.1)
    MI=[];
    MIbool=zeros(nRoIs);
    %MI=corr(curr_mat,'Type','Kendall');
    for jj=1:nRoIs
        for kk=1:nRoIs
            %if (isnan(MI(i,j)))
            %    MI(i,j)=1;
            %end
            xc1=xcorr(curr_mat(:,jj),curr_mat(:,kk),0);
            xc2=xcorr(curr_mat(:,kk),curr_mat(:,jj),0);
            if(xc1<1e-5)
                xc1=0;
            end
            xc1=int16(xc1);
            xc2=int16(xc2);
            if not(xc1==xc2)
                xc1
                xc2
                disp('Different!!!')
                pause()
            end
            %xc=corr(curr_mat(:,jj)+1,curr_mat(:,kk)+1);
            %Force to be symmetric
            if (not(MIbool(jj,kk)))||(not(MIbool(kk,jj)))
                MI(jj,kk)=xc1;
                MI(kk,jj)=xc1;
                MIbool(jj,kk)=1;
                MIbool(kk,jj)=1;
            end
        end
    end
    %MI here is symmetric
    %heatmap(MI);
    %pause()
    clear max;
    mmax=max(max(MI));
    MIN=MI/abs(mmax);
    %MIN = normalize(MI,'range',[-1 1]);
    MIN(1:1+size(MIN,1):end) = 1;
    %heatmap(MIN);
    %pause()
    %heatmap(MIN);%Normalized virtually
    %pause()
    for ii=1:nRoIs
        for j=1:nRoIs
            if (MIN(ii,j)==0)
                MIN(ii,j)=0.0001;
            end
        end
    end
    g=graph(MIN);
    LWidths = g.Edges.Weight/max(g.Edges.Weight);
    %plot(g,'EdgeLabel',g.Edges.Weight,'LineWidth',LWidths)
    if (plot_graph)
        plot(g,'LineWidth',LWidths)
        %p = plot(g, 'LineWidth', g.Edges.Weight);
        pause(0.04)
    end
    if (paus)
        pause()
    end
    %colormap gray
    %deg = degree(g);
    %nSizes = 2*sqrt(deg-min(deg)+0.2);
    %nColors = deg;
    %plot(g,'MarkerSize',nSizes,'NodeCData',nColors,'EdgeAlpha',0.1)
    %colorbar
    %pause()
    %heatmap(MIN);
    %pause()
    %title('BPC_{1,140,s} values evaluated over w=10 samples for each RoI');
    %xlabel('RoI');
    %ylabel('RoI');
    %pause(0.1)
    %entropy evaluation
    hentropy=zeros(nRoIs,1);
    for ii=1:nRoIs
        temp=curr_mat(:,ii);
        hentropy(ii)=entropy_eval(temp,states,W);
    end
    %disp(hentropy);
    %disp('*********');
    NMI=[];
    for ii=1:nRoIs
        for jj=1:nRoIs
            ent1=hentropy(ii);
            ent2=hentropy(jj);
            NMI(ii,jj)=2*MI(ii,jj)/(ent1+ent2);
            if (ent1==0)&&(ent2==0)
                NMI(ii,jj)=0;
            end
        end
    end
    NMI = normalize(NMI,'range',[0 1]);
    NMI(1:1+size(NMI,1):end) = 1;
    if (plot_heat)
        heatmap(NMI);%Normalized virtually
        title('NMI_{1,140,s} values evaluated over w=10 samples for each couple of RoI');
        xlabel('RoI');
        ylabel('RoI');
        pause(0.04)
    end
    GlobalNMI=GlobalNMI+NMI;
    %Here in GlobalNMI we have the connection graph
    %Here in curr_state we have the W values for each state
    %Definition 1 (Brain Activity)
    K=30720;
    Psize=512*(1024);%We define it but avoid to use it due to huge numbers
    time=W*Ts;
    %BA=0.1;
    for roi=1:nRoIs
        T_roi=0;
        for w=1:W
            %the length is W
            k=rand(1,1);
            pois=-log(k)/curr_state{roi}(w);
            %it
            %pause(0.005);
            T_roi=T_roi+ceil(pois);
        end
        fact=K/T_roi;
        %fact=fact*Psize*time;%Here is the number of bits generated by RoI roi
        fact=fact*time;%Here is the number of packets generated by RoI roi
        fact=round(fact);
        %disp(num2str(fact));
        den=0;
        %Impulses not to myself
        for w=1:nRoIs
            if not(w==roi) 
                den=den+NMI(roi,w);
            else
                if (self)
                    den=den+NMI(roi,w);
                end
            end
        end
        %if (den==0)
        %    disp('NULL!')
        %end
        for dest=1:nRoIs
            %Impulses not to myself
            if (not(den==0)) & (NMI(roi,dest)>=BA)
                if not(dest==roi) 
                    GlobalPackets(roi,dest)=GlobalPackets(roi,dest)+round(fact*NMI(roi,dest)/den); 
                    %(i-1)*nRoIs+j
                    index=ind1(roi,dest,nRoIs);
                    elem=round(fact*NMI(roi,dest)/den);
                    vect=Packets{index};
                    vect=[vect elem];
                    Packets{index}=vect;
                else
                    if (self)
                        GlobalPackets(roi,dest)=GlobalPackets(roi,dest)+round(fact*NMI(roi,dest)/den); 
                        %(i-1)*nRoIs+j
                        index=ind1(roi,dest,nRoIs);
                        elem=round(fact*NMI(roi,dest)/den);
                        vect=Packets{index};
                        vect=[vect elem];
                        Packets{index}=vect;
                    end
                end
            end    
        end
    end
end
%Clean NaN for disconnection
GlobalNMI(1:1+size(NMI,1):end) = max(max(GlobalNMI))/2.5;
heatmap(GlobalNMI);
title('GlobalNMI');
pause()
%G=graph(GlobalNMI);
%plot(G)
%pause(0.2)
%Now we have in GlobalPackets the matrix with the total number of exhanged
%packets
%In Packets a linearized matrix of the packets population
g=digraph(GlobalPackets);
LWidths = g.Edges.Weight/max(g.Edges.Weight)/2;

%plot(g,'EdgeLabel',g.Edges.Weight,'LineWidth',LWidths)
plot(g,'LineWidth',LWidths)
title('GlobalPackets');
pause()
heatmap(GlobalPackets);
title('Heating map representation of the average total number of packets exchanged between RoIs (configuration: 1 1 1)');
save('afterE100.mat')

%%%%%%%%%%%%%%%
%% FUNCTIONS %%
%%%%%%%%%%%%%%%
function elem=ind1(i,j,col_elems)
    elem=(i-1)*col_elems+j;
end

function [i j]=ind2(ind,col_elems)
    i = uint8(ind) / LineLength;  
    j = mod(uint8(ind),col_elems+1); 
end