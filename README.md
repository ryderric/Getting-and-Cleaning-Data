## Getting-and-Cleaning-Data - Course Project
=============================================

This is the course project for Coursera's Getting and Cleaning Data course.

* Initial data for the project is derived from [UCI HAR Dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

The included R script, run_analysis.R, conducts the following:
1. If the data does not already exist in the working directory it will download 
the dataset from the web.
2. Read both the train and test datasets.
3. Merge the datasets.
4. Modify column names to descriptive titles. (e.g -mean to Mean, -std to Std, 
and remove symbols like -, (, ))
5. Extract measurements for the mean and standard deviation values.
6. Generate 'tidy_Dataset' that consists of the mean for each variable
for each subject and each activity. 