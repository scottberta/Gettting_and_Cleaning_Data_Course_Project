# run_analysis.R
# Data collected from Samsung Galaxy S II mobile phone is
# cleaned and analysed. Resulting data is oputput to a tidy
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

# Read Subject data and combine to one Subject data set
trainSubject<-read.table(file.path(datadir,datapath,"train/subject_train.txt"))
testSubject<-read.table(file.path(datadir,datapath,"test/subject_test.txt"))
subjectData <- rbind(trainSubject, testSubject)

# Read Labels and combine to create one data set
trainLabels<-read.table(file.path(datadir,datapath,"train/y_train.txt"))
testLabels<-read.table(file.path(datadir,datapath,"test/y_test.txt"))
labelData<- rbind(trainLabels, testLabels)

# Read features data and combine to create one data set
trainFeatures <-read.table(file.path(datadir,datapath,"train/X_train.txt"))
testFeatures<-read.table(file.path(datadir,datapath,"test/X_test.txt"))
featuresData <- rbind(trainFeatures,testFeatures)

# Rename column names in featuresData with names from features.txt
features<-read.table(file.path(datadir,datapath,"features.txt"), as.is = TRUE)
colnames(featuresData)<-t(features[2])

#Merge subject, label and feature data with cbind to create allData
colnames(subjectData)<-"Subject"
colnames(labelData)<-"Activity"
allData<-cbind(subjectData, labelData, featuresData)

#Read activity names and update column names
activityLabels<-read.table(file.path(datadir,datapath,"activity_labels.txt"))
colnames(activityLabels) <- c("activityId", "activityLabel")

# Determine which columns to keep (containing Mean and Std)
wantedFeatures <-grep(".*mean.*|.*std.*", names(allData))
keepColumns <- c(1,2,wantedFeatures)

# Extract columns to keep from allData
allDataMeans <- allData[,keepColumns]

# Apply descriptive variable names to allDataMeans

names(allDataMeans)<-gsub("Acc", "Accelerometer", names(allDataMeans))
names(allDataMeans)<-gsub("Gyro", "Gyroscope", names(allDataMeans))
names(allDataMeans)<-gsub("BodyBody", "Body", names(allDataMeans))
names(allDataMeans)<-gsub("Mag", "Magnitude", names(allDataMeans))
names(allDataMeans)<-gsub("^t", "Time", names(allDataMeans))
names(allDataMeans)<-gsub("^f", "Frequency", names(allDataMeans))
names(allDataMeans)<-gsub("tBody", "TimeBody", names(allDataMeans))
names(allDataMeans)<-gsub("-mean()", "Mean", names(allDataMeans), ignore.case = TRUE)
names(allDataMeans)<-gsub("-std()", "STD", names(allDataMeans), ignore.case = TRUE)
names(allDataMeans)<-gsub("-freq()", "Frequency", names(allDataMeans), ignore.case = TRUE)
names(allDataMeans)<-gsub("angle", "Angle", names(allDataMeans))
names(allDataMeans)<-gsub("gravity", "Gravity", names(allDataMeans))

#Turn activities and subjects into factors
allDataMeans$Activity <- factor(allDataMeans$Activity, levels=activityLabels[, 1], labels=activityLabels[, 2])
allDataMeans$Subject <- as.factor(allDataMeans$Subject)

#Group by activity and subject and calculate mean of each measure
allDataMeansOutput <- aggregate(. ~Subject + Activity, allDataMeans, mean)

#Write output to text file "tidy_data.txt"
write.table(allDataMeansOutput,file="tidy_data.txt",row.names=FALSE)