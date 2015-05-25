

The R script called run_analysis.R provides the following functions. 
1)Merges the training and the test sets to create one data set.
2)Extracts only the measurements on the mean and standard deviation for each measurement. 
3)Uses descriptive activity names to name the activities in the data set
4)Appropriately labels the data set with descriptive variable names. 
5)From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


In order to run run_analysis.R script, please follow the steps as below.

First, unzip the data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and rename the folder with "RawData".
Make sure the folder "RawData" and the run_analysis.R script are both in the current working directory.

Second, use source("run_analysis.R") command in R.

Third, you will find the following output file will be created in the current working directory:
result_means.txt (264 Kb) 

Finally, run result <- read.table("result_means.txt") command in R to read the result file.  
 




