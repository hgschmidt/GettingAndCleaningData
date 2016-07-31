
#Place this script in the "UCI HAR Dataset folder"


# Obtain the activity labels
actlab <- read.table("activity_labels.txt", sep = "")


#read the train and test datasets, and add the activities as levels
Xtrain <- read.table("./train/X_train.txt", header = FALSE)
Ytrain <- read.table("train/y_train.txt")
subtrain <- read.table("train/subject_train.txt")
colnames(Ytest) <- "Activity"
levels(Ytrain$Activity) <- actlab 



Xtest <- read.table("./test/X_test.txt", header = FALSE)
Ytest <- read.table("test/y_test.txt")
subtest <- read.table("./test/subject_test.txt")
colnames(Ytest) <- "Activity"
levels(Xtrain$Activity) <- actlab 







