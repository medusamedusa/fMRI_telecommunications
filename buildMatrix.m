%it receives the samples vector and returns the transition probabilities
%matrix
function [m, sst, thresholds] = buildMatrix(x, states, sampling_time)
    %Evaluate thresholds
    a=min(x);
    b=max(x);
    range=b-a;
    thresholds=[];
    for i=1:states
        thresholds(i)=a+(i-1)*(range/states);
    end
    thresholds=[thresholds b];

    sst={};
    n_states=length(thresholds)-1;
    for i=1:n_states
        sst{i}=[];
    end
    m = zeros(n_states);
    rowsTot= zeros(1,n_states);
    %Not from 1 because the first value is just the id of the original column
    %Then we jump the second value because it is always an outlier
    curr_state=checkstate(x(1),thresholds);
    state_time=sampling_time;%we are already in
    for i=2:length(x)
        next_state=checkstate(x(i),thresholds);
        %disp([num2str(curr_state) ' ' num2str(next_state)]);
        if (next_state==curr_state)
            rowsTot(curr_state)=rowsTot(curr_state)+1;
            m(curr_state,curr_state)=m(curr_state,curr_state)+1;
            state_time=state_time+sampling_time;
        else
            m(curr_state,next_state)=m(curr_state,next_state)+1;
            rowsTot(curr_state)=rowsTot(curr_state)+1;
            sst{curr_state}=[sst{curr_state} state_time];
            state_time=sampling_time;
            curr_state=next_state;
        end
    end
    %Let us normalize m
    check=0;
    bad=0;
    for i=1:n_states
        for j=1:n_states
            m(i,j)=m(i,j)/rowsTot(i);
            check=check+m(i,j);
        end
        if (check-1<0.000001)
            %disp(['Rules satisfied for row: ' num2str(i)]);
            check=0;
        else
            %disp(['An error occurred while building row: ' num2str(i)]);
            bad=1;
        end
    end
    if (not(bad))
        %disp('Matrix correctly built!');
    else
        disp('An error occurred while building M!');
        return
    end
end