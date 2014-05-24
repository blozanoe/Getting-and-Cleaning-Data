  ##Read the Train files and assign it to a variable trainrd (train raw data)
  xtrainrd=read.table("./train/X_train.txt",colClasses="numeric")
  ytrainrd=read.table("./train/y_train.txt",colClasses="numeric")
  subjecttrainrd=read.table("./train/subject_train.txt")
  
  ##Read the Test files and assign it to a variable testrd (Test raw data)
  xtestrd=read.table("./test/X_test.txt",colClasses="numeric")
  ytestrd=read.table("./test/y_test.txt",colClasses="numeric")
  subjecttestrd=read.table("./test/subject_test.txt")
  
  ##Read the Feature file the information are the column names for the trainrd and testrd 
  features=read.table("./features.txt")
  activities=read.table("./activity_labels.txt")
  
  
  ##Get the second column of the features variable into a vector called columna
  columna<-features[,2]
  
  ## Name the columns in trainrd and testrd with the columna vector
  names(xtrainrd)<-columna
  names(xtestrd)<-columna
  
  
  ## convert to factor the number of activity in the ytrainrd and ytestrd data
  ## creating an auxiliar variable
  activities=as.character(activities$V2)
  ytrainrd<- as.factor(ytrainrd$V1)
  levels(ytrainrd)=activities
  ytestrd<- as.factor(ytestrd$V1)
  levels(ytestrd)=activities
  
  ## CHange to levels the subjects in order to analyze data per subject
  subjecttrainrd=as.factor(subjecttrainrd$V1)
  subjecttestrd=as.factor(subjecttestrd$V1)
  
  
  ## Bind the train and test files
  traindata<-cbind(subjecttrainrd,xtrainrd,ytrainrd) ## binds the train set
  testdata<-cbind(subjecttestrd,xtestrd,ytestrd) ## binds the test set
  names(traindata)[563]="Activities" ##names the activities column in the cbind of the train set
  names(testdata)[563]="Activities" ##names the activities column in the cbind of the test set
  names(traindata)[1]="Subject" ##names the Subject column in the cbind of the train set
  names(testdata)[1]="Subject"##names the subject column in the cbind of the test set
  dataset<-rbind(traindata,testdata) ## binds both the train and the test sets
  
  
  ##answer to question2: Grep will look for mean and std in the dataset, and create a new data set with only this columns
  question2<-subset(dataset,select=c(Subject, Activities,grep("mean()", colnames(dataset),fixed=TRUE),grep("std()",colnames(dataset))))
  
  library(reshape2)
  library(plyr)
  Question5<-melt(question2,id.var=c("Subject","Activities"))
  Question5$value <- as.numeric(Question5$value, na.rm = TRUE)
  
  ## The following line creates a df for the mean of each variable, by subject and Activity
  TidyData <- dcast(Question5, Subject + Activities ~ variable, mean, na.rm = TRUE )

  write.table(dataset,"DataSet.txt",sep=",",row.names=FALSE)
  write.table(question2,"Question2Set.txt",sep=",",row.names=FALSE)
  write.table(TidyData,"TidyData.txt",sep=",",row.names=FALSE)
  