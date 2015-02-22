# Coursera - Getting and Cleaning Data - Johns Hopkins
# Professor: Jeff Leek, PhD
#
#
# The purpose of this project is to collect, work with, and clean a data set. The goal is to
# prepare tidy data that can be used for later analysis. The project data can be found in:
#
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
#
# Unzipping the data set reveals that the project data is under directory "UCI HAR Datase."
# For this script to work, set your working directory to ../"UCI HAR Datase"
#
# run_analysis.R does the following:
#
#       1. Merges the training and the test sets to create one data set.
#       2. Extracts only the measurements on the mean and standard deviation for each measurement.
#          Uses load_data() for this step.
#       3. Uses descriptive activity names to name the activities in the data set.
#       4. Appropriately labels the data set with descriptive variable names.
#          Uses load_data() for this step.
#       5. Creates a tidy data set for analysis
#       6. From the data set in step 5, creates a second, independent tidy data set with the
#          average of each variable for each activity and each subject.
#       7. Save data set in step 6 to txt file


# 
#       load_data <- function ( which_data )
#
#       which_data <- "train" | "test"
#
# There are two data sets to be loaded and merged - train and test - each one in its own subdirectory.
# The load_data() function accepts the which_data argument, which can be either "train" or "test" and
# performs the following tasks:
#       1. Loads the subject, activity, and fact files
#       2. Renames the columns in all 3 data frames, since the files had no headers
#       3. Gets only the mean and std columns from the fact file
#       4. Joins all three data frames and returns

load_data <- function ( which_data ) {
        
        # 1. Load the subject, activity, and fact data frames        
        subject <- read.table( paste0( which_data, "/subject_", which_data, ".txt"),
                                header = F, stringsAsFactors = F )
        activity <- read.table( paste0( which_data, "/y_", which_data, ".txt"),
                                header = F, stringsAsFactors = F)
        fact <- read.table( paste0(  which_data, "/x_", which_data, ".txt"),
                                header = F, stringsAsFactors = F)
        
        # 2. Rename columns in all 3 data frames
        names(subject) <- c("subject")
        names(activity) <- c("activityCode")
        
        # The fact data frame has 561 columns.  The column names are in the features.txt file
        column_names <- read.table( "features.txt", header=F, stringsAsFactors = F)
        
        # There are duplicate column names. make.names() will return a vector of unique names
        # which is assigned to the column names of fact
        names(fact) <- make.names( column_names[,2], unique = T )
        
        # 3. Gets only the mean and std columns from the fact data frame
        fact <- select(fact, contains("mean", ignore.case = T), contains("std", ignore.case = T))
        
        # Further clean up the fact column names as make.names() replaces each non-alphanumeric
        # symbol with a dot (.)
        # Replace 2 or 3 dots in a row with a single dot
        names(fact) <- gsub("[\\.]{2,3}","\\.", names(fact)) 
        # Remove the dot at the end of the column name
        names(fact) <- gsub("\\.$", "", names(fact))
        
        # 4. Joins all three data frames
        
        # Using plyr join_all make this simple if the data frames have a common column name.
        # Create the id column in all data frames
        # Get the length of the data frames
        rows <- dim(subject)[1]
        subject <-mutate(subject, id = 1:rows)
        activity <-mutate(activity, id = 1:rows)
        fact <-mutate(fact, id = 1:rows)
        
        # Create the list of data frames to be joined
        joinList <- list( subject, activity, fact)
        
        # Join all the datasets
        join_all(joinList)
        
        
}


library(plyr)
library(dplyr)

# 1. Merge the train and the test sets to create one data set.

#    Load train and test data

train <- load_data("train")
test <- load_data("test")

#    Consolidate the two datasets - train is left

train <- rbind( train, test)

# 3. Uses descriptive activity names to name the activities in the data set
train <- mutate(train, activity = ( ifelse( activityCode == 1, "WALKING",
                           ifelse( activityCode == 2, "WALKING_UPSTAIRS",
                           ifelse( activityCode == 3, "WALKING_DOWNSTAIRS", 
                           ifelse( activityCode == 4, "SITTING", 
                           ifelse( activityCode == 5, "STANDING",
                                   "LAYING"))))))) # activityCode == 6

# 5. Creates a tidy data set for analysis
#   Cleanup and get the final data frame without the id used to join and the activityCode
final_df <- select(train, -id, -activityCode )


# 6. From the data set in step 5, creates a second, independent tidy data set with the
#    average of each variable for each activity and each subject.
# 
#    This is done easily with the melt() and dcast() functions from the reshape2 library

library(reshape2)

melted <- melt( final_df, id.vars = c("activity", "subject"))

mean_by_activity_subject <- dcast( melted, activity + subject ~ variable, fun.aggregate = mean,
                                   na.rm = T)

#  7. Save data set in step 6 to txt file
write.table(mean_by_activity_subject, "projectTidyData.txt", row.name=FALSE)
