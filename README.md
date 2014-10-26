courseproject
=============

Getting and cleaning data / course project
====================================================
Human Activity Recognition Using Smartphones Dataset
====================================================
Original data: 
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. 
Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) 
wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 
3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded 
to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers 
was selectedfor generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width 
sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and 
body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force 
is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, 
a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

=========================================================
1: Train and Test sets in the original data was merged to create one dataset.
merged sets include:
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'x_train.txt': training set
- 'y_train.txt': training labels
- 'subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
- 'x_test.txt': test set
- 'y_test.txt': test labels
- 'subject_test.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.

2:  Extracted only the variables that measures mean and standard deviation for each measure.
3: Labels of 'Activity' created according to 'activity_labels.txt' file.
4: Renamed variables in order to be have more descriptive names. 
5: Created a second data set (named as 'tidydata.txt') in which the data express the average of each measure for each activity and each subject. 
=============================================================
Notes:
Dimensions of Final data set (tidydata) 180 rows and 68 column.  

The folder contains:
ReadMe : initial notes about the data set and process
'Codebook.txt': codebook of data set
'tidydata.txt': data set
'run_analysis.R': script
