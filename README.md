## Bash Data Cleaning
In this repo, I describe how we could easily do basic data cleaning using Bash Scripting. The script takes multiple CSV files from a directory (assuming they are of the same structure) and merges them into a single file in a new directory called cleaned data. The script is written in a way that it can be easily modified to other types of files, such as excel. 

Before any processing is done, the script makes a backup of the original files to a directory called backup under the temp_data with a date and time stamp as the name of the folder. The script then does the following: Makes a copy of the header of the first file in the current directory in our case, it was data1.csv and stores it in a file called clean_data.csv, gets rid of headers in the rest of the files and appends all the data to clean_data.csv file and finally removes any duplicates.  

## How to run the script
How to use the script:
1. Clone the repo
2. copy the csv files that you want to clean / merge into the temp_data directory. 
3. Run the script using the command: bash data_cleaning.sh
4. The cleaned files will be stored in the cleaned_data directory.


