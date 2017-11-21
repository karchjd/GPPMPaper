%% replication of Wood 2006 stuff
size = [1.42,1.58,1.78,1.99,1.99,1.99,2.13,2.13,2.13,...
        2.32,2.32,2.32,2.32,2.32,2.43,2.43,2.78,2.98,2.98]';
wear = [4.0,4.2,2.5,2.6,2.8,2.4,3.2,2.4,2.6,4.8,2.9,...
    3.8,3.0,2.7,3.1,3.3,3.0,2.8,1.7]';

x = size-min(size);
x=x/max(x);
y=wear;
out = [];
hyp.mean = [];
hyp.cov = [];
hyp.lik = gp_backward(0.0001);
out.Xpred = ((0:100)/100)';
% [out.muPred,out.varPred, out.muLa, out.varLa]=gp(hyp, @infExact, @meanZero, @covCubicSpline, @likGauss, x, y, out.Xpred);
% out.Xtrain = x;
% out.Ytrain = y;
% out.varPred = 0; %cheat
% gp_plotPersonPredict(out);
% set(gca,'FontSize',20);
% xlabel('Time');
% ylabel('Value');

hyp =[];
hyp.lik = gp_backward(0.0001);
hyp.mean = 3;
% hyp.mean= 0;
%% with optimization of the noise parameter i.e. lambda
hypMin = minimize(hyp, @gp, -100, @infExact, @meanConst, @covCubicSpline, @likGauss, x, y);
[out.muPred,out.varPred, out.muLa, out.varLa]=gp(hypMin, @infExact, @meanConst, @covCubicSpline, @likGauss, x, y, out.Xpred);
out.Xtrain = x;
out.Ytrain = y;
out.varPred = 0; %cheat
gp_plotPersonPredict(out);
set(gca,'FontSize',20);
xlabel('Time');
ylabel('Value');
export_fig matlab.pdf -painters
