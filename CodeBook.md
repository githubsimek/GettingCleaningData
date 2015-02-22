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

| Column | Name
|---|---|
|1 |activity|
|2 |subject |
|3 | tbodyacc.mean.x|
|4 |tbodyacc.mean.y |
|5 | tbodyacc.mean.z|
|6 |tgravityacc.mean.x |
|7 | tgravityacc.mean.y|
|8 |tgravityacc.mean.z |
|9 | tbodyaccjerk.mean.x|
|10 |tbodyaccjerk.mean.y |
|11 |tbodyaccjerk.mean.z|
|12 |tbodygyro.mean.x |
|13 |tbodygyro.mean.y|
|14 |tbodygyro.mean.z |
|15 |tbodygyrojerk.mean.x|
|16 |tbodygyrojerk.mean.y |
|17 |tbodygyrojerk.mean.z|
|18 |tbodyaccmag.mean |
|19 |tgravityaccmag.mean|
|20 |tbodyaccjerkmag.mean |
|21 |tbodygyromag.mean|
|22 |tbodygyrojerkmag.mean |
|23 |fbodyacc.mean.x|
|24 |fbodyacc.mean.y |
|25 |fbodyacc.mean.z|
|26 |fbodyacc.meanfreq.x |
|27 |fbodyacc.meanfreq.y|
|28 |fbodyacc.meanfreq.z |
|29 |fbodyaccjerk.mean.x|
|30 |fbodyaccjerk.mean.y |
|31 |fbodyaccjerk.mean.z|
|32 |fbodyaccjerk.meanfreq.x |
|33 |fbodyaccjerk.meanfreq.y|
|34 |fbodyaccjerk.meanfreq.z |
|35 |fbodygyro.mean.x|
|36 |fbodygyro.mean.y |
|37 |fbodygyro.mean.z|
|38 |fbodygyro.meanfreq.x |
|39 |fbodygyro.meanfreq.y|
|40 |fbodygyro.meanfreq.z |
|41 |fbodyaccmag.mean|
|42 |fbodyaccmag.meanfreq |
|43 |fbodybodyaccjerkmag.mean|
|44 |fbodybodyaccjerkmag.meanfreq |
|45 |fbodybodygyromag.mean|
|46 |fbodybodygyromag.meanfreq |
|47 |fbodybodygyrojerkmag.mean|
|48 |fbodybodygyrojerkmag.meanfreq |
|49 |angle.tbodyaccmean.gravity|
|50 |angle.tbodyaccjerkmean.gravitymean |
|51 |angle.tbodygyromean.gravitymean|
|52 |angle.tbodygyrojerkmean.gravitymean"|
|53 |angle.x.gravitymean|
|54 |angle.y.gravitymean |
|55 |angle.z.gravitymean|
|56 |tbodyacc.std.x |
|57 |tbodyacc.std.y|
|58 |tbodyacc.std.z |
|59 |tgravityacc.std.x|
|60 |tgravityacc.std.y |
|61 |tgravityacc.std.z|
|62 |tbodyaccjerk.std.x |
|63 |tbodyaccjerk.std.y|
|64 |tbodyaccjerk.std.z |
|65 |tbodygyro.std.x|
|66 |tbodygyro.std.y |
|67 |tbodygyro.std.z|
|68 |tbodygyrojerk.std.x |
|69 |tbodygyrojerk.std.y|
|70 |tbodygyrojerk.std.z |
|71 |tbodyaccmag.std|
|72 |tgravityaccmag.std |
|73 |tbodyaccjerkmag.std|
|74 |tbodygyromag.std |
|75 |tbodygyrojerkmag.std|
|76 |fbodyacc.std.x |
|77 |fbodyacc.std.y|
|78 |fbodyacc.std.z |
|79 |fbodyaccjerk.std.x|
|80 |fbodyaccjerk.std.y |
|81 |fbodyaccjerk.std.z|
|82 |fbodygyro.std.x |
|83 |fbodygyro.std.y|
|84 |fbodygyro.std.z |
|85 |fbodyaccmag.std|
|86 |fbodybodyaccjerkmag.std |
|87 |fbodybodygyromag.std|
|88 |fbodybodygyrojerkmag.std |