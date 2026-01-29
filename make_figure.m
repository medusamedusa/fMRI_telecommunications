function null = make_figure (a,i)
    x=double(0:length(a)-1);
    %scatter(x,a,50,'filled','MarkerEdgeColor',[0 0 .6],...
     %         'MarkerFaceColor',[.5 .5 .8],...
      %        'LineWidth',1);
    color=0;
    i
    if (i==1)
        color='black';
    elseif (i==2)
        color = 'blue';
    elseif (i==3)
        color='red';
    else
        color='green';
    end
    plot(x,a,'Color',color,'MarkerSize',8,'Marker','+','LineWidth',1);  
    set(gca,'FontSize',16,'FontWeight','bold')
    grid on
    title('MTPM^A element pdf, M=4, w=20, \alpha=0, \beta=0, i \in Frontal lobe, A="Oxford", k=Healthy patient 1','FontSize',18,'FontWeight','bold');
    xlabel('q','FontSize',18,'FontWeight','bold')
    ylabel('MTPM value','FontSize',18,'FontWeight','bold')
    %Frontal lobe
    %legend('i=1', 'i=3', 'i=4', 'i=5', 'i=6', 'i=7', 'i=25', 'i=26', 'i=33', 'i=41', 'i=42');
    %legend('i=2', 'i=8', 'i=9', 'i=10', 'i=11', 'i=12', 'i=13', 'i=14', 'i=15', 'i=16', 'i=37', 'i=38', 'i=39', 'i=44', 'i=45', 'i=46');
    %legend('i=17', 'i=18', 'i=19', 'i=20', 'i=21', 'i=31', 'i=43');
    %legend('i=22', 'i=23', 'i=24', 'i=32', 'i=36', 'i=40', 'i=47', 'i=48');
    %legend('i=27', 'i=28', 'i=29', 'i=30', 'i=34', 'i=35');
    ax = gca;
    %ax.XTick = unique( round(ax.XTick) );
end