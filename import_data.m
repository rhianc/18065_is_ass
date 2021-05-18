% function to import data for a given country

function data = import_data(country)
    
    temp = readtable('data.csv');

    data = temp;
end