##Code Book

This document describes the code inside run_analysis.R.

#Libraries
*  data.table
*  plyr

#Functions
*  read.table --> Read in table format and creates a data frame from it
*  rbind --> Merge data tables by rows
*  cbind --> Merge columns to get the data frame for all data together
*  grep --> Subset by measurements on the mean and standard deviation
*  subset --> Subset the data frame by selected names of Features
*  gsub --> Label Names of Features using descriptive variable names
*  aggregate --> Create independent tidy data set with the average of each variable for each activity and each subject
*  write.table --> Print final data frame to a file "tidy_data.txt"

#Data Files

Features
*  UCI HAR Dataset/train/X_train.txt
*  UCI HAR Dataset/test/X_test.txt
         
Activity Data
*  UCI HAR Dataset/train/Y_train.txt 
*  UCI HAR Dataset/test/y_test.txt
              
Subject Files
*  UCI HAR Dataset/train/subject_train.txt 
*  UCI HAR Dataset/test/subject_test.txt
              
#Variables
*  subject --> data frame with Subject Data
*  activity --> data frame with Activity Data
*  features --> data frame with Features
*  data1 --> data frame with the data from subject, activity and features
*  data2 --> data frame with the measurements on the mean and standard deviation for each measurement
*  data3 --> final data frame with tidy data
*  selected_names --> character list with Names of the Features
*  activity_labels --> data frame with the labels for different activities

*  Merges test data and trainning data to data1
*  Indentifies the mean and std columns to data2
*  Uses selected_names to extract the measurements on the mean and standard deviation for each measurement
*  Uses activity_labels to name labels of activity
*  Final data frame data3 looks like

>head(data3[, 1:3], n=5)
>    subject activity timeBodyAccelerometer-mean()-X
>1         1        1                      0.2773308
>31        1        2                      0.2554617
>61        1        3                      0.2891883
>91        1        4                      0.2612376
>121       1        5                      0.2789176

*  Writing final data to TXT file
