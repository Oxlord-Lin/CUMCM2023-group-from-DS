d = load('预处理后的地形测量数据.mat');
d = d.dCopy;
%%
figure
x = d(1,2:end);
y = d(2:end,1);
z = -d(2:end,2:end);
[C,h] = contourf(x,y,z,'ShowText','on','LineWidth',0.1);
colormap('jet')
h.LevelStep = 5;
colorbar
axis equal
% %% 
% figure(2)
% x = d(1,2:end);
% y = d(2:end,1);
% z = -d(2:end,2:end);
% h = meshc(x,y,z);
% % h.LevelStep = 10;
% % h.ShowText = 'on';
% xlabel('x')
% ylabel('y')
% % axis equal
% colorbar