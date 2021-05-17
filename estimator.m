

iddata1 = iddata(y,x,1);        % y is output data, x is input data, 1 is 
                                % sample period (discrete)
                                
                                % y and x are both column vectors of equal
                                % length

load iddata1 z1;                % iddata1 is time domain input/output data
np = 5;                         % nubmer of poles
sys = tfest(z1,np);             % the estimated transfer function

%{

enter these in cmd line to see results

sys.Numerator;                  
sys.Denominator;

%}