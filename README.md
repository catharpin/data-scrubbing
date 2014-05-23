data-scrubbing
==============

 This project contains one R script, `run_analysis.R`, that:

* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each 
  measurement.
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive activity names. 
* Creates a second, independent tidy data set with the average of each variable 
  for each activity and each subject. 

Usage
-----

This script will detect whether the file `activity.zip` is present in the 
current working directory.  If it isn't,
it will retrieve the data file.

If the `/data` subdirectory is present in the working directory, the script 
will assume the raw file has been unpacked.
Otherwise it will unpack the `activity.zip` file into `/data`.

Produces a file `mean_observed_values.txt` in the working directory as output.

Assumptions
-----------
In bullet five, "each variable" is taken to mean only those 
variables extracted in bullet two.
