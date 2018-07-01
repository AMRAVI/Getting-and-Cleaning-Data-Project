# Getting-and-Cleaning-Data-Project
Week 4 Project Submission


# The data
The dataset includes the following files:

'test/X_test.txt': Test set.
'test/y_test.txt': Test labels.
'features_info.txt': Shows information about the variables used on the feature vector.
'features.txt': List of all features.
'activity_labels.txt': Links the class labels with their activity name.
'train/X_train.txt': Training set.
'train/y_train.txt': Training labels.


# The following files are available for the train and test data. Their descriptions are equivalent.
'train/subject_train.txt': 
Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.

'train/Inertial Signals/total_acc_x_train.txt': 
The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. 
Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' 
and 'total_acc_z_train.txt' files for the Y and Z axis.

'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting 
the gravity from the total acceleration.

'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope 
for each window sample. The units are radians/second.


# Transformation details

1. Read trainings,testing data tables
2. assigns the Column Names
3. Merg train test data sets mrg_train+mrg_test and save to setAllInOne
4. Save Columnnames of the merged dataset to a vector
5. Vector mean_and_std to Retain Mactching columns to the pattern 
6. Apply the macthing column vector to the Merged Data set
7. Calculate mean and order sets and store in secondTidySet 
8. Save Data set to a file tidy_data.txt
