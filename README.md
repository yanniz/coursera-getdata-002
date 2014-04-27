Getting and Cleaning Data Course
================================

This is a four-week course on coursera. Apr 7th - May 4th, 2014.


## Peer Assessment Project

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 
- a tidy data set as described below, 
- a link to a Github repository with your script for performing the analysis, and 
- a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.  

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

You should create one R script called run_analysis.R that does the following. 
- Merges the training and the test sets to create one data set.
- Extracts only the measurements on the mean and standard deviation for each measurement. 
- Uses descriptive activity names to name the activities in the data set
- Appropriately labels the data set with descriptive variable or feature (column) names. 
- Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 


### Assumption
for the purposes of this analysis, a subset of columns were taken via column names end in `mean()` or `std()`


### Running the Script 
In order to run this script, you need to downloads the data from the link below
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
unzip it, and it should result in a `UCI HAR Dataset` folder that has all the files in the required structure.
Change current directory to the UCI HAR Dataset folder.
Two tidy datasets should be created in the current directory as `tidy_data_1.txt` and `tidy_data_2.txt`

### Reference
Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012