function data = getData(nSamples, n_var)

    %nSamples = 50;
    data = zeros(nSamples, 1);

    for i=1:nSamples
        data(i) = main(n_var);
    end

end