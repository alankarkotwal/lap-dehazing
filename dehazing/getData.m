function data = getData(nSamples, n_var)

    %nSamples = 50;
    data = zeros(1, 1);

    for i=1:nSamples
        i
        data(i) = final(n_var);
    end

end

% n_var = linspace(0.012,0.12,5);
% data = zeros(5,1);
% gam = data;
% for i=1:5
%     i
% [data(i),gam(i)] = final(n_var(i));
% end