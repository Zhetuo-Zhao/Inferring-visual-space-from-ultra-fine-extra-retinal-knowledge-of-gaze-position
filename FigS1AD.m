load('..\data\Exp1_driftChar.mat');
figure; hold on; cols=get(gca, 'colorOrder'); 
plot(disp_hist.bin_center,disp_hist.prob,'lineWidth',3);
xlim([-6 6]);
xlabel('drift displacement (arcmin)'); ylabel('probability');
set(gca,'FontSize',16);


load('..\data\Exp2_driftChar.mat');
figure; hold on; cols=get(gca, 'colorOrder'); 
plot(disp_hist.bin_center,disp_hist.prob,'lineWidth',3);
xlim([-6 6]);
xlabel('drift displacement (arcmin)'); ylabel('probability');
set(gca,'FontSize',16);