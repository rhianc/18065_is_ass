
% take as inputs x and y (input & output vectors) and returns the estimated transfer function. 
% estimator for single input single output system

function best_sys = estimator(z1)

    % get dataset length: 
    data_size = length(z1.InputData);
    
    training_data = z1(1:floor(4*data_size/5));
    validation_data = z1(floor(4*data_size/5)+1:data_size);

    % try different order transfer functions and select minimal error system
    best_fit = -100;
    best_sys = tf();
    for np = 1:15        
        sys = tfest(z1,np);                                      % estimate system with np poles 
        [y,fit,ic] = compare(z1,sys);
        disp(fit);
        if fit > best_fit
            % choose best fit model by comparing to previous best fit
            best_fit = fit;
            best_sys = sys;
        end
    end
    %plot(best_y);
end

