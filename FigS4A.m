clear; close all;
load('..\data\Exp2_perf.mat');

cols=zeros(5,3);
cols(1,:)=[0.47 0.67 0.19];
cols(2,:)=[0.3 0.75 0.93];
cols(3,:)=[1 0.68 0.5];
cols(4,:)=[0.93 0.6 1];
cols(5,:)=[0.93 0.69 0.13];
figure('position',[0 0 1600 400]); 
LW=1.5;
for i=7:-1:1
    % plot d-prime
    subplot(2,7,i); hold on;
    errorbar([1 2], perf(i).Predict_2cues_Dprime_mu(2:3), perf(i).Predict_2cues_Dprime_sd(2:3),'lineWidth',LW,'Marker','o','color',cols(1,:),'MarkerFaceColor',cols(1,:));
    errorbar([1 2], perf(i).Predict_Xe_Dprime_mu(2:3), perf(i).Predict_Xe_Dprime_sd(2:3),'lineWidth',LW,'Marker','o','color',cols(2,:),'MarkerFaceColor',cols(2,:));
    errorbar([1 2], perf(i).Predict_Xr_Dprime_mu(2:3), perf(i).Predict_Xr_Dprime_sd(2:3),'lineWidth',LW,'Marker','o','color',cols(3,:),'MarkerFaceColor',cols(3,:));
    errorbar([1 2]+0.1, perf(i).Empirical_Dprime_mu(2:3), perf(i).Empirical_Dprime_sd(2:3),'color','k','lineStyle','none','lineWidth',2,'Marker','diamond','MarkerFaceColor','k');
    xlim([0.8 2.2]);
    set(gca,'xTick',[1 2],'xTickLabel',{'1.9','3.8'},'FontSize',12)
    xlabel('Vernier offset'); ylabel('d^{\prime}'); title(sprintf('s%d',i));

    % plot log likelihood
    subplot(2,7,7+i); hold on;
    errorbar([0 1 2], perf(i).Predict_2cues_LogLikelihood_mu, perf(i).Predict_2cues_LogLikelihood_sd,'lineWidth',LW,'Marker','o','color',cols(1,:),'MarkerFaceColor',cols(1,:));
    errorbar([0 1 2], perf(i).Predict_Xe_LogLikelihood_mu, perf(i).Predict_Xe_LogLikelihood_sd,'lineWidth',LW,'Marker','o','color',cols(2,:),'MarkerFaceColor',cols(2,:));
    errorbar([0 1 2], perf(i).Predict_Xr_LogLikelihood_mu, perf(i).Predict_Xr_LogLikelihood_sd,'lineWidth',LW,'Marker','o','color',cols(3,:),'MarkerFaceColor',cols(3,:));
    xlim([-0.2 2.2]);
    set(gca,'xTick',[0 1 2],'xTickLabel',{'0','1.9','3.8'},'FontSize',12)
    xlabel('Vernier offset'); ylabel('log likelihood');
    
end