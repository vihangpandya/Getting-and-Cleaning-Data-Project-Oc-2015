# Codebook for Oct 15 Getting and Cleaning Data Project
Vihang Pandya  
Oct 24, 2015  

## Project Description
Clean the data obtained for measurement from 30 volunteers who wore a Samsung Galaxy S smartphone, while performing different activities. The data was measured by the accelerometers and gyroscope in the phone. Activities included were walking, standing, walking up, walking down etc.

##Study design and data processing
Researchers adopted the standard Support Vector Machine (SVM) and exploits fixed-point arithmetic for computational cost reduction. A comparison with the traditional SVM shows a significant improvement in terms of computational costs while maintaining similar accuracy, which can contribute to develop more sustainable systems for Ambient Intelligence.

###Collection of the raw data
Using the phone's embedded accelerometer and gyroscope, 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz were captured. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

The accelerometer and gyroscope 3-axial raw signals are called as tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

##Creating the tidy datafile

###Guide to create the tidy data file
1) Merged the train and test data set of measurements.
2) Combined the subject ids of the train and test.
3) Replaced the activity label file with actual descriptive name of the activity (e.g. 1 = STANDING)
4) Merged the subject ID as the first column to the dataset

###Cleaning of the data
run_analysis.R extracts the necessary columns from the dataset. Selected columns are those that contain mean and standard deviation information. The selected data set is then grouped based on subject id and activity. Later the mean is calculated for each column. Please refer to README.html for more information

##Description of the variables in the datamean.txt file
General description of the file including:
 - Dimensions of the dataset - datamean
180 rows by 68 columns
The first 2 of the 68 columns include subjectid and activity. The others are columns that include mean and standard deviation data.

 - Summary of the data
 Mean of the measurements that include all the mean and standard deviation for each subject and their corresponding 6 activites.
 
 - Variables present in the dataset
 
####subjectid
Identifies 1 of 30 subjects

####activity
Identifies 1 of 6 possible acitivites

####tbodyaccmeanx
Mean of the time based body acceleration in X direction

####tbodyaccmeany
Mean of the time based body acceleration in Y direction

####tbodyaccmeanz
Mean of the time based body acceleration in Z direction

####tbodyaccstdx
Mean of the standard deviation from body acceleration in X direction

####tbodyaccstdx
Mean of the standard deviation from body acceleration in Y direction

####tbodyaccstdz
Mean of the standard deviation from body acceleration in Z direction

####tgravityaccmeanx
Mean of the time based gravity acceleration in X direction

####tgravityaccmeany
Mean of the time based gravity acceleration in Y direction

####tgravityaccmeanz
Mean of the time based gravity acceleration in Z direction

####tgravityaccstdx
Mean of the standard deviation from gravity acceleration in X direction

####tgravityaccstdy
Mean of the standard deviation from gravity acceleration in Y direction

####tgravityaccstdz
Mean of the standard deviation from gravity acceleration in Z direction

####tbodyaccjerkmeanx
Mean of the body acceleration from jerk signals in X direction

####tbodyaccjerkmeany
Mean of the body acceleration from jerk signals in Y direction

####tbodyaccjerkmeanz
Mean of the body acceleration from jerk signals in Z direction

####tbodyaccjerkstdx
Mean of the standdard deviation of body acceleration from jerk signals in X direction

####tbodyaccjerkstdy
Mean of the standdard deviation of body acceleration from jerk signals in Y direction

####tbodyaccjerkstdz
Mean of the standdard deviation of body acceleration from jerk signals in Z direction

####tbodygyromeanx
Mean of the time based body gyroscope measurement in X direction

####tbodygyromeany
Mean of the time based body gyroscope measurement in Y direction

####tbodygyromeanz
Mean of the time based body gyroscope measurement in Z direction

####tbodygyrostdx
Mean of the standard deviation of time based body gyroscope measurement in X direction

