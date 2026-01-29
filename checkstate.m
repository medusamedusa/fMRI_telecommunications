%It receives a number and the thresholds set (the last threshold is the
%max)
function st = checkstate(x,thresholds)
    st=1;
    for i=1:length(thresholds-1)
        if (x>=thresholds(i))&&(x<=thresholds(i+1))
            st=i;
            break;
        end
    end
end

