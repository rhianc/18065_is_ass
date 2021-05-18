
% Use this file to analyse the estimated LTI system results

% import data from various countries, maybe have a matlab data file with
% nested {country: {vaccination_data, infection_data}} for easy access

% use estimator on various countries

% compare impulse/step responses, see if there are signficant differences
% between countries and try and hypothesize why. 

x = [];
y = [];
country = 'United States';


data = import_data(country);

%sys_estimate = estimator(x,y);
%step_response = step(sys_estimate);

% I actually think it won't work that great unless we use an initial
% condition (like daily confirmed cases, and let the system see those
% internal dynamics, then adjust for the new inputs once vaccinations start
% happening)

% I think the share of positive tests dataset is gonna end up being useful
% for sure, but there are external factors that cause the peaks to start
% decreasing without vaccinations which we somehow need to take into
% account. I'm not sure which data to use as an input to account for this. 

% we can make this all more complex (adding other inputs to the system,
% non-linearity, etc) but first lets make sure it works as expected with
% simple inputs. 
