### install the necessary "plyr" package 
install.packages("plyr")
library("plyr")

### download the necessary data given the URL
fileUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = "d:/documents/r/data/projectwk4.zip")

### set the working directory
setwd("d:/documents/r/data/UCI HAR Dataset")
getwd()
list.files()

### read the training files and assign to a variable
xtraining<-read.table("train/X_train.txt")
ytraining<-read.table("train/y_train.txt")
training_subject<-read.table("train/subject_train.txt")

### read the test files and assign to a variable
xtest<-read.table("test/X_test.txt")
ytest<-read.table(test/y_test.txt)
ytest<-read.table("test/y_test.txt")
subject_test<-read.table("test/subject_test.txt")

### bind or merge the training and test files and assign to a variable
xdata<-rbind(xtraining, xtest)
ydata<-rbind(ytraining, ytest)
datasubject<-rbind(training_subject, subject_test)

### reads the feature file and extract the mean and standard deviations columns
feat<-read.table("features.txt")
mean_std_of_feat<-grep("-(meam|std)\\(\\)", feat[,2])

### 
xdata<-xdata[,mean_std_of_feat]
names(xdata)<-feat[mean_std_of_feat, 2]

### reads the activity and substitute the ydata to activity
activity<-read.table("activity_labels.txt")

ydata[,1]<-activity[ydata[,1],2]
names(ydata)<-"activity"

names(datasubject)<-"subject"

##bin the three datasets into one dataset
agg_training_data<-cbind(xdata, ydata, datasubject)
