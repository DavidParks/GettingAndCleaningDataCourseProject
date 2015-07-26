# run_analysis.R
# Getting and Cleaning Data Project
# July 26, 2015

# Unzip the "UCI HAR Dataset.zip" file in your R working directory. This creates the "UCI HAR Dataset" directory.
# Run this script from the R working directory containing the "UCI HAR Dataset" directory.
# When run, this script will first read the the test and train dataset files.
test <- read.table("./UCI HAR Dataset/test/X_test.txt")
testact <- read.table("./UCI HAR Dataset/test/y_test.txt")
testsubj <- read.table("./UCI HAR Dataset/test/subject_test.txt")
train <- read.table("./UCI HAR Dataset/train/X_train.txt")
trainact <- read.table("./UCI HAR Dataset/train/y_train.txt")
trainsubj <- read.table("./UCI HAR Dataset/train/subject_train.txt")
# Merge the training and the test sets to create one data set.
fulldata <- rbind(test, train)
subjects <- rbind(testsubj, trainsubj)
activities <- rbind(testact, trainact)
# Read features.txt file to get column names and determine columns with mean and standard deviation measurements.
features <- read.table("./UCI HAR Dataset/features.txt")
keepers <- grepl("-mean\\(\\)|-std\\(\\)", features[,2])
# Extract only the measurements on the mean and standard deviation for each measurement.
extractdata <- fulldata[, keepers]
# Add subject and activity columns
data <- cbind(subjects, activities, extractdata)
## Apply descriptive activity names to name the activities in the data set
data[,2] <- gsub("1","walking", data[,2])
data[,2] <- gsub("2","walking_upstairs", data[,2])
data[,2] <- gsub("3","walking_downstairs", data[,2])
data[,2] <- gsub("4","sitting", data[,2])
data[,2] <- gsub("5","standing", data[,2])
data[,2] <- gsub("6","laying", data[,2])
# Label the data set with descriptive variable names. 
vnames <- features[keepers,2]
vnames <- as.character(vnames)
labels <- c("subject", "activity", vnames)
colnames(data) <- labels
# Create a tidy data set with the average of each variable for each activity and each subject.
