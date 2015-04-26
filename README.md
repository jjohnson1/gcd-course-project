# Getting and Cleaning Data: Course Project README

### Jeff Johnson
### 26 April 2015

# Contents
This repository contains the data and anaylsis files associated with 
the course project for Getting and Cleaning Data. These files are:

- 'README.md'

- 'getData.R': A script to download and unzip the requisite data. 

- 'wearable.zip': The compressed version of the raw data. This can be obtained
  by running 'getData.R'.

- 'UCI HAR Dataset': A directory containing the unzipped data and related
  files. This directory is also created by 'getData.R'.

- 'CodeBook.md': A code book describing the variables, the data, and 
  the process followed to generate the tidy data set. 

- 'run_analysis.R': The analysis script for this project, described 
  in greater detail below.

- 'AverageByActivityBySubject.txt': A text file containing the tidy
  data set as described in the project requirements. This file is created
  by 'run_analysis.R'

# Reading the tidy data set
AverageByActivityBySubject.txt can be loaded into R for easy viewing and
exploration via the following command:

```R
data <- read.table("AverageByActivityBySubject.txt", header = TRUE)
```
# Descriptions of scripts
### getData.R
This script first checks for the existence of the 'wearables.zip' file
in the working directory. If the file does not exist, the script downloads
the data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip. 

After downloading the data,
or if the file already exists in the working directory, this script proceeds
to unzip the compressed data, resuliting in the creation of the UCI HAR Dataset
directory. 

### run_analysis.R
This script performs all of the necessary tasks to move from the raw data to 
the final, tidy version seen in AverageByActivityBySubject.txt. This involves the
following steps:

<b>1. Create a complete dataset</b>

  This step involves combining the X, Y, and subject data for each of the train and 
  test sets to create complete test and train sets. This step also involves attaching
  descriptive names to the variables in the dataset. Finally, this step concludes
  with combining the train and test sets to create a large composite set with all data.

<b>2. Extract only the desired columns</b>

  For this project, we are only concerned with observations of the mean and standard deviation for each measurement. Thus step 2 involves removing all other variables
  from the composite data set. Mean and standard deviation columns are selected by 
  finding variable names that include either mean or std, excluding meanFreq and gravityMean.

<b>3. Create tidy data set</b>

  This step involves grouping the composite data set by activity and by subject and 
  computing the average for each variable for all observations in each subject-activity
  group. This dataset is then saved as AverageByActivityBySubject.txt. This data set adheres
  to the pricniples of tidy data by presenting only one variable in each column and showing 
  each observation of these variables (for each subject-activity pair) in a separate row. 

