
% Use this file to analyse the estimated LTI system results

% use estimator on various countries

% compare impulse/step responses, see if there are signficant differences
% between countries and try and hypothesize why. 
%%
country = 'United States';


y_data = import_data(country,1);
x_data = import_data(country,0);


y_data(isnan(y_data))=0;

x_data(isnan(x_data))=0;

z1 = iddata(y_data,x_data); 

%%
sys_estimate = estimator(z1);
%step_response = step(sys_estimate);

compare(z1,sys_estimate);

%time_samples = 1:length(y_data);
%time_samples = transpose(time_samples);
%x_data(isnan(x_data))=0;
%lsim(sys_estimate,x_data,time_samples);

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
