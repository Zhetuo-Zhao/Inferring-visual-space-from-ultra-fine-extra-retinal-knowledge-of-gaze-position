clear; close all;
addpath('.\tools\');
load('..\data\Exp3_perf.mat'); N=3;  
%% Fig.4E
figure('position',[100 100 450 400]); hold on; cols=get(gca,'colorOrder');

tmp=reshape([perf.Predict_CorrectProp_100ms_mu],[3 N])';
shadedErrorBar([2 3], mean(tmp(:,2:end)),std(tmp(:,2:end))/sqrt(N),{'col',[0 1 1],'lineWidth',1.5},1);

tmp=reshape([perf.Predict_extrapolate_CorrectProp_500ms_mu],[6 N])';
shadedErrorBar([2:6 7.5],mean(tmp), std(tmp)/sqrt(N),{'col',[1 0.67 0.53],'lineWidth',1.5},1);

tmp=reshape([perf.Predict_accumulate_CorrectProp_500ms_mu],[6 N])';
shadedErrorBar([2:6 7.5],mean(tmp), std(tmp)/sqrt(3),{'col',[1 0.74 0.09],'lineWidth',1.5},1);

tmp=reshape([perf.Empirical_CorrectProp_100ms_mu],[3 N])';
h1=errorbar([2:3],mean(tmp(:,2:end)),std(tmp(:,2:end))/sqrt(N),'color',cols(1,:),'lineWidth',2,'lineStyle','none','Marker','o','MarkerFaceColor',cols(1,:));

tmp=reshape([perf.Empirical_CorrectProp_500ms_mu],[7 N])';
h2=errorbar([2:6 7.5],mean(tmp(:,2:end)),std(tmp(:,2:end))/sqrt(N),'color',cols(2,:),'lineWidth',2,'lineStyle','none','Marker','o','MarkerFaceColor',cols(2,:));

line([1 8],[0.5 0.5],'lineWidth',2,'lineStyle','--','color',[0.5 0.5 0.5])
set(gca,'Xtick',[2:6 7.5], 'xTickLabel', {'1.9','3.8','5.7','7.6','9.5','>9.5'})
xlabel('Vernier offset (arcmin)'); ylabel('correct proportion');
xlim([1 8]); ylim([0.4 1]);
legend([h1 h2],{'100 ms','500 ms'},'Box','off','Location','southeast')
set(gca,'FontSize',16)


%% Fig.4F
figure('position',[100 100 450 400]); hold on; cols=get(gca,'colorOrder');
for subj=1:3
     gap=1;
     errorbar(perf(subj).Empirical_CorrectProp_100ms_mu(gap+1),perf(subj).Empirical_CorrectProp_500ms_mu(gap+1),...
              perf(subj).Empirical_CorrectProp_100ms_sd(gap+1)...
             ,'horizontal','color',cols(subj,:),'LineStyle','none','LineWidth',2);
     errorbar(perf(subj).Empirical_CorrectProp_100ms_mu(gap+1),perf(subj).Empirical_CorrectProp_500ms_mu(gap+1),...
              perf(subj).Empirical_CorrectProp_500ms_sd(gap+1)...
             ,'color',cols(subj,:),'LineStyle','none','LineWidth',2,'Marker','o','MarkerFaceColor',cols(subj,:));
    
     gap=2;
     errorbar(perf(subj).Empirical_CorrectProp_100ms_mu(gap+1),perf(subj).Empirical_CorrectProp_500ms_mu(gap+1),...
              perf(subj).Empirical_CorrectProp_100ms_sd(gap+1)...
             ,'horizontal','color',cols(subj,:),'LineStyle','none','LineWidth',2);
     errorbar(perf(subj).Empirical_CorrectProp_100ms_mu(gap+1),perf(subj).Empirical_CorrectProp_500ms_mu(gap+1),...
              perf(subj).Empirical_CorrectProp_500ms_sd(gap+1)...
             ,'color',cols(subj,:),'LineStyle','none','LineWidth',2,'Marker','square','MarkerFaceColor',[1 1 1]);
         
end
line([0.5 1],[0.5 1],'LineStyle','--','color',[1 1 1]*0.5);
xlabel('100 ms'); ylabel('500 ms');
xlim([0.5 1]); ylim([0.3 1]);
set(gca,'FontSize',16)


%% Fig.S5

colM=[1 0.67 0.53; 1 0.74 0.09];
    
figure('position',[10 100 1200 350]); cols=get(gca,'colorOrder');
for i=1:3
    subplot(1,3,4-i); hold on; 
    shadedErrorBar([2 3], perf(i).Predict_CorrectProp_100ms_mu(2:end),perf(i).Predict_CorrectProp_100ms_sd(2:end),{'col',[0 1 1],'lineWidth',1.5},1);

    shadedErrorBar([2:6 7.5],perf(i).Predict_extrapolate_CorrectProp_500ms_mu, perf(i).Predict_extrapolate_CorrectProp_500ms_sd,{'col',[1 0.67 0.53],'lineWidth',1.5},1);
    
    shadedErrorBar([2:6 7.5],perf(i).Predict_accumulate_CorrectProp_500ms_mu, perf(i).Predict_accumulate_CorrectProp_500ms_sd,{'col',[1 0.74 0.09],'lineWidth',1.5},1);
    
    
    h1=errorbar([2:3],perf(i).Empirical_CorrectProp_100ms_mu(2:end),perf(i).Empirical_CorrectProp_100ms_sd(2:end),'color',cols(1,:),'lineWidth',2,'lineStyle','none','Marker','o','MarkerFaceColor',cols(1,:));
    h2=errorbar([2:6 7.5],perf(i).Empirical_CorrectProp_500ms_mu(2:end),perf(i).Empirical_CorrectProp_500ms_sd(2:end),'color',cols(2,:),'lineWidth',2,'lineStyle','none','Marker','o','MarkerFaceColor',cols(2,:));
    
    line([1 8],[0.5 0.5],'lineWidth',2,'lineStyle','--','color',[0.5 0.5 0.5])
    set(gca,'Xtick',[2:6 7.5], 'xTickLabel', {'1.9','3.8','5.7','7.6','9.5','>9.5'})
    xlabel('Vernier offset (arcmin)'); ylabel('correct proportion');
    xlim([1 8]); ylim([0.4 1]);
    legend([h1 h2],{'100 ms','500 ms'},'Box','off','Location','southeast')
    set(gca,'FontSize',16)
    
end

