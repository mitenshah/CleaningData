# Getting and Cleaning Data Assignment

## Reading Given Data
Use *read.table()* to read the data for the given assignment.

## Obtaining labels
Obtain the names of columns from the features.txt file using.
Obtain the names of activities from the activities.txt file.

## Importing Data
Given two sets of data: test and training.
Firstly, import from test data, apply column names and map the activity codes to activity names.
Similarly, import from training data, apply column names and map the activity codes to activity names.
In both the cases use *cbind()* to append the columns.

## Merging Data
Using *rbind()*, combine the training and test data.

## Extract required columns
Using *select()* combined with regex expression obtain the columns referring to mean or standard deviation.

## Group the data
Group the data using *group_by()* with respect to activity and subject name.

## Obtain averages
For each variable, obtain the average for each activity and subject name using *summarise_each()*.
