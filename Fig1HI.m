clear; close all;
load('..\data\Exp1_perf.mat');
N=6;
%% proportion correct
figure('position',[100 100 300 400]); set(gca,'FontSize',16); hold on; 
cp=reshape([perf.CorrectProp],[3,N])';
plot([1 2],cp(:,2:3)','color',[0.5 0.5 0.5],'MarkerFaceColor',[0.5 0.5 0.5],'Marker','o'); 
errorbar([1 2]+0.1,mean(cp(:,2:3)),std(cp(:,2:3))/sqrt(7),'Color',[ 0 0 0],'lineWidth',3,'MarkerSize',9,'MarkerFaceColor',[1 1 1],'Marker','d');
xlim([0.7 2.4]); ylim([0.5 1]); xlabel('Vernier offset (arcmin)'); ylabel('correct proportion');
set(gca, 'xTick', [1 2], 'xTickLabel', {'1.4','2.8'})

%% d prime
figure('position',[100 100 300 400]); set(gca,'FontSize',16); hold on; 
dp=reshape([perf.Dprime],[3,N])';
plot([1 2],dp(:,2:3)','color',[0.5 0.5 0.5],'MarkerFaceColor',[0.5 0.5 0.5],'Marker','o'); 
errorbar([1 2]+0.1,mean(dp(:,2:3)),std(dp(:,2:3))/sqrt(7),'Color',[ 0 0 0],'lineWidth',3,'MarkerSize',9,'MarkerFaceColor',[1 1 1],'Marker','d');
xlim([0.7 2.4]); ylim([0 2.7]); xlabel('Vernier offset (arcmin)'); ylabel('d^{\prime}');
set(gca, 'xTick', [1 2], 'xTickLabel', {'1.4','2.8'})