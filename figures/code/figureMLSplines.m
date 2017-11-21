noise = 0.05;
splineInit;
examplePers = [3,4,6];
for i=1:numel(examplePers)
    subplot(1,numel(examplePers),i)
   
    trueF = intercepts(examplePers(i)) + predX.^2*slopes(examplePers(i));
    h = plot(predX,trueF,'LineWidth', 3);
    
    %spline
    splinePred = gp_personPredict(splineModel,examplePers(i),predX);
    splinePred.varPred = 0; %cheat
    spline = gp_plotPersonPredict(splinePred);
    
    %true
    set(h,'Color',colorMatrix(1,:));
    set(spline,'Color',colorMatrix(2,:));
    splineAes;
end
h=legend({'true','spline'});
set(h,'Position', [0.5 0.04 0 0],'Units', 'normalized');
set(gcf, 'Color', 'w');
export_fig ../render/03_MLSplines.pdf -painters
    
