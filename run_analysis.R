temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", temp)
x_train <- read.table(unz(temp,"UCI HAR Dataset/train/X_train.txt"),sep = "")
x_test <- read.table(unz(temp,"UCI HAR Dataset/test/X_test.txt"),sep = "")
y_train <- read.table(unz(temp,"UCI HAR Dataset/train/y_train.txt"),sep = "")
y_test <- read.table(unz(temp,"UCI HAR Dataset/test/y_test.txt"),sep = "")
train_subject <- read.table(unz(temp,"UCI HAR Dataset/train/subject_train.txt"),sep = "")
test_subject <- read.table(unz(temp,"UCI HAR Dataset/test/subject_test.txt"),sep = "")
#add the y dbs to the respective x dbs
train <- cbind(x_train, y_train, train_subject)
test <- cbind(x_test, y_test, test_subject)
#merge test and train
df <- rbind(train, test)
#name the columns of the merged df
name_vars <- read.table(unz(temp,"UCI HAR Dataset/features.txt"),sep = "")
name_vars_df <- as.vector(name_vars[,2])
cols <- c("label", "subject")
headers <- append(name_vars_df, cols)
names(df) <- headers
df_mean_std <- df[ , grepl( "[Mm]ean|[Ss]td|label|subject" , names( df ) ) ]
labels <- read.table(unz(temp,"UCI HAR Dataset/activity_labels.txt"),sep = "")
names(labels) <- c("label", "activity")
library("dplyr")
df_joined <- left_join(df_mean_std, labels, by = "label")
df_tidy <- df_joined %>% group_by(activity, subject) %>% summarise_at(vars(-label),mean)
