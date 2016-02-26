*Data

The dataset in this repo is created for the assignment of the Getting and Cleaning Data Course Project of the Getting and Cleaning Data course on Coursera.org. The dataset should agree to the tidy data rules that are taught in this course and that are described in the Tidy Data paper by Hadly Wickham that is available here: http://vita.had.co.nz/papers/tidy-data.pdf.

The source dataset represents data collected from the accelerometers from the Samsung Galaxy S smartphone. It is available and described here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.


*Transformations

The provided run_analysis.R script performs various clean up actions that result in the final dataset. These steps are performed:
- the source dataset is downloaded and unzipped in the cwd.
- training, test, subject, activity and features files are loaded.
- the names of the activities in the activity table are converted to lowercase and underscores are removed to improve readability.
- the feature names are added as headers to the test and training data.
- the activity and subject data is added to the test and training data. This allows us to link a subject and an activity to the features.
- the test and training datasets are combined into one new data frame.
- only the mean and std features are required for the assignment. Line 49 in the script gets all columns that match the columns that contain "mean()" or "std()". The "activity" and "subject" columns are also required for the assignment and are included in the new dataset.
- the vector that contains the required columns is used to retrieve these columns and put them in a new data frame.
- the activity ids are replaced by the activity names to improve readability.
- a number of steps are taken to clean up the column names:
  - "()" are removed
  - "t" at the beginning of a variable name is replaced by "time"
  - "f" at the beginning of a variable name is replaced by "frequency"
  - "-" is replaced by "_"
  - the "X", "Y" and "Z" characters at the end of a variable name are converted to lowercase
- the assignment wants to have the average per feature grouped by activity and subject. This is selection is performed on line 69 and the result is stored in a new dataset: "avgActivitySubject"
- the final dataset is stored in a file called "avgActivitySubject.R" in the current working directory.


*Variables

