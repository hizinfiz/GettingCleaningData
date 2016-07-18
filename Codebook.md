# Getting and Cleaning Data Course Project Code Book

### Script & Steps Used

The raw data used in this project can be found [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). A full description of the experiment is available [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

Assuming you have downloaded the raw data to your computer and extracted it, these are the steps I used to tidy the data:

1. Read in the data. Specifically, I read in `/train/X_train.txt`, `/train/y_train.txt`, `/test/X_test.txt`, `/test/y_test.txt`, and `features.txt`.
2. I then assigned temporary column names to the data frames based on `features.txt`. This was done to faciliate #2 in the requirements for the assignment.
3. I then merged the training and test sets to create one data set using a series of `rbind` and `cbind` commands. (Part 1)
4. Using regex, I extracted only the columns that had `mean()` and `std()` in their name. (from step 2) I also included the Activity and Subject columns since this would be needed to later find the average of each variable. (Part 2)
5. I gave the Activity column descriptive names based on the provided number. The name was taken from `activity_labels.txt`. (Part 3)
6. I created a csv that would contain the descriptive variable names I wanted to use and named this `descriptive.csv`. I then assigned names of the data frame to be the names listed in `descriptive.csv`. (Part 4)
7. Using dplyr, I grouped the data frame based on Subject and Activity and found the average of each. I then wrote the resulting data frame to a csv titled `tidyData.csv`. (Part 5)

### Description of Variable Names

There are 68 variables in `tidyData.csv` They are as follows:

1. Subject  
  An ID number corresponding to the test subject, values range from 1 to 30
* Activity  
  A description of the specific activity
  * Walking
  * Walking Upstairs
  * Walking Downstairs
  * Sitting
  * Standing Laying
* Time Body Acceleration X Axis mean() - Average body linear acceleration in the time domain along the X axis 
* Time Body Acceleration Y Axis mean() - Average body linear acceleration in the time domain along the Y axis 
* Time Body Acceleration Z Axis mean() - Average body linear acceleration in the time domain along the Z axis 
* Time Body Acceleration X Axis std() - Standard Deviation of body linear acceleration in the time domain along the X axis 
* Time Body Acceleration Y Axis std() - Standard Deviation of body linear acceleration in the time domain along the Y axis 
* Time Body Acceleration Z Axis std() - Standard Deviation of body linear acceleration in the time domain along the Z axis 
* Time Gravity Acceleration X Axis mean() - Average gravity acceleration in the time domain along the X axis
* Time Gravity Acceleration Y Axis mean() - Average gravity acceleration in the time domain along the Y axis
* Time Gravity Acceleration Z Axis mean() - Average gravity acceleration in the time domain along the Z axis
* Time Gravity Acceleration X Axis std() - Standard Deviation gravity acceleration in the time domain along the X axis
* Time Gravity Acceleration Y Axis std() - Standard Deviation gravity acceleration in the time domain along the Y axis
* Time Gravity Acceleration Z Axis std() - Standard Deviation gravity acceleration in the time domain along the Z axis
* Time Body Acceleration Jerk Signal X Axis mean() - Average body linear acceleration jerk signal in the time domain along the X axis 
* Time Body Acceleration Jerk Signal Y Axis mean() - Average body linear acceleration jerk signal in the time domain along the Y axis 
* Time Body Acceleration Jerk Signal Z Axis mean() - Average body linear acceleration jerk signal in the time domain along the Z axis 
* Time Body Acceleration Jerk Signal X Axis std() - Standard Deviation body linear acceleration jerk signal in the time domain along the X axis 
* Time Body Acceleration Jerk Signal Y Axis std() - Standard Deviation body linear acceleration jerk signal in the time domain along the Y axis
* Time Body Acceleration Jerk Signal Z Axis std() - Standard Deviation body linear acceleration jerk signal in the time domain along the Z axis
* Time Body Gyroscope X Axis mean() - Average body gyroscope in the time domain along the X axis
* Time Body Gyroscope Y Axis mean() - Average body gyroscope in the time domain along the Y axis 
* Time Body Gyroscope Z Axis mean() - Average body gyroscope in the time domain along the Z axis 
* Time Body Gyroscope X Axis std() - Standard Deviation body gyroscope in the time domain along the X axis 
* Time Body Gyroscope Y Axis std() - Standard Deviation body gyroscope in the time domain along the Y axis 
* Time Body Gyroscope Z Axis std() - Standard Deviation body gyroscope in the time domain along the Z axis 
* Time Body Gyroscope Jerk Signal X Axis mean() - Average body gyroscope jerk signal in the time domain along the X axis
* Time Body Gyroscope Jerk Signal Y Axis mean() - Average body gyroscope jerk signal in the time domain along the Y axis
* Time Body Gyroscope Jerk Signal Z Axis mean() - Average body gyroscope jerk signal in the time domain along the Z axis
* Time Body Gyroscope Jerk Signal X Axis std() - Standard Deviation body gyroscope jerk signal in the time domain along the X axis
* Time Body Gyroscope Jerk Signal Y Axis std() - Standard Deviation body gyroscope jerk signal in the time domain along the Y axis
* Time Body Gyroscope Jerk Signal Z Axis std() - Standard Deviation body gyroscope jerk signal in the time domain along the Z axis
* Time Body Acceleration Magnitude mean() - Average body linear acceleration magnitude in the time domain
* Time Body Acceleration Magnitude std() - Standard Deviation body linear acceleration magnitude in the time domain
* Time Gravity Acceleration Magnitude mean() - Average gravity acceleration magnitude in the time domain
* Time Gravity Acceleration Magnitude std() - Standard Deviation gravity acceleration magnitude in the time domain
* Time Body Acceleration Jerk Signal Magnitude mean() - Average body linear acceleration jerk signal magnitude in the time domain
* Time Body Acceleration Jerk Signal Magnitude std() - Standard Deviation body linear acceleration jerk signal magnitude in the time domain
* Time Body Gyroscope Magnitude mean() - Average body gyroscope magnitude in the time domain
* Time Body Gyroscope Magnitude std() - Standard Deviation body gyroscope magnitude in the time domain
* Time Body Gyroscope Jerk Signal Magnitude mean() - Average body gyroscope jerk signal magnitude in the time domain
* Time Body Gyroscope Jerk Signal Magnitude std() - Standard Deviation body gyroscope jerk signal magnitude in the time domain
* Fast Fourier Transform Body Acceleration X axis mean() - Average Fast Fourier Transformation applied to the body linear acceleration in the X axis
* Fast Fourier Transform Body Acceleration Y axis mean() - Average Fast Fourier Transformation applied to the body linear acceleration in the Y axis
* Fast Fourier Transform Body Acceleration Z axis mean() - Average Fast Fourier Transformation applied to the body linear acceleration in the Z axis
* Fast Fourier Transform Body Acceleration X axis std() - Standard Deviation Fast Fourier Transformation applied to the body linear acceleration in the X axis
* Fast Fourier Transform Body Acceleration Y axis std() - Standard Deviation Fast Fourier Transformation applied to the body linear acceleration in the Y axis
* Fast Fourier Transform Body Acceleration Z axis std() - Standard Deviation Fast Fourier Transformation applied to the body linear acceleration in the Z axis
* Fast Fourier Transform Body Acceleration Jerk Signal X axis mean() - Average Fast Fourier Transformation applied to the body linear acceleration jerk signal in the X axis
* Fast Fourier Transform Body Acceleration Jerk Signal Y axis mean() - Average Fast Fourier Transformation applied to the body linear acceleration jerk signal in the Y axis
* Fast Fourier Transform Body Acceleration Jerk Signal Z axis mean() - Average Fast Fourier Transformation applied to the body linear acceleration jerk signal in the Z axis
* Fast Fourier Transform Body Acceleration Jerk Signal X axis std() - Standard Deviation Fast Fourier Transformation applied to the body linear acceleration jerk signal in the X axis
* Fast Fourier Transform Body Acceleration Jerk Signal Y axis std() - Standard Deviation Fast Fourier Transformation applied to the body linear acceleration jerk signal in the Y axis
* Fast Fourier Transform Body Acceleration Jerk Signal Z axis std() - Standard Deviation Fast Fourier Transformation applied to the body linear Z acceleration jerk signal in the axis
* Fast Fourier Transform Body Gyroscope X axis mean() - Average Fast Fourier Transformation applied to the body gyroscope in the X axis
* Fast Fourier Transform Body Gyroscope Y axis mean() - Average Fast Fourier Transformation applied to the body gyroscope in the Y axis
* Fast Fourier Transform Body Gyroscope Z axis mean() - Average Fast Fourier Transformation applied to the body gyroscope in the Z axis
* Fast Fourier Transform Body Gyroscope X axis std() - Standard Deviation Fast Fourier Transformation applied to the body gyroscope in the X axis
* Fast Fourier Transform Body Gyroscope Y axis std() - Standard Deviation Fast Fourier Transformation applied to the body gyroscope in the Y axis
* Fast Fourier Transform Body Gyroscope Z axis std() - Standard Deviation Fast Fourier Transformation applied to the body gyroscope in the Z axis
* Fast Fourier Transform Body Acceleration Magnitude mean() - Average Fast Fourier Transformation applied to the body linear acceleration magnitude
* Fast Fourier Transform Body Acceleration Magnitude std() - Standard Deviation Fast Fourier Transformation applied to the body linear acceleration magnitude
* Fast Fourier Transform Body Acceleration Jerk Signal Magnitude mean() - Average Fast Fourier Transformation applied to the body linear acceleration jerk signal magnitude
* Fast Fourier Transform Body Acceleration Jerk Signal Magnitude std() - Standard Deviation Fast Fourier Transformation applied to the body linear acceleration jerk signal magnitude
* Fast Fourier Transform Body Gyroscope Magnitude mean() - Average Fast Fourier Transformation applied to the body gyroscope magnitude
* Fast Fourier Transform Body Gyroscope Magnitude std() - Standard Deviation Fast Fourier Transformation applied to the body gyroscope magnitude
* Fast Fourier Transform Body Gyroscope Jerk Signal Magnitude mean() - Average Fast Fourier Transformation applied to the body gyroscope jerk signal magnitude
* Fast Fourier Transform Body Gyroscope Jerk Signal Magnitude std() - Standard Deviation Fast Fourier Transformation applied to the body gyroscope jerk signal magnitude