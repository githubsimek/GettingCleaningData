==================================================================
Getting and Cleaning Data - Coursera - Johns Hopkins
Professor: Jeff Leek, PhD
Date: February 22, 2015

CodeBook.md for run_analysis.R
==================================================================

The script loads 3 files - activity, subject, fact - for each data set train and test as described in the README.md file.

The resulting data set has 10,299 rows and 561 variables. However, only the mean and standard deviation (std) variables 
are kept from the original data sets. So this intermediary data set ends up with a data frame dimension of 10,299 X 88.

We then map the activity codes to their labels and drop the activity code column - maintaining the 10,299 X 88 dimension.

The activity labels are:

	- WALKING
	- WALKING_UPSTAIRS
	- WALKING_DOWNSTAIRS
	- SITTING
	- STANDING
	- LAYING

After melting and casting the intermediary data set, the script writes the final data set to file "projectTidyData.txt."  This data set 
contains the mean by activity and subject, and has only  180 rows.

The resulting data set from running run_analysis.R has the following variables, with their respective column position:

|   Column  |  Name |  Description
|----|---|----|
|1| activity | activity label|
|2 |subject | subject performing the activity |
 
 Estimated Time domain accelerometer body signals in the X, Y and Z directions - their mean and standard deviation:
 
|   Column  |  Name |    Column  |  Name 
|----|---|---|----|
|3| tBodyAcc.mean.X		|		56 |tBodyAcc.std.X|
|4| tBodyAcc.mean.Y     |        57| tBodyAcc.std.Y |
|5 |tBodyAcc.mean.Z     |        58| tBodyAcc.std.Z|

Estimated Time domain accelerometer gravity signals  in the X, Y and Z directions - their mean and standard deviation: 

|   Column  |  Name |    Column  |  Name 
|----|---|--|---|
|6 |tGravityAcc.mean.X	|		59| tGravityAcc.std.X|
|7 |tGravityAcc.mean.Y    |      60| tGravityAcc.std.Y |
|8| tGravityAcc.mean.Z     |     61| tGravityAcc.std.Z|

Estimated Time domain linear body acceleration resulting in the Jerk signals  in the X, Y and Z directions - their mean and standard deviation:

|   Column  |  Name |    Column  |  Name 
|----|---|--|---|
|9| tBodyAccJerk.mean.X	|		62| tBodyAccJerk.std.X|
|10| tBodyAccJerk.mean.Y   |      63| tBodyAccJerk.std.Y|
|11| tBodyAccJerk.mean.Z    |     64| tBodyAccJerk.std.Z|

Estimated Time domain gyroscope signals  in the X, Y and Z directions - their mean and standard deviation:

|   Column  |  Name |    Column  |  Name 
|----|---|--|---|
|12| tBodyGyro.mean.X	|			65 |tBodyGyro.std.X|
|13 |tBodyGyro.mean.Y   |          66| tBodyGyro.std.Y|
|14| tBodyGyro.mean.Z   |          67 |tBodyGyro.std.Z|

Estimated Time domain angular velocity resulting in the Jerk signals in the X, Y and Z directions - their mean and standard deviation:

|   Column  |  Name |    Column  |  Name 
|----|---|--|---|
|15| tBodyGyroJerk.mean.X	|	68| tBodyGyroJerk.std.X|
|16| tBodyGyroJerk.mean.Y  |     69 |tBodyGyroJerk.std.Y|
|17| tBodyGyroJerk.mean.Z   |    70| tBodyGyroJerk.std.Z |

Estimated Time domain magnitude of the above three-dimensional signals was calculated using the Euclidean norm - their mean and standard deviation:

|   Column  |  Name |    Column  |  Name 
|----|---|--|---|
|18| tBodyAccMag.mean			|		71| tBodyAccMag.std|
|19| tGravityAccMag.mean       |          72| tGravityAccMag.std|
|20| tBodyAccJerkMag.mean    |          73| tBodyAccJerkMag.std|
|21| tBodyGyroMag.mean        |          74| tBodyGyroMag.std|
|22| tBodyGyroJerkMag.mean  |          75| tBodyGyroJerkMag.std |

Fast Fourier Transform (FFT) was applied to some of these signals producing the frequency domain signals:

|   Column  |  Name |   Column  |  Name |     Column  |  Name 
|----|---|----|---|----|---|
|23| fBodyAcc.mean.X			|			76| fBodyAcc.std.X	|	26| fBodyAcc.meanFreq.X            |     
|24| fBodyAcc.mean.Y           |            77| fBodyAcc.std.Y	|	27 |fBodyAcc.meanFreq.Y|
|25| fBodyAcc.mean.Z           |            78| fBodyAcc.std.Z	|	28| fBodyAcc.meanFreq.Z|
                             
|29| fBodyAccJerk.mean.X       |          79 |fBodyAccJerk.std.X	|	32 |fBodyAccJerk.meanFreq.X|
|30| fBodyAccJerk.mean.Y        |         80| fBodyAccJerk.std.Y |	33 |fBodyAccJerk.meanFreq.Y|
|31| fBodyAccJerk.mean.Z       |          81| fBodyAccJerk.std.Z	|	34 |fBodyAccJerk.meanFreq.Z|
                
|35| fBodyGyro.mean.X			|			82| fBodyGyro.std.X	|		38| fBodyGyro.meanFreq.X|
|36| fBodyGyro.mean.Y           |          83 |fBodyGyro.std.Y	|	39| fBodyGyro.meanFreq.Y|
|37| fBodyGyro.mean.Z            |         84|fBodyGyro.std.Z	|		40 |fBodyGyro.meanFreq.Z|

|41| fBodyAccMag.mean	|				85 |fBodyAccMag.std		|			42| fBodyAccMag.meanFreq|

|43| fBodyBodyAccJerkMag.mean	|	86| fBodyBodyAccJerkMag.std	|	44| fBodyBodyAccJerkMag.meanFreq|

|45| fBodyBodyGyroMag.mean	|		87| fBodyBodyGyroMag.std		|	46| fBodyBodyGyroMag.meanFreq|

|47| fBodyBodyGyroJerkMag.mean	|	88| fBodyBodyGyroJerkMag.std	|	48 |fBodyBodyGyroJerkMag.meanFreq|

Finally additional vectors obtained by averaging the signals in a signal window sample, are denoted by the angle prefix:

|   Column  |  Name 
|----|---|
|49| angle.tBodyAccMean.gravity|
|50| angle.tBodyAccJerkMean.gravityMean|
|51| angle.tBodyGyroMean.gravityMean|
|52| angle.tBodyGyroJerkMean.gravityMean|
|53| angle.X.gravityMean|
|54| angle.Y.gravityMean|
|55| angle.Z.gravityMean|

































