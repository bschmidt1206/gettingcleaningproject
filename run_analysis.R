# NOTE: Before running this script you need to download and unzip the original dataset
# to the "UCI HAR Dataset" folder in the working directory.  Please see the README.md
# file for links to the dataset and related resources.

rm(list=ls())

library(reshape2)

# (0) Load data tables from files ####

# Load friendly names for the activities (coded as an integer in the range 1:6)
activity_labels = read.table("UCI HAR Dataset\\activity_labels.txt", stringsAsFactors=F)
colnames(activity_labels) = c("activityid", "activity")

# Load names for the features (coded 1:561)
features = read.table("UCI HAR Dataset\\features.txt", stringsAsFactors=F)
colnames(features) = c("featureid", "feature")

# 7352 rows in train
train.x = read.table("UCI HAR Dataset\\train\\X_train.txt")
train.y = read.table("UCI HAR Dataset\\train\\y_train.txt")
train.s = read.table("UCI HAR Dataset\\train\\subject_train.txt")

# 2947 rows in test
test.x = read.table("UCI HAR Dataset\\test\\X_test.txt")
test.y = read.table("UCI HAR Dataset\\test\\y_test.txt")
test.s = read.table("UCI HAR Dataset\\test\\subject_test.txt")

# (1) Merge training and test sets ####

# Combine into train and test data frames
train = cbind(train.s, train.y, train.x)
test = cbind(test.s, test.y, test.x)

# Combine train and test into a single data frame
ds.full = rbind(train, test)

# Use friendly names for columns
colnames(ds.full) = c("subjectid", "activityid", features$feature)

# Remove objects no longer needed
rm(train, train.x, train.y, train.s, test, test.x, test.y, test.s)

# (2) Extract mean and standard deviation measurements ####

# Get indices of variables of interest (the mean and std measurements)
idx = grep(pattern = "mean\\(|std\\(", features$feature, value=F)

# The indices of the variables are incremented by 2 here in order to
# account for the first two columns (subjectid, activityid)
ds.subset = ds.full[, c(1:2,idx+2)]

# (3) Use descriptive activity names ####

ds.subset = merge(ds.subset, activity_labels, by="activityid")

# Reorder columns for easier reading of the table
ds.subset = ds.subset[,c("subjectid", "activityid", "activity", colnames(ds.subset)[3:68])]

# (4) Use descriptive variable names ####

tmp = colnames(ds.subset)[4:69]
tmp = gsub(pattern = "Acc", replacement="Acceleration", tmp)
tmp = gsub(pattern = "Gyro", replacement="Gyroscope", tmp)
tmp = gsub(pattern = "Mag", replacement="Magnitude", tmp)
tmp = gsub(pattern = "\\(\\)", replacement="", tmp)
tmp = gsub(pattern = "^t", replacement="Time", tmp)
tmp = gsub(pattern = "^f", replacement="Freq", tmp)
tmp = gsub(pattern = "BodyBody", replacement="Body", tmp)
tmp = gsub(pattern = "-mean", replacement="Mean", tmp)
tmp = gsub(pattern = "-std", replacement="Std", tmp)
tmp = gsub(pattern = "-X", replacement="X", tmp)
tmp = gsub(pattern = "-Y", replacement="Y", tmp)
tmp = gsub(pattern = "-Z", replacement="Z", tmp)
colnames(ds.subset)[4:69] = tmp

# (5) Create a new table with the mean of each variable  ####
# for each activity and each subject

ds.melt = melt(ds.subset, id=c("subjectid", "activity"), measure.vars=colnames(ds.subset)[4:69])

# Compute mean value for each {subjectid, activity} pair
ds.means = dcast(ds.melt, subjectid + activity ~ variable, mean)

# Prepend 'Mean' to all feature names since these variables are mean values
colnames(ds.means)[3:68] = paste0("Mean", colnames(ds.means)[3:68])

# Write to output file
write.table(ds.means, "HAR_means.txt", row.names=F)
