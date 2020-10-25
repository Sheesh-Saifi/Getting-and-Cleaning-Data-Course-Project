#Step-1 :
X_test <- read.table("./test/X_test.txt")
y_test <- read.table("./test/y_test.txt")
subject_test <- read.table("./test/subject_test.txt")
X_train <- read.table("./train/X_train.txt")
y_train <- read.table("./train/y_train.txt")
subject_train <- read.table("./train/subject_train.txt")    #Read data from text files.

test1 <- cbind(subject_test,y_test)
test2 <- cbind(test1,X_test)    #Bind test data into a single table

train1 <- cbind(subject_train,y_train)
train2 <- cbind(train1,X_train)   #Bind train data into a single table

dataset <- rbind(test2,train2)   #Bind train and test data into a single table

#Step-2: 
features <- read.table("./features.txt")      #Read the data from features text file into a table

ms <- grep("mean()|std()",features$V2)        #find the rows which contain mean or std     
msd = append(1:2,ms+2)                        

set <- dataset[,msd]                          #Extract the measurements on the mean and std for each measurement from our dataset.                         


#Step-3:
labels <- read.table("activity_labels.txt")            #Read the labels
ac_labels <- labels$V2[set$V1.1]                    #Extract the required labels in an ordered manner
set$V1.1 <- ac_labels                               #Replace the numbers with label text

#Step-4:
s =set
s1 <- s[1:2]
s2 <- s[3:81]
colnames(s1) <- c("Subject","Activity Labels")          #Change the column names of 1st and 2nd column
colnames(s2) <- features$V2[ms]                         #Change the remaining column names to given features
set  <- cbind(s1,s2)                                    #Bind the s1 and s2 into a single table after changing their labels

#Step-5:
final <- aggregate(.~Subject+`Activity Labels`,data=set,mean)        #creating an independent data set with the average of each variable for each activity and each subject
final                                                           #Completed.
