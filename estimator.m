
% take as inputs x and y (input & output vectors) and returns the estimated transfer function. 
% estimator for single input single output system

% currently training on last 4/5 of data, validating on first 1/5.
% this is because there is only vaccine data on the last 1/2. 

function best_sys = estimator(z1)
% functions that takes input data type iddata

    data_size = length(z1.OutputData);
    % get data length
    
    training_data = z1(floor(1*data_size/5):data_size);
    validation_data = z1(1:floor(1*data_size/5)-1);
    % parse data into training data (last 4/5) and validation (first 1/5)

    % try different order transfer functions and select minimal error system
    best_fit = -100;
    best_sys = tf();
    for np = 2:10        
        sys = tfest(training_data,np);                                      % estimate system with np poles 
        [y,fit,ic] = compare(validation_data,sys);
        if fit > best_fit
            % choose best fit model by comparing to previous best fit
            best_fit = fit;
            best_sys = sys;
        end
    end
    disp(best_fit);
end

