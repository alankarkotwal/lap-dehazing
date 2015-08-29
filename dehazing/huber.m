
%% huber function

function out = huber(in, gamma)
    [m,n] = size(in);
    out = in;
    for i=1:m
        for j=1:n
            
            if(in(i,j)<=gamma)
                out(i,j) = 0.5.*abs(in(i,j)).^2;
            else
                out(i,j) = gamma.*abs(in(i,j))-gamma.^2./2;
            end
        end
    end    

end