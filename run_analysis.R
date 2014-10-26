#download and unzipdata
fileUrl <- "http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile="./smartphones.zip")
sphones <- unzip("smartphones.zip")

#1. Merges the training and the test sets to create one data set.
y_train <- read.table("y_train.txt", sep="", header=F)
x_train <- read.table("x_train.txt", sep="", header=F) 
y_test <- read.table("y_test.txt", sep="", header=F)
x_test <- read.table("x_test.txt", sep="", header=F)
subject_train <- read.table("subject_train.txt", sep="", header=FALSE)
subject_test <- read.table("subject_test.txt", sep="", header=FALSE)
dim(subject_test)
dim(subject_train)
dim(y_train)
dim(y_test)
dim(x_train)
dim(x_test)
features <- read.table("features.txt", sep="", header=F)
dim(features)
names(x_test) <- features[[2]]
names(x_train) <- features[[2]]
subject <- rbind(subject_test, subject_train)
names(subject) <- "subject"
activity <- rbind(y_test, y_train)
names(activity) <- "activity"
measure <- rbind(x_test, x_train)
dim(measure)
datafull <- cbind(measure, subject, activity)
datafull[1:10, 1:10]
dim(datafull)

#2.Extracts only the measurements on the mean and standard deviation for each measurement.
head(names(datafull))
column_names<- names(datafull)
data_st <- datafull[, ((grepl("mean", column_names) & !grepl("meanFreq", column_names))|grepl("std", column_names)|grepl("subject", column_names)|grepl("activity", column_names))]
dim(data_st)

#3. Uses descriptive activity names to name the activities in the data set
data_st$activity <- factor(data_st$activity, labels = c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTINGS", "STANDINGS", "LYING"))
str(data_st$activity)
#4. Appropriately labels the data set with descriptive variable names. 
names(data_st)
colnames <- names(data_st)
from <- c("Acc", "Gyro", "Body", "Mag", "Jerk", "^t", "^f", "std", "X", "Y", "Z")
to <- c("accelerometer", "gyroscope", "body", "magnitude", "jerksignals", "time", "frequency", "standarddeviation", "Xaxis", "Yaxis", "Zaxis")
chg <- function(pattern, replacement, x) {
    for (i in seq(length(pattern)))
    {x <-  gsub(pattern[i], replacement[i], x)} 
    x
}
longnames <- chg(from, to, colnames)
names(data_st) <- longnames
longnames
#5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
library(dplyr)
cran <- tbl_df(data_st)
ncol(cran)
tidydata <- 
    cran2 %>%
    group_by(subject, activity)%>%
    summarise_each(funs(mean))
head(tidydata)
dim(tidydata)
write.table(tidydata, file = "tidydata.txt", row.name=FALSE)

#for codebook
names(tidydata)
str(tidydata)

