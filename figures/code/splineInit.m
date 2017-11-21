% create data
rng(42448)
p = 10;
N = 40;


model = [];
model.X = repmat((1:p)/p,N,1); % for everybody p time points in [0,1]
intercepts = repmat(randn(N,1),1,p);
slopes = randn(N,1);
% slopes = repmat(3,N,1);
model.Y = intercepts+bsxfun(@times,model.X.^2,slopes); % for everybody one contant measurement between distribtuion is standard Gaussian + x^2+x^3
model.Y = model.Y + randn(N,p)*noise; % add Gaussian noise

% models stuff that is the same
model.lik = @likGauss;
model.hyp.lik = 0.333;
model.meanf = @meanZero;

% panel spline model
splineModel = model;
splineModel.covf = @covCubicSpline;
splineModel = gpPanel(splineModel);

predX = setdiff(((1:100)/100)',model.X(1,:));

%colorMatrix obtained by http://tools.medialab.sciences-po.fr/iwanthue/
%4 colors colorblind friendly

colorMatrix = [127,100,185;
                187,118,56;
                185,74,116;
                   112,173,93];
 colorMatrix = colorMatrix/255; %convert to matlab


