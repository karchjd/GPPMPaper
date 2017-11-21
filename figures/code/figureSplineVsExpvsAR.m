% fit all three models
noise = 0.5;
splineInit;

% squared Exp
sqExpModel = model;
sqExpModel.covf = @covSEiso;
sqExpModel.hyp.cov = [3 2];
sqExpModel = gpPanel(sqExpModel);
 
% AR(1) model
ar1Model = model;
ar1Model.covf = {@covMaterniso 1};
ar1Model.hyp.cov = [3 2];
ar1Model = gpPanel(ar1Model);
examplePers = [3,4,6];
for i=1:numel(examplePers)
    subplot(1,numel(examplePers),i)
    
    trueF = intercepts(examplePers(i)) + predX.^2*slopes(examplePers(i));
    trueH = plot(predX,trueF,'LineWidth', 3);
    
    
    %spline
    splinePred = gp_personPredict(splineModel,examplePers(i),predX);
    splinePred.varPred = 0; %cheat
    spline = gp_plotPersonPredict(splinePred);
    
    %squared expo
    squaredPred = gp_personPredict(sqExpModel,examplePers(i),predX);
    squaredPred.varPred = 0; %cheat
    squared = gp_plotPersonPredict(squaredPred);
    
    %ar(1)
    ar1Pred = gp_personPredict(ar1Model,examplePers(i),predX);
    ar1Pred.varPred = 0; %cheat
    ar1 = gp_plotPersonPredict(ar1Pred);
    
    
    %true
    set(trueH,'Color',colorMatrix(1,:));
    set(spline,'Color',colorMatrix(2,:));
    set(squared,'Color',colorMatrix(3,:));
    set(ar1,'Color',colorMatrix(4,:));
    splineAes;
end
h = legend([trueH,spline,squared,ar1],{'true','spline','squared exponential','AR(1)'});
set(h,'Position', [0.515 0.925 0 0],'Units', 'normalized');
set(gcf, 'Color', 'w');
export_fig ../render/04_arVSSplineVsExp.pdf -painters