zs = linspace(0.012, 0.12, 5);

sim = 0;

if(~sim)
    data_ours = load('boxplot_pGTdata.mat');
    data_cvpr = load('boxplot_CVPR_pGT.mat');
    data_cvprd = load('boxplot_denoise_pGT_updated.mat');
    data_wein = load('weinerNoiseComp_pGT');
    data_ours = data_ours.data;
    data_cvpr = data_cvpr.data;
    data_cvprd = data_cvprd.data;
    data_wein = data_wein.data;
    data_ours_m = repmat(mean(data_ours), size(data_ours, 1), 1) + 1*(data_ours - repmat(mean(data_ours), size(data_ours, 1), 1));
    data_cvpr_m = repmat(mean(data_cvpr), size(data_cvpr, 1), 1) + 1*(data_cvpr - repmat(mean(data_cvpr), size(data_cvpr, 1), 1));
    data_cvprd_m = repmat(mean(data_cvprd), size(data_cvprd, 1), 1) + 1*(data_cvprd - repmat(mean(data_cvprd), size(data_cvprd, 1), 1));
    data_wein_m = repmat(mean(data_wein), size(data_wein, 1), 1) + 1*(data_wein - repmat(mean(data_wein), size(data_wein, 1), 1));
else
    data_ours = load('boxplot.mat');
    data_cvpr = load('boxplot_CVPR.mat');
    data_cvprd = load('boxplot_CVPR+denoise(bl).mat');
    data_wein = load('weinerNoiseComp.mat');
    data_ours = data_ours.datas;
    data_cvpr = data_cvpr.datas;
    data_cvprd = data_cvprd.datas;
    data_wein = data_wein.data;
    data_ours_m = repmat(mean(data_ours), size(data_ours, 1), 1) + 10*(data_ours - repmat(mean(data_ours), size(data_ours, 1), 1));
    data_cvpr_m = repmat(mean(data_cvpr), size(data_cvpr, 1), 1) + 10*(data_cvpr - repmat(mean(data_cvpr), size(data_cvpr, 1), 1));
    data_cvprd_m = repmat(mean(data_cvprd), size(data_cvprd, 1), 1) + 10*(data_cvprd - repmat(mean(data_cvprd), size(data_cvprd, 1), 1));
    data_wein_m = repmat(mean(data_wein), size(data_wein, 1), 1) + 10*(data_wein - repmat(mean(data_wein), size(data_wein, 1), 1));
end

scrsz = get(groot,'ScreenSize'); scrsz (3) = scrsz (3) * 0.7;
figure('Position',scrsz);
set (gca,'FontSize', 50);
hold on;

bp2 = boxplot(data_cvprd_m, 255*zs, 'positions', zs+0.0075, 'symbol', '', 'widths', 0.01);
bp3 = boxplot(data_cvpr_m, 255*zs, 'positions', zs-0.0075, 'symbol', '', 'widths', 0.01);
bp4 = boxplot(data_wein_m, 255*zs, 'positions', zs, 'symbol', '', 'widths', 0.01);
bp1 = boxplot(data_ours_m, 255*zs, 'positions', zs, 'symbol', '', 'widths', 0.01);

set (bp1(:,1:end), 'linewidth', 1, 'color', 'r');
set (bp2(:,1:end), 'linewidth', 1, 'color', 'g');
set (bp3(:,1:end), 'linewidth', 1, 'color', 'b');

color = ['b', 'b', 'b', 'b', 'b', 'm', 'm', 'm', 'm', 'm', 'y', 'y', 'y', 'y', 'y', 'g', 'g', 'g', 'g', 'g'];
h = findobj(gca,'Tag','Box');
for j=1:length(h)
   patch(get(h(j),'XData'),get(h(j),'YData'),color(j),'FaceAlpha',.5);
end
c = get(gca, 'Children');
hleg1 = legend([c(6) c(1) c(11) c(16)], 'K. He, CVPR2009', 'Above + denoising', 'Gibson, ICIP2013', 'Our Method', 'Location', 'NorthWest');

h = findobj(gca, 'Tag', 'Upper Whisker');
for j=1:length(h)
   patch(get(h(j),'XData'),get(h(j),'YData'),color(j),'FaceAlpha',.5);
end

h = findobj(gca, 'Tag', 'Lower Whisker');
for j=1:length(h)
   patch(get(h(j),'XData'),get(h(j),'YData'),color(j),'FaceAlpha',.5);
end

h = findobj(gca, 'Tag', 'Upper Adjacent Value');
for j=1:length(h)
   patch(get(h(j),'XData'),get(h(j),'YData'),color(j),'FaceAlpha',.5);
end

h = findobj(gca, 'Tag', 'Lower Adjacent Value');
for j=1:length(h)
   patch(get(h(j),'XData'),get(h(j),'YData'),color(j),'FaceAlpha',.5);
end

h = findobj(gca, 'Tag', 'Median');
for j=1:length(h)
   patch(get(h(j),'XData'),get(h(j),'YData'),color(j),'FaceAlpha',.5);
end

h=findobj(gca,'tag','Outliers');
delete(h);

xlabel ('Corrupted Image Noise Level');
ylabel ('Error in Estimate');
axis tight;

ax = gca;
ax.GridAlpha = 0.3;
grid on;

hold off;

if(~sim)
    export_fig noise_comparison_pGT.png
else
    export_fig noise_comparison.png
end