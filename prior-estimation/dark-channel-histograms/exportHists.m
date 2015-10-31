close all;

k_green = 2.3952;
k_blue = 2.7056;
k_red = 4.1693;
theta_green = 23.8942;
theta_blue = 20.20;
theta_red = 25.1374;

load('rAcc.mat');
load('gAcc.mat');
load('bAcc.mat');

scrsz = get(groot,'ScreenSize');
figure('Position', scrsz);
h = histogram(rAcc, 20, 'Normalization', 'pdf'); hold on;
h.FaceColor = [0.5 0.5 0.5];
plot((0:255), gampdf((0:255), k_red, theta_red), 'r', 'LineWidth', 15);
set(gca, 'FontSize', 100);
axis tight;
xlabel('Red Intensity');
ylabel('Probability');
% print('red', '-dpng');
export_fig red.png;

% close all;

figure('Position', scrsz);
h = histogram(gAcc, 20, 'Normalization', 'pdf'); hold on;
h.FaceColor = [0.5 0.5 0.5];
plot((0:255), gampdf((0:255), k_green, theta_green), 'Color', [0 0.7 0], 'LineWidth', 15);
set(gca, 'FontSize', 100);
axis tight;
xlabel('Green Intensity');
ylabel('Probability');
% print('green', '-dpng');
export_fig green.png;

% close all;

figure('Position', scrsz);
h = histogram(bAcc, 20, 'Normalization', 'pdf'); hold on;
h.FaceColor = [0.5 0.5 0.5];
plot((0:255), gampdf((0:255), k_blue, theta_blue), 'b', 'LineWidth', 15);
set(gca, 'FontSize', 100);
axis tight;
xlabel('Blue Intensity');
ylabel('Probability');
% print('blue', '-dpng');
export_fig blue.png;

% close all;