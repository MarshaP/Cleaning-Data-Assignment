library(data.table)
setwd("C:\\Users\\mpmar\\Desktop\\data scientists_courses\\data")

fileurl = 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
if (!file.exists('./UCI HAR Dataset.zip')){
  download.file(fileurl,'./UCI HAR Dataset.zip', mode = 'wb')
  unzip("UCI HAR Dataset.zip", exdir = getwd())
}

####reading and cleaning data
###train data
features <- read.csv('./UCI HAR Dataset/features.txt', header = FALSE, sep = ' ')
features <- as.character(features[,2])

train.x <- read.table('./UCI HAR Dataset/train/X_train.txt')
train.activity <- read.csv('./UCI HAR Dataset/train/y_train.txt', header = FALSE, sep = ' ')
train.subject <- read.csv('./UCI HAR Dataset/train/subject_train.txt',header = FALSE, sep = ' ')

train <-  data.frame(train.subject, train.activity, train.x)
names(train) <- c(c('subject', 'activity'), features)


###test data
test.x <- read.table('./UCI HAR Dataset/test/X_test.txt')
test.activity <- read.csv('./UCI HAR Dataset/test/y_test.txt', header = FALSE, sep = ' ')
test.subject <- read.csv('./UCI HAR Dataset/test/subject_test.txt', header = FALSE, sep = ' ')

test <-  data.frame(test.subject, test.activity, test.x)
names(test) <- c(c('subject', 'activity'), features)



### question 1 mergina the data
dt.mrg <- rbind(train, test)

#dt.mrg


####Question 2 Extracts only the measurements on the mean and standard deviation for each measurement.

mean_std<- grep('mean|std', features)
dt_mean_std <- data.all[,c(1,2,mean_std + 2)]

#dt_mean_std


### Question 3 Uses descriptive activity names to name the activities in the data set

activity.labels <- read.table('./UCI HAR Dataset/activity_labels.txt', header = FALSE)
activity.labels <- as.character(activity.labels[,2])
dt_mean_std$activity <- activity.labels[dt_mean_std$activity]

#dt_mean_std$activity 

### Question 4 Appropriately labels the data set with descriptive variable names.

new_name <- names(dt_mean_std)
new_name <- gsub("[(][)]", "", new_name)
new_name  <- gsub("^t", "TimeDomain_", new_name)
new_name <- gsub("^f", "FrequencyDomain_", new_name)
new_name <- gsub("Acc", "Accelerometer", new_name)
new_name <- gsub("Gyro", "Gyroscope", new_name)
new_name <- gsub("Mag", "Magnitude", new_name)
new_name <- gsub("-mean-", "_Mean_", new_name)
new_name <- gsub("-std-", "_StandardDeviation_", new_name)
new_name <- gsub("-", "_", new_name)
names(dt_mean_std) <- new_name

#dt_mean_std

### Question 5From the data set in step 4, creates a second, independent tidy data set with 
#the average of each variable for each activity and each subject.

tidy_dt <- aggregate(dt_mean_std[,3:81], by = list(activity = dt_mean_std$activity, subject = dt_mean_std$subject),FUN = mean)
write.table(x = tidy_dt, file = "tidy_data.txt", row.names = FALSE)


