% function to import data for a given country

function data = import_data(country)
    
    temp = readtable('data.csv');
    
    num_rows = height(temp);
    
    first_row = 0;
    last_row = 0;
    
    for row = 1:num_rows
        
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
    data = temp.new_cases_smoothed(first_row:last_row);
end