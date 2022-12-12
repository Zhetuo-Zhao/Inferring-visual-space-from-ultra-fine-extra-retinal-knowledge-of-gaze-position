clear; close all;
load('..\data\Exp2_perf.mat');

figure('position',[100 100 400 350]); set(gca,'FontSize',16); hold on; cols=get(gca,'colorOrder');

tmp=reshape([perf.Empirical_Dprime_mu],[3,7])';
errorbar([1 2]+0.06,mean(tmp(:,2:3)), std(tmp(:,2:3))/sqrt(size(tmp,1)),'lineWidth',2,'color','k');

tmp=reshape([perf.Predict_2cues_Dprime_mu],[3,7])';
errorbar([1 2]-0.02,mean(tmp(:,2:3)), std(tmp(:,2:3))/sqrt(size(tmp,1)),'lineWidth',2,'color',[0.47 0.67 0.19]);

tmp=reshape([perf.Predict_Xe_Dprime_mu],[3,7])';
errorbar([1 2]+0.02,mean(tmp(:,2:3)), std(tmp(:,2:3))/sqrt(size(tmp,1)),'lineWidth',2,'color',[0.3 0.75 0.93]);

tmp=reshape([perf.Predict_Xr_Dprime_mu],[3,7])';
errorbar([1 2]-0.06,mean(tmp(:,2:3)), std(tmp(:,2:3))/sqrt(size(tmp,1)),'lineWidth',2,'color',[1 0.68 0.5]);
ylabel('d^{\prime}'); 
xlim([0.8 2.2]);  ylim([-0.2 3]);
xlabel('Vernier offset (arcmin)');
set(gca,'xTick',[1 2],'xTickLabel',{'1.9','3.8'})
leg=legend({'data','$X_{E+R}$','$X_{E}$','$X_{R}$'},'location','northWest');
set(leg,'Interpreter','latex');
legend boxoff;