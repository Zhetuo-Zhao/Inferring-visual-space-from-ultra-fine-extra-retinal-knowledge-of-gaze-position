
%% Fig.1F, Exp1
load('..\data\Exp1_driftChar.mat'); N=6;
figure('position',[100 100 400 300]); hold on; cols=get(gca,'ColorOrder');
shadedErrorBar(disp_time.t, mean(disp_time.disp_marker),std(disp_time.disp_marker)/sqrt(N),{'col',cols(1,:),'lineWidth',2},1);
shadedErrorBar(disp_time.t, mean(disp_time.disp_Vernier),std(disp_time.disp_Vernier)/sqrt(N),{'col',cols(2,:),'lineWidth',2},1);
xlim([20 100]); ylim([1 8]); 
xlabel('time (ms)'); ylabel('displacement^2 (arcmin^2)'); set(gca,'FontSize',14,'XScale','log','YScale','log');

figure('position',[100 100 400 300]); hold on; cols=get(gca,'ColorOrder');
shadedErrorBar(vel_hist.bin_center, mean(vel_hist.prob_marker),std(vel_hist.prob_marker)/sqrt(N),{'col',cols(1,:),'lineWidth',2},1);
shadedErrorBar(vel_hist.bin_center, mean(vel_hist.prob_Vernier),std(vel_hist.prob_Vernier)/sqrt(N),{'col',cols(2,:),'lineWidth',2},1);
xlim([0 150]); ylim([0 0.1]); 
xlabel('drift speed (arcmin/s)'); ylabel('probability'); set(gca,'FontSize',14);


%% Fig.1G, Exp1
figure("Position",[100 100 350 280]);
imagesc(disp_hist2D.x, disp_hist2D.y, disp_hist2D.prob);
xlabel('horizontal (arcmin)'); ylabel('vertical (arcmin)');
grid on;     set(gca,'FontSize',14); set(gca, 'ydir', 'reverse');
  
colorM=parula(256);    stepN=30;
color0=[(1:-(1-colorM(1,1))/stepN:colorM(1,1))' (1:-(1-colorM(1,2))/stepN:colorM(1,2))' (1:-(1-colorM(1,3))/stepN:colorM(1,3))'];
caxis([0 1]);     colormap( [color0; parula(256)] );   colorbar;


%% Fig.S2 A,B, Exp2 
load('..\data\Exp2_driftChar.mat'); N=7;
figure('position',[100 100 400 300]); hold on; cols=get(gca,'ColorOrder');
shadedErrorBar(disp_time.t, mean(disp_time.disp_marker),std(disp_time.disp_marker)/sqrt(N),{'col',cols(1,:),'lineWidth',2},1);
shadedErrorBar(disp_time.t, mean(disp_time.disp_Vernier),std(disp_time.disp_Vernier)/sqrt(N),{'col',cols(2,:),'lineWidth',2},1);
xlim([20 100]); ylim([1 10]); 
xlabel('time (ms)'); ylabel('displacement^2 (arcmin^2)'); set(gca,'FontSize',14,'XScale','log','YScale','log');

figure('position',[100 100 400 300]); hold on; cols=get(gca,'ColorOrder');
shadedErrorBar(vel_hist.bin_center, mean(vel_hist.prob_marker),std(vel_hist.prob_marker)/sqrt(N),{'col',cols(1,:),'lineWidth',2},1);
shadedErrorBar(vel_hist.bin_center, mean(vel_hist.prob_Vernier),std(vel_hist.prob_Vernier)/sqrt(N),{'col',cols(2,:),'lineWidth',2},1);
xlim([0 150]); ylim([0 0.1]); 
xlabel('drift speed (arcmin/s)'); ylabel('probability'); set(gca,'FontSize',14);



%% Fig.S2 C, Exp2 
figure("Position",[100 100 350 280]);
imagesc(disp_hist2D.x, disp_hist2D.y, disp_hist2D.prob);
xlabel('horizontal (arcmin)'); ylabel('vertical (arcmin)');
grid on;     set(gca,'FontSize',14); set(gca, 'ydir', 'reverse');
  
colorM=parula(256);    stepN=30;
color0=[(1:-(1-colorM(1,1))/stepN:colorM(1,1))' (1:-(1-colorM(1,2))/stepN:colorM(1,2))' (1:-(1-colorM(1,3))/stepN:colorM(1,3))'];
caxis([0 1]);     colormap( [color0; parula(256)] );   colorbar;