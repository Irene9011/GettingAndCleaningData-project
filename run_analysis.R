## first unzip the data downloaded from the website provided
## then change the work directory for R to current folder

# read the file and then merge the data sets
x_train <- read.table("UCI HAR Dataset/train/X_train.txt")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt")
x_data <- rbind(x_train, x_test)

y_train <- read.table("UCI HAR Dataset/train/Y_train.txt")
y_test <- read.table("UCI HAR Dataset/test/Y_test.txt")
y_data <- rbind(y_train, y_test)

subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
subject_data <- rbind(subject_train, subject_test)

features_data <- read.table("UCI HAR Dataset/features.txt")

#Split cols with mean() and std()
##source ##https://stat.ethz.ch/R-manual/R-devel/library/base/html/grep.html
mean_std <- grep("-(mean|std)\\(\\)", features_data[,2])

#subset and then rename activities and cols
x_datause <- x_data[,mean_std]
names(x_datause) <- features_data[mean_std,2]

activity <- read.table("UCI HAR DAtaset/activity_labels.txt")
y_datanew <- y_data
y_datanew[,1] <- activity[y_data[,1],2]

names(y_datanew) <- "activity"
names(subject_data) <- "subject"


##calculate the avrg value for cols
library(plyr)
datafinal <- cbind(x_datause, y_datanew, subject_data)
result <- ddply(datafinal, .(subject, activity), function(x) colMeans(x[,1:66]))

write.table(result, "result.txt", row.name=FALSE)
