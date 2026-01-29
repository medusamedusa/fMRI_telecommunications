function e = entropy_eval(vect,symbols,length)
    e=0;
    prob=zeros(symbols,1);
    %vect
    for i=1:symbols
        sym=i-1;
        %Evaluate the probability of symbol i
        for j=1:length
            if(vect(j)==sym)
                prob(i)=prob(i)+1;
            end
        end
        prob(i)=prob(i)/length;
    end
    %prob
    %pause()
    %Entropy definition
    for i=1:symbols
        if not(prob(i)==0)
            e=e+log2(prob(i))*prob(i);
        end
    end
    e=-e;%due to 1/log2 evaluated as -log2
end