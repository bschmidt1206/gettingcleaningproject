# Getting and Cleaning Data: Course Project
## September 2014

The purpose of this project is to prepare a public dataset (the UCI HAR Dataset) for further analysis, and then perform some simple computations that summarize a subset of the original dataset.

The output of the provided R script, 'run_analysis.R', is a second dataset, 'HAR_means.txt'.

__Dataset Source__: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

__Dataset Reference__: Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. _Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine_. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

__Dataset Information__: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Instructions: The UCI HAR Dataset must be downloaded and unzipped to the "UCI HAR Dataset" folder in the working directory before running this project's R script, 'run_analysis.R'.

Please see the README.txt file that accompanies the UCI HAR Dataset for further information about the original dataset and how it was created.

The 'run_analysis.R' R script contains all the logic for processing the UCI HAR Dataset once it is unzipped.

## Script Details

The remainder of this document describes the logic of the 'run_analysis.R' R script that is used to process the dataset.

[0] _Loading the UCI HAR Dataset_

First the data files are loaded into separate data frames using read.table:
* Activity labels (activity_labels.txt)
* Features (features.txt)
* Training set (X_train.txt, y_train.txt, subject_train.txt)
* Test set (X_test.txt, y_test.txt, subject_test.txt)

The data in the 'Inertial Signals' folders (for both training and test) are not used in this project, since this data is not necessary to compute the desired mean values (in step [5] below).

The columns of the activity labels and features data frames are given descriptive names: { "activityid", "activity" } and { "featureid", "feature" } respectively.

[1] _Merging the training and test data_

The training and test datasets are each assembled as data frames by cbind'ing the subject, y, and X data frames (in that order). Then the training and test datsets are combined into a single data frame using rbind.

The columns of the merged dataset are given descriptive names.  Feature names are taken from the features table.
The order of the features in the dataset (columns from left to right) is assumed to be the same as the order of the features listed in the 'features.txt' file.

[2] _Extract mean and standard deviation measurements_

Per the requirements of the assignment, a subset of features are selected from the full dataset.
The variables selected are the mean and standard deviation from each of the features.
These are found by searching for 'mean(' and 'std(' within the feature names.
Note that this logic deliberately excludes the 'meanFreq' variables as well as the angle-specific variables such as 'angle(tBodyAccMean,gravity)' which happen to contain the text 'mean' or 'Mean' in their names.

The grep function is used to find the index values of the desired variables; these variables are then extracted into a separate data frame (along with the subjectid and activityid).

[3] _Use descriptive activity names_

The dataset is merged with the activity labels so that activities can be read as text instead of an integer code in the range 1:6.
The columns of the dataset are also reordered for readability.

[4] _Use descriptive variable names_

The dataset is modified to use more descriptive variable names.  The starting point for the variable names is the set of names in the 'features.txt' file.  Please see the CodeBook.md file for a list of all variable names and naming conventions used in the final dataset.

[5] _Create a new table with the mean of each variable_

The data is melted using id variables 'subjectid' and 'activity' since these define the groupings for which we will be computing mean values.
The data is then cast, employing the 'mean' function in order to compute the mean value of each variable for each subject and activity.

The resulting data frame is written using write.table to the 'HAR_means.txt' file in the working directory (with the row.names=FALSE option).


## License

This project is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors for its use or misuse. Any commercial use is prohibited.
