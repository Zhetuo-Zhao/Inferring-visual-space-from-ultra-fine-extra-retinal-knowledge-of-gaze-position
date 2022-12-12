load('..\data\Exp1_perf.mat');
N=6;
%% two-side correct proportion
cp=reshape([perf.CorrectProp_2sides],[5,N])';
figure('position',[100 100 500 400]); hold on; cols=get(gca,'colorOrder');

for i=1:N
    plot([-2 -1 1 2]+0.1, cp(i,[-2 -1 1 2]+3),'Marker','square','MarkerFaceColor',cols(i,:),'color',cols(i,:),'LineStyle','none')
end

MU=nanmean(cp); SEM=nanstd(cp)/sqrt(N);
MU(3)=nan; SEM(3)=nan;
errorbar([-2 -1 0 1 2],MU,SEM,'color','k','lineWidth',2)
xlim([-2.2 2.2]); 
set(gca,'FontSize',14,'xTick',[-2:2],'xTickLabel',{'2.8','1.4','0','1.4','2.8'});
xlabel('Vernier gap (arcmin)'); ylabel('correct proportion');



%% two-side d-prime
dp=reshape([perf.Dprime_2sides],[5,N])';
figure('position',[100 100 500 400]); hold on; cols=get(gca,'colorOrder');
for i=1:N
    plot([-2 -1 1 2]+0.1, dp(i,[-2 -1 1 2]+3),'Marker','square','MarkerFaceColor',cols(i,:),'color',cols(i,:),'LineStyle','none')
end
MU=nanmean(dp); SEM=nanstd(dp)/sqrt(N);
MU(3)=nan; SEM(3)=nan;
errorbar([-2 -1 0 1 2],MU,SEM,'color','k','lineWidth',2)
xlim([-2.2 2.2]); 
set(gca,'FontSize',14,'xTick',[-2:2],'xTickLabel',{'2.8','1.4','0','1.4','2.8'});
xlabel('Vernier gap (arcmin)'); ylabel('d^{\prime}');
