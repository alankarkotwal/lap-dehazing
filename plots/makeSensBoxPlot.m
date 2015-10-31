zs = [0.01 0.1];

our = load('our.mat');
cvpr = load('cvpr.mat');

our = our.b;
cvpr = cvpr.b;

scrsz = get(groot,'ScreenSize');
figure('Position',scrsz);
set (gca,'FontSize', 40);
hold on;

bp1 = boxplot(cvpr, zs, 'positions', zs+0.005, 'symbol', '', 'widths', 0.005);
bp2 = boxplot(our, zs, 'positions', zs-0.005, 'symbol', '', 'widths', 0.005);

color = ['m', 'm', 'y', 'y'];
h = findobj(gca,'Tag','Box');
for j=1:length(h)
   patch(get(h(j),'XData'),get(h(j),'YData'),color(j),'FaceAlpha',.5);
end
c = get(gca, 'Children');
hleg1 = legend([c(1) c(3)], 'Dark Channel Prior', 'Our Method', 'Location', 'NorthWest');

xlabel ('Parameter Variance');
ylabel ('RMSD');
axis tight;

ax = gca;
ax.GridAlpha = 0.3;
grid on;

hold off;

print('sensitivity', '-depsc')