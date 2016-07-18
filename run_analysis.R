# Read in the relevant files
xTrain <- read.table("UCI HAR Dataset/train/X_train.txt")
yTrain <- read.table("UCI HAR Dataset/train/y_train.txt")
subjectTrain <- read.table("UCI HAR Dataset/train/subject_train.txt")
xTest <- read.table("UCI HAR Dataset/test/X_test.txt")
yTest <- read.table("UCI HAR Dataset/test/y_test.txt")
subjectTest <- read.table("UCI HAR Dataset/test/subject_test.txt")
feature <- read.table("UCI HAR Dataset/features.txt")

# Assign temporary column names based on features.txt
colnames(xTrain) <- feature$V2
colnames(yTrain) <- "activity"
colnames(subjectTrain) <- "subject"
colnames(xTest) <- feature$V2
colnames(yTest) <- "activity"
colnames(subjectTest) <- "subject"

# Merge the data sets together. I decided to have yTrain/Test come first so it's
#   easier to reference when viewing the data set in RStudio. (Don't have to
#   scroll all the way to the right)
# (step #1 in instructions)
xMerge <- rbind(xTrain, xTest)
yMerge <- rbind(yTrain, yTest)
subjectMerge <- rbind(subjectTrain, subjectTest)
dataMerge <- cbind(subjectMerge, yMerge, xMerge)

# Using regex, extract only the columns in which the name contains either
#   "activity" (the very first column), "mean()", or "std()" as specified by
#   the assignment directions.
# (step #2 in instructions)
dataMerge <- dataMerge[,grepl("subject|activity|(mean|std)\\(\\)",names(dataMerge))]

# Assigning descriptive activity names to the activities in the dataset. Names
#   taken from activity_labels.txt
# (step #3 in instructions)
dataMerge$activity[dataMerge$activity == "1"] <- "Walking"
dataMerge$activity[dataMerge$activity == "2"] <- "Walking Upstairs"
dataMerge$activity[dataMerge$activity == "3"] <- "Walking Downstairs"
dataMerge$activity[dataMerge$activity == "4"] <- "Sitting"
dataMerge$activity[dataMerge$activity == "5"] <- "Standing"
dataMerge$activity[dataMerge$activity == "6"] <- "Laying"

# Assign the data frame descriptive names.
# (step #4 in instructions)
descriptive <- read.csv("descriptive.csv")
colnames(dataMerge) <- names(descriptive)

# Creating a second data set with the mean of each variable based on the activity above.
#   Accomplished using the dplyr package.
# (step #5 in instructions)
library(dplyr)
meanData <- dataMerge %>% group_by(Subject, Activity) %>% summarize_each(funs(mean))
write.table(meanData, "tidyData.txt", row.name=FALSE)