File: Codebook.md

Description: a code book that describes the variables, the data, and any transformations or work that you performed to clean up the
data. 

Source data, the data for the project:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Transformation Specifications - 5 requirments and How Source Code run_analysis.R 

Merges the training and the test sets to create one data set. Source code "run_analysis.R" loads both test and train data, processes
them, and merges the results into one dataset.

Extracts only the measurements on the mean and standard deviation for each measurement. Source code "run_analysis.R" extracts the mean
and standard deviation data into one dataset with appropriate column names.

Uses descriptive activity names to name the activities in the data set. Source code "run_analysis.R" loads the descriptive feature and
activity labels.


Appropriately labels the data set with descriptive variable names Source code "run_analysis.R" adds appropriately descriptive variable
names to the large dataset columns (variables).

From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each 
subject Source code "run_analysis.R" calculates the average for all measurement columns grouped by variables Activity and Subject and
then writes the output to a local text file named "tidy.txt""

Tidy data set description

The variables in the tidy data

Tidy data contains 180 rows and 68 columns. Each row has averaged variables for each subject and each activity.

Only all the variables estimated from mean and standard deviation in the tidy set were kept.
mean(): Mean value
std(): Standard deviation

The data were averaged based on subject and activity group.
Subject column is numbered sequentially from 1 to 30. Activity column has 6 types as listed below.
WALKING
WALKING_UPSTAIRS
WALKING_DOWNSTAIRS
SITTING
STANDING
LAYING

The tidy data contains 6 rows (averaged based on activity) and 68 columns (66 variables and activity labels).
"subject"  
"activity"                                      
"timeBodyAccelerometer.mean...X"                
"timeBodyAccelerometer.mean...Y"   
"timeBodyAccelerometer.mean...Z"  
"timeBodyAccelerometer.std...X" 
"timeBodyAccelerometer.std...Y" 
"timeBodyAccelerometer.std...Z" 
"timeGravityAccelerometer.mean...X" 
"timeGravityAccelerometer.mean...Y"
"timeGravityAccelerometer.mean...Z"
"timeGravityAccelerometer.std...X"
"timeGravityAccelerometer.std...Y"
"timeGravityAccelerometer.std...Z"
"timeBodyAccelerometerJerk.mean...X"
"timeBodyAccelerometerJerk.mean...Y" 
"timeBodyAccelerometerJerk.mean...Z" 
"timeBodyAccelerometerJerk.std...X" 
"timeBodyAccelerometerJerk.std...Y" 
"timeBodyAccelerometerJerk.std...Z" 
"timeBodyGyroscope.mean...X" 
"timeBodyGyroscope.mean...Y" 
"timeBodyGyroscope.mean...Z"
"timeBodyGyroscope.std...X"                     
"timeBodyGyroscope.std...Y" 
"timeBodyGyroscope.std...Z"  
"timeBodyGyroscopeJerk.mean...X"                
"timeBodyGyroscopeJerk.mean...Y" 
"timeBodyGyroscopeJerk.mean...Z" 
"timeBodyGyroscopeJerk.std...X"                 
"timeBodyGyroscopeJerk.std...Y"
"timeBodyGyroscopeJerk.std...Z" 
"timeBodyAccelerometerMagnitude.mean.."         
"timeBodyAccelerometerMagnitude.std.." 
"timeGravityAccelerometerMagnitude.mean.." 
"timeGravityAccelerometerMagnitude.std.."       
"timeBodyAccelerometerJerkMagnitude.mean.." 
"timeBodyAccelerometerJerkMagnitude.std.." 
"timeBodyGyroscopeMagnitude.mean.."             
"timeBodyGyroscopeMagnitude.std.."   
"timeBodyGyroscopeJerkMagnitude.mean.."
"timeBodyGyroscopeJerkMagnitude.std.."          
"frequencyBodyAccelerometer.mean...X"
"frequencyBodyAccelerometer.mean...Y" 
"frequencyBodyAccelerometer.mean...Z"           
"frequencyBodyAccelerometer.std...X" 
"frequencyBodyAccelerometer.std...Y" 
"frequencyBodyAccelerometer.std...Z"            
"frequencyBodyAccelerometerJerk.mean...X"
"frequencyBodyAccelerometerJerk.mean...Y" 
"frequencyBodyAccelerometerJerk.mean...Z"       
"frequencyBodyAccelerometerJerk.std...X"  
"frequencyBodyAccelerometerJerk.std...Y"
"frequencyBodyAccelerometerJerk.std...Z"        
"frequencyBodyGyroscope.mean...X" 
"frequencyBodyGyroscope.mean...Y" 
"frequencyBodyGyroscope.mean...Z"               
"frequencyBodyGyroscope.std...X"  
"frequencyBodyGyroscope.std...Y" 
"frequencyBodyGyroscope.std...Z"                
"frequencyBodyAccelerometerMagnitude.mean.." 
"frequencyBodyAccelerometerMagnitude.std.."
"frequencyBodyAccelerometerJerkMagnitude.mean.."
"frequencyBodyAccelerometerJerkMagnitude.std.."
"frequencyBodyGyroscopeMagnitude.mean.."   
"frequencyBodyGyroscopeMagnitude.std.."         
"frequencyBodyGyroscopeJerkMagnitude.mean.." 
"frequencyBodyGyroscopeJerkMagnitude.std.."     

variable units

Activity variable is factor type. Subject variable is integer type. All the other variables are numeric type.
