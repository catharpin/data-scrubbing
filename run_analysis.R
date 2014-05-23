library(reshape2)

## Retrieve the dataset from cloudfront if it's not already present.

if (!file.exists("./activity.zip")){
    download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",destfile="./activity.zip")
} else {
    message("Raw data archive already present.")
}

if (!file.exists("./data/UCI HAR Dataset")){
    unzip("activity.zip",exdir="./data")
} else {
    message ("Data directory present - assuming already unpacked.")
}

## Create dataframes from the raw data files.

activities <- read.table("data/UCI HAR Dataset/activity_labels.txt",
                         stringsAsFactors=FALSE,
                         col.names=c("code","activity"))

features <- read.table("data/UCI HAR Dataset/features.txt",
                       stringsAsFactors=FALSE,
                       col.names=c("code","feature"))


## since both the activities and features are in ascending order, we can 
## simplify them to vectors.

activities <- activities$activity
features <- features$feature

## The features vector will be added as column names to the raw data frame.

message("Loading training data.")

traindata <- read.table("data/UCI HAR Dataset/train/X_train.txt",
                        stringsAsFactors=FALSE,
                        col.names=features)
                        
traindata.activity <- read.table("data/UCI HAR Dataset/train/y_train.txt",
                                 stringsAsFactors=FALSE, 
                                 col.names=c("activity.code"))

traindata.subject <- read.table("data/UCI HAR Dataset/train/subject_train.txt",
                                stringsAsFactors=FALSE,
                                col.names=c("subject.code"))

## Append the activity (as text) and subject ID to the training data.
## Addresses Objective 3/4 (meaningful column names)

traindata$activity <- activities[traindata.activity$activity.code]
traindata$subject <- traindata.subject$subject.code
traindata$sourcefile <- 'TRAIN'

## Now repeat the process for the test data.

message("Loading test data.")

testdata <- read.table("data/UCI HAR Dataset/test/X_test.txt",
                        stringsAsFactors=FALSE,
                        col.names=features)

testdata.activity <- read.table("data/UCI HAR Dataset/test/y_test.txt",
                                 stringsAsFactors=FALSE, 
                                 col.names=c("activity.code"))

testdata.subject <- read.table("data/UCI HAR Dataset/test/subject_test.txt",
                                stringsAsFactors=FALSE,
                                col.names=c("subject.code"))

testdata$activity <- activities[testdata.activity$activity.code]
testdata$subject <- testdata.subject$subject.code
testdata$sourcefile <- 'TEST'



## Objective 1. Merge training and test data into a single dataset.

combineddata <- merge(testdata,traindata,all=TRUE)

combineddata <- combineddata[order(combineddata$subject,combineddata$activity),]

rm("testdata","testdata.activity","testdata.subject","traindata",
   "traindata.activity","traindata.subject")

## Objective 2. Extract only the mean and standard deviation from each 
## measurement. 

## I am interpreting this to mean extract only those features containing
## mean() and std() in their names (which specifically excludes the angle.*() 
## features)

filterdata <- combineddata[c("subject","activity",
                         grep(".mean[^F]|.std.",colnames(combineddata),value=TRUE,perl=TRUE))]

## Eliminate the extraneous ".." from column names - these came from
## the parentheses in the input data.

colnames(filterdata) <- gsub("\\.\\.","",colnames(filterdata))
filterdata$subject <- as.factor(filterdata$subject)
filterdata$activity <- as.factor(filterdata$activity)

rm("combineddata","activities","features")

message("Load complete.")

transform <- melt(filterdata,id=c("subject","activity"))
tidydata <- dcast(transform, subject + activity ~ variable, fun.aggregate = mean)
colnames(tidydata) <- c("subject","activity",paste("mean.",names(tidydata)[3:68],sep=""))
rm("transform")

write.csv(tidydata,file="mean_observed_values.csv")
