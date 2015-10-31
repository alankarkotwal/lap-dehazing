
%% The plot

data = load('subspace_data.mat');
d = data.data;
m = mean(d);
dd= d;
% plot the points
% scrsz = get(groot,'ScreenSize');
% figure('Position',scrsz);
figure;
set(gca,'FontSize',90);
scatter3(1,1,1,2000,[0.95,0.95,0.95],'filled','MarkerEdgeColor','k');
hold on;
scatter3(0,0,0,2000,[0,0,0],'filled','MarkerEdgeColor','k');
scatter3(1,0,0,2000,[1,0,0],'filled','MarkerEdgeColor','k');
scatter3(0,1,0,2000,[0,1,0],'filled','MarkerEdgeColor','k');
scatter3(0,1,0,2000,[0,1,0],'filled','MarkerEdgeColor','k');
scatter3(0,1,1,2000,[0,1,1],'filled','MarkerEdgeColor','k');
scatter3(0,0,1,2000,[0,0,1],'filled','MarkerEdgeColor','k');
scatter3(1,0,1,2000,[1,0,1],'filled','MarkerEdgeColor','k');
scatter3(1,1,0,2000,[1,1,0],'filled','MarkerEdgeColor','k');
for i = 1:20
    scatter3(d(i,1),d(i,2),d(i,3),700,[d(i,1),d(i,2),d(i,3)],'filled','MarkerEdgeColor','k');
end    
% now plot the best fit line
t = linspace(-0.7,0.7,1000);
for k=1:20
    d(k,:) = d(k,:) - m;
end
[~,~,V] = svd(d);
for i =1:1000
    p(i,:) = m' + V(:,1).*t(i);
end   

scatter3(p(:,1),p(:,2),p(:,3),2,'filled');
text(-0.1,0.1,0.1,'Black');
text(-0.1+1,0.1+1,0.1+1,'W');
text(-0.1+1,0.1,0.1,'R');
text(-0.1,0.1+1,0.1,'G');
text(-0.1,0.1,0.1+1,'B');
text(-0.1+1,0.1+1,0.1,'Y');
text(-0.1+1,0.1,0.1+1,'M');
text(-0.1,0.1+1,0.1+1,'C');

