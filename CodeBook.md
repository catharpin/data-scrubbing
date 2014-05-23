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

Outputs
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
