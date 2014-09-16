# Getting and Cleaning Data: Course Project

The HAR_means.txt dataset (referred to here as HAR_means) is derived from the UCI HAR (Human Activity Recognition) Dataset.  In other words, HAR_means is a summary of a subset of the UCI HAR Dataset.

The datasets include data for 30 subjects.  For each subject, there are multiple measurements for each of 6 activities.
Please see the 'README.txt' file for the UCI HAR Dataset for more details about how that dataset was created.

There is one row in the HAR_means dataset for each combination of subject and activity, for a total of 180 rows.

The first column is 'subjectid' and is a unique identifier for subjects (values are integers 1-30).

The second column is 'activity' and is a friendly name for activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING).

The remaining columns are the mean values for each of 66 variables (for a specific subject and activity).

The 66 variables (a subset of the variables in the UCI HAR Dataset) are the mean and standard deviation of the signals described in the 'features_info.txt' code book for the UCI HAR Dataset.

Please see the 'features_info.txt' for information about the signals and the logic used to create the variables.

The variable names in HAR_means are the same as in the UCI HAR Dataset (with 'mean()-' prepended to indicate that they are mean values).

Preservation of naming conventions facilitates cross-referencing between the datasets.

Please see the README.md file for pointers to references for the UCI HAR Dataset.