################################################################################
## This R script does the following -

## Merges the training and the test sets to create one data set.
## Extracts only the measurements on the mean and standard deviation for each measurement. 
## Uses descriptive activity names to name the activities in the data set
## Appropriately labels the data set with descriptive activity names. 
## Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

## In order to run this script, you need to downloads the data from the link below
## https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
## unzip it, and it should result in a UCI HAR Dataset folder that has all the files in the required structure.
## Change current directory to the UCI HAR Dataset folder.
## Two tidy datasets should be created in the current directory as tidy_data_1.txt and tidy_data_2.txt

################################################################################


################################################################################
## Functions
################################################################################

get_factor <- function(filepath='./activity_labels.txt') {
    activity_labels <- read.table(filepath, stringsAsFactors=FALSE)
    levels <- activity_labels[,1]
    labels <- activity_labels[,2]
    list(levels=levels, labels=labels)
}

combineData <- function(filename_suffix, data_folder, fn_data=character()) {
    
    # load X (feature) data file
    fpath <- file.path(data_folder, paste("X_", filename_suffix, ".txt",sep=""))
    x_data <- read.table(fpath, header=FALSE)
    names(x_data) <- fn_data
    
    # load y (activity labels) data file
    fpath <- file.path(data_folder, paste("y_", filename_suffix, ".txt", sep=""))
    activity <- read.table(fpath, header=FALSE, col.names=c("activity_id"))
    
    # Convert a to factors
    f <- get_factor()
    activity <- factor(activity[,1], levels=f$levels, labels=f$labels)
    
    # load subject data file
    fpath <- file.path(data_folder, paste("subject_", filename_suffix, ".txt", sep=""))
    subject <- read.table(fpath, header=FALSE, col.names=c("subject_id"))
    
    # Convert subjects to factors
    subject <- factor(subject[,1], levels=1:30)
    
    # subset data
    x_data <- x_data[,grep(".*mean\\(\\)|.*std\\(\\)", fn_data)]
    
    mergedData <- cbind(subject, x_data, activity)
    
    # return the combined data
    return(mergedData)
}
       

################################################################################
## Main Script
################################################################################

# load feature name file
fn_data <- read.table("features.txt", header=FALSE, as.is=TRUE, col.names=c("feature_id", "feature_name"));
fn_data <- fn_data[,2];
tidy_data_test <-combineData("test", "test",fn_data);
tidy_data_train <-combineData("train", "train",fn_data);
tidy_data_train$data_group <- rep("train",nrow(tidy_data_train))
tidy_data_test$data_group <- rep("test",nrow(tidy_data_test))

# Combine training and test data sets
tidy_data_1 <- rbind(tidy_data_train, tidy_data_test)

## Create a second tidy data: tidy_data_2
# install package if it is not installed on the machine
if (!is.element("plyr", installed.packages()[,1]))
    install.packages("plyr", dep = TRUE)
require("plyr", character.only = TRUE)
library(plyr)

tidy_data_2 <- ddply(tidy_data_1, .(subject, activity, data_group), .fun=function(x){ colMeans(x[,-c(1,68,69)]) })

# Export to .txt file
write.table(tidy_data_1, file='tidy_data_1.txt')
write.table(tidy_data_2, file='tidy-data_2.txt')



