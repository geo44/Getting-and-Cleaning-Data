# Course Project
In this repo you will find
- An R script: run_analysis.R
- A Codebook describing the variables and transformations of the dataset: CodeBook.md

##The R Script
This script will take datasets from Samsung, make one table from the train, test, subject,
and activity sets, and create a tidy dataset with descriptive labels.
- The first bit of code will download and store the zip file containing all the datasets which are then manually unzipped.
  *You should not run this if you already have the data in your working directory*
- The sets are then loaded into individual objects.
- The variable names in the subject and labels sets are changed from V1 to subject and activity, respectively, and then appended to the train and test sets in new columns.
- The train and test sets edited to only include variables with mean() and std(), according to the features set, in addition to subject and activity.
- The train and test sets are then combined vertically and stored in dat.
- The activity and variable codes are replaced with descriptive names. Variables are made to be valid in R and unique. Abbreviations are preserved for brevity of column names.
- An independent tiday data set (called result) with the average of each variable for each activity and each subject is created and made the output of the program.

The data can be read into R for easy viewing with the following bit of code
```
data <- read.table("./tidy_data.txt", header = TRUE)
View(data)
View(data)
```

##The Codebook
The codebook contains information on the variables and transformations to the dataset. It also includes links to the data file and its original codebook.