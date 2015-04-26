# CodeBook for Getting and Cleaning Data Course Project

### Overiview of the Data
The data for this project come from 

The following comes from the README.txt file included with the raw data:

>The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

>The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

>For each record it is provided:

>- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.

>- Triaxial Angular velocity from the gyroscope. 

>- A 561-feature vector with time and frequency domain variables. 

>- Its activity label. 

>- An identifier of the subject who carried out the experiment.

It should be noted that <b>all features are normalized and bounded within [-1, 1].</b> In addition, the features are described in features_info.txt as follows:

>The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

>Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

>Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

# Changes made by run_analysis.R
The analysis script in this repository reorganizes the data to be grouped by the subject 
and by activity. For each subject-activity pair, the script calculates the average value of
each of the variables listed below. For simplicity, .XYZ is used to indicate that the variable is observed along the X, Y, and Z axes separately. Thus tBodyAccMean.XYZ refers to three variables in the data set: tBodyAccMeanX, tBodyAccMeanY, and tBodyAccMeanZ

- activity: label of the activity completed during the experiment. Values are:
	WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING.

- subject: An identifier of the subject who completed the experiment. Values are integers from 1 to 30.

- tBodyAccMean.XYZ: time domain body accelarion mean along the X, Y, or Z axis.

-tGravityAccMean.XYZ: time domain gravity acceleration mean along the X, Y, or Z axis.

-tBodyAccJerkMean.XYZ: time domain body acceleration Jerk signal mean along the X, Y, or Z axis. 

- tBodyGyroMean.XYZ: time domain body gyroscope signal mean along the X, Y, or Z axis.

- tBodyGyroJerkMean.XYZ: time domain body gyroscope jerk signal mean along the X, Y, or Z axis.

- tBodyAccMagMean: time domain body acceleration magnitude mean.

- tGravityAccMagMean: time domain gravity acceleration magnitude mean.

- tBodyAccJerkMagMean: time domain body jerk signal magnitude mean.

- tBodyGyroMagMean: time domain body gyroscope signal magnitude mean.

- tBodyGyroJerkMagMean: time domain body gyroscope jerk signal magnitude mean.

- fBodyAccMean.XYZ: frequency domain body acceleration mean along the X, Y, or Z axis.

- fBodyAccJerkMean.XYZ: frequency domain body acceleration jerk signal mean along the X, Y, or Z axis.

- fBodyGyroMean.XYZ: frequency domain gyroscope signal mean along the X, Y, or Z axis.

- fBodyAccMagMean: frequency domain body acceleration magnitude mean.

- fBodyAccJerkMagMean: frequency domain acceleration jerk signal magnitude mean.

- fBodyGyroMagMean: frequency domain gyroscope signal magnitude mean.

- fBodyGyroJerkMagMean: frequency domain gyroscope jerk signal magnitude mean.

- fBodyBodyAccJerkMagMean: frequency domain body acceleration jerk signal magnitude mean.

- fBodyBodyGyroMagMean: frequency domain body gyroscope magnitude mean.

- fBodyBodyGyroJerkMagMean: frequency domain body gyroscope jerk signal magnitude mean.

- tBodyAccStd.XYZ: time domain body accelarion standard deviation along the X, Y, or Z axis.

- tGravityAccStd.XYZ: time domain gravity acceleration standard deviation along the X, Y, or Z axis.

- tBodyAccJerkStd.XYZ: time domain body acceleration Jerk signal standard deviation along the X, Y, or Z axis. 

- tBodyGyroStd.XYZ: time domain body gyroscope signal standard deviation along the X, Y, or Z axis.

- tBodyGyroJerkStd.XYZ: time domain body gyroscope jerk signal standard deviation along the X, Y, or Z axis.

- tBodyAccMagStd: time domain body acceleration magnitude standard deviation.

- tGravityAccMagStd: time domain gravity acceleration magnitude standard deviation.

- tBodyAccJerkMagStd: time domain body jerk signal magnitude standard deviation.

- tBodyGyroMagStd: time domain body gyroscope signal magnitude standard deviation.

- tBodyGyroJerkMagStd: time domain body gyroscope jerk signal magnitude standard deviation.

- fBodyAccStd.XYZ: frequency domain body acceleration standard deviation along the X, Y, or Z axis.

- fBodyAccJerkStd.XYZ: frequency domain body acceleration jerk signal standard deviation along the X, Y, or Z axis.

- fBodyGyroStd.XYZ: frequency domain gyroscope signal standard deviation along the X, Y, or Z axis.

- fBodyAccMagStd: frequency domain body acceleration magnitude standard deviation.

- fBodyAccJerkMagStd: frequency domain acceleration jerk signal magnitude standard deviation.

- fBodyGyroMagStd: frequency domain gyroscope signal magnitude standard deviation.

- fBodyGyroJerkMagStd: frequency domain gyroscope jerk signal magnitude standard deviation.

- fBodyBodyAccJerkMagStd: frequency domain body acceleration jerk signal magnitude standard deviation.

- fBodyBodyGyroMagStd: frequency domain body gyroscope magnitude standard deviation.

- fBodyBodyGyroJerkMagStd: frequency domain body gyroscope jerk signal magnitude standard deviation.