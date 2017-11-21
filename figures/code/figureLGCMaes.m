%basics
xlabel('Age');
ylabel('Latent Perceputal Speed');
ylim([-40 100]);
title('Unconditional Prediction');

%fonts
set(gca,'FontName'   , 'Helvetica' );
set(gca, 'FontSize'   , 12);


%tick labels
set(gca, ...
  'Box'         , 'off'     , ...
  'TickDir'     , 'out'     , ...
  'TickLength'  , [.02 .02] , ...
  'XMinorTick'  , 'on'      , ...
  'YMinorTick'  , 'on'      , ...
  'XColor'      , [.3 .3 .3], ...
  'YColor'      , [.3 .3 .3]);
set(gca, 'XTickLabel', cellfun(@str2double,get(gca, 'XTickLabel'))+70);










