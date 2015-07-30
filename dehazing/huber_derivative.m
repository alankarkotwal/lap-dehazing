
%% huber_derivative

function out = huber_derivative(in, gamma)

    if(in<=gamma)
        out = 0.5;
    else
        out = gamma./(2*abs(in));
    end

end