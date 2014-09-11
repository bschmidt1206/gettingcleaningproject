rm(list=ls())

library(reshape2)

# (0) Load data tables from files ####

# NOTE: You need to first download and unzip the raw dataset
# to the "UCI HAR Dataset" folder in the working directory
# Please see the README for more info about the dataset

# Load names for the activities (coded 1:6)
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

train = cbind(train.s, train.y, train.x)
test = cbind(test.s, test.y, test.x)

# dim: 10299 x 563
ds.full = rbind(train, test)
colnames(ds.full) = c("subjectid", "activityid", features$feature)

# Remove objects no longer needed
rm(train, train.x, train.y, train.s, test, test.x, test.y, test.s)

# (2) Extract mean and standard deviation measurements ####

# Indices of variables of interest
idx = grep(pattern = "mean\\(|std\\(", features$feature, value=F)

# Variable names for variables of interest
idxVal = grep(pattern = "mean\\(|std\\(", features$feature, value=T)

# The indices of the variables are incremented by 2 in order to
# account for the first two columns (subjectid, activityid)
ds.subset = ds.full[, c(1:2,idx+2)]

# (3) Use descriptive activity names ####

ds.subset = merge(ds.subset, activity_labels, by="activityid")

# Reorder columns for easier reading of the table
ds.subset = ds.subset[,c("subjectid", "activityid", "activity", idxVal)]

# (4) Use descriptive variable names ####

# NOTE: This was taken care of above in Step (1) when the column names
# are set to be the feature labels

# (5) Create a new table with the mean of each variable  ####
# for each activity and each subject

ds.melt = melt(ds.subset, id=c("subjectid", "activity"), measure.vars=idxVal)

# Compute mean value for each {subjectid, activity} pair
ds.means = dcast(ds.melt, subjectid + activity ~ variable, mean)

# Prepend 'mean()-' to all feature names since these columns are mean values
colnames(ds.means)[3:68] = paste0("mean()-", colnames(ds.means)[3:68])

# Write to output file
write.table(ds.means, "HAR_means.txt", row.names=F)
