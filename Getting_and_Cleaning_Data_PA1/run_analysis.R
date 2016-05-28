# 1. Merges the training and the test sets to create one data set.
x_columnNames <- read.table("./UCI HAR Dataset/features.txt")[, 2]
subject_test  <- read.table("./UCI HAR Dataset/test/subject_test.txt",   col.names = c("subject"))
X_test        <- read.table("./UCI HAR Dataset/test/X_test.txt",         col.names = x_columnNames)
y_test        <- read.table("./UCI HAR Dataset/test/y_test.txt",         col.names = c("activity_cd"))
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt", col.names = c("subject"))
X_train       <- read.table("./UCI HAR Dataset/train/X_train.txt",       col.names = x_columnNames)
y_train       <- read.table("./UCI HAR Dataset/train/y_train.txt",       col.names = c("activity_cd"))

uci_har_1 <- rbind(data.frame(subject_test,  y_test,  X_test), data.frame(subject_train, y_train, X_train))

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
uci_har_2             <- uci_har_1[, grep("(mean|std)", colnames(uci_har_1))]
x_colNames            <- colnames(uci_har_2)
uci_har_2$activity_cd <- uci_har_1$activity_cd
uci_har_2$subject     <- uci_har_1$subject

# 3. Uses descriptive activity names to name the activities in the data set
activity <- read.table("./UCI HAR Dataset/activity_labels.txt", col.names = c("activity_cd", "activity_label"))

# 4. Appropriately labels the data set with descriptive activity names.
uci_har_4 <- merge(activity, uci_har_2)

# 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
uci_har_5 <- aggregate(uci_har_4[, x_colNames], list(uci_har_4$activity_cd, uci_har_4$activity_label, uci_har_4$subject), mean)
colnames(uci_har_5) <- append(c("activity_cd", "activity_label", "subject"), x_colNames)

# Save data
write.csv(uci_har_5, file = "UCI_HAR_Dataset(Tidy).txt", fileEncoding = "UTF-8")

# remove object
rm(list = ls())
