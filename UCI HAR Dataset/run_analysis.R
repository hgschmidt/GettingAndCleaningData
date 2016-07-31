
library(data.table)
#Place this script in the "UCI HAR Dataset folder"


# 1. Obtain the activity labels
actlab <- read.table("activity_labels.txt", sep = "")


#  2. Read the train and test datasets, and obtain the activity and subject names
Xtrain <- read.table("./train/X_train.txt", header = FALSE)
Ytrain <- read.table("train/y_train.txt", header = FALSE)
subtrain <- read.table("train/subject_train.txt", header = FALSE)
colnames(Ytrain) <- "Activity"
colnames(subtrain) <- "Subjects"



Xtest <- read.table("./test/X_test.txt", header = FALSE)
Ytest <- read.table("test/y_test.txt", header = FALSE)
subtest <- read.table("./test/subject_test.txt", header = FALSE)
colnames(Ytest) <- "Activity"
colnames(subtest) <- "Subjects"

# 3.  Now combine the individual data objects into their own data frames

train <- cbind(Xtrain, Ytrain, subtrain)
test <- cbind(Xtest, Ytest, subtest)

# 4.  Produce single data set

mrgData <- rbind(train, test)

#5. Assign the Activity columns the levels in actlab

levels(mrgData$Activity) <- levels(actlab)
#(for some reaons this doesn't work if you do it first)


#6. Obtain Mean and Standard devations for all variables in mrgData
mrgMean <- lapply(mrgData, mean, na.rm = TRUE)
mrgSD <- lapply(mrgData, sd, na.rm = TRUE)

#7.  Make tidy dataset
mrgTable <- data.table(mrgData)
tidyset <-mrgTable[,lapply(.SD,mean),by="Activity,Subjects"]
write.csv(tidyset, file="TidyData.csv")




