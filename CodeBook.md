Code Book
======================
The data used in this project is from [Anguita et al.][1], obtained from
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.

Data Transformations
--------------------
The original data set contains 561 numeric measurements, plus two labels 
signifying the test subject and the activity the subject was engaging in at
the time of the measurement.

There are thirty subjects in the study, numbered 1 through 30.  Each subject
engaged in six activities, encoded as `LAYING`, `SITTING`, `STANDING`, `WALKING`,
`WALKING_DOWNSTAIRS`, and `WALKING_UPSTAIRS`.

From these measurements, only those representing mean and standard deviations
of the raw data were extracted.  This was determined by name of the measurement
containing "mean" (not followed by Freq) and "std", delimited by periods (which
were transformed from parentheses and dashes in the original data.)

Where the measurement ends in X, Y, or Z, this represents the axis in which
the measurement was taken.

Following this, the arithmetic means of each of these values were taken, by 
subject and by activity.

To distinguish these values from the original data, while still retaining 
connection to the original names, they are prefixed by "mean.".  

Variables
---------------
position | name | datatype
--------|-----|---------
01 | subject | factor(chr)
02 | activity | factor(chr)
03 | mean.tBodyAcc.mean.X | numeric
04 | mean.tBodyAcc.mean.Y | numeric
05 | mean.tBodyAcc.mean.Z | numeric
06 | mean.tBodyAcc.std.X | numeric
07 | mean.tBodyAcc.std.Y | numeric
08 | mean.tBodyAcc.std.Z | numeric
09 | mean.tGravityAcc.mean.X | numeric
10 | mean.tGravityAcc.mean.Y | numeric
11 | mean.tGravityAcc.mean.Z | numeric
12 | mean.tGravityAcc.std.X | numeric
13 | mean.tGravityAcc.std.Y | numeric
14 | mean.tGravityAcc.std.Z | numeric
15 | mean.tBodyAccJerk.mean.X | numeric
16 | mean.tBodyAccJerk.mean.Y | numeric
17 | mean.tBodyAccJerk.mean.Z | numeric
18 | mean.tBodyAccJerk.std.X | numeric
19 | mean.tBodyAccJerk.std.Y | numeric
20 | mean.tBodyAccJerk.std.Z | numeric
21 | mean.tBodyGyro.mean.X | numeric
22 | mean.tBodyGyro.mean.Y | numeric
23 | mean.tBodyGyro.mean.Z | numeric
24 | mean.tBodyGyro.std.X | numeric
25 | mean.tBodyGyro.std.Y | numeric
26 | mean.tBodyGyro.std.Z | numeric
27 | mean.tBodyGyroJerk.mean.X | numeric
28 | mean.tBodyGyroJerk.mean.Y | numeric
29 | mean.tBodyGyroJerk.mean.Z | numeric
30 | mean.tBodyGyroJerk.std.X | numeric
31 | mean.tBodyGyroJerk.std.Y | numeric
32 | mean.tBodyGyroJerk.std.Z | numeric
33 | mean.tBodyAccMag.mean | numeric
34 | mean.tBodyAccMag.std | numeric
35 | mean.tGravityAccMag.mean | numeric
36 | mean.tGravityAccMag.std | numeric
37 | mean.tBodyAccJerkMag.mean | numeric
38 | mean.tBodyAccJerkMag.std | numeric
39 | mean.tBodyGyroMag.mean | numeric
40 | mean.tBodyGyroMag.std | numeric
41 | mean.tBodyGyroJerkMag.mean | numeric
42 | mean.tBodyGyroJerkMag.std | numeric
43 | mean.fBodyAcc.mean.X | numeric
44 | mean.fBodyAcc.mean.Y | numeric
45 | mean.fBodyAcc.mean.Z | numeric
46 | mean.fBodyAcc.std.X | numeric
47 | mean.fBodyAcc.std.Y | numeric
48 | mean.fBodyAcc.std.Z | numeric
49 | mean.fBodyAccJerk.mean.X | numeric
50 | mean.fBodyAccJerk.mean.Y | numeric
51 | mean.fBodyAccJerk.mean.Z | numeric
52 | mean.fBodyAccJerk.std.X | numeric
53 | mean.fBodyAccJerk.std.Y | numeric
54 | mean.fBodyAccJerk.std.Z | numeric
55 | mean.fBodyGyro.mean.X | numeric
56 | mean.fBodyGyro.mean.Y | numeric
57 | mean.fBodyGyro.mean.Z | numeric
58 | mean.fBodyGyro.std.X | numeric
59 | mean.fBodyGyro.std.Y | numeric
60 | mean.fBodyGyro.std.Z | numeric
61 | mean.fBodyAccMag.mean | numeric
62 | mean.fBodyAccMag.std | numeric
63 | mean.fBodyBodyAccJerkMag.mean | numeric
64 | mean.fBodyBodyAccJerkMag.std | numeric
65 | mean.fBodyBodyGyroMag.mean | numeric
66 | mean.fBodyBodyGyroMag.std | numeric
67 | mean.fBodyBodyGyroJerkMag.mean | numeric
68 | mean.fBodyBodyGyroJerkMag.std | numeric

Output and Retained Data
---------------
The `run_analysis.R` script cleans most of its intermediate results as they
are significant in size.

Retained items are:

* `filterdata` - the subset of the merged data that contains only mean() and
    std() observations.
* `tidydata` - the arithmetic means of each of the mean() and std() observations,
    summarized by subject and activity.
    
The contents of `tidydata` are also written to `mean_observed_values.txt` 
(CSV format) in the working directory.


References
---------------

[1]: Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
