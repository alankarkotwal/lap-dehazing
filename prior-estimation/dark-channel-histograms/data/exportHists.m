close all;

k_green = 2.3952;
k_blue = 2.7056;
k_red = 4.1693;
theta_green = 23.8942;
theta_blue = 20.20;
theta_red = 25.1374;

load('histb.mat');
load('histr.mat');
load('histg.mat');

figure;
plot(0:255, histr); hold on;
plot(0:255, gampdf(0:255, k_red, theta_red));
set(gca, 'FontSize', 32);
axis tight;
xlabel('Red Intensity');
ylabel('Probability');
print('red', '-depsc');

close all;

% figure;
% plot(0:255, histg); hold on;
% plot(0:255, gampdf(0:255, k_green, theta_green));
% set(gca, 'FontSize', 40);
% axis tight;
% xlabel('Green Intensity');
% ylabel('Probability');
% print('green', '-depsc');
% 
% close all;
% 
% figure;
% plot(0:255, histb); hold on;
% plot(0:255, gampdf(0:255, k_blue, theta_blue));
% set(gca, 'FontSize', 40);
% axis tight;
% xlabel('Blue Intensity');
% ylabel('Probability');
% print('blue', '-depsc');