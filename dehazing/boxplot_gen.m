n_vars = linspace(0.012, 0.12, 5);
n_inst = 50;

% n_vars = 0.01;
% n_inst = 1;

datas = zeros(n_inst, size(n_vars, 2));

for i=1:size(n_vars, 2)
    i
    data = getData(n_inst, n_vars(i));
    save(strcat('varyNoiseVariance/', int2str(i), '.mat'), 'data');
    datas(:,i) = data;
end

boxplot(datas, n_vars);
save('boxplot.mat','datas');
% myBxPlt = print('-RGBImage');
% imwrite(myBxPlt, 'boxPlot.png')