
% take as inputs x and y (input & output vectors) and returns the estimated transfer function. 

function best_sys = estimator(x,y)

    % get dataset length: 
    length = size(y);

    iddata1 = iddata(y,x,1);                                                % y is output data, x is input data, 1 is sample period (discrete)                    

    load iddata1 z1;                                                        % iddata1 is time domain input/output data

    training_data = z1(1:floor(4*length/5));
    validation_data = z1(floor(4*length/5)+1,length);

    % try different order transfer functions and select minimal error system
    best_fit = 0;
    best_sys = tf();
    for np = 1:10        
        sys = tfest(training_data,np);                                      % estimate system with np poles 
        [y,fit,ic] = compare(validation_data,sys);
        if fit > best_fit
            % choose best fit model by comparing to previous best fit
            best_fit = fit;
            best_sys = sys;
        end
    end
end

