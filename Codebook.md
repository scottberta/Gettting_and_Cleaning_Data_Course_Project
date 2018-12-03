title: Getting and Cleaning Data Course Project

author: Scott Berta

output: tidy_data.txt

# Project Description

See the `README.md` file of this repository for information on how this data set was created.
Experiments have been carried out with a group of 30 volunteers within the age bracket of 19-48 years. Eachperson performed six activities (WALKING, WALKING-UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING and LAYING) while wearing a Samsung Galaxy S II smartphone on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

### Identifiers

* `subject` - The ID of the test subject
* `activity` - The type of activity performed when the corresponding measurements were taken

### Average of measurements <a name="average-measurements"></a>

All measurements are floating-point values, normalised and bounded within [-1,1].

Prior to normalisation, acceleration measurements (variables containing `Accelerometer`) were made in *g*'s (9.81 m.s⁻²) and gyroscope measurements (variables containing `Gyroscope`) were made in radians per second (rad.s⁻¹).

Magnitudes of three-dimensional signals (variables containing `Magnitude`) were calculated using the Euclidean norm.

The measurements are classified in two domains:

- Time-domain signals (variables prefixed by `timeDomain`), resulting from the capture of accelerometer and gyroscope raw signals.

- Frequency-domain signals (variables prefixed by `frequencyDomain`), resulting from the application of a Fast Fourier Transform (FFT) to some of the time-domain signals.

### Measurements

The following measurements were captured from the data and the mean for each was output to tidy_data.txt grouped by subject and activity:

`tBodyAccMeanX`, `tBodyAccMeanY`, `tBodyAccMeanZ`, `tBodyAccStdX`, `tBodyAccStdY`, `tBodyAccStdZ`, `tGravityAccMeanX`
`tGravityAccMeanY`, `tGravityAccMeanZ`, `tGravityAccStdX`, `tGravityAccStdY`, `tGravityAccStdZ`, `tBodyAccJerkMeanX`
`tBodyAccJerkMeanY`, `tBodyAccJerkMeanZ`, `tBodyAccJerkStdX`, `tBodyAccJerkStdY`, `tBodyAccJerkStdZ`, `tBodyGyroMeanX`
`tBodyGyroMeanY`, `tBodyGyroMeanZ`, `tBodyGyroStdX`, `tBodyGyroStdY`, `tBodyGyroStdZ`, `tBodyGyroJerkMeanX`, `tBodyGyroJerkMeanY`
`tBodyGyroJerkMeanZ`, `tBodyGyroJerkStdX`, `tBodyGyroJerkStdY`, `tBodyGyroJerkStdZ`, `tBodyAccMagMean`, `tBodyAccMagStd`
`tGravityAccMagMean`, `tGravityAccMagStd`, `tBodyAccJerkMagMean`, `tBodyAccJerkMagStd`, `tBodyGyroMagMean`, `tBodyGyroMagStd`
`tBodyGyroJerkMagMean`, `tBodyGyroJerkMagStd`, `fBodyAccMeanX`, `fBodyAccMeanY`, `fBodyAccMeanZ`, `fBodyAccStdX`, `fBodyAccStdY`
`fBodyAccStdZ`, `fBodyAccMeanFreqX`, `fBodyAccMeanFreqY`, `fBodyAccMeanFreqZ`, `fBodyAccJerkMeanX`, `fBodyAccJerkMeanY`,
`fBodyAccJerkMeanZ`, `fBodyAccJerkStdX`, `fBodyAccJerkStdY`, `fBodyAccJerkStdZ`, `fBodyAccJerkMeanFreqX`, `fBodyAccJerkMeanFreqY`
`fBodyAccJerkMeanFreqZ`, `fBodyGyroMeanX`, `fBodyGyroMeanY`, `fBodyGyroMeanZ`, `fBodyGyroStdX`, `fBodyGyroStdY`, `fBodyGyroStdZ`
`fBodyGyroMeanFreqX`, `fBodyGyroMeanFreqY`, `fBodyGyroMeanFreqZ`, `fBodyAccMagMean`, `fBodyAccMagStd`, `fBodyAccMagMeanFreq`
`fBodyBodyAccJerkMagMean`, `fBodyBodyAccJerkMagStd`, `fBodyBodyAccJerkMagMeanFreq`, `fBodyBodyGyroMagMean`, `fBodyBodyGyroMagStd`
`fBodyBodyGyroMagMeanFreq`, `fBodyBodyGyroJerkMagMean`, `fBodyBodyGyroJerkMagStd`, `fBodyBodyGyroJerkMagMeanFreq`

### Activity Labels

The following activities were were captured for each of the 30 subjects:

* `WALKING` (value `1`): subject was walking during the test
* `WALKING_UPSTAIRS` (value `2`): subject was walking up a staircase during the test
* `WALKING_DOWNSTAIRS` (value `3`): subject was walking down a staircase during the test
* `SITTING` (value `4`): subject was sitting during the test
* `STANDING` (value `5`): subject was standing during the test
* `LAYING` (value `6`): subject was laying down during the test
