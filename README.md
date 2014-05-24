## Getting and Cleaning Data
# Coursera Getting and Cleaning Data Project

OBJECTIVE The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project.
You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md.
You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.

RUNNING THE SCRIPT run_analysis.R
The script (run_analysis.R) does the following:
Merges the training and the test sets to create one data set.
Extracts only the measurements on the mean and standard deviation for each measurement.
Uses descriptive activity names to name the activities in the data set
Appropriately labels the data set with descriptive activity names.
Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Running the script:
Unzip the source (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip )
into a folder on your local drive. This should create a folder named "\UCI HAR Dataset\" which includes all the files required to run  the analysis (2 subfolders and several txt files)
Place the “run_analysis.R” script in the ~\R\UCI HAR Dataset\ and set in R or R Studio the working directory to this path: setwd("path\UCI HAR Dataset\") and then: open and the script "run_analysis.R" The latter will run the R script, it will read the dataset and create these files:

DataSet.txt <- This file contains the result merging all the files required in order to perform the analysis 
Question2Set.txt  <- This file contains the result for the second step of the instructions, that is “Extracts only the measurements on the mean and standard deviation for each measurement.”
TidyData.txt  <- This last file contains the result of the fifth step of the instructions, that is “Creates a second, independent tidy data set with the average of each variable for each activity and each subject.” Based on the result of the second step.


UNDERSTANDING "UCI HAR Dataset"
It is very important to understand the structure of the study. What the variables (which will be our columns) are and which are not as important as how the whole data set is structured. If you want to know more about what the variables read the file "README.txt" and "features_info.txt" that were unzipped along with the rest of the information.
What is important is:
1) The whole study consists of a universe of 10,299 entries. 
2) The "universe" is created from a matrix of 6 files (3 for the sub-universe "Train" and 3 for the sub-universe "Test") 
3) Each "sub-universe" contains the same "features" (or variables if you like) 
4) There should be a total of 563 "features" in each sub-universe. 
5) Each of the sub-universe, are also composed by 3 files (X, Y, Subject) 
X Y Subject 
6) X contains most of the features, with values extracted from the GPS information (for more info about this, read "README.txt) 
7) Y contains the Activity done during the extractions of each "particle" 
8) "Subject" contains the number of the subject from where the data was obtained. 
9) Since the original data does not contains the names of the column, these should be replaced.


HOW IT WORKS:
The script performs the following steps:
1) Upload the 3 "train" txt files, into a corresponding R variables (xtrainrd, ytrainrd, subjecttrainrd) and then Upload the 3 "test" txt files, into a corresponding R variables (xtestrd, ytestrd, subjecttestrd) 
2) Reads and loads the information of the “features.txt” (column names for the x files) and the “activities_labels.txt” to their corresponding R variable (features and activities) 
3) Assign names to the x files based on the features.txt file.
4) Replace the activities (first column) of the x files with an understandable english name based on the activities_labels.txt file. 
5) Change the “subject” files to factor so that the information can be used in further analysis.
6) Bind the 3 R variables (subject, x, y) by columns (cbind) for each of the sets (test and train) into a new variable (traindata and testdata).
7) Change the names of the columns representing the activities to “Activities” and “Subject” in the data variables (I don’t know why this was not respected )=  )
8) Answer Step2: Create a subset of data containing the means and standard deviation variables in the dataframe. (Here according to the features_info.txt file that was unzipped along with the rest of the files, “the set of variables estimated from these signals are: mean(): Mean value and std(): Standard deviation, I’m not considering gravityMean, tBodyAccMean, tBodyAccJerkMean, tBodyGyroMean, tBodyGyroJerkMean as means. My understanding of “Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:” is that these are angle variables (if my understanding is wrong it my be because I am Mexican and not a native English-speaking person. 
9) From the resulting subset from 8) I created a melt for id.variables “Subject” and “Activities”, as stated in the “Creates a second, independent tidy data set with the average of each variable for each activity and each subject.”. And create  a new TidyData set with a dcast from the set with both of the variables mentioned, and calculated the mean for each result.
10) Finally I created the text files for each data set created.
