==================================================================
Getting and Cleaning Data - Coursera - Johns Hopkins
Professor: Jeff Leek, PhD
Date: February 22, 2015

README.md
==================================================================

The purpose of this project is to collect, work with, and clean a data set. The goal is to
prepare tidy data that can be used for later analysis. 
 
The project data was collected from the accelerometers from the Samsung Galaxy S smartphone. 
A full description is available at the site from where the data was obtained: 
  
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
  
The project data can be found in:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 


 
In order to understand the project review thoroughly the following files in the unzipped directory:
-------------------------------------------------------------------------------------------------------------------

- README.txt 
- features_info.txt: Shows information about the variables used on the feature vector (fact data frame)
- features.txt: : List of all column names for the feature vector (fact data frame)
- activity_labels.txt: Maps the activity codes with the activity labels

In this implementation we have *not* used the "Inertial Signals" subdirectories data.
  

Files used for this project:
------------------------------

-  features.txt:  List of all column names for the feature vector (fact data frame)

-  test/subject_test.txt:  Subject data frame input file contains 2,947 observations with 1 variable.
							      Each row identifies the subject who performed the activity for each window sample. 
							      Its range is from 1 to 30.
							   
- test/X_text.txt: Fact data frame input file contains 2,947 observations with 561 variables.

- test/y_text.txt: Activity data frame input file contains 2,947 observations with 1 variable.
					    Each row identifies the activity code performed for each window sample. 
					    Its range is from 1 to 6.

- train/subject_train.txt:  Subject data frame input file contains 7,352 observations with 1 variable.
							        Each row identifies the subject who performed the activity for each window sample. 
							       Its range is from 1 to 30.
								  
- train/X_train.txt: Fact data frame input file contains 7,352 observations with 561 variables.

- train/y_train.txt: Activity data frame input file contains 7,352 observations with 1 variable.
					    Each row identifies the activity code performed for each window sample. 
					    Its range is from 1 to 6.
						
						
Implementation of run_analysis.R script
-----------------------------------------------						
 
 Unzipping the data set reveals that the project data is under directory "UCI HAR Dataset"
 
 VERY IMPORTANT : For the run_analysis.R script to work, set your R tool working directory to ../"UCI HAR Dataset"
------------------------------------------------------------------------------------------------------------------


 - run_analysis.R does the following:

       1. Merges the training and the test sets to create one data set.
       2. Extracts only the measurements on the mean and standard deviation for each measurement.
       3. Uses descriptive activity names to name the activities in the data set.
       4. Appropriately labels the data set with descriptive variable names.
       5. Creates a tidy data set for analysis
       6. From the data set in step V, creates a second, independent tidy data set with the
          average of each variable for each activity and each subject.
       7. Save data set in step VI to a text file
	   
For more details on the implementation see the CodeBook.md file.  
	   


	   

