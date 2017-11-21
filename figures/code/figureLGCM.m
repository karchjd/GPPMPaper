close all;
%generate LGCM
lgcm = gp_modelLGCM(58,-1,258,0.4,0,10);
%add data of one person
lgcm.X = [0 10];
lgcm.Y = [40 25];

%fake run ML optimization
lgcmFit = gpPanel(lgcm,0);

%validate calucation in paper
preds = gp_personPredict(lgcmFit,1,15);


%prediction age 70 to 100 for the group
subplot(1,2,1)
predsGroup = gp_personPredict(lgcmFit,1,(0:0.1:30)',(0:0.1:30)');
gp_plotPersonPredict(predsGroup,true)
figureLGCMaes;


%predictions 70 to 100 fro the person 
subplot(1,2,2)
predsIndi = gp_personPredict(lgcmFit,1,(0:0.1:30)');
gp_plotPersonPredict(predsIndi,true);
figureLGCMaes;
set(gcf, 'Color', 'w');
export_fig ../render/02_LGCMpreds.pdf -painters