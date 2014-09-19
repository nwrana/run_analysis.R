README for run_analysis.R
==========================

Written by Nathan Wrana as part of the course project for Getting and Clean Data
==========================


The package includes the following files
==========================
run_analysis.R
Supporting_script.R


Notes on run_analysis.R
==========================
The purpose of the run_analysis.R script is to clean up a raw dataset downloaded from the Human Activity Recognition Using
Smartphones experiment. The resulting cleand and tidy dataset was achieved using information tought in class as well as online
searches from blogs abd websites such as stackoverflow. The final clean dataset has been assigned the variable "mergedData"

The run_analysis.R script runs by first creating a folder on your home directory labelled "GetCleanData_Project". The zip file is downloaded to this folder and extracted using the unzip() function. The desired files in the zipped folder are read into R,
appropriate columns names are assigned, and finally the entire dataset is merged using the cbind() function


Notes on Supporting_script.R
===========================
Supporting code can be found in Supporting_script.R, also included in this package. This code only works if run_analysis.R is run
first because it requires the mergedData variable. The purpsoe of Supporting_script.R is to show how the dataset was reshaped by:
i) extracting columns with specific characters in the name, using the select() function from the dplyr package
ii) applying conditional formatting to assign descriptive names to numbers (creating the Activity column)
iii) using the melt() function from the reshape2 package to orgaanize the data into a form that's able to
iv) the summarize() and group_by() functions to determine the mean of each variable for each Activity from each Subject
