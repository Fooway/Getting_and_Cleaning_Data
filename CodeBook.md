##Getting and Cleaning Data Course Project CodeBook

This codebook describes how to obtain tidy data by the variables, the data, and any transformations.

The original data was derived from the following website:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
The data set for the project was download from the following link :
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

To clean the raw data, the run_analysis.R script carry out the following operations.

1)Read X_train.txt, y_train.txt and subject_train.txt from the "./RawData/train" directory and store them in x_train_data, y_train_data and subject_train_data variables respectively.

2)Read X_test.txt, y_test.txt and subject_test.txt from the "./RawData/test" directory and store them in x_test_data, y_test_data and subject_test_data variables respectively.

3)Read activity_labels.txt from "./RawData/activity_labels.txt" directory and store them in activity_labels variables.

4)Read features.txt.txt from "./RawData/features.txt.txt" directory and store them in features_data variables.

5)Merge x_train_data and y_train_data training data variables into merge_train_data using cbind(). Merge x_test_data and y_test_data test data variables into merge_test_data using cbind(). Merge merge_train_data and merge_test_data variables into merge_all_data using rbind().

6)Modify the label names for merge_all_data variable.

7) Extracts only the measurements on the mean and standard deviation from merge_all_data variable and store them in all_data_mean_std.

8) Uses descriptive activity names to name the activities in the data set using join() and store them in all_data_mean_std variable.

9) Modify lable names for easy to read for all_data_mean_std variable.

10) Write the processed data to "result_means.txt" file in current working directory.
 
