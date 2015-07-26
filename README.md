# GettingAndCleaningDataCourseProject
Course project for the Johns Hopkins / Coursera Getting and Cleaning Data Course

This readme file describes the use of the *run_analysis.R* script to process the datasets used in the Johns Hopkins Coursera course titled *Getting and Cleaning Data*.
Download and unzip the [UCI HAR Dataset.zip file](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) into the R working directory containing the *run_analysis.R* script. When unzipped, the UCI HAR Dataset.zip file creates a *UCI HAR Dataset* directory hierarchy containing the test and train dataset files. Run the *run_analysis.R* script in the same R working directory containing the *UCI HAR Dataset* directory.
This script does the following with the project datasets.
1. Merges the training and the test datasets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
