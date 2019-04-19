## Description: Getting and cleaning data week 4 project to create a tidy dataset
## Program Name: run_analysis.R
## Author: Sathya Thiruvengadam

## set working directory using setwd()

if (!file.exists("./project")){
  dir.create("./project")
}

### Download files ###
fileurl="https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileurl,destfile = "./project/Orig_dataset.zip", mode = "wb")
datedownloaded<-date()

zipf<-"./project/Orig_dataset.zip"
outdir <- "./project/files"
unzip(zipf,exdir=outdir)

library(dplyr)

### Read data 
features_train <- read.table("./project/files/UCI HAR dataset/train/X_train.txt")
activity_train <- read.table("./project/files/UCI HAR dataset/train/Y_train.txt")
sub_train <- read.table("./project/files/UCI HAR dataset/train/subject_train.txt")

features_test <- read.table("./project/files/UCI HAR dataset/test/X_test.txt")
activity_test <- read.table("./project/files/UCI HAR dataset/test/Y_test.txt")
sub_test <- read.table("./project/files/UCI HAR dataset/test/subject_test.txt")

activity_labels <- read.table("./project/files/UCI HAR dataset/activity_labels.txt")

var_names <- read.table("./project/files/UCI HAR dataset/features.txt")

## Merge test and train data
features_total <- rbind(features_train, features_test)
activity_total <- rbind(activity_train, activity_test)
sub_total <- rbind(sub_train, sub_test)

## change column names
colnames(activity_total) <- "activityN"
colnames(activity_labels) <- c("activityN","activity label")
colnames(sub_total) <- "subject"

## Get factors of activity names
activity <- left_join(activity_total,activity_labels,by="activityN")[,2]

#Rename features_total columns using columns from var_names from features.txt
names(features_total) <- var_names$V2


###Create one large dataset with only these variables: sub_total,  Activity,  features_total
dataset <- cbind(sub_total, activity)
dataset <- cbind(dataset, features_total)

###Create New datasets by extracting only the measurements on the mean and standard deviation for each measurement
subFeaturesNames <- var_names$V2[grep("mean\\(\\)|std\\(\\)", var_names$V2)]
datanames <- c("subject", "activity", as.character(subFeaturesNames))
dataset <- subset(dataset, select=datanames)

## Rename the columns of the large dataset using more descriptive activity names
names(dataset)<-gsub("^t", "time", names(dataset))
names(dataset)<-gsub("^f", "frequency", names(dataset))
names(dataset)<-gsub("Acc", "Accelerometer", names(dataset))
names(dataset)<-gsub("Gyro", "Gyroscope", names(dataset))
names(dataset)<-gsub("Mag", "Magnitude", names(dataset))
names(dataset)<-gsub("BodyBody", "Body", names(dataset))

## Create a second, independent tidy data set with the average of each variable for each activity and each subject
Seconddataset<-aggregate(. ~subject + activity, dataset, mean)
Seconddataset<-Seconddataset[order(Seconddataset$subject,Seconddataset$activity),]

write.table(Seconddataset, file="./project/tidy.txt", row.names = FALSE, col.names = TRUE)
