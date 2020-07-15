# Load Library
      library(dplyr)

# Check if archive exists and if not download
      filename <- "Coursera_DS3_Final.zip"

      if (!file.exists(filename)){
             fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
            download.file(fileURL, filename, method = "curl")
      }
      
      if (!file.exists("UCI HAR Dataset")){
      unzip(filename)
      }

# Read in the data 

      features <- read.table("UCI HAR Dataset/features.txt", 
                            col.names = c("n","functions"))
      activities <- read.table("UCI HAR Dataset/activity_labels.txt", 
                               col.names = c("code", "activity"))
      s_test <- read.table("UCI HAR Dataset/test/subject_test.txt", 
                                 col.names = "subject")
      x_test <- read.table("UCI HAR Dataset/test/X_test.txt", 
                           col.names = features$functions)
      y_test <- read.table("UCI HAR Dataset/test/y_test.txt", 
                           col.names = "code")
      s_train <- read.table("UCI HAR Dataset/train/subject_train.txt", 
                                  col.names = "subject")
      x_train <- read.table("UCI HAR Dataset/train/X_train.txt", 
                            col.names = features$functions)
      y_train <- read.table("UCI HAR Dataset/train/y_train.txt", 
                            col.names = "code")

# Merge the test and training data
      x <- rbind(x_train, x_test)
      y <- rbind(y_train, y_test)
      s <- rbind(s_train, s_test)
      merged_data <- cbind(s, y, x)
      
# Extract the mean and standard deviations
      knitdata <- merged_data %>%
            select(subject, code, contains("mean"), contains("std"))

# Update the labels with meaningful names
      names(knitdata)[2] = "activity"
      names(knitdata)<-gsub("^t", "Time", names(knitdata))
      names(knitdata)<-gsub("^f", "Frequency", names(knitdata))
      names(knitdata)<-gsub("Acc", "Accelerometer", names(knitdata))
      names(knitdata)<-gsub("Gyro", "Gyroscope", names(knitdata))
      names(knitdata)<-gsub("BodyBody", "Body", names(knitdata))
      names(knitdata)<-gsub("Mag", "Magnitude", names(knitdata))
      names(knitdata)<-gsub("-mean()", "Mean", names(knitdata), 
                            ignore.case = TRUE)
      names(knitdata)<-gsub("-std()", "Standard Deviation", names(knitdata), 
                            ignore.case = TRUE)
      names(knitdata)<-gsub("-freq()", "Frequency", names(knitdata), 
                            ignore.case = TRUE)
      
      
# Create TidyData dataset 
      tidy_Dataset <- knitdata %>%
            group_by(subject, activity) %>%
            summarise_all(funs(mean))
      write.table(tidy_Dataset, "tidy_Dataset.txt", row.name=FALSE)