####tbodygyrostdy
Mean of the standard deviation of time based body gyroscope measurement in Y direction

####tbodygyrostdz
Mean of the standard deviation of time based body gyroscope measurement in Z direction

####tbodygyrojerkmeanx
Mean of the time based body gyroscope from jerk signals in X direction

####tbodygyrojerkmeany
Mean of the time based body gyroscope from jerk signals in Y direction

####tbodygyrojerkmeanz
Mean of the time based body gyroscope from jerk signals in Z direction

####tbodygyrojerkstdx
Mean of the standard deviation of the time based body gyroscope from jerk signals in X direction

####tbodygyrojerkstdy
Mean of the standard deviation of the time based body gyroscope from jerk signals in Y direction

####tbodygyrojerkstdz
Mean of the standard deviation of the time based body gyroscope from jerk signals in Z direction

####tbodyaccmagmean
Mean of time based body acceleration and magnitude 

####tbodyaccmagstd
Mean of the standard deviation of time based body acceleration and magnitude

####tgravityaccmagmean
Mean of the time based gravity acceleration magnitude

####tgravityaccmagstd
Mean of the standard deviation for time based gravity acceleration and magnitude

####tbodyjerkmagmean
Mean of the time based body from jerk signal magnitude 

####tbodygyrojerkmagstd
Mean of the time based body gyroscope from jerk signals magnitude

####fbodyaccmeanx
Mean of the fourier transform on body acceleration in X direction

####fbodyaccmeany
Mean of the fourier transform on body acceleration in Y direction

####fbodyaccmeanz
Mean of the fourier transform on body acceleration in Z direction

####fbodyaccstdx
Mean of the fourier transform on the standard deviation of body acceleration in X direction

####fbodyaccstdy
Mean of the fourier transform on the standard deviation of body acceleration in Y direction

####fbodyaccstdz
Mean of the fourier transform on the standard deviation of body acceleration in Z direction

####fbodyaccjerkmeanx
Mean of the fourie transform on the body acceleration from jerk signals in X direction

####fbodyaccjerkmeany
Mean of the fourie transform on the body acceleration from jerk signals in Y direction

####fbodyaccjerkmeanz
Mean of the fourie transform on the body acceleration from jerk signals in Z direction

####fbodyaccjerkstdx
Mean of the fourier transform on the body acceleration from jerk signals in X direction

####fbodyaccjerkstdy
Mean of the fourier transform on the body acceleration from jerk signals in Y direction

####fbodyaccjerkstdz
Mean of the fourier transform on the body acceleration from jerk signals in Z direction

####fbodygyromeanx
Mean of the fourier transform in the body gyroscope in X direction

####fbodygyromeany
Mean of the fourier transform in the body gyroscope in Y direction

####fbodygyromeanz
Mean of the fourier transform in the body gyroscope in Z direction

####fbodygyrostdx
mean of the fourier transform on standard deviation from the body gyroscope in X direction

####fbodygyrostdy
mean of the fourier transform on standard deviation from the body gyroscope in Y direction

####fbodygyrostdz
mean of the fourier transform on standard deviation from the body gyroscope in Z direction

####fbodyaccmagmean
mean of the fourier transform on the magnitude of body acceleration

####fbodyaccmagstd
mean of the fourier transform of the standard deviation on the magnitude of body acceleration

####fbodyaccjerkmagmean
mean of the fourier transform on the body acceleration from the jerk signals

####fbodyaccjerkmagstd
mean of the fourier transform on the standard deviation of body accleration fromn jerk signals

####fbodybodygyromagmean
mean of the fourier transform on the magnitude of body gyroscope 

####fbodygyromagstd
mean of the fourier transform on the standard deviation from body gyrscope magnitude

####fbodygyrojerkmagmean
mean of the fourier transform on the magnitude of body gyroscope from jerk signals

####fbodygyrojerkmagstd
mean of the fourier transform on the standard deviation for the magnitude of body gyroscope from jerk signals
