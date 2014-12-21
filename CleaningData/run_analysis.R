## Download the exercise zip file
## download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",destfile="getdata-projectfiles-UCI HAR Dataset.zip",method="curl")
## Unzip the project zipfile
## unzip('./getdata-projectfiles-UCI HAR Dataset.zip')

library(plyr)
library(reshape2)

## Read features and activities

features<-read.table('./UCI HAR Dataset/features.txt')
activities<-read.table('./UCI HAR Dataset/activity_labels.txt')

## Labeling the data set with descriptive variable names

## Test data

XTest <- read.table('./UCI HAR Dataset/test/X_test.txt')
names(XTest) <- (features$V2)
YTest <- read.table('./UCI HAR Dataset/test/y_test.txt')
colnames(YTest) <- "Activity"
subjectTest <- read.table('./UCI HAR Dataset/test/subject_test.txt')
colnames(subjectTest) <- "Subject"

test <- cbind(Ytest,Xtest)
testComplete <- cbind(subjectTest,test)

## Training data

XTrain <- read.table('./UCI HAR Dataset/train/X_train.txt')
names(XTrain) <- (features$V2)
YTrain <- read.table("././UCI HAR Dataset/train/y_train.txt")
colnames(Ytrain) <- "Activity"
subjectTrain <- read.table("./UCI HAR Dataset/train/subject_train.txt")
colnames(subjectTrain) <- "Subject"

train <- cbind(Ytrain,Xtrain)
trainComplete <- cbind(subjectTrain,train)

## Create the complete data set

completeData <- rbind(testComplete,trainComplete)

## Include only mean() and std()

featureSubset <- grep("std()",names(completeData),value=TRUE,fixed=TRUE)
featureSubset <- append(featureSubset,(grep("mean()",names(fullData),value=TRUE,fixed=TRUE)))
featureSubset <- append(featureSubset,"Activity",0)
featureSubset <- append(featureSubset,"Subject",0)
tidyData <- fullData[,featureSubset]

## Descriptive activity names to name the activities in the data set

tidyData$Activity[tidyData$Activity == "1"] <- "WALKING"
tidyData$Activity[tidyData$Activity == "2"] <- "WALKING_UPSTAIRS"
tidyData$Activity[tidyData$Activity == "3"] <- "WALKING_DOWNSTAIRS"
tidyData$Activity[tidyData$Activity == "4"] <- "SITTING"
tidyData$Activity[tidyData$Activity == "5"] <- "STANDING"
tidyData$Activity[tidyData$Activity == "6"] <- "LAYING"

## Create average of each variable

moltenData <- melt(tidyData, id=c("Activity","Subject"))
meansData <- dcast(moltenData, Subject + Activity ~ variable,mean)

## Create CSV files
?write.table
write.table(meansData,"./MeansData.txt",sep=",",row.names = FALSE)
write.table(tidyData,"./tidyData.csv",sep=",")