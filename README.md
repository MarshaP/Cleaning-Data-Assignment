Purpose and Goal
==========================
The purpose of this project is to demonstrate course students' ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. Students will be graded by their peers on a series of yes/no questions related to the project. Students will be required to submit:

(1) a tidy data set as described below,

(2) a link to a Github repository with your script for performing the analysis,

(3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. Students should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.


Resources:
=====================
The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here is the data used for the project:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Instructions:
==========================
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


My Work:
============================
1. Downloaded the zipped file:
a. Features from UCI HAR Dataset/features.txt
b. train.x from UCI HAR Dataset/train/X_train.txt
c. train.activity from UCI HAR Dataset/train/y_train.txt
d. train.subject from UCI HAR Dataset/train/subject_train.txt
e. test.x from UCI HAR Dataset/test/X_test.txt
f. test.activity from UCI HAR Dataset/test/y_test.txt
g. test.subject from UCI HAR Dataset/test/subject_test.txt

2. Created "train" data frame from train.x, train.activity and train.subject
3. Created "test" data frame from test.x, test.activity and test.subject
4. Merged "train" and "test" data frames using "rbing" 
5. Get mean and standard diviation from "Feature" data frame
6. Downloaded "UCI HAR Dataset/activity_labels.txt" file and store it in "label_activity" data frame.  Apply the names 
dataset from previous point
7. Create new_name variable and apply new names into merged data set.
8. I created tidy_data.txt file using "write_table" code.

