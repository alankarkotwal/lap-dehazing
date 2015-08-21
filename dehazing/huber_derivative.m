
%% huber_derivative

function out = huber_derivative(in, gamma)
    
%     if(in==0) 
%         out = 0.5;
%     end    
    if(in<=gamma)
        out = 0.5;
    else
        out = gamma./(2*abs(in) + 0.00000000000000000000001);
    end

end