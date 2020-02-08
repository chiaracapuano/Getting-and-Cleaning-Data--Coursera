# Getting-and-Cleaning-Data--Coursera
Week 4 programming assignment

The files in this repo are run_analysis.R and CodeBook.md. 

**run_analysis.R**  \
run_analysis.R downloads the zipped files from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip. The description of this dataset can be found at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.
The data represent data collected from the accelerometers from the Samsung Galaxy S smartphone for specific test subjects. The data are further divided in x and y test and train sets. The x sets contain the feature measurements, the y sets contain the activity label. The subject dataset contains a subject identifier and is a file a part.
The program merges the subject, train and the test sets to create a single data set. The columns of this dataset are named according to the file features.txt, present in the zipped folder.
Afterwards, only the subject, the activity label and the measurements on the mean and standard deviation for each variable are extracted from the dataset. 
The program joins the numeric labels related to the activity in the column "labels" with the activity labels in the activity_labels.txt file in the zip folder, to replace the activity labels with descritpive names.
A second, independent tidy data (df_tidy) is created, that displays the average of each variable for each activity and each subject.

**CodeBook.md** \
CodeBook.md contains a code book that describes the variables, the data, and any transformations or work that has been performed to clean up the data. 

**Week4ProgrammingAssignment.txt**
Week4ProgrammingAssignment.txt contains the output dataset.
