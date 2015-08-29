
%% huber_derivative

function out = huber_derivative(in, gamma)

    
    [m,n] = size(in);
    out = in;
    for i=1:m
        for j=1:n
            
    if(in(i,j)<=gamma)
        out(i,j) = 0.5;
    else
        out(i,j) = gamma./(2*abs(in(i,j)));
    end
        end
    end    
end