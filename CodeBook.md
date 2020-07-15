The run_analysis.R script performs the data preparation followed by the steps necessary to meet the course project’s definition.

1. Download the dataset
Dataset downloaded and extracted in the folder named UCI HAR Dataset

2 Read data into dataframes
* features <- features.txt 
* activities <- activity_labels.txt
* s_test <- test/subject_test.txt 
* x_test <- test/X_test.txt 
* y_test <- test/y_test.txt 
* s_train <- test/subject_train.txt 
* x_train <- test/X_train.txt : 
* y_train <- test/y_train.txt 

3. Merge the training and the test sets to create one data set
* x is created by merging x_train and x_test using rbind() function
* y is created by merging y_train and y_test using rbind() function
* s is created by merging subject_train and subject_test using rbind() function
* knitdata is created by merging S, Y and X using cbind() function

4. Extract the mean and standard deviation for each measurement

5. Update names to provide more descriptice variable names:
* All variables starting with the character f is updated to Frequency
* All variables starting the character t is updated with Time
* Acc is replaced with Accelerometer
* Gyro is replaced with Gyroscope
* BodyBody is replaced with Body
* Mag is replaced with Magnitude

6. Create the final data set with the average of each variable for each activity and each subject
FinalData (180 rows, 88 columns) is created by sumarizing TidyData taking the means of each variable for each activity and each subject, after groupped by subject and activity.