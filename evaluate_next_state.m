function st = evaluate_next_state(mu,sigma,curr_st)
    st=-1;
    prob=rand(1);
    mu=cell2mat(mu);
    sigma=cell2mat(sigma);
    rowM=mu(curr_st+1,:);
    rowS=sigma(curr_st+1);
    for i=1:length(rowM)
        if (i==1)&&(prob<rowM(i))
            %disp('!!!!!!!!!!!!!!!!!!!!!!!!!!!!!')
            st=i-1;
            return
        else
            sum=0;
            for j=1:i
                sum=sum+rowM(j);
            end
            %prob
            %sum
            if (prob<sum)
                st=i-1;
                return
            end
        end
    end
    %disp(['next_state: ' num2str(st)]);
end
