#Script below is to demonstrate work completed for parts 2-5 in Project
#This script only works in conjuction with run_analysis.R

#extract mean and stdev for each measurement using select function from dplyr package
library(dplyr)

sub_m <- select(mergedData, contains("mean"))
sub_s <- select(mergedData, contains("std"))
sub_data <- as.data.frame(cbind(sub_m, sub_s))

#Create activity column and merge to dataset
Test_labels <- read.table("./GetCleanData_Project/UCI HAR Dataset/test/y_test.txt")
Train_labels <- read.table("./GetCleanData_Project/UCI HAR Dataset/train/y_train.txt")
activities <- rbind(Test_labels, Train_labels)

#create conditional loop to replace numbers in activity column with labels
rows <- as.numeric(nrow(activities))
Activity_Labels <- NULL
for (i in 1:rows) {
      sub <- activities[i,] 
      
      if (sub == 1) { rename <- "WALKING" 
      } else if (sub == 2) { rename <- "WALKING_UPSTAIRS" 
      } else if (sub == 3) { rename <- "WALKING_DOWNSTAIRS"
      } else if (sub == 4) { rename <- "SITTING"
      } else if (sub == 5) { rename <- "STANDING"
      } else if (sub == 6) { rename <- "LAYING"
      }
      
      Activity_Labels <- rbind(Activity_Labels, rename)
      rm(rename)
}

#merge into a single data set assigned to Merge
subject_merge <- rbind(Test_subject, Train_subject)
Merge <- cbind(subject_merge, Activity_Labels, sub_data)

#use melt and summarize functions to create second data set
library(reshape2)

melt <- melt(Merge, id=c("Subject", "Activity_Labels"))
x <- summarize(group_by(melt, Subject, Activity_Labels, variable), mean(value))

#save file in working directory
write.table(x, file = "./GetCleanData_Project.txt", row.name=FALSE)
