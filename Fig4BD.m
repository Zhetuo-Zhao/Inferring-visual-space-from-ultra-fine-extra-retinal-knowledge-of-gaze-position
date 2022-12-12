clear; close all;
addpath('.\tools\');

%% ISI = 100 ms 
load('..\data\Exp2_CorrMap.mat');
N=7;

maximum = max(max(corrMap.mu));
[x,y]=find(corrMap.mu==maximum);

figure; hold on; 
imagesc(corrMap.t/1000,corrMap.winSz/1000,corrMap.mu); 
contourf(corrMap.t/1000,corrMap.winSz/1000,corrMap.mu,'--','Fill','off')
colorbar;
xlabel('window center from 1st bar (s)'); ylabel('window size (s)');
line([corrMap.t(y) corrMap.t(y)]/1000,[10 corrMap.winSz(x)]/1000,'color','r','lineWidth',1.5, 'lineStyle','--');
line([corrMap.t(1) corrMap.t(y)]/1000,[corrMap.winSz(x) corrMap.winSz(x)]/1000,'color','r','lineWidth',1.5, 'lineStyle','--');
set(gca,'FontSize',14,'YDir','reverse');
cb=colorbar; ylabel(cb, 'correlation');


figure('position',[100 100 500 200]); hold on;
shadedErrorBar(corrMap.t/1000,corrMap.mu(x,:),corrMap.sd(x,:)/sqrt(N));
yl=ylim;
line([corrMap.t(y) corrMap.t(y)]/1000,yl,'color','r','lineWidth',1.5, 'lineStyle','--');
xlabel('window center from 1st bar (s)'); ylabel('correlation');
set(gca,'FontSize',14)


figure('position',[100 100 500 200]);  hold on;
shadedErrorBar(corrMap.winSz/1000,corrMap.mu(:,y),corrMap.sd(:,y)/sqrt(N));
yl=ylim;
line([corrMap.winSz(x) corrMap.winSz(x)]/1000,yl,'color','r','lineWidth',1.5, 'lineStyle','--');
xlabel('window size (s)'); ylabel('correlation');
set(gca,'FontSize',14)




%% ISI = 500 ms 
load('..\data\Exp3_CorrMap.mat');
N=3;

maximum = max(max(corrMap.mu));
[x,y]=find(corrMap.mu==maximum);

figure; hold on; 
imagesc(corrMap.t/1000,corrMap.winSz/1000,corrMap.mu); 
contourf(corrMap.t/1000,corrMap.winSz/1000,corrMap.mu,'--','Fill','off')
colorbar;
xlabel('window center from 1st bar (s)'); ylabel('window size (s)');
line([corrMap.t(y) corrMap.t(y)]/1000,[10 corrMap.winSz(x)]/1000,'color','r','lineWidth',1.5, 'lineStyle','--');
line([corrMap.t(1) corrMap.t(y)]/1000,[corrMap.winSz(x) corrMap.winSz(x)]/1000,'color','r','lineWidth',1.5, 'lineStyle','--');
set(gca,'FontSize',14,'YDir','reverse');
cb=colorbar; ylabel(cb, 'correlation');


figure('position',[100 100 500 200]); hold on;
shadedErrorBar(corrMap.t/1000,corrMap.mu(x,:),corrMap.sd(x,:)/sqrt(N));
yl=ylim; ylim([max([yl(1) 0 ]) yl(2)]); xlim([corrMap.t(1) corrMap.t(end)]/1000);
line([corrMap.t(y) corrMap.t(y)]/1000,yl,'color','r','lineWidth',1.5, 'lineStyle','--');
xlabel('window center from 1st bar (s)'); ylabel('correlation');
set(gca,'FontSize',14)


figure('position',[100 100 500 200]);  hold on;
shadedErrorBar(corrMap.winSz/1000,corrMap.mu(:,y),corrMap.sd(:,y)/sqrt(N));
yl=ylim; ylim([max([yl(1) 0 ]) yl(2)]); xlim([corrMap.winSz(1) corrMap.winSz(end)]/1000);
line([corrMap.winSz(x) corrMap.winSz(x)]/1000,yl,'color','r','lineWidth',1.5, 'lineStyle','--');
ylim();
xlabel('window size (s)'); ylabel('correlation');
set(gca,'FontSize',14)