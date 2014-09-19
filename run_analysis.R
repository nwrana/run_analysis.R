#Getting and Cleaning Data - Course Project

#Create folder in working directory and download .zip file data 
file_URL <- "http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"        

if(!file.exists("./GetCleanData_Project")){
      dir.create("./GetCleanData_Project")
}

download.file(file_URL, destfile = "./GetCleanData_Project/data_file.zip")

#unzip file to newly created directory
unzip("./GetCleanData_Project/data_file.zip", exdir = "./GetCleanData_Project")

#extract column names data from features.txt and attach to Test_set
Col_names <- read.table("./GetCleanData_Project/UCI HAR Dataset/features.txt")
Col_sub <- as.character(Col_names[,2]) #subset Col_names to only include text

#extract data from unzipped folder
Test_set <- read.table("./GetCleanData_Project/UCI HAR Dataset/test/X_test.txt")
Test_subject <- read.table("./GetCleanData_Project/UCI HAR Dataset/test/subject_test.txt")

Train_set <- read.table("./GetCleanData_Project/UCI HAR Dataset/train/X_train.txt")
Train_subject <- read.table("./GetCleanData_Project/UCI HAR Dataset/train/subject_train.txt")

#assign column names to Test, Train, and Subject
colnames(Test_set) <- Col_sub
colnames(Train_set) <- Col_sub
colnames(Test_subject) <- "Subject"
colnames(Train_subject) <- "Subject"

#merge datasets to create final tidy table named "mergedData"
Test_set <- cbind(Test_set, Test_subject)
Train_set <- cbind(Train_set, Train_subject)
mergedData <- as.data.frame(rbind(Test_set, Train_set))
