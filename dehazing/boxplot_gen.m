% n_vars = linspace(0.01, 0.1, 5);
% n_inst = 50;

n_vars = 0.01;
n_inst = 1;

datas = zeros(size(n_vars, 2), n_inst);

for i=1:size(n_vars, 2)
    data = getData(n_inst, n_vars(i));
    save(strcat('varyNoiseVariance/', int2str(i), '.mat'), 'data');
    datas(i, :) = data;
end

boxplot(datas, n_vars);
myBxPlt = print('-RGBImage');
imwrite(myBxPlt, 'boxPlot.png')