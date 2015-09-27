# The Raw Data
The data for this project is collected from the accelerometers from the Samsung Galaxy S smartphone. In the experiment, 30 volunteers of ages 19-48 years performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a Samsung Galaxy SII smartphone on the waist. The data set was then randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

* Data file: [https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip] (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
* Original Codebook: [http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones] (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

The dataset used for this project includes the following files:

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

-  'test/subject_test.txt':  Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.

Notes: 
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

#Transformation
1. The train and test sets are appended with the subject and activity data accordingly.
2. Only the variables with mean() and std() are selected from each set.
3. The train and test sets are then combined, stacked vertically.
4. Descriptive activity labels and descriptive variable names replace codes. Parantheses are removed, and variable names are made to be readable by R script and unique.
5. An independent tidy data set with the average of each variable for each activity and each subject is created.
The output of that table is tidy_data.txt