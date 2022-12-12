
load('..\data\Exp2_respBin.mat');

%% Fig.2D, Empirical responses pattern as a function of two cues
figure;
scatter([DataBin.Xe], [DataBin.Xr], [], [DataBin.Empirical_Resp],'filled')
xlabel('X_E (arcmin)'); ylabel('X_R (arcmin)');
set(gca,'FontSize',16); axis equal; ylim([-2 2]); xlim([-6 6])
caxis([0 1]); cb=colorbar; 
ylabel(cb, 'P("Right")');

%% Fig.2E, Empirical responses marginal pattern along motor cue
binEdge=-4.5:0.2:4.5;
binCenter=binEdge(1+2:end-2);
posCueV=[DataBin.Xe];
reErrV=[DataBin.Xr];
respV=[DataBin.Empirical_Resp];
clear bin_mu bin_sd bin_num;
for i=length(binCenter):-1:1
    idx1=posCueV>binEdge(i) &  posCueV<binEdge(i+4) & reErrV>0;
    [bin_mu{1}(i),bin_sd{1}(i)]=bootstrap(respV(idx1),1E4); 
    bin_num{1}(i)= sum(idx1);
    
    idx2=posCueV>binEdge(i) &  posCueV<binEdge(i+4) & reErrV<0;
    [bin_mu{2}(i),bin_sd{2}(i)]=bootstrap(respV(idx2),1E4); 
    bin_num{2}(i)= sum(idx2);
end
figure('position',[100 100 400 400]); hold on; cols=get(gca,'colorOrder');
shadedErrorBar(binCenter,bin_mu{1}-0.06,bin_sd{1},{'col',cols(1,:)},1); 
shadedErrorBar(binCenter,bin_mu{2}+0.06,bin_sd{2},{'col',cols(2,:)},1); 
line([-4 4],[0.5 0.5],'lineWidth',2,'color',[0.5 0.5 0.5],'lineStyle','--');%grid on;
h(1)=plot(binCenter,bin_mu{1}-0.06,'lineWidth',2,'color',cols(1,:));
h(2)=plot(binCenter,bin_mu{2}+0.06,'lineWidth',2,'color',cols(2,:));
legend(h,{'X_R>0','X_R<0'},'location','northWest');
ylim([0 1]); xlim([-4 4]);
xlabel('drift displacement X_E (arcmin)');  ylabel('probability of "Right" judgement');
set(gca,'FontSize',16); 



%% Fig.3B, Predicted responses from 2 cues
figure;
scatter([DataBin.Xe], [DataBin.Xr], [], [DataBin.Predict_2cues_Resp],'filled')
xlabel('X_E (arcmin)'); ylabel('X_R (arcmin)');
set(gca,'FontSize',16); axis equal; ylim([-2 2]); xlim([-6 6])
caxis([0 1]); cb=colorbar; 
ylabel(cb, 'P("Right")');

%% Fig.3C, Predicted responses from Xe
figure;
scatter([DataBin.Xe], [DataBin.Xr], [], [DataBin.Predict_Xe_Resp],'filled')
xlabel('X_E (arcmin)'); ylabel('X_R (arcmin)');
set(gca,'FontSize',16); axis equal; ylim([-2 2]); xlim([-6 6])
caxis([0 1]); cb=colorbar; 
ylabel(cb, 'P("Right")');

%% Fig.3D, Predicted responses from Xr
figure;
scatter([DataBin.Xe], [DataBin.Xr], [], [DataBin.Predict_Xr_Resp],'filled')
xlabel('X_E (arcmin)'); ylabel('X_R (arcmin)');
set(gca,'FontSize',16); axis equal; ylim([-2 2]); xlim([-6 6])
caxis([0 1]); cb=colorbar; 
ylabel(cb, 'P("Right")');



%%  Fig.3E
R2_Xr    = 1-var([DataBin.Predict_Xr_Resp]-[DataBin.Empirical_Resp])/var([DataBin.Empirical_Resp]);
R2_2cues = 1-var([DataBin.Predict_2cues_Resp]-[DataBin.Empirical_Resp])/var([DataBin.Empirical_Resp]);
R2_Xe    = 1-var([DataBin.Predict_Xe_Resp]-[DataBin.Empirical_Resp])/var([DataBin.Empirical_Resp]);

figure('position',[100 100 520 450]); hold on; 
scatter([DataBin.Empirical_Resp], [DataBin.Predict_Xr_Resp], 'd','LineWidth',1.5,'MarkerEdgeColor',[1 0.68 0.5],'MarkerFaceColor','none');
scatter([DataBin.Empirical_Resp], [DataBin.Predict_Xe_Resp], '+','LineWidth',1.5,'MarkerEdgeColor',[0.3 0.75 0.93]);
scatter([DataBin.Empirical_Resp], [DataBin.Predict_2cues_Resp], 'filled','LineWidth',0.1,'MarkerEdgeColor',[0.47 0.67 0.19],'MarkerFaceColor',[0.47 0.67 0.19]);
line([0 1], [0 1],'lineWidth',2,'lineStyle','--','color',[0.5 0.5 0.5]);
leg=legend({sprintf('$X_R$ ($R^2=$%.2f)',R2_Xr),...
            sprintf('$X_E$ ($R^2=$%.2f)',R2_Xe),...
            sprintf('$X_E+X_R$ ($R^2=$%.2f)',R2_2cues)},'location','northWest');
set(leg,'Interpreter','latex'); legend boxoff;
xlabel('P("Right") in data'); ylabel('P("Right") in model');
set(gca,'FontSize',16)

