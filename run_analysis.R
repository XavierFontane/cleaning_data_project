## Create one R script called run_analysis.R that does the following:

setwd("./UCI HAR Dataset")
library(data.table)

## 1. Merges the training and the test sets to create one data set

      #Subject files
      subject_test <- read.table("./test/subject_test.txt")
      subject_train <- read.table("./train/subject_train.txt")

      #Features
      features_test <- read.table("./test/X_test.txt")
      features_train <- read.table("./train/X_train.txt")
      features_names <- read.table("features.txt")

      #Activity files
      activity_test <- read.table("./test/y_test.txt")
      activity_train <- read.table("./train/Y_train.txt")

      #Merging data
      subject <- rbind(subject_train, subject_test)
      activity<- rbind(activity_train, activity_test)
      features<- rbind(features_train, features_test)
      
      names(subject)<-c("subject")
      names(activity)<- c("activity")
      names(features)<- features_names$V2
      
      merge1 <- cbind(subject, activity)
      data1 <- cbind(features, merge1)

## 2. Extracts only the measurements on the mean and standard deviation for each measurement
      
      #Subset data1 by features
      sub_features_names<-features_names$V2[grep("mean\\(\\)|std\\(\\)", features_names$V2)]
      selected_names<-c(as.character(sub_features_names), "subject", "activity" )
      data2<-subset(data1,select=selected_names)
      
## 3. Uses descriptive activity names to name the activities in the data set
      
      activity_labels <- read.table("activity_labels.txt")
      
## 4. Appropriately labels the data set with descriptive activity names

      names(data2)<-gsub("^t", "time", names(data2))
      names(data2)<-gsub("^f", "frequency", names(data2))
      names(data2)<-gsub("Acc", "Accelerometer", names(data2))
      names(data2)<-gsub("Gyro", "Gyroscope", names(data2))
      names(data2)<-gsub("Mag", "Magnitude", names(data2))
      names(data2)<-gsub("BodyBody", "Body", names(data2))

## 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject
      library(plyr)
      data3<-aggregate(. ~subject + activity, data2, mean)
      data3<-data3[order(data3$subject,data3$activity),]
      write.table(data3, file = "tidy_data.txt",row.name=FALSE)
