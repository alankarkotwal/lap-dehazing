function out = sparsePrior(Js)

    out = sum(sum(abs(Js)));
% out = length(Js(Js~=0));

end