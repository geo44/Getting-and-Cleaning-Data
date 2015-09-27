#This script will take datasets from Samsung, make one table from the train, test, subject
#and activity sets, and create a tidy dataset with descriptive labels.

#Download data from website and store zip in working directory. Data is then manually unzipped.
#You should skip this bit of code if you already have the data.
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = "./Samsung.zip", mode = "wb")

#Load each dataset into R from working directory.
train <- read.table("./UCI HAR Dataset/train/X_train.txt")
test <- read.table("./UCI HAR Dataset/test/X_test.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
labels_train <- read.table("./UCI HAR Dataset/train/Y_train.txt")
labels_test <- read.table("./UCI HAR Dataset/test/Y_test.txt")
activity <- read.table("./UCI HAR Dataset/activity_labels.txt")
features <- read.table("./UCI HAR Dataset/features.txt")

#Change variable name from V1 to apporpriate name in subject and labels sets.
subject_train <- rename(subject_train, subject= V1)
subject_test <- rename(subject_test, subject = V1)
labels_train <- rename(labels_train, activity = V1)
labels_test <- rename(labels_test, activity = V1)

#Append subject and activity data to train and test sets by adding new columns.
train.s <- cbind(train, subject_train, labels_train)
test.s <- cbind(test, subject_test, labels_test)

#Filters out columns with mean() and std() in the variable names according to features set,
#preserving the subject and activity columns.
feat.f <- filter(features, grepl("mean()|std()", V2))
train.f <- select(train.s, feat.f$V1, 562:563)
test.f <- select(test.s, feat.f$V1, 562:563)

#Combine train and test sets, stacking train on top of test.
dat <- rbind(train.f, test.f)

dat <- tbl_df(dat)

#Change activity labels to descriptive names.
dat$activity <- activity$V2[dat$activity]

#Remove parantheses from variables and make them valid and unique names in R.
#Then replace the code variable names in the dataset.
feat <- feat.f$V2
f <- gsub("[()]", "", feat)
f <- make.names(f, unique = TRUE)

colnames(dat)[1:79] <- f

#Create an independent tidy data set with the average of each variable for 
#each activity and each subject and make it the output of the program.
result <- dat %>% group_by(activity, subject) %>% summarize_each(funs(mean))

write.table(result, file = "tidy_data.txt", row.names = FALSE)