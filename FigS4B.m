load('../data/Exp2_ModelParam.mat');

%% Sigma_E v.s. Sigma_R
figure('position',[100 100 350 320]); hold on;
set(gca,'FontSize',16)
for subj=1:7
    scatter(ModelParam(subj).Sigma_E,ModelParam(subj).Sigma_R,75,'lineWidth',3);
end
line([0 3],[0 3],'lineWidth',2,'lineStyle','--','color',0.5*ones(1,3));
grid on;
xlabel('\sigma_E (arcmin)'); ylabel('\sigma_R (arcmin)');

%% Sigma_E v.s. D
figure('position',[100 100 350 320]); hold on; set(gca,'FontSize',16);
for subj=1:7
     scatter(ModelParam(subj).Sigma_E,ModelParam(subj).D,75,'lineWidth',3);
end
xFit = linspace(1, 3.5, 1000); yFit = mean([ModelParam.D]./[ModelParam.Sigma_E])*xFit;
plot(xFit, yFit,'lineWidth',2,'lineStyle','--','color',[0.5 0.5 0.5])
grid on; xlim([1 3.5]); ylim([10 35]);
set(gca,'FontSize',16,'xTick',[1 2 3]);
ylabel('D (arcmin^2/s)'); xlabel('$\sigma_E$ (arcmin)','Interpreter','latex');