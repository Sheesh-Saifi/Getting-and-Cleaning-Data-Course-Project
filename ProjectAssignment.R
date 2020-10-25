X_test <- read.table("./test/X_test.txt")
y_test <- read.table("./test/y_test.txt")
subject_test <- read.table("./test/subject_test.txt")
X_train <- read.table("./train/X_train.txt")
y_train <- read.table("./train/y_train.txt")
subject_train <- read.table("./train/subject_train.txt")

test1 <- cbind(subject_test,y_test)
test2 <- cbind(test1,X_test)

train1 <- cbind(subject_train,y_train)
train2 <- cbind(train1,X_train)

dataset <- rbind(test2,train2)


features <- read.table("./features.txt")
ms <- grep("mean()|std()",features$V2)
msd = append(1:2,ms+2)
set <- dataset[,msd]

labels <- read.table("activity_labels.txt")
ac_labels <- labels$V2[set$V1.1]
set$V1.1 <- ac_labels
s =set
s1 <- s[1:2]
s2 <- s[3:81]
colnames(s1) <- c("Subject","Activity Labels")
colnames(s2) <- features$V2[ms]
set  <- cbind(s1,s2)

final <- aggregate(.~Subject+`Activity Labels`,data=set,mean)
final