|Variable Name|Explanation|
|-------------|-----------|
|activity|Activity performed by subject: walking, walking_upstairs, walking_downstairs, sitting, standing or laying|
|subject|Person who performed the activity|
|time_BodyAcc_mean_x|mean of the mean of body acceleration signals on the x axis in the time domain|
|time_BodyAcc_mean_y|mean of the mean of body acceleration signals on the y axis in the time domain|
|time_BodyAcc_mean_z|mean of the mean of body acceleration signals on the z axis in the time domain|
|time_BodyAcc_std_x|mean of the standard deviation of body acceleration signals on the x axis in the time domain|
|time_BodyAcc_std_y|mean of the standard deviation of body acceleration signals on the y axis in the time domain|
|time_BodyAcc_std_z|mean of the standard deviation of body acceleration signals on the z axis in the time domain|
|time_GravityAcc_mean_x|mean of the mean of gravity acceleration signals on the x axis in the time domain|
|time_GravityAcc_mean_y|mean of the mean of gravity acceleration signals on the y axis in the time domain|
|time_GravityAcc_mean_z|mean of the mean of gravity acceleration signals on the z axis in the time domain|
|time_GravityAcc_std_x|mean of the standard deviation of gravity acceleration signals on the x axis in the time domain|
|time_GravityAcc_std_y|mean of the standard deviation of gravity acceleration signals on the y axis in the time domain|
|time_GravityAcc_std_z|mean of the standard deviation of gravity acceleration signals on the z axis in the time domain|
|time_BodyAccJerk_mean_x|mean of body acceleration jerk signals on the x axis in the time domain|
|time_BodyAccJerk_mean_y|mean of body acceleration jerk signals on the y axis in the time domain|
|time_BodyAccJerk_mean_z|mean of body acceleration jerk signals on the z axis in the time domain|
|time_BodyAccJerk_std_x|mean of the standard deviation of body acceleration jerk signals on the x axis in the time domain|
|time_BodyAccJerk_std_y|mean of the standard deviation of body acceleration jerk signals on the y axis in the time domain|
|time_BodyAccJerk_std_z|mean of the standard deviation of body acceleration jerk signals on the z axis in the time domain|
|time_BodyGyro_mean_x|mean of the mean of body gyroscopic signals on the x axis in the time domain|
|time_BodyGyro_mean_y|mean of the mean of body gyroscopic signals on the y axis in the time domain|
|time_BodyGyro_mean_z|mean of the mean of body gyroscopic signals on the z axis in the time domain|
|time_BodyGyro_std_x|mean of the standard deviation of body gyroscopic signals on the x axis in the time domain|
|time_BodyGyro_std_y|mean of the standard deviation of body gyroscopic signals on the y axis in the time domain|
|time_BodyGyro_std_z|mean of the standard deviation of body gyroscopic signals on the z axis in the time domain|
|time_BodyGyroJerk_mean_x|mean of the mean of body gyroscopic jerk signals on the x axis in the time domain|
|time_BodyGyroJerk_mean_y|mean of the mean of body gyroscopic jerk signals on the y axis in the time domain|
|time_BodyGyroJerk_mean_z|mean of the mean of body gyroscopic jerk signals on the z axis in the time domain|
|time_BodyGyroJerk_std_x|mean of the standard deviation of body gyroscopic jerk signals on the x axis in the time domain|
|time_BodyGyroJerk_std_y|mean of the standard deviation of body gyroscopic jerk signals on the y axis in the time domain|
|time_BodyGyroJerk_std_z|mean of the standard deviation of body gyroscopic jerk signals on the z axis in the time domain|
|time_BodyAccMag_mean|mean of the mean of body acceleration signals in the time domain|
|time_BodyAccMag_std|mean of the mean of the standard deviation of magnitude of body acceleration signals in the time domain|
|time_GravityAccMag_mean|mean of the mean of gravity acceleration signals in the time domain|
|time_GravityAccMag_std|mean of the mean of the standard deviation of gravity acceleration signals in the time domain|
|time_BodyAccJerkMag_mean|mean of the mean of body acceleration jerk signals in the time domain|
|time_BodyAccJerkMag_std|mean of the standard deviation of body acceleration jerk signals in the time domain|
|time_BodyGyroMag_mean|mean of the mean of body gyroscopic signals in the time domain|
|time_BodyGyroMag_std|standard devition of body gyroscopic signals in the time domain|
|time_BodyGyroJerkMag_mean|mean of the mean of body gyroscopic jerk signals in the time domain|
|time_BodyGyroJerkMag_std|mean of the standard deviation of body gyroscopic jerk signals in the time domain|
|frequency_BodyAcc_mean_x|mean of the mean of body acceleration signals on the x axis in the frequency domain|
|frequency_BodyAcc_mean_y|mean of the mean of body acceleration signals on the y axis in the frequency domain|
|frequency_BodyAcc_mean_z|mean of the mean of body acceleration signals on the z axis in the frequency domain|
|frequency_BodyAcc_std_x|mean of the standard deviation of body acceleration signals on the x axis in the frequency domain|
|frequency_BodyAcc_std_y|mean of the standard deviation of body acceleration signals on the y axis in the frequency domain|
|frequency_BodyAcc_std_z|mean of the standard deviation of body acceleration signals on the z axis in the frequency domain|
|frequency_BodyAccJerk_mean_x|mean of the mean of body acceleration jerk signals on the x axis in the frequency domain|
|frequency_BodyAccJerk_mean_y|mean of the mean of body acceleration jerk signals on the y axis in the frequency domain|
|frequency_BodyAccJerk_mean_z|mean of the mean of body acceleration jerk signals on the z axis in the frequency domain|
|frequency_BodyAccJerk_std_x|mean of the standard deviation of body acceleration jerk signals on the x axis in the frequency domain|
|frequency_BodyAccJerk_std_y|mean of the standard deviation of body acceleration jerk signals on the y axis in the frequency domain|
|frequency_BodyAccJerk_std_z|mean of the standard deviation of body acceleration jerk signals on the z axis in the frequency domain|
|frequency_BodyGyro_mean_x|mean of the mean of body gyroscopic signals on the x axis in the frequency domain|
|frequency_BodyGyro_mean_y|mean of the mean of body gyroscopic signals on the y axis in the frequency domain|
|frequency_BodyGyro_mean_z|mean of the mean of body gyroscopic signals on the z axis in the frequency domain|
|frequency_BodyGyro_std_x|mean of the standard deviation of body gyroscopic signals on the x axis in the frequency domain|
|frequency_BodyGyro_std_y|mean of the standard deviation of body gyroscopic signals on the y axis in the frequency domain|
|frequency_BodyGyro_std_z|mean of the standard deviation of body gyroscopic signals on the z axis in the frequency domain|
|frequency_BodyAccMag_mean|mean of the mean of magnitude of body acceleration signals in the frequency domain|
|frequency_BodyAccMag_std|mean of the standard deviation of magnitude of body acceleration signals in the frequency domain|
|frequency_BodyBodyAccJerkMag_mean|mean of the mean of gravity acceleration signals in the frequency domain|
|frequency_BodyBodyAccJerkMag_std|mean of the standard deviation of gravity acceleration signals in the frequency domain|
|frequency_BodyBodyGyroMag_mean|mean of the mean of body acceleration jerk signals in the frequency domain|
|frequency_BodyBodyGyroMag_std|mean of the standard deviation of body acceleration jerk signals in the frequency domain|
|frequency_BodyBodyGyroJerkMag_mean|mean of the mean of body gyroscopic jerk signals in the frequency domain|
|frequency_BodyBodyGyroJerkMag_std|standard devition of body gyroscopic jerk signals in the frequency domain|
