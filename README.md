# Getting and Cleaning Data Course Project

* [Summary](#intro)
* [Repository and Script Contents](#contents)
* [Analysis](#process)

<h1 id=intro>Summary</h1>

This is a Peer-graded Assignment for Coursera Johns Hopkins University <i>Getting and Cleaning data</i> course. 

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis
The data used in this project can be downloaded from [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) .

The code performs the following steps which are explained in detail below:

- Merges the training and the test sets to create one data set.

- Extracts only the measurements on the mean and standard deviation for each measurement.

- Uses descriptive activity names to name the activities in the data set

- Appropriately labels the data set with descriptive variable names.

- From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


<h1 id=contents>Repository and Script Contents</h1>

This repository includes a <i>ProjectAssignment.R</i> script which contains the code used in this project to analyse the data. Additional files in the repository include the README.md. 

Code book:

<table>
<tr><th>Variable Name</th><th>Description</th></tr>
<tr><td valign=top>X_test</td><td>It contains the data from X_test.txt in table format</td></tr>
<tr><td valign=top>y_test</td><td>It contains the data from y_test.txt in table format</td></tr>
<tr><td valign=top>X_train</td><td>It contains the data from X_train.txt in table format</td></tr>
<tr><td valign=top>y_train</td><td>It contains the data from y_train.txt in table format</td></tr>
<tr><td valign=top>subject_train</td><td>It contains the data from subject_train.txt in table format</td></tr>
<tr><td valign=top>subject_test</td><td>It contains the data from subject_test.txt in table format</td></tr>
<tr><td valign=top>test1</td><td>It contains the data binded from subject_test and y_test in table format</td></tr>
<tr><td valign=top>test2</td><td>It contains the data binded from test1 and X_test in table format</td></tr>
<tr><td valign=top>train1</td><td>It contains the data binded from subject_train and y_train in table format</td></tr>   
<tr><td valign=top>train2</td><td>It contains the data binded from train1 and X_train in table format</td></tr>
<tr><td valign=top>dataset</td><td>It contains the data binded from test2 and train2 in a table format</td></tr>   
<tr><td valign=top>features</td><td>It contains the data from features.txt in table format</td></tr>
<tr><td valign=top>msd</td><td>It contains the locations of "mean" and "std" in features variable</td></tr>
<tr><td valign=top>set</td><td>It contains the data after Extract the measurements on the mean and std for each measurement from our dataset</td></tr>
<tr><td valign=top>ac_labels</td><td>It contains the activity labels in an ordered format</td></tr>
<tr><td valign=top>final</td><td>It contains the final independent tidy data set with the average of each variable for each activity and each subject.</td></tr>
</table>


<h1 id=process>Analysis process</h1>

<h2> Step-1: Merging the training and the test sets to create one data set. </h2>

First, we read the text files and store it in a tabular format using <code> read.table </code> command. 
After reading the data, we bind the seperated data into one single table using <code>cbind</code> and then <code>rbind</code> commands as explained in the script.

<h2> Step-2: Extracting only the measurements on the mean and standard deviation for each measurement. </h2>

In this step, first we read the features text file into R and extract the location of rows which contains "mean" and "std" in them using <code>grep</code> command. Then, using those locations we extract the measurements on the mean and std for each measurement from our dataset and store it in a variable called "dataset".

<h2> Step-3: Using descriptive activity names to name the activities in the data set </h2>

In this step, we read the labels using <code>read.table</code> command and then extract the required labels as shown in the script. Then we replace the previous numbers with the extracted labels.

<h2> Step-4:Appropriately labeling the data set with descriptive variable names. </h2>

In this step, first we seperated the columns into to different variables as shown for the sake of convinience. Then we changed their column names according the given features using colnames as shown in the script. After changing the column names, the seperated variables will be merged again with <code>cbind</code>

<h2> Step-5: Creating an independent tidy data set with the average of each variable for each activity and each subject. </h2>

To create an independent tidy data set with the average of each variable for each activity and each subject, we use aggregate command and store the result in a variable called
"final" as shown : <code>final <- aggregate(.~Subject+`Activity Labels`,data=set,mean)</code>

# Conclusion

Our analysis of the given data set was completed. After analysing the data, we created a variable a "final" which contains a tidy data set with the average of each variable for each activity and each subject which was the objective.
