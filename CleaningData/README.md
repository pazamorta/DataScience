##Background##

This package includes:

1. File run_analysis.R that performs the activities specified below.
2. File codebook.md that explains all variables included in the output files obtained by running run_analysis.R.
3. This README.MD file that specifies the content of the package, the objectives and the method followed.

The source data is not included. It can be found [here][1] 

## Objective ##

The objective is to use a script to obtain two tidy data sets based on the source file:
    
    1. Data set merging the training and the test data from the source file.
    2. Data set with the average of each variable for each activity and each subject.

## Method ##

Create an R script called *run_analysis.R* to be found in this repository.
The script requires the libraries plyr and reshape2.
The script can be executed assuming the data is in the working directory.

The script follows these steps:
    
    1. Download the source file
    2. Unzip the source file in the working directory
    3. Load the required libraries
    4. Read the features and activities tables
    5. Create a testComplete object with test data
        X_test.txt
        y_test.txt
        subject_test.txt
    6. Create a trainComplete object with training data
        X_train.txt
        y_train.txt
        subject_train.txt
    7. Bind both objects into a completeData object
    8. Check all mean() and std()
    9. Give a descriptive activity name to the Activities based on the source file activity_labels.txt
    10. Calculate the average for each variable for each activity and each subject
    11. Write 2 files:
        *meansData.txt* file with the average for each variable for each activity and each subject
        *tidyData.csv* file with training and the test data including descriptive activity and variable names

[1]: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "Data"