# Getting and Cleaning Data: Course Project

The HAR_means.txt dataset (referred to here as HAR_means) is derived from the UCI HAR (Human Activity Recognition) Dataset.  In other words, HAR_means is a summary of a subset of the UCI HAR Dataset.

The UCI HAR Dataset holds data collected from accelerometers on subjects' Samsung Galaxy S smartphones.

The datasets include data for 30 subjects.  For each subject, there are multiple measurements for each of 6 activities.

Please see the 'README.txt' file for the UCI HAR Dataset for more details about how that dataset was created.

There is one row in the HAR_means dataset for each combination of subject and activity, for a total of 180 rows.

The first column is 'subjectid' and is a unique identifier for subjects (values are integers 1-30).

The second column is 'activity' and is a friendly name for activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING).

The remaining columns are the mean values for each of 66 variables (for a specific subject and activity).

MeanTimeBodyAccelerationMeanX
MeanTimeBodyAccelerationMeanY
MeanTimeBodyAccelerationMeanZ
MeanTimeBodyAccelerationStdX
MeanTimeBodyAccelerationStdY
MeanTimeBodyAccelerationStdZ
MeanTimeGravityAccelerationMeanX
MeanTimeGravityAccelerationMeanY
MeanTimeGravityAccelerationMeanZ
MeanTimeGravityAccelerationStdX
MeanTimeGravityAccelerationStdY
MeanTimeGravityAccelerationStdZ
MeanTimeBodyAccelerationJerkMeanX
MeanTimeBodyAccelerationJerkMeanY
MeanTimeBodyAccelerationJerkMeanZ
MeanTimeBodyAccelerationJerkStdX
MeanTimeBodyAccelerationJerkStdY
MeanTimeBodyAccelerationJerkStdZ
MeanTimeBodyGyroscopeMeanX
MeanTimeBodyGyroscopeMeanY
MeanTimeBodyGyroscopeMeanZ
MeanTimeBodyGyroscopeStdX
MeanTimeBodyGyroscopeStdY
MeanTimeBodyGyroscopeStdZ
MeanTimeBodyGyroscopeJerkMeanX
MeanTimeBodyGyroscopeJerkMeanY
MeanTimeBodyGyroscopeJerkMeanZ
MeanTimeBodyGyroscopeJerkStdX
MeanTimeBodyGyroscopeJerkStdY
MeanTimeBodyGyroscopeJerkStdZ
MeanTimeBodyAccelerationMagnitudeMean
MeanTimeBodyAccelerationMagnitudeStd
MeanTimeGravityAccelerationMagnitudeMean
MeanTimeGravityAccelerationMagnitudeStd
MeanTimeBodyAccelerationJerkMagnitudeMean
MeanTimeBodyAccelerationJerkMagnitudeStd
MeanTimeBodyGyroscopeMagnitudeMean
MeanTimeBodyGyroscopeMagnitudeStd
MeanTimeBodyGyroscopeJerkMagnitudeMean
MeanTimeBodyGyroscopeJerkMagnitudeStd
MeanFreqBodyAccelerationMeanX
MeanFreqBodyAccelerationMeanY
MeanFreqBodyAccelerationMeanZ
MeanFreqBodyAccelerationStdX
MeanFreqBodyAccelerationStdY
MeanFreqBodyAccelerationStdZ
MeanFreqBodyAccelerationJerkMeanX
MeanFreqBodyAccelerationJerkMeanY
MeanFreqBodyAccelerationJerkMeanZ
MeanFreqBodyAccelerationJerkStdX
MeanFreqBodyAccelerationJerkStdY
MeanFreqBodyAccelerationJerkStdZ
MeanFreqBodyGyroscopeMeanX
MeanFreqBodyGyroscopeMeanY
MeanFreqBodyGyroscopeMeanZ
MeanFreqBodyGyroscopeStdX
MeanFreqBodyGyroscopeStdY
MeanFreqBodyGyroscopeStdZ
MeanFreqBodyAccelerationMagnitudeMean
MeanFreqBodyAccelerationMagnitudeStd
MeanFreqBodyAccelerationJerkMagnitudeMean
MeanFreqBodyAccelerationJerkMagnitudeStd
MeanFreqBodyGyroscopeMagnitudeMean
MeanFreqBodyGyroscopeMagnitudeStd
MeanFreqBodyGyroscopeJerkMagnitudeMean
MeanFreqBodyGyroscopeJerkMagnitudeStd

These 66 variables (derived from a subset of the variables in the UCI HAR Dataset) are means of mean and standard deviation variables for the signals described in the 'features_info.txt' code book for the UCI HAR Dataset.

The conventions for variable names in HAR_means is as follows:
* All variable names begin with 'Mean' because all are mean values.
* Some variables are time domain signals (labled 'Time') and others are frequency domain signals ('Freq').
* Accelerometer measures are separated labeled with either 'BodyAcceleration' or 'GravityAcceleration'.
* Gyroscope measures are labled with 'Gyroscope'.
* Body linear acceleration and angular velocity were derived in time to obtain 'Jerk' variables.
* Signal magnitudes are calculated using the Euclidean norm and labeled 'Magnitude'.
* The 'Mean' and 'Std' labels indicate whether a mean or standard deviation feature was used.
* The labels 'X', 'Y', and 'Z' indicate 3-axial signals in those 3 dimensions.

Please see the 'features_info.txt' for further information about the signals and the logic used to create the variables.

Please see the README.md file for pointers to references for the UCI HAR Dataset.