# run_analysis.R
# Data collected from Samsung Galaxy S II mobile phone is
# cleaned and analysed. Resulting data is output to a tidy
# data file named "tidy_data.txt"

library(dplyr)

# Step 1: Read data 

# Declare file variables

url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
zipfilename<-"UCI HAR Dataset.zip"
datadir<-"./data"
datapath<-"UCI HAR Dataset"

# Check if file and directory already exist and retrieve if not

if(!file.exists(zipfilename))
  download.file(url, zipfilename, mode = "wb")
        
# Unzip file into datadir

unzip(zipfilename, exdir = datadir)

# Read test data and cbind to create one training data set
trainSubject<-read.table(file.path(datadir,datapath,"train/subject_train.txt"))
trainLabels<-read.table(file.path(datadir,datapath,"train/y_train.txt"))
trainValues<-read.table(file.path(datadir,datapath,"train/X_train.txt"))
trainData<-cbind(trainSubject, trainLabels, trainValues)

# Read test data and cbind to create one test data set
testSubject<-read.table(file.path(datadir,datapath,"test/subject_test.txt"))
testLabels<-read.table(file.path(datadir,datapath,"test/y_test.txt"))
testValues<-read.table(file.path(datadir,datapath,"test/X_test.txt"))
testData<-cbind(testSubject, testLabels, testValues)

#Merge testData and trainData with rbind to create allData
allData<-rbind(trainData, testData)

#Read activity names and update column names
activityLabels<-read.table(file.path(datadir,datapath,"activity_labels.txt"))
colnames(activityLabels) <- c("activityId", "activityLabel")

#Read in features and extract wanted measure (Mean, STD)
features<-read.table(file.path(datadir,datapath,"features.txt"), as.is = TRUE)
wantedMeasures<-grep(".*mean.*|.*std.*", features[,2])
wantedMeasures.names <- features[wantedMeasures,2]
wantedMeasures.names = gsub('-mean', 'Mean', wantedMeasures.names)
wantedMeasures.names = gsub('-std', 'Std', wantedMeasures.names)
wantedMeasures.names = gsub('[-()]','',wantedMeasures.names)

#Add column names to allData
colnames(allData) <- c("subject", "activity", wantedMeasures.names)

#Turn activities and subjects into factors
allData$activity <- factor(allData$activity, levels=activityLabels[, 1], labels=activityLabels[, 2])
allData$subject <- as.factor(allData$subject)

#Group by activity and subject and calculate mean of each measure
allDataMeans <- aggregate(. ~subject + activity, allData, mean)

#Write output to text file "tidy_data.txt"
write.table(allDataMeans,file="tidy_data.txt",row.names=FALSE)
