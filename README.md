Getting-and-Cleaning-Data-Project
=================================
 
This function reads the test and training data from a set of space deliminated files and combines the data into a single data set.  The data that isn't associated with mean and std data is removed from the data set.  The mean is taken for each subject, activity combination and the results are written out to a space deliminated file called titydata.txt.

The working directory must be set to the root directory of the data before calling this function.
 
 
