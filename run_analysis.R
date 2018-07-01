##You should create one R script called run_analysis.R that does the following.

# 1.Merges the training and the test sets to create one data set.
# 2.Extracts only the measurements on the mean and standard deviation for each measurement.
# 3.Uses descriptive activity names to name the activities in the data set
# 4.Appropriately labels the data set with descriptive variable names.
# 5.From the data set in step 4, creates a second, independent tidy data set with the average 
#  of each variable for each activity and each subject.

require("data.table")

# Reading trainings,testing data tables


x_train <- read.table("train/X_train.txt")
y_train <- read.table("train/y_train.txt")
subject_train <- read.table("train/subject_train.txt")
x_test <- read.table("test/X_test.txt")
y_test <- read.table("test/y_test.txt")
subject_test <- read.table("test/subject_test.txt")


features <- read.table('features.txt')     # Reading feature vector
activityLabels = read.table('activity_labels.txt')    # Reading activity labels


# Section below assigns the COlumn Names

colnames(x_train) <- features[,2]     #Assigning the col names to x_train dataset from features dataset
colnames(y_train) <-"activityId"
colnames(subject_train) <- "subjectId"
colnames(x_test) <- features[,2]    #Assigning the col names to x_test dataset from features dataset
colnames(y_test) <- "activityId"
colnames(subject_test) <- "subjectId"
colnames(activityLabels) <- c('activityId','activityType')


# Merging Datasets train+test
mrg_train <- cbind(y_train, subject_train, x_train)
mrg_test <- cbind(y_test, subject_test, x_test)
setAllInOne <- rbind(mrg_train, mrg_test)

#Save Columnnames of the merged dataset to a vector
colNames <- colnames(setAllInOne)


#Retain Mactching columns to the pattern
mean_and_std <- (grepl("activityId" , colNames) | 
                   grepl("subjectId" , colNames) | 
                   grepl("mean.." , colNames) | 
                   grepl("std.." , colNames) 
)

setForMeanAndStd <- setAllInOne[ , mean_and_std == TRUE]


setWithActivityNames <- merge(setForMeanAndStd, activityLabels,
                              by='activityId',
                              all.x=TRUE)


#Calculate mean and order sets.
secondTidySet_1 <- aggregate( . ~subjectId + activityId, setWithActivityNames, mean)
secondTidySet <- secondTidySet_1[order(secTidySet$subjectId, secTidySet$activityId),]

#Save Data set to a file
write.table(secondTidySet, file = "tidy_data.txt",row.name=FALSE)
