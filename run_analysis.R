# load the dplyr package
library(dplyr)
# allow the whole final dataset to be printed
options(dplyr.print_max = 200, dplyr.width = Inf)

# download datasets
#download.file(url="https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", destfile="getdata-projectfiles-UCI HAR Dataset.zip", method='curl')
# unzip the zip file
#unzip("getdata-projectfiles-UCI HAR Dataset.zip")

# load all datasets, activities, subjects and features
testDataSet <- read.table(file="UCI HAR Dataset/test/X_test.txt")
testDataSetLabels <- read.table(file="UCI HAR Dataset/test/y_test.txt")
testDataSetSubjects <- read.table(file="UCI HAR Dataset/test/subject_test.txt")
trainDataSet <- read.table(file="UCI HAR Dataset/train/X_train.txt")
trainDataSetLabels <- read.table(file="UCI HAR Dataset/train/y_train.txt")
trainDataSetSubjects <- read.table(file="UCI HAR Dataset/train/subject_train.txt")
activityLabels <- read.table(file="UCI HAR Dataset/activity_labels.txt")
features <- read.table(file="UCI HAR Dataset/features.txt")

# tidy activityLabels
# change to lower case and remove underscores
activityLabels$V2 <- gsub("_","",tolower(activityLabels$V2))

# build testDataSet
# add names to testDataSet
names(testDataSet) <- features$V2
# add activities to test dataset
testDataSet <- cbind(testDataSetLabels, testDataSet)
colnames(testDataSet)[1] <- "activity"
# add subjects to test dataset
testDataSet <- cbind(testDataSetSubjects$V1, testDataSet)
colnames(testDataSet)[1] <- "subject"

# build trainDataSet
# add names to trainDataSet
names(trainDataSet) <- features$V2
# add activities to test dataset
trainDataSet <- cbind(trainDataSetLabels, trainDataSet)
colnames(trainDataSet)[1] <- "activity"
# add subjects to train dataset
trainDataSet <- cbind(trainDataSetSubjects$V1, trainDataSet)
colnames(trainDataSet)[1] <- "subject"

# merge the two datasets
completeDataSet <- rbind(testDataSet,trainDataSet)

# get columns that have mean() or std() in their names. keep the activity and subject
getMeanAndDev <- grep('mean\\(\\)|std\\(\\)|^activity$|^subject$', names(completeDataSet))
# create new data frame with requested columns
meanAndStd <- completeDataSet[getMeanAndDev]

# replace activity id with activity name from activityLabels
meanAndStd$activity <- activityLabels$V2[match(meanAndStd$activity, activityLabels$V1)]

# tidy column names
# remove ()
names(meanAndStd) <- gsub("\\(\\)","",names(meanAndStd))
# replace t with time
names(meanAndStd) <- gsub("^t","time_",names(meanAndStd))
# replace f with frequency
names(meanAndStd) <- gsub("^f","frequency_",names(meanAndStd))
# replace - with .
names(meanAndStd) <- gsub("-","_",names(meanAndStd))
# lower case xyz at end of line
names(meanAndStd) <- gsub("([XYZ]$)",'\\L\\1',names(meanAndStd),perl=TRUE)

# get the mean and std dev of all features grouped by activity and subject
meanAndStd %>% group_by(activity,subject) %>% summarise_each(funs(mean)) -> avgActivitySubject
# save the resulting dataset to a file
write.table(avgActivitySubject,file="avgActivitySubject.R",row.name=FALSE)
print("the new dataset is now available as avgActivitySubject in your current workspace, or as file named avgActivitySubject.R in your cwd")
