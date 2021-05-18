% function to import data for a given country

function data = import_data(country)

    read_opts = 
    
    temp = readmatrix('data.csv');

    data = temp;
end