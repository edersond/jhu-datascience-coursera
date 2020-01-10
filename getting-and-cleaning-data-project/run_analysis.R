#R script for the getting an cleaning data course project

#tasks to accomplish:
#1- Merges the training and the test sets to create one data set.
#2- Extracts only the measurements on the mean and standard deviation for each measurement.
#3- Uses descriptive activity names to name the activities in the data set
#4- Appropriately labels the data set with descriptive variable names.
#5- From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

library(tidyverse)
library(zip)
library(reshape2)

#data source:
data.url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

#check if project folders already exists and creates them
if(!dir.exists("gcd_project")){
  dir.create("gcd_project")
  if(!dir.exists("gcd_project/data")) {
    dir.create("gcd_project/data")
  }
}

#checks if exist and downloads data
if(!file.exists("gcd_project/data/dataset.zip")) {
  download.file(data.url, destfile = "gcd_project/data/dataset.zip")
  unzip("gcd_project/data/dataset.zip", overwrite = TRUE, exdir = "gcd_project/data")
}

#loads variable names
var.names <- read.csv("gcd_project/data/UCI HAR Dataset/features.txt",header = FALSE, sep = " ",stringsAsFactors = FALSE)[,2]

#defines column number of the interest variables, and keeps it in order
interest.vars <- c(grep("mean\\(\\)",var.names), grep("std\\(\\)",var.names))
interest.vars.names <- var.names[interest.vars]

#loads activity labels
activity.labels <- read.csv("gcd_project/data/UCI HAR Dataset/activity_labels.txt", header = FALSE, sep=" ",stringsAsFactors = FALSE)
names(activity.labels) <- c("activity","activity_label")

#loads training data, activities and subjects, renames variables, merges them, and activity labels
train.data <- (read.csv("gcd_project/data/UCI HAR Dataset/train/X_train.txt", header = FALSE,sep = ""))[,interest.vars]
names(train.data) <- interest.vars.names
train.activities <- read.csv("gcd_project/data/UCI HAR Dataset/train/y_train.txt", header = FALSE,sep = "")
names(train.activities) <- "activity"
train.subjects <- read.csv("gcd_project/data/UCI HAR Dataset/train/subject_train.txt", header = FALSE,sep = "")
names(train.subjects) <- "subject"
train.data <- bind_cols(train.data,train.activities) %>%
  left_join(activity.labels, by = "activity") %>%
  bind_cols(train.subjects)

#loads test data and activities, renames it, merges them then add activity labels
test.data <- read.csv("gcd_project/data/UCI HAR Dataset/test/X_test.txt", header = FALSE,sep = "")[,interest.vars]
names(test.data) <- interest.vars.names
test.activities <- read.csv("gcd_project/data/UCI HAR Dataset/test/y_test.txt", header = FALSE,sep = "")
names(test.activities) <- "activity"
test.subjects <- read.csv("gcd_project/data/UCI HAR Dataset/test/subject_test.txt", header = FALSE,sep = "")
names(test.subjects) <- "subject"
test.data <- bind_cols(test.data,test.activities) %>%
  left_join(activity.labels, by = "activity") %>%
  bind_cols(test.subjects)

#merges both datasets, with its variables properly renamed. labeled activities and subjects added 
##accomplish tasks 1 to 4
full.data <- bind_rows(train.data,test.data)

#reshapes data to tidy format
tidy.data <- melt(full.data, c("subject","activity_label"))
tidy.data <- dcast(tidy.data, subject + activity_label ~ variable, fun.aggregate = mean) %>%
  select(-activity)

#exports file containing tidy data
##accomplishes task 5
write.csv(tidy.data, file = "gcd_project/tidy_data.csv")

##script end