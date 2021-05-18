
% Use this file to analyse the estimated LTI system results

% import data from various countries, maybe have a matlab data file with
% nested {country: {vaccination_data, infection_data}} for easy access

% use estimator on various countries

% compare impulse/step responses, see if there are signficant differences
% between countries and try and hypothesize why. 

x = [];
y = [];
country = "USA";

sys_estimate = estimator(x,y);
step_response = step(sys_estimate);

% we can make this all more complex (adding other inputs to the system,
% non-linearity, etc) but first lets make sure it works as expected with
% simple inputs. 

