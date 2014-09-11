## Getting and Cleaning Data: Course Project

The purpose of this project is to prepare a raw dataset (the UCI HAR Dataset) for further analysis, and then do some simple computations that summarize a subset of the original dataset.

Dataset Source: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Dataset Reference: Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

Dataset Information: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Notes:
* Please see the README.txt file that accompanies the UCI HAR Dataset for further information about the dataset.
* The the UCI HAR Dataset must be downloaded and unzipped to the "UCI HAR Dataset" folder in the working directory before running this project's script.
* This project's 'run_analysis.R' script contains all the logic for processing the dataset once it is unzipped.

The remainder of this document describes the logic used to process the dataset.

[0] Loading the dataset

First the data files are loaded into separate data frames using read.table:
* Activity labels (activity_labels.txt)
* Features (features.txt)
* Training set (X_train.txt, y_train.txt, subject_train.txt)
* Test set (X_test.txt, y_test.txt, subject_test.txt)

The data in the 'Inertial Signals' folders (for both training and test) are not used in this project, since this data is not necessary to compute the desired mean values (in step [5] below).

The columns of the activity labels and features tables are given descriptive names.

[1] Merging the training and test data

First the training and test datasets are each put into their own table by cbind'ing the subject, y, and X data frames.
Then the training and test datsets are combined using rbind.

The columns of the merged dataset are given descriptive names.  Feature names are taken from the features table.  The order of the features in the dataset (left to right) is assumed to be the same as the order of the features in the 'features.txt' file.

[2] Extract mean and standard deviation measurements

Per the requirements of the assignment, a subset of features are selected from the full dataset.  The variables selected are the mean and standard deviation from each of the features.  These are found by searching for 'mean(' and 'std(' within the feature names (feature names are listed in features_info.txt).  Note that this logic deliberately excludes the 'meanFreq' variables as well as the angle-specific variables such as 'angle(tBodyAccMean,gravity)' which happen to contain the text 'mean' or 'Mean' in their names.

The grep function is used to find the indices of the desired variables, which are then extracted into a separate table (along with the subjectid and activityid).
The grep function is also used to find the variable names of the variables of interest.  This is useful to inspect (to ensure the code is working) and is also used later in the script.

[3] Use descriptive activity names

The dataset is merged with the activity labels so that activities can be read as text in addition to an integer code in the range 1:6.

The columns of the dataset are also reordered for readability.

[4] Use descriptive variable names

The dataset uses descriptive variable names.  The variable names are taken from the 'features.txt' file.  Please see step [1] above for details as this is where the column names are changed.

[5] Create a new table with the mean of each variable

The data is melted using id variables 'subjectid' and 'activity' since these are the groups for which we will be computing mean values.  The data is then cast, employing the 'mean' function in order to compute the mean value of each variable for each subject and variable.

The resulting data frame is written using write.table to the 'HAR_means.txt' file in the working directory (with the row.names=FALSE option).


This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.
