
% Use this file to analyse the estimated LTI system results

% use estimator on various countries, some countries it doesn't look that
% good, others it's awesome. 

% it looks better without saving some data for validation, of course. When
% I train on the last 80% of time and then validate on the first 20% it
% works reasonably well, but that also isn't validating the vaccine part. 

% compare impulse/step responses, see if there are signficant differences
% between countries and try and hypothesize why. 
%%

%{
Countries that look good:
United States
India
Colombia
Mexico
Russia
%}

country = 'Russia';
% pick a country

y_data = import_data(country,1);
x_data = import_data(country,0);
% import input (x_data) and output (y_data) 

y_data(isnan(y_data))=0;
x_data(isnan(x_data))=0;
% make all the NaN datatypes equal to 0

z1 = iddata(y_data,x_data); 
% make the correct data type for model prediction

%%
sys_estimate = estimator(z1);
% save the estimated system

compare(z1,sys_estimate);
% compare the actual system output with out simulated system output 
% overlays plots and shows a measure of "goodness" of fit

%% compare step response
h = stepplot(sys_estimate);
% plot step response, can't figure out how to plot the response to
% different inputs on different axiis. 


