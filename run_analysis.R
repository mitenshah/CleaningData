library(dplyr)

## Read from files
features <- read.table("UCI HAR Dataset/features.txt")
activities <- read.table("UCI HAR Dataset/activity_labels.txt")

## Test file

### Obtain subjects
test_sub <- read.table("UCI HAR Dataset/test/subject_test.txt")
names(test_sub) <- "subjectname"

### Obtain activities
test_act <- read.table("UCI HAR Dataset/test/y_test.txt")
names(test_act) <- "activity"
test_act[,1] <- factor(test_act[,1], labels=activities[,2])

### Obtain test feature values
test <- read.table("UCI HAR Dataset/test/X_test.txt")
names(test) <- make.names(names=gsub(",|-|\\(|\\)","",features[,2]), unique=TRUE)

### Combine the columns
test <- cbind(test_sub, test_act, test)

## Train file

### Obtain subjects
train_sub <- read.table("UCI HAR Dataset/train/subject_train.txt")
names(train_sub) <- "subjectname"

### Obtain activities
train_act <- read.table("UCI HAR Dataset/train/y_train.txt")
names(train_act) <- "activity"
train_act[,1] <- factor(train_act[,1], labels=activities[,2])

### Obtain train feature values
train <- read.table("UCI HAR Dataset/train/X_train.txt")
names(train) <- make.names(names=gsub(",|-|\\(|\\)","",features[,2]), unique=TRUE)

### Combine the columns
train <- cbind(train_sub, train_act, train)

## Merge the test and training data
mergedata <- rbind(test, train)

## Extract the mean and standard deviation columns
extractdata <- select(mergedata, activity, subjectname, matches("mean|std"))

## Group the data based on activity and subject name
groupdata <- group_by(extractdata, activity, subjectname)

## Find average of each variable in the grouped data
summarisedata <- summarise_each(groupdata, funs(mean))