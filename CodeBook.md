#VARIABLES:
xtrainrd <- raw data from the x_train.txt file.
ytrainrd<- raw data from they_train.txt file.
subjecttrainrd<- raw data from the subject_train.txt file.
xtestrd <- raw data from the x_test.txt file.
ytestrd<- raw data from they_test.txt file.
subjecttestrd<- raw data from the subject_test.txt file.
features<- raw data from the features.txt file.
Activities<- raw data from the activity_labels.txt file.
columna<- extracts the second column from the features which includes the names of each column in the xtrainrd and xtestrd data
traindata<- cbind subjecttrainrd, xtrainrd, ytrainrd
testdata<- cbind subjecttestrd, xtestrd, ytestrd
dataset<- binds both the train and the test sets
question2 <- creates a subset of the data in dataset and includes the variables “Subject”, “Activities” and rest of the variables that ends with "mean()" and"std()"
Question5<- creates a melt from the information in question2 based on the variables "Subject" and "Activities"
TidyData <-  creates a dataset based on the “Subject” and “Activities” with the mean for each variable

#HOW IT WORKS:
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
