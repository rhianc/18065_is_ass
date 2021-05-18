% function to import data for a given country
% feel like the explanation of how it works isn't important the paper. 

function data = import_data(country,in_or_out)
    
    temp = readtable('data.csv');
    
    num_rows = height(temp);
    
    first_row = 0;
    last_row = 0;
    
    for row = 1:num_rows
        if last_row == 0
            
            single_row = temp(row,'location');
            row_country = string(single_row{1,1});
            if row_country == country
                if first_row == 0
                    first_row = row;
                end
            end
            if row_country ~= country
                if first_row ~= 0
                    last_row = row-1;
                end
            end
        end
    end
    pre_zero = zeros(20,1);
    pre_zero2 = zeros(20,2);
    if in_or_out == 1
        data = temp.new_cases_smoothed(first_row:last_row);
        %data = [pre_zero;data];
    else
        data1 = temp.new_vaccinations_smoothed(first_row:last_row);
        data2 = temp.positive_rate(first_row:last_row);
        data = [data1(:), data2(:)];
        %data = [pre_zero2;data];
    end
    
end