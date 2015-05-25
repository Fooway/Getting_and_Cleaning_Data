###########################################################################################
##Create one R script called run_analysis.R that does the following data processing jobs.##
###########################################################################################

###########################################################################################
##1)Merges the training and the test sets to create one data set.
###########################################################################################

library(plyr)

##set working direcoty
setwd("/Users/Michael/OneDrive/Study/Data Science/03.Getting and Cleaning Data/Course_Project")

##read train data
x_train_data <- read.table("./RawData/train/X_train.txt")
y_train_data <- read.table("./RawData/train/y_train.txt")
subject_train_data <- read.table("./RawData/train/subject_train.txt")

##read test data
x_test_data <- read.table("./RawData/test/X_test.txt")
y_test_data <- read.table("./RawData/test/y_test.txt") 
subject_test_data <- read.table("./RawData/test/subject_test.txt")

##read activity data
activity_labels <- read.table("./RawData/activity_labels.txt",col.names = c("ActivityId", "Activity"))

##read feature data
features_data <- read.table("./RawData/features.txt",colClasses = c("character"))

## merge data
merge_train_data <- cbind(cbind(x_train_data, subject_train_data), y_train_data)
merge_test_data  <- cbind(cbind(x_test_data, subject_test_data), y_test_data)
merge_all_data <- rbind(merge_train_data, merge_test_data)

## modify label names
all_labels <- rbind(rbind(features_data, c(562, "Subject")), c(563, "ActivityId"))[,2]
names(merge_all_data) <- all_labels


###########################################################################################
##2)Extracts only the measurements on the mean and standard deviation for each measurement. 
###########################################################################################

all_data_mean_std <- merge_all_data[,grepl("mean|std|Subject|ActivityId", names(merge_all_data))]

###########################################################################################
##3)Uses descriptive activity names to name the activities in the data set.
###########################################################################################

all_data_mean_std <- join(all_data_mean_std, activity_labels, by = "ActivityId", match = "first")
all_data_mean_std <- all_data_mean_std[,-1]

###########################################################################################
##4)Appropriately labels the data set with descriptive variable names. 
##########################################################################################
##replace labels
names(all_data_mean_std) <- gsub('\\(|\\)',"",names(all_data_mean_std), perl = TRUE)
names(all_data_mean_std) <- make.names(names(all_data_mean_std))
names(all_data_mean_std) <- gsub('Acc',"Acceleration",names(all_data_mean_std))
names(all_data_mean_std) <- gsub('GyroJerk',"AngularAcceleration",names(all_data_mean_std))
names(all_data_mean_std) <- gsub('Gyro',"AngularSpeed",names(all_data_mean_std))
names(all_data_mean_std) <- gsub('Mag',"Magnitude",names(all_data_mean_std))
names(all_data_mean_std) <- gsub('^t',"Time.",names(all_data_mean_std))
names(all_data_mean_std) <- gsub('^f',"Frequency.",names(all_data_mean_std))
names(all_data_mean_std) <- gsub('\\.mean',".Mean",names(all_data_mean_std))
names(all_data_mean_std) <- gsub('\\.std',".StandardDeviation",names(all_data_mean_std))
names(all_data_mean_std) <- gsub('Freq\\.',"Frequency.",names(all_data_mean_std))
names(all_data_mean_std) <- gsub('Freq$',"Frequency",names(all_data_mean_std))

#write.table(all_data_mean_std, "merged_data.txt")  


##########################################################################################
##5)From the data set in step 4, creates a second, independent tidy data set with the 
##  average of each variable for each activity and each subject.
##########################################################################################

mean_result = ddply(all_data_mean_std, c("Subject","Activity"), numcolwise(mean))
write.table(mean_result, file = "result_means.txt",row.name=FALSE)


