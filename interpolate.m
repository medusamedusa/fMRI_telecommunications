%Adds the average value between the other two
function y = interpolate (x)
    j=1;%index on y
    leng=length(x);
    for i=1:leng-1
        curr=x(i);
        next=x(i+1);
        avg=(curr+next)/2;
        y(j)=x(i);
        y(j+1)=avg;
        j=j+2;
    end
end
