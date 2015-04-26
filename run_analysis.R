# Load dplyr library for dataset manipulation
library(dplyr)

############## Create Combined Dataset ###############

# Set activity labels (found in activity_labels.txt)
activities.code <- c(WALKING=1, WALKING_UPSTAIRS=2, WALKING_DOWNSTAIRS=3,
                     SITTING=4, STANDING=5, LAYING=6)

### Training Dataset
# Gather all training data
train <- read.table("UCI HAR Dataset/train/X_train.txt")
train_subjects <- read.table("UCI HAR Dataset/train/subject_train.txt")
train_activities <- read.table("UCI HAR Dataset/train/Y_train.txt")
# Replace activity numbers with descriptive names
activity_names <- names(activities.code)[train_activities$V1]
# Create combined train set
train <- cbind(train_subjects$V1, activity_names, train)
colnames(train) <- as.character(1:563)
rm("train_activities", "activity_names", "train_subjects")

### Test Dataset
# Gather all test data
test <- read.table("UCI HAR Dataset/test/X_test.txt")
test_subjects <- read.table("UCI HAR Dataset/test/subject_test.txt")
test_activities <- read.table("UCI HAR Dataset/test/y_test.txt")
# Replace activity numbers with descriptive names
activity_names <- names(activities.code)[test_activities$V1]
# Create combined test set
test <- cbind(test_subjects$V1, activity_names, test)
colnames(test) <- as.character(1:563)
rm("test_activities", "activity_names", "test_subjects")

### Combine Train and Test
composite <- rbind(train, test)

### Label the variables
labels <- read.table("UCI HAR Dataset/features.txt")
colnames(composite) <- c("subject", "activity", as.character(labels$V2))

############## Extract Desired Columns ###############
# Here we extract the columns which report the mean and std of the measurements
# We exclude columns with meanFreq and gravityMean in their names

# Remove columns with duplicate names (none of these contain "mean" or "std", thus
# this step does not interfere with our goals of using only mean and std columns)
unique_composite <- composite[, unique(colnames(composite))]
target_data <- select(unique_composite, activity, subject, contains("mean"), contains("std"), 
                      -contains("meanFreq"), -contains("gravityMean"), -contains("angle"))


############## Create Second Tidy Dataset ############
# Now we wish to create a dataset with the mean for each variable for each 
# activity and each subject
avg_data <- target_data %>% group_by(activity, subject) %>% summarise_each(funs(mean))
# Remove unwanted characters in variable names
names(avg_data) <- lapply(names(avg_data), function(x) gsub("\\.|\\(|\\)|-", "", x))

# Write data set to txt file
write.table(avg_data, file="AverageByActivityBySubject.txt")
