# Getting and cleaning data

For creating a tidy data set of wearable computing data originally from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Files in this repo
* README.md -- you are reading it right now
* CodeBook.md -- codebook describing variables, the data and transformations
* run_analysis.R -- actual R code

## run_analysis.R
It follows the goals step by step.

*  1. Merges the training and the test sets to create one data set:
  * Read all the test and training files.
  * Combine the files to a data frame in the form of subjects, labels, the rest of the data.

* 2. Extracts only the measurements on the mean and standard deviation for each measurement:
  * Read the features from features.txt and filter it to only leave features that are either means ("mean()") or standard deviations ("std()").
  * A new data frame is then created that includes subjects, labels and the described features.

* 3. Uses descriptive activity names to name the activities in the data set:
  * Read the activity labels from activity_labels.txt and replace the numbers with the text.

* 4. Appropriately labels the data set with descriptive activity names:
  * Convert all non-alphanumeric characters to descriptive variable names
  * Apply the new names to the data frame
  
* 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject:
  * Create a new data frame by finding the mean for each combination of subject and label using the `aggregate()` function
  * Write the new tidy set into a text file similarl to the original files.
