#!/bin/bash
#get a copy of the csv files that you want to merge, I'm using a directory 'original' to hold my files
cp temp_data/backup/original/*.csv temp_data

echo "Creating a backup of the csv files before any changes are made"
# make a back up of all the csv files in the dummy_data folder with the date and time of the backup 

create_backup(){
    echo "Creating a backup of the csv files"
    mkdir -p temp_data/backup/$(date +%Y-%m-%d_%H-%M-%S)
    cp temp_data/*.csv temp_data/backup/$(date +%Y-%m-%d_%H-%M-%S)
    echo "Backup created"
}

create_backup

# grab the header for first file in your directory, in my case data1.csv and append to a new file
head -n 1 temp_data/data1.csv > temp_data/clean/clean_data.csv

# loop through all the files in the directory and append the data to the clean_data.csv file
for file in temp_data/*.csv
do
    tail -n +2 $file >> temp_data/clean/clean_data.csv
done

# remove duplicate rows
cat temp_data/clean/clean_data.csv > temp_data/clean/data.csv
cat temp_data/clean/data.csv | sort -r | uniq > temp_data/clean/clean_data.csv
echo "Data has been merged into one csv and any duplicate rows have been removed"

# create a subset of the clean_data.csv file with only the first 6 columns
cut -d ',' -f 1-6 temp_data/clean/clean_data.csv > temp_data/clean/subset.csv
echo "The number of rows in the clean_data.csv file is $(wc -l < temp_data/clean/clean_data.csv)"

# get rid of the csv files that you don't need anymore
rm temp_data/*.csv
rm temp_data/clean/data.csv

# docker run -it --rm bash:4.4







