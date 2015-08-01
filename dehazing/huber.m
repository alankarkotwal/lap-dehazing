
%% huber function

function out = huber(in, gamma)

    if(in<=gamma)
        out = 0.5.*abs(in).^2;
    else
        out = gamma.*abs(in)-gamma.^2./2;
    end